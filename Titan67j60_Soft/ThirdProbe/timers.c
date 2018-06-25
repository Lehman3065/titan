#include "timers.h"

static u16_t T3compare;
static u32_t DataInterval, PrevExtendedCCP4;
static uint8_t PorogInterval, Interval_Hi, Interval_Lo, Precizion1msCounter;

extern void TitanApp (void);

void Timers_Initialize(void){
    
    // Timer3 initialization    - дл€ нужд 
    T3CON = 0x41;   // 10 = Timer3 and Timer4 are the clock sources for ECCP3, CCP4 and CCP5;
                    //      Timer1 and Timer2 are the clock sources for ECCP1 and ECCP2
                    // Enables Timer3 with Internal clock (FOSC/4) = _XTAL_FREQ/4
    PIE2bits.TMR3IE = 1;
    
    //  CCP4 initialization     - дл€ приема данных с оптопары
    CCP4CON = 0x04; // Capture mode; every falling edge 
    PIR3bits.CCP4IF = 0;
    PIE3bits.CCP4IE = 1;    // 
    ReceiverStatus = 255;   // приемник ждет 
    TimersCCP.value = 0;    // флаг приема = 0
    
    //  CCP5 initialization     - дл€ организации 1 мс интервала - базового логического цикла
    CCP5CON = 0x0A; // Compare mode; generate software interrupt on compare match (CCPxIF bit is set,
                    // CCPx pin reflects I/O state)
    PIE3bits.CCP5IE = 0;        // Ќ≈ «јѕ–≈ўјё“—я ѕ–≈–џ¬јЌ»я - ѕќ“≈Ќ÷»јЋ№Ќќ ѕ≈–≈ѕќЋЌ≈Ќ»≈ !!!
    PIR3bits.CCP5IF = 0;
    T3compare.byte.lo = TMR3L;
    T3compare.byte.hi = TMR3H;
    CCPR5 = T3compare.word + CTimer3_1ms_ticks;
    PIE3bits.CCP5IE = 1;// 
    
}

void CCP4_ISR(void){

static uint8_t ReceiverBitCounter, ByteToShift;

    // Clear the CCP4 interrupt flag
    PIR3bits.CCP4IF = 0;
    
    if (PIR2bits.TMR3IF) {      // если не обработано прерывание таймера,
        TMR3_ISR();             // то сначала обрабатываем его здесь
    }
    ExtendedCCP4.word.lo = (uint16_t) CCPR4;
    
#asm    //    DataInterval.value = ExtendedCCP4.value - PrevExtendedCCP4.value;  
    movf _PrevExtendedCCP4,w,c
    subwf _ExtendedCCP4,w,c
    movwf _DataInterval,f,c
    movf (_PrevExtendedCCP4 + 1),w,c
    subwfb (_ExtendedCCP4 + 1),w,c
    movwf (_DataInterval + 1),f,c
    movf (_PrevExtendedCCP4 + 2),w,c
    subwfb (_ExtendedCCP4 + 2),w,c
    movwf (_DataInterval + 2),f,c
    movf (_PrevExtendedCCP4 + 3),w,c
    subwfb (_ExtendedCCP4 + 3),w,c
    movwf (_DataInterval + 3),f,c
#endasm
    
    PrevExtendedCCP4 = ExtendedCCP4;
    
// биты (30 шт.) передаютс€ следующим образом - сначала бит 0 - FireStatus, 1 - Ignition, 2..5 - control sum и 3 байта напр€жений (младшим битом вперед)
// если бит Ignition == 1, то передаютс€ всего 6 бит: 2 флага - сначала бит 0 - FireStatus, 1 - Ignition, потом они же 2 флага инверсных и снова 2 флага
    
    if (DataInterval.value > CTimer3_1ms_ticks) {
        ReceiverStatus = 0; // сброс приемника, будем джать стартовый интервал
    } 
    else {
#asm    //  DataInterval.byte.b1 = DataInterval.word.lo >> 6; // смотрим только старшие биты интервала
        rlcf (_DataInterval),c          // нормализованный интервал в DataInterval.byte.b1 !!!
        rlcf (_DataInterval + 1),c
        rlcf (_DataInterval),c
        rlcf (_DataInterval + 1),c
#endasm        
        if (ReceiverStatus == 0) {
#asm
        movf (_DataInterval + 1),w,c    // PorogInterval = DataInterval.byte.b1;       // пороговый интервал
        movwf _PorogInterval,c
        rrcf (_DataInterval + 1),w,c    // Interval_Lo = PorogInterval >> 1;           // короче этого нельз€
        movwf _Interval_Lo,c
        addwf _PorogInterval,w,c        // Interval_Hi = PorogInterval + Interval_Lo;  // длиннее этого тоже нельз€
        movwf _Interval_Hi,c
#endasm        
            ByteToShift = 0; // по умолчанию ждем 30 бит - он заодно и счетчик битов
            ReceiverBitCounter = 6; // первые 6 бит кладем в отдельную €чейку пам€ти
        } else if (ReceiverStatus != 255) {
            if (DataInterval.byte.b1 < Interval_Lo) {
                ReceiverStatus = 255;       // 255 - ошибка приема
            } else if (DataInterval.byte.b1 > Interval_Hi) {
                    ReceiverStatus = 255;   // 255 - ошибка приема
            } else {
                if (DataInterval.byte.b1 > PorogInterval) {
                    ByteToShift = 0x80 + (ByteToShift >> 1);    // здесь принимаем 1
                } else {
                    ByteToShift = 0x00 + (ByteToShift >> 1);    // здесь принимаем 0
                }
                ReceiverStatus++;
                ReceiverBitCounter--;
                if (ReceiverBitCounter == 0) {
                    ReceiverBitCounter = 8;
                    if (ReceiverStatus = 6) {
                        ReceiveBuffer.byte.b0 = ByteToShift;
                        if (ReceiveBuffer.byte.b0 & 0x02) {
                            ReceiveQuantity = 6;
                            TimersCCP.Flags.Receive = 1;    // прием 6 бит завершен
                        }
                    } else if (ReceiverStatus = 14) {
                        ReceiveBuffer.byte.b1 = ByteToShift;
                    } else if (ReceiverStatus = 22) {
                        ReceiveBuffer.byte.b2 = ByteToShift;
                    } else if (ReceiverStatus = 30) {
                        ReceiveBuffer.byte.b3 = ByteToShift;
                        ReceiveQuantity = 30;
                        TimersCCP.Flags.Receive = 1;        // прием 30 бит завершен
                    } 
                }
            }    
        }
    } 
}   

void CCP5_ISR(void){
    // Clear the CCP5 interrupt flag
    PIR3bits.CCP5IF = 0;
     // Write to the Timer3 CCP5 register
    T3compare.byte.lo = TMR3L;
    T3compare.byte.hi = TMR3H;
    if (((uint8_t)(T3compare.byte.hi - CCPR5H)) < ((uint8_t)((CTimer3_1ms_ticks >> 8) - 2))){ // запас 256..512 тактов на возврат из прерывани€
        CCPR5 += CTimer3_1ms_ticks;
    }
    else{
        CCPR5 = T3compare.word + CTimer3_1ms_ticks; // здесь если вылетели за цикл - заново синхронизируемс€...
    }
    if (++Precizion1msCounter > 2) {
        Precizion1msCounter = 0;
    }
    else {
        CCPR5 += 1; // в 2 случа€х из 3 добавл€ем 1 = дробный коэффициент делени€ кварцованой частоты (2/3)
    }
    // For all other routines
    Count_1_ms++;
    TitanApp();     // вызываетс€ каждую 1 мс
}

void TMR3_ISR(void){
    PIR2bits.TMR3IF = 0;    // Clear the TMR3 interrupt flag
    ExtendedCCP4.word.hi++; // считаем количество переполнений таймера
}

u16_t TMR3_ReadTimer(void){
    u16_t readVal;
    
    readVal.byte.lo = TMR3L;
    readVal.byte.hi = TMR3H;
    return readVal;
}


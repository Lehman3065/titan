#include "timers.h"

static u16_t T3compare;
static u32_t DataInterval, PrevExtendedCCP4;
static uint8_t PorogInterval, Interval_Hi, Interval_Lo, Precizion1msCounter;

extern void TitanApp (void);

void Timers_Initialize(void){
    
    // Timer3 initialization    - ��� ���� 
    T3CON = 0x41;   // 10 = Timer3 and Timer4 are the clock sources for ECCP3, CCP4 and CCP5;
                    //      Timer1 and Timer2 are the clock sources for ECCP1 and ECCP2
                    // Enables Timer3 with Internal clock (FOSC/4) = _XTAL_FREQ/4
    PIE2bits.TMR3IE = 1;
    
    //  CCP4 initialization     - ��� ������ ������ � ��������
    CCP4CON = 0x04; // Capture mode; every falling edge 
    PIR3bits.CCP4IF = 0;
    PIE3bits.CCP4IE = 1;    // 
    ReceiverStatus = 255;   // �������� ���� 
    TimersCCP.value = 0;    // ���� ������ = 0
    
    //  CCP5 initialization     - ��� ����������� 1 �� ��������� - �������� ����������� �����
    CCP5CON = 0x0A; // Compare mode; generate software interrupt on compare match (CCPxIF bit is set,
                    // CCPx pin reflects I/O state)
    PIE3bits.CCP5IE = 0;        // �� ����������� ���������� - ������������ ������������ !!!
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
    
    if (PIR2bits.TMR3IF) {      // ���� �� ���������� ���������� �������,
        TMR3_ISR();             // �� ������� ������������ ��� �����
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
    
// ���� (30 ��.) ���������� ��������� ������� - ������� ��� 0 - FireStatus, 1 - Ignition, 2..5 - control sum � 3 ����� ���������� (������� ����� ������)
// ���� ��� Ignition == 1, �� ���������� ����� 6 ���: 2 ����� - ������� ��� 0 - FireStatus, 1 - Ignition, ����� ��� �� 2 ����� ��������� � ����� 2 �����
    
    if (DataInterval.value > CTimer3_1ms_ticks) {
        ReceiverStatus = 0; // ����� ���������, ����� ����� ��������� ��������
    } 
    else {
#asm    //  DataInterval.byte.b1 = DataInterval.word.lo >> 6; // ������� ������ ������� ���� ���������
        rlcf (_DataInterval),c          // ��������������� �������� � DataInterval.byte.b1 !!!
        rlcf (_DataInterval + 1),c
        rlcf (_DataInterval),c
        rlcf (_DataInterval + 1),c
#endasm        
        if (ReceiverStatus == 0) {
#asm
        movf (_DataInterval + 1),w,c    // PorogInterval = DataInterval.byte.b1;       // ��������� ��������
        movwf _PorogInterval,c
        rrcf (_DataInterval + 1),w,c    // Interval_Lo = PorogInterval >> 1;           // ������ ����� ������
        movwf _Interval_Lo,c
        addwf _PorogInterval,w,c        // Interval_Hi = PorogInterval + Interval_Lo;  // ������� ����� ���� ������
        movwf _Interval_Hi,c
#endasm        
            ByteToShift = 0; // �� ��������� ���� 30 ��� - �� ������ � ������� �����
            ReceiverBitCounter = 6; // ������ 6 ��� ������ � ��������� ������ ������
        } else if (ReceiverStatus != 255) {
            if (DataInterval.byte.b1 < Interval_Lo) {
                ReceiverStatus = 255;       // 255 - ������ ������
            } else if (DataInterval.byte.b1 > Interval_Hi) {
                    ReceiverStatus = 255;   // 255 - ������ ������
            } else {
                if (DataInterval.byte.b1 > PorogInterval) {
                    ByteToShift = 0x80 + (ByteToShift >> 1);    // ����� ��������� 1
                } else {
                    ByteToShift = 0x00 + (ByteToShift >> 1);    // ����� ��������� 0
                }
                ReceiverStatus++;
                ReceiverBitCounter--;
                if (ReceiverBitCounter == 0) {
                    ReceiverBitCounter = 8;
                    if (ReceiverStatus = 6) {
                        ReceiveBuffer.byte.b0 = ByteToShift;
                        if (ReceiveBuffer.byte.b0 & 0x02) {
                            ReceiveQuantity = 6;
                            TimersCCP.Flags.Receive = 1;    // ����� 6 ��� ��������
                        }
                    } else if (ReceiverStatus = 14) {
                        ReceiveBuffer.byte.b1 = ByteToShift;
                    } else if (ReceiverStatus = 22) {
                        ReceiveBuffer.byte.b2 = ByteToShift;
                    } else if (ReceiverStatus = 30) {
                        ReceiveBuffer.byte.b3 = ByteToShift;
                        ReceiveQuantity = 30;
                        TimersCCP.Flags.Receive = 1;        // ����� 30 ��� ��������
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
    if (((uint8_t)(T3compare.byte.hi - CCPR5H)) < ((uint8_t)((CTimer3_1ms_ticks >> 8) - 2))){ // ����� 256..512 ������ �� ������� �� ����������
        CCPR5 += CTimer3_1ms_ticks;
    }
    else{
        CCPR5 = T3compare.word + CTimer3_1ms_ticks; // ����� ���� �������� �� ���� - ������ ����������������...
    }
    if (++Precizion1msCounter > 2) {
        Precizion1msCounter = 0;
    }
    else {
        CCPR5 += 1; // � 2 ������� �� 3 ��������� 1 = ������� ����������� ������� ����������� ������� (2/3)
    }
    // For all other routines
    Count_1_ms++;
    TitanApp();     // ���������� ������ 1 ��
}

void TMR3_ISR(void){
    PIR2bits.TMR3IF = 0;    // Clear the TMR3 interrupt flag
    ExtendedCCP4.word.hi++; // ������� ���������� ������������ �������
}

u16_t TMR3_ReadTimer(void){
    u16_t readVal;
    
    readVal.byte.lo = TMR3L;
    readVal.byte.hi = TMR3H;
    return readVal;
}


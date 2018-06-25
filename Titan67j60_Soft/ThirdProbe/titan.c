#include "titan.h"

#define PortA_PORLatch 0x00
#define PortB_PORLatch 0x00
#define PortC_PORLatch (1<<ComTx)
#define PortD_PORLatch (1<<nModPWM)
#define PortE_PORLatch ((1<<RelaySC)|(1<<nFlashCS))
#define PortF_PORLatch 0x00
#define PortG_PORLatch 0x00
#define StartADCChannel 0x20            // >15 !! � ������� 3 ���� = 0
#define StartRelayRegisterValue (0x0208 + (StartADCChannel & 0x07))
#define CSwitchDebounce 3   // ������� ������ ����������� ������� ����������� ��� ������������
#define CIgnitionEnablePeriod 32  // ms - ����� ����� ������ ���� �������� �� �������� ��� ��������� �������

const uint8_t ADC_Input[8] = {0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x02, 0x04}; // ���� ��� ������ ������


static TitanSwitch_t TitanSwitchPrev;   // �������� ������������
static TitanTemp_t DeltaTitanTemp;      // ���������� ����������� ��� ����������
static uint8_t AfterPOResetTimer;       // ��� �������� ��� ��������� �������
static uint8_t DebounceCounter[8];
static TitanADC_t ADC_10uA;             // �������� ������� ��� ��� ���� 10 uA
static TitanADC_t ADC_500uA;            // �������� ������� ��� ��� ���� 500 uA
static uint8_t ADC_Channel;


void INTERRUPT_Initialize(void);
void OSCILLATOR_Initialize(void);
void ADCconversion(void);
void LowPassFilterADC(TitanADC_t *pFiltrValue, uint8_t Ch);


void HardwareInit(void){
    ADCON0bits.ADCAL = 1; // Calibration is performed on next A/D conversion
    ADCON1 = 0x13;  // VREF+ = (AN3), AIN0..AIN11 - analog inputs
    ADCON2 = 0xBE;//8A;  // Right justified, A/D Acquisition Time = 2, TAD = TOSC * 32
                    // ��� A/D Acquisition Time = 0 �� �������� !!!!
    ADCON0bits.ADON = 1;  // A/D Converter module is enabled
//    CMCON = 0x07; // comparator off - arter reset value
//    CVRCON = 0x00;// Comparator Voltage Reference off - arter reset value
    
    TRISA = ((1<<Ain6)|(1<<Ain7)|(1<<A_3VA)); // A2, A3, A5 - input
    TRISB = (0xFF - (1<<nFlHold)- (1<<ComCS)); // B4 - output ComCS, B5 - output nFlHold
    TRISC = ((1<<SpiMISO)|(1<<UartRx)); // C4 - input SpiMISO, C7 - input Rx
    TRISD = ((1<<DataECCP3)|(1<<DataCCP4)); // D1, D2 - input, ��������� - output
    TRISE = (1<<DigitIn); // ����� RE3, ��� ��������� - output
    TRISF = (0xFF - (1<<RelayPC)); // F7 - output RelayPC
    TRISG = 0x00; // output
    ADCON0bits.ADCAL = 1; // Calibration is performed on next A/D conversion
    ADCON1 = 0x13;  // VREF+ = (AN3), AIN0..AIN11 - analog inputs
    ADCON2 = 0xBE;//8A;  // Right justified, A/D Acquisition Time = 2, TAD = TOSC * 32
                    // ��� A/D Acquisition Time = 0 �� �������� !!!!
    ADCON0bits.ADON = 1;  // A/D Converter module is enabled
//    CMCON = 0x07; // comparator off - arter reset value
//    CVRCON = 0x00;// Comparator Voltage Reference off - arter reset value
    
    OSCILLATOR_Initialize();
    Timers_Initialize();
    INTERRUPT_Initialize();
    for (uint8_t i=0; i<8; i++) DebounceCounter[i] = 0;
}

void VariablesInit(void){
    LATA = PortA_PORLatch;
    LATB = PortB_PORLatch;
    LATC = PortC_PORLatch;
    LATD = PortD_PORLatch;
    LATE = PortE_PORLatch;
    LATF = PortF_PORLatch;
    LATG = PortG_PORLatch;
    
    AfterPOResetTimer = 100;    // ����������� �� 1 ��� ������ ��������� ���������� ������
    // ����� ��� ����, ����� ������� �����, ����� ���������� ����� ������� ���������
    // ��� ��� �� ����� ������ ���������� ������ �� ������� ��������
    // ��������� 0,1 ��� AfterPOResetTimer - ������������� ��������� �������� �������� � ������
    TitanHwFlags.value = 0;
        
    ADC_Channel = StartADCChannel;
    RelayRegister.value = StartRelayRegisterValue;   // ��������� �������� �������� ��������
    
    TitanSwitch.value = 0x00;
    TitanSwitchPrev = TitanSwitch;
}

void  INTERRUPT_Initialize(void){
    // Disable Interrupt Priority Vectors (16CXXX Compatibility Mode)
    RCONbits.IPEN = 0;
    INTERRUPT_GlobalInterruptEnable();
    INTERRUPT_PeripheralInterruptEnable();
}

void OSCILLATOR_Initialize(void){
    // SCS Primary_OSC; OSTS intosc; IDLEN disabled; 
    OSCCON = 0x02;
    // PLLEN enabled; PPST0 disabled; PPRE divide_by_3; PPST1 divide_by_3; 
    OSCTUNE = 0x40;
}

void interrupt INTERRUPT_InterruptManager(void){
    // interrupt handler
    if(INTCONbits.PEIE == 1) {
        if (PIR3bits.CCP4IF) {
            CCP4_ISR();
        }
        else if (PIR3bits.CCP5IF) {
            CCP5_ISR();
        }
        else if (PIR2bits.TMR3IF) {
            TMR3_ISR();
        }
        else {
        //Unhandled Interrupt
        }
    }
}

void StartADC(void){
    while (ADCON0bits.GO_nDONE) { } // ���� ���������� ���
    ADCON0bits.GO = 1;              // ������ ��������������
}


void GetAllSensor(void){
uint8_t ChMask;
uint8Bits_t NumChannel;
//TitanADC_t *p;

    while (ADCON0bits.GO_nDONE) {  } // ���� ���������� ���
    if (AfterPOResetTimer != 0)         AfterPOResetTimer--;
    if (AfterPOResetTimer < 25) {   // 8 ������� * CSwitchDebounce = 24
        // ��������� 0,1 ��� AfterPOResetTimer - ������������� ��������� ��������
        NumChannel.value = ADC_Channel & 0x07;

        // ����� ������
        if (ADC_Channel <= 15) {
            ChMask = (uint8_t) (1 << NumChannel.value);

            if ((TitanSwitch.value & ChMask) != 0) {
                if (DigitInbit != 0) {
                    if (++DebounceCounter[NumChannel.value] >= CSwitchDebounce) {
                        TitanSwitch.value ^= ChMask;
                        DebounceCounter[NumChannel.value] = 0;
                    }
                } 
                else DebounceCounter[NumChannel.value] = 0;
            }
            else if (DigitInbit != 0) {
                    DebounceCounter[NumChannel.value] = 0;
                }
                else {
                    if (++DebounceCounter[NumChannel.value] >= CSwitchDebounce) {
                        TitanSwitch.value ^= ChMask;
                        DebounceCounter[NumChannel.value] = 0;
                    }
            }
        } // */

        if (ADC_Channel <8) {
            LowPassFilterADC (&ADC_10uA, NumChannel.value);
        }
        else if (ADC_Channel < 16) {
            LowPassFilterADC (&ADC_500uA, NumChannel.value);
        }

        ADC_Channel++;
        if (ADC_Channel > 16) ADC_Channel = 0;
        NumChannel.value = ADC_Channel & 0x07;

        if (ADC_Channel < 8) {
            RelayRegister.RelayRegBit.nSel500uA = 1;
        }
        else {
            RelayRegister.RelayRegBit.nSel500uA = 0;
        }

        RelayRegister.RelayRegBit.ChannelBit0 = NumChannel.Bits.Bit0;
        RelayRegister.RelayRegBit.ChannelBit1 = NumChannel.Bits.Bit1;
        RelayRegister.RelayRegBit.ChannelBit2 = NumChannel.Bits.Bit2;
        WriteRelayRegister();

        ADCON0 = (ADC_Input[NumChannel.value] << 2) + 1;
                            //    ADCON0bits.CHS = ADC_Input[NumChannel.value];
        if ((ADC_Channel == 16)) {
            ADCON0bits.ADCAL = 1; // Calibration is performed on next A/D conversion
        }
        else {
            ADCON0bits.ADCAL = 0;
        }
        ADCON2 = 0x83;  // ��� A/D Acquisition Time = 0 ������ �� RC ���������� �������� !!!!
                //8A;   // Right justified, A/D Acquisition Time = 2, TAD = TOSC * 32
    }
}

void LowPassFilterADC(TitanADC_t *pFiltrValue, uint8_t Ch) {
    uint16_t Val;
    uint16_t *p;
    
    p = ((uint16_t) pFiltrValue) + ((uint8_t)(Ch << 1));   // ��������� �� ���������� ��������
    if (AfterPOResetTimer != 0) {               // �� ����� ������ ������ ��������� ��������         
        *p = (uint16_t) ADRES;
    }
    else {
        Val = *p;
        Val = Val << 6;
        Val -= *p;
        Val += (uint16_t) ADRES;
        *p = Val >> 6;
    }
}

void BoilerLogic(void){
//    if (AfterPOResetTimer == 0) {  // ���� �������� AfterPOResetTimer ��� �������� �����������
        RelayRegister.RelayRegBit.RelayEV1 = TitanSwitch.Switch.Switch1;
        RelayRegister.RelayRegBit.RelayEV2 = TitanSwitch.Switch.Switch2;
        TitanHwFlags.Flags.MakeIgnition = ((RelayRegister.RelayRegBit.RelayEV1 == 1) && (TitanSwitch.Switch.GasIgnition == 1));
//    }    
}

inline void WriteRelayRegister(void){
static uint8_t MakeIgnitionCounter;
uint8_t ByteToShift;
uint8_t BitCounter;
    
    ByteToShift = RelayRegister.RelayRegByte.Lo;
    for (BitCounter = 0; BitCounter < 8; BitCounter++){
        RelaySCbit = 0;
        if (ByteToShift & 0x01){
            RelaySDbit = 1;
        }
        else{
            RelaySDbit = 0;
        }
        ByteToShift = ByteToShift >> 1;
        RelaySCbit = 1;
    }
    
        // ��������� �������� ��� ������ ������� �� ����� MakeIgnition
    if (++MakeIgnitionCounter >= (CIgnitionEnablePeriod/4)) {  // 4 ms - ��� ����� ���� ��������
        MakeIgnitionCounter = 0;
        MakeIgnitionBit = TitanHwFlags.Flags.MakeIgnition;
    }


    ByteToShift = RelayRegister.RelayRegByte.Hi;
    for (BitCounter = 0; BitCounter < 8; BitCounter++){
        RelaySCbit = 0;
        if (ByteToShift & 0x01){
            RelaySDbit = 1;
        }
        else{
            RelaySDbit = 0;
        }
        ByteToShift = ByteToShift >> 1;
        RelaySCbit = 1;
    }
            
    RelayPCbit = 1;
    
    MakeIgnitionBit = 0;
    
    RelayPCbit = 0;
}

void TitanApp(void) {
    // ���� �������� 1 ��� � 1 �� !!!
            if ((Count_1_ms & 0x03) == 0){
                StartADC();         // ���� �������� 1 ��� � 4 �� !!!
            }
            else if ((Count_1_ms & 0x03) == 1){
                GetAllSensor();     // ���� �������� 1 ��� � 4 �� !!!
                NOP();
            }
            else if ((Count_1_ms & 0x03) == 2){
                // DecodeTemp();    // ���� �������� 1 ��� � 4 �� !!!
            }
            else {
                BoilerLogic();      // ���� �������� 1 ��� � 4 �� !!!
                NOP();
            }
}

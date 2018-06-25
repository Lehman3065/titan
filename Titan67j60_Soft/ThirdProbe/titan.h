/* 
 * File:   main.h
 * Author: јлексей81
 *
 * Created on 24 апрел€ 2018 г., 17:54
 */

#ifndef TITAN_H
#define	TITAN_H

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>
#include "timers.h"
//#include "pin_manager.h"
//#include "interrupt_manager.h"
//#include "spi1.h"
//#include "mcc_generated_files\tmr1.h"
//#include "tmr0.h"
//#include "eccp1.h"
//#include "adc.h"
// #include "TCPIPLibrary/network.h"

//#include "titanvar.h"
//#include "titaninit.h"

// CONFIG1L
#pragma config WDT = ON         // Watchdog Timer Enable bit (WDT enabled)
#pragma config STVR = ON        // Stack Overflow/Underflow Reset Enable bit (Reset on stack overflow/underflow enabled)
#pragma config XINST = OFF      // Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))
#pragma config DEBUG = ON       // Background Debugger Enable bit->Background debugger enabled; RB6 and RB7 are dedicated to In-Circuit Debug

// CONFIG1H
#pragma config CP0 = OFF        // Code Protection bit (Program memory is not code-protected)

// CONFIG2L
#pragma config FOSC = HSPLL    // Oscillator Selection bits->HS oscillator, PLL enabled and under software control
#pragma config FOSC2 = ON       // Default/Reset System Clock Select bit (Clock selected by FOSC1:FOSC0 as system clock is enabled when OSCCON<1:0> = 00)
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor enabled)
#pragma config IESO = ON        // Two-Speed Start-up (Internal/External Oscillator Switchover) Control bit (Two-Speed Start-up enabled)

// CONFIG2H
#pragma config WDTPS = 64       // Watchdog Timer Postscaler Select bits (1:64)

// CONFIG3L

// CONFIG3H
#pragma config ETHLED = ON      // Ethernet LED Enable bit (RA0/RA1 are multiplexed with LEDA/LEDB when Ethernet module is enabled and function as I/O when Ethernet is disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

// port A
#define Ain6    2
#define A_3VA   3
#define Ain7    5

// port B
#define ComCS   4
#define nFlHold 5

// portC
#define SpiMISO 4
#define ComTx   6
#define UartRx  7

// portD
#define DataECCP3 1
#define DataCCP4 2
#define nModPWM 0

// portE
#define RelaySC 0
#define RelaySCbit  LATEbits.LATE0
#define RelaySD 1
#define RelaySDbit  LATEbits.LATE1
#define DigitIn 3
#define DigitInbit  PORTEbits.RE3
#define nFlashCS 4

// portF
#define RelayPC 7
#define RelayPCbit LATFbits.LATF7

// portG
#define MakeIgnitionOpto 4
#define MakeIgnitionBit PORTGbits.RG4

typedef union {
    uint8_t value;
struct {                    // дл€ хранени€ сото€ни€ выключателей
    unsigned GasIgnition : 1;
    unsigned Switch1 : 1;
    unsigned Switch2 : 1;
    unsigned Switch3 : 1;
    unsigned Switch4 : 1;
    unsigned Switch5 : 1;
    unsigned Switch6 : 1;
    unsigned Switch7 : 1;
    } Switch;
} TitanSwitch_t;            

typedef union {
    uint8_t value;
struct {                    // дл€ хранени€ сото€ни€ выключателей
    unsigned Bit0 : 1;
    unsigned Bit1 : 1;
    unsigned Bit2 : 1;
    unsigned Bit3 : 1;
    unsigned Bit4 : 1;
    unsigned Bit5 : 1;
    unsigned Bit6 : 1;
    unsigned Bit7 : 1;
    } Bits;
} uint8Bits_t;            

typedef union {             // дл€ хранени€ показаний ADC
    int16_t value[8];
struct {
    int16_t Termistor0;           
    int16_t Termistor1;        
    int16_t Termistor2;       
    int16_t Termistor3;
    int16_t Termistor4;
    int16_t Termistor5;
    int16_t Resistor6;
    int16_t Resistor7;
    } Resistors;
} TitanADC_t;

typedef struct {            // дл€ хранени€ показаний температуры *10
    int16_t Room;           // в комнате
    int16_t OutDoor;        // на улице
    int16_t HotWater;       // воды
    int16_t Termistor3;
    int16_t Termistor4;
    int16_t Termistor5;
} TitanTemp_t; 

typedef union {
    uint16_t value;
struct{
    uint8_t Lo;
    uint8_t Hi;
    } RelayRegByte;
struct {
    unsigned ChannelBit2 : 1;
    unsigned ChannelBit1 : 1;
    unsigned ChannelBit0 : 1;
    unsigned nFaultHV : 1;
    unsigned LedFaultKathode : 1;
    unsigned RelayEV2 : 1;
    unsigned RelayEV1 : 1;
    unsigned EnablePWM : 1;
    unsigned Bit8 : 1;
    unsigned LedFaultAnode : 1;
    unsigned RelayMotor5 : 1;
    unsigned RelayMotor4 : 1;
    unsigned RelayMotor3 : 1;
    unsigned RelayMotor2 : 1;
    unsigned RelayMotor1 : 1;
    unsigned nSel500uA : 1;
    } RelayRegBit;
struct {
    unsigned Channel : 3;    
    };
}RelayRegister_t;

typedef union {
    uint8_t value;
struct {
    unsigned MakeIgnition: 1;
    } Flags;
} TitanHwFlags_t;

static RelayRegister_t RelayRegister;
static TitanSwitch_t TitanSwitch;
static TitanTemp_t TitanTemp;
static TitanHwFlags_t TitanHwFlags;

#define INTERRUPT_GlobalInterruptHighEnable() (INTCONbits.GIEH = 1)
#define INTERRUPT_GlobalInterruptHighDisable() (INTCONbits.GIEH = 0)
#define INTERRUPT_GlobalInterruptLowEnable() (INTCONbits.GIEL = 1)
#define INTERRUPT_GlobalInterruptLowDisable() (INTCONbits.GIEL = 0)
#define INTERRUPT_GlobalInterruptEnable() (INTCONbits.GIE = 1)
#define INTERRUPT_GlobalInterruptDisable() (INTCONbits.GIE = 0)
#define INTERRUPT_PeripheralInterruptEnable() (INTCONbits.PEIE = 1)
#define INTERRUPT_PeripheralInterruptDisable() (INTCONbits.PEIE = 0)

void HardwareInit(void);
void VariablesInit(void);
void GetAllSensor(void);
void StartADC(void);
void BoilerLogic(void);
inline void WriteRelayRegister(void);
void TitanApp(void);
void interrupt INTERRUPT_InterruptManager(void);


#endif	/* TITAN_H */


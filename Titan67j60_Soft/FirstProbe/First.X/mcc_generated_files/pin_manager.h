/**
  @Generated Pin Manager Header File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.h

  @Summary:
    This is the Pin Manager file generated using MPLAB(c) Code Configurator

  @Description:
    This header file provides implementations for pin APIs for all pins selected in the GUI.
    Generation Information :
        Product Revision  :  MPLAB(c) Code Configurator - 4.26
        Device            :  PIC18F67J60
        Version           :  1.01
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.35
        MPLAB             :  MPLAB X 3.40

    Copyright (c) 2013 - 2015 released Microchip Technology Inc.  All rights reserved.

    Microchip licenses to you the right to use, modify, copy and distribute
    Software only when embedded on a Microchip microcontroller or digital signal
    controller that is integrated into your product or third party product
    (pursuant to the sublicense terms in the accompanying license agreement).

    You should refer to the license agreement accompanying this Software for
    additional information regarding your rights and obligations.

    SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
    EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
    MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
    IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
    CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
    OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
    INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
    CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
    SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
    (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

*/


#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set LedA aliases
#define LedA_TRIS               TRISAbits.TRISA0
#define LedA_LAT                LATAbits.LATA0
#define LedA_PORT               PORTAbits.RA0
#define LedA_ANS                anselRA0bits.anselRA0
#define LedA_SetHigh()            do { LATAbits.LATA0 = 1; } while(0)
#define LedA_SetLow()             do { LATAbits.LATA0 = 0; } while(0)
#define LedA_Toggle()             do { LATAbits.LATA0 = ~LATAbits.LATA0; } while(0)
#define LedA_GetValue()           PORTAbits.RA0
#define LedA_SetDigitalInput()    do { TRISAbits.TRISA0 = 1; } while(0)
#define LedA_SetDigitalOutput()   do { TRISAbits.TRISA0 = 0; } while(0)
#define LedA_SetAnalogMode()  do { anselRA0bits.anselRA0 = 1; } while(0)
#define LedA_SetDigitalMode() do { anselRA0bits.anselRA0 = 0; } while(0)

// get/set LedB aliases
#define LedB_TRIS               TRISAbits.TRISA1
#define LedB_LAT                LATAbits.LATA1
#define LedB_PORT               PORTAbits.RA1
#define LedB_ANS                anselRA1bits.anselRA1
#define LedB_SetHigh()            do { LATAbits.LATA1 = 1; } while(0)
#define LedB_SetLow()             do { LATAbits.LATA1 = 0; } while(0)
#define LedB_Toggle()             do { LATAbits.LATA1 = ~LATAbits.LATA1; } while(0)
#define LedB_GetValue()           PORTAbits.RA1
#define LedB_SetDigitalInput()    do { TRISAbits.TRISA1 = 1; } while(0)
#define LedB_SetDigitalOutput()   do { TRISAbits.TRISA1 = 0; } while(0)
#define LedB_SetAnalogMode()  do { anselRA1bits.anselRA1 = 1; } while(0)
#define LedB_SetDigitalMode() do { anselRA1bits.anselRA1 = 0; } while(0)

// get/set channel_Ref5k1 aliases
#define channel_Ref5k1_TRIS               TRISAbits.TRISA2
#define channel_Ref5k1_LAT                LATAbits.LATA2
#define channel_Ref5k1_PORT               PORTAbits.RA2
#define channel_Ref5k1_ANS                anselRA2bits.anselRA2
#define channel_Ref5k1_SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define channel_Ref5k1_SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define channel_Ref5k1_Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define channel_Ref5k1_GetValue()           PORTAbits.RA2
#define channel_Ref5k1_SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define channel_Ref5k1_SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define channel_Ref5k1_SetAnalogMode()  do { anselRA2bits.anselRA2 = 1; } while(0)
#define channel_Ref5k1_SetDigitalMode() do { anselRA2bits.anselRA2 = 0; } while(0)

// get/set RA3 procedures
#define RA3_SetHigh()    do { LATAbits.LATA3 = 1; } while(0)
#define RA3_SetLow()   do { LATAbits.LATA3 = 0; } while(0)
#define RA3_Toggle()   do { LATAbits.LATA3 = ~LATAbits.LATA3; } while(0)
#define RA3_GetValue()         PORTAbits.RA3
#define RA3_SetDigitalInput()   do { TRISAbits.TRISA3 = 1; } while(0)
#define RA3_SetDigitalOutput()  do { TRISAbits.TRISA3 = 0; } while(0)
#define RA3_SetAnalogMode() do { anselRA3bits.anselRA3 = 1; } while(0)
#define RA3_SetDigitalMode()do { anselRA3bits.anselRA3 = 0; } while(0)

// get/set DispSerMode aliases
#define DispSerMode_TRIS               TRISAbits.TRISA4
#define DispSerMode_LAT                LATAbits.LATA4
#define DispSerMode_PORT               PORTAbits.RA4
#define DispSerMode_SetHigh()            do { LATAbits.LATA4 = 1; } while(0)
#define DispSerMode_SetLow()             do { LATAbits.LATA4 = 0; } while(0)
#define DispSerMode_Toggle()             do { LATAbits.LATA4 = ~LATAbits.LATA4; } while(0)
#define DispSerMode_GetValue()           PORTAbits.RA4
#define DispSerMode_SetDigitalInput()    do { TRISAbits.TRISA4 = 1; } while(0)
#define DispSerMode_SetDigitalOutput()   do { TRISAbits.TRISA4 = 0; } while(0)

// get/set channel_Ref33k aliases
#define channel_Ref33k_TRIS               TRISAbits.TRISA5
#define channel_Ref33k_LAT                LATAbits.LATA5
#define channel_Ref33k_PORT               PORTAbits.RA5
#define channel_Ref33k_ANS                anselRA5bits.anselRA5
#define channel_Ref33k_SetHigh()            do { LATAbits.LATA5 = 1; } while(0)
#define channel_Ref33k_SetLow()             do { LATAbits.LATA5 = 0; } while(0)
#define channel_Ref33k_Toggle()             do { LATAbits.LATA5 = ~LATAbits.LATA5; } while(0)
#define channel_Ref33k_GetValue()           PORTAbits.RA5
#define channel_Ref33k_SetDigitalInput()    do { TRISAbits.TRISA5 = 1; } while(0)
#define channel_Ref33k_SetDigitalOutput()   do { TRISAbits.TRISA5 = 0; } while(0)
#define channel_Ref33k_SetAnalogMode()  do { anselRA5bits.anselRA5 = 1; } while(0)
#define channel_Ref33k_SetDigitalMode() do { anselRA5bits.anselRA5 = 0; } while(0)

// get/set NoPWMFault aliases
#define NoPWMFault_TRIS               TRISBbits.TRISB0
#define NoPWMFault_LAT                LATBbits.LATB0
#define NoPWMFault_PORT               PORTBbits.RB0
#define NoPWMFault_SetHigh()            do { LATBbits.LATB0 = 1; } while(0)
#define NoPWMFault_SetLow()             do { LATBbits.LATB0 = 0; } while(0)
#define NoPWMFault_Toggle()             do { LATBbits.LATB0 = ~LATBbits.LATB0; } while(0)
#define NoPWMFault_GetValue()           PORTBbits.RB0
#define NoPWMFault_SetDigitalInput()    do { TRISBbits.TRISB0 = 1; } while(0)
#define NoPWMFault_SetDigitalOutput()   do { TRISBbits.TRISB0 = 0; } while(0)

// get/set NoHiVFault aliases
#define NoHiVFault_TRIS               TRISBbits.TRISB1
#define NoHiVFault_LAT                LATBbits.LATB1
#define NoHiVFault_PORT               PORTBbits.RB1
#define NoHiVFault_SetHigh()            do { LATBbits.LATB1 = 1; } while(0)
#define NoHiVFault_SetLow()             do { LATBbits.LATB1 = 0; } while(0)
#define NoHiVFault_Toggle()             do { LATBbits.LATB1 = ~LATBbits.LATB1; } while(0)
#define NoHiVFault_GetValue()           PORTBbits.RB1
#define NoHiVFault_SetDigitalInput()    do { TRISBbits.TRISB1 = 1; } while(0)
#define NoHiVFault_SetDigitalOutput()   do { TRISBbits.TRISB1 = 0; } while(0)

// get/set DispInt aliases
#define DispInt_TRIS               TRISBbits.TRISB2
#define DispInt_LAT                LATBbits.LATB2
#define DispInt_PORT               PORTBbits.RB2
#define DispInt_SetHigh()            do { LATBbits.LATB2 = 1; } while(0)
#define DispInt_SetLow()             do { LATBbits.LATB2 = 0; } while(0)
#define DispInt_Toggle()             do { LATBbits.LATB2 = ~LATBbits.LATB2; } while(0)
#define DispInt_GetValue()           PORTBbits.RB2
#define DispInt_SetDigitalInput()    do { TRISBbits.TRISB2 = 1; } while(0)
#define DispInt_SetDigitalOutput()   do { TRISBbits.TRISB2 = 0; } while(0)

// get/set SerialLinkIn aliases
#define SerialLinkIn_TRIS               TRISBbits.TRISB3
#define SerialLinkIn_LAT                LATBbits.LATB3
#define SerialLinkIn_PORT               PORTBbits.RB3
#define SerialLinkIn_SetHigh()            do { LATBbits.LATB3 = 1; } while(0)
#define SerialLinkIn_SetLow()             do { LATBbits.LATB3 = 0; } while(0)
#define SerialLinkIn_Toggle()             do { LATBbits.LATB3 = ~LATBbits.LATB3; } while(0)
#define SerialLinkIn_GetValue()           PORTBbits.RB3
#define SerialLinkIn_SetDigitalInput()    do { TRISBbits.TRISB3 = 1; } while(0)
#define SerialLinkIn_SetDigitalOutput()   do { TRISBbits.TRISB3 = 0; } while(0)

// get/set DigIn aliases
#define DigIn_TRIS               TRISBbits.TRISB4
#define DigIn_LAT                LATBbits.LATB4
#define DigIn_PORT               PORTBbits.RB4
#define DigIn_SetHigh()            do { LATBbits.LATB4 = 1; } while(0)
#define DigIn_SetLow()             do { LATBbits.LATB4 = 0; } while(0)
#define DigIn_Toggle()             do { LATBbits.LATB4 = ~LATBbits.LATB4; } while(0)
#define DigIn_GetValue()           PORTBbits.RB4
#define DigIn_SetDigitalInput()    do { TRISBbits.TRISB4 = 1; } while(0)
#define DigIn_SetDigitalOutput()   do { TRISBbits.TRISB4 = 0; } while(0)

// get/set NoFlashHold aliases
#define NoFlashHold_TRIS               TRISBbits.TRISB5
#define NoFlashHold_LAT                LATBbits.LATB5
#define NoFlashHold_PORT               PORTBbits.RB5
#define NoFlashHold_SetHigh()            do { LATBbits.LATB5 = 1; } while(0)
#define NoFlashHold_SetLow()             do { LATBbits.LATB5 = 0; } while(0)
#define NoFlashHold_Toggle()             do { LATBbits.LATB5 = ~LATBbits.LATB5; } while(0)
#define NoFlashHold_GetValue()           PORTBbits.RB5
#define NoFlashHold_SetDigitalInput()    do { TRISBbits.TRISB5 = 1; } while(0)
#define NoFlashHold_SetDigitalOutput()   do { TRISBbits.TRISB5 = 0; } while(0)

// get/set PGC aliases
#define PGC_TRIS               TRISBbits.TRISB6
#define PGC_LAT                LATBbits.LATB6
#define PGC_PORT               PORTBbits.RB6
#define PGC_SetHigh()            do { LATBbits.LATB6 = 1; } while(0)
#define PGC_SetLow()             do { LATBbits.LATB6 = 0; } while(0)
#define PGC_Toggle()             do { LATBbits.LATB6 = ~LATBbits.LATB6; } while(0)
#define PGC_GetValue()           PORTBbits.RB6
#define PGC_SetDigitalInput()    do { TRISBbits.TRISB6 = 1; } while(0)
#define PGC_SetDigitalOutput()   do { TRISBbits.TRISB6 = 0; } while(0)

// get/set PGD aliases
#define PGD_TRIS               TRISBbits.TRISB7
#define PGD_LAT                LATBbits.LATB7
#define PGD_PORT               PORTBbits.RB7
#define PGD_SetHigh()            do { LATBbits.LATB7 = 1; } while(0)
#define PGD_SetLow()             do { LATBbits.LATB7 = 0; } while(0)
#define PGD_Toggle()             do { LATBbits.LATB7 = ~LATBbits.LATB7; } while(0)
#define PGD_GetValue()           PORTBbits.RB7
#define PGD_SetDigitalInput()    do { TRISBbits.TRISB7 = 1; } while(0)
#define PGD_SetDigitalOutput()   do { TRISBbits.TRISB7 = 0; } while(0)

// get/set NoDispCs aliases
#define NoDispCs_TRIS               TRISCbits.TRISC0
#define NoDispCs_LAT                LATCbits.LATC0
#define NoDispCs_PORT               PORTCbits.RC0
#define NoDispCs_SetHigh()            do { LATCbits.LATC0 = 1; } while(0)
#define NoDispCs_SetLow()             do { LATCbits.LATC0 = 0; } while(0)
#define NoDispCs_Toggle()             do { LATCbits.LATC0 = ~LATCbits.LATC0; } while(0)
#define NoDispCs_GetValue()           PORTCbits.RC0
#define NoDispCs_SetDigitalInput()    do { TRISCbits.TRISC0 = 1; } while(0)
#define NoDispCs_SetDigitalOutput()   do { TRISCbits.TRISC0 = 0; } while(0)

// get/set DispPoDown aliases
#define DispPoDown_TRIS               TRISCbits.TRISC1
#define DispPoDown_LAT                LATCbits.LATC1
#define DispPoDown_PORT               PORTCbits.RC1
#define DispPoDown_SetHigh()            do { LATCbits.LATC1 = 1; } while(0)
#define DispPoDown_SetLow()             do { LATCbits.LATC1 = 0; } while(0)
#define DispPoDown_Toggle()             do { LATCbits.LATC1 = ~LATCbits.LATC1; } while(0)
#define DispPoDown_GetValue()           PORTCbits.RC1
#define DispPoDown_SetDigitalInput()    do { TRISCbits.TRISC1 = 1; } while(0)
#define DispPoDown_SetDigitalOutput()   do { TRISCbits.TRISC1 = 0; } while(0)

// get/set I2C_En aliases
#define I2C_En_TRIS               TRISCbits.TRISC2
#define I2C_En_LAT                LATCbits.LATC2
#define I2C_En_PORT               PORTCbits.RC2
#define I2C_En_SetHigh()            do { LATCbits.LATC2 = 1; } while(0)
#define I2C_En_SetLow()             do { LATCbits.LATC2 = 0; } while(0)
#define I2C_En_Toggle()             do { LATCbits.LATC2 = ~LATCbits.LATC2; } while(0)
#define I2C_En_GetValue()           PORTCbits.RC2
#define I2C_En_SetDigitalInput()    do { TRISCbits.TRISC2 = 1; } while(0)
#define I2C_En_SetDigitalOutput()   do { TRISCbits.TRISC2 = 0; } while(0)

// get/set SPI_Clk aliases
#define SPI_Clk_TRIS               TRISCbits.TRISC3
#define SPI_Clk_LAT                LATCbits.LATC3
#define SPI_Clk_PORT               PORTCbits.RC3
#define SPI_Clk_SetHigh()            do { LATCbits.LATC3 = 1; } while(0)
#define SPI_Clk_SetLow()             do { LATCbits.LATC3 = 0; } while(0)
#define SPI_Clk_Toggle()             do { LATCbits.LATC3 = ~LATCbits.LATC3; } while(0)
#define SPI_Clk_GetValue()           PORTCbits.RC3
#define SPI_Clk_SetDigitalInput()    do { TRISCbits.TRISC3 = 1; } while(0)
#define SPI_Clk_SetDigitalOutput()   do { TRISCbits.TRISC3 = 0; } while(0)

// get/set SPI_MISO aliases
#define SPI_MISO_TRIS               TRISCbits.TRISC4
#define SPI_MISO_LAT                LATCbits.LATC4
#define SPI_MISO_PORT               PORTCbits.RC4
#define SPI_MISO_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define SPI_MISO_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define SPI_MISO_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define SPI_MISO_GetValue()           PORTCbits.RC4
#define SPI_MISO_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define SPI_MISO_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)

// get/set SPI_MOSI aliases
#define SPI_MOSI_TRIS               TRISCbits.TRISC5
#define SPI_MOSI_LAT                LATCbits.LATC5
#define SPI_MOSI_PORT               PORTCbits.RC5
#define SPI_MOSI_SetHigh()            do { LATCbits.LATC5 = 1; } while(0)
#define SPI_MOSI_SetLow()             do { LATCbits.LATC5 = 0; } while(0)
#define SPI_MOSI_Toggle()             do { LATCbits.LATC5 = ~LATCbits.LATC5; } while(0)
#define SPI_MOSI_GetValue()           PORTCbits.RC5
#define SPI_MOSI_SetDigitalInput()    do { TRISCbits.TRISC5 = 1; } while(0)
#define SPI_MOSI_SetDigitalOutput()   do { TRISCbits.TRISC5 = 0; } while(0)

// get/set ComTx aliases
#define ComTx_TRIS               TRISCbits.TRISC6
#define ComTx_LAT                LATCbits.LATC6
#define ComTx_PORT               PORTCbits.RC6
#define ComTx_SetHigh()            do { LATCbits.LATC6 = 1; } while(0)
#define ComTx_SetLow()             do { LATCbits.LATC6 = 0; } while(0)
#define ComTx_Toggle()             do { LATCbits.LATC6 = ~LATCbits.LATC6; } while(0)
#define ComTx_GetValue()           PORTCbits.RC6
#define ComTx_SetDigitalInput()    do { TRISCbits.TRISC6 = 1; } while(0)
#define ComTx_SetDigitalOutput()   do { TRISCbits.TRISC6 = 0; } while(0)

// get/set ComRx aliases
#define ComRx_TRIS               TRISCbits.TRISC7
#define ComRx_LAT                LATCbits.LATC7
#define ComRx_PORT               PORTCbits.RC7
#define ComRx_SetHigh()            do { LATCbits.LATC7 = 1; } while(0)
#define ComRx_SetLow()             do { LATCbits.LATC7 = 0; } while(0)
#define ComRx_Toggle()             do { LATCbits.LATC7 = ~LATCbits.LATC7; } while(0)
#define ComRx_GetValue()           PORTCbits.RC7
#define ComRx_SetDigitalInput()    do { TRISCbits.TRISC7 = 1; } while(0)
#define ComRx_SetDigitalOutput()   do { TRISCbits.TRISC7 = 0; } while(0)

// get/set IO_RD0 aliases
#define IO_RD0_TRIS               TRISDbits.TRISD0
#define IO_RD0_LAT                LATDbits.LATD0
#define IO_RD0_PORT               PORTDbits.RD0
#define IO_RD0_SetHigh()            do { LATDbits.LATD0 = 1; } while(0)
#define IO_RD0_SetLow()             do { LATDbits.LATD0 = 0; } while(0)
#define IO_RD0_Toggle()             do { LATDbits.LATD0 = ~LATDbits.LATD0; } while(0)
#define IO_RD0_GetValue()           PORTDbits.RD0
#define IO_RD0_SetDigitalInput()    do { TRISDbits.TRISD0 = 1; } while(0)
#define IO_RD0_SetDigitalOutput()   do { TRISDbits.TRISD0 = 0; } while(0)

// get/set IO_RD1 aliases
#define IO_RD1_TRIS               TRISDbits.TRISD1
#define IO_RD1_LAT                LATDbits.LATD1
#define IO_RD1_PORT               PORTDbits.RD1
#define IO_RD1_SetHigh()            do { LATDbits.LATD1 = 1; } while(0)
#define IO_RD1_SetLow()             do { LATDbits.LATD1 = 0; } while(0)
#define IO_RD1_Toggle()             do { LATDbits.LATD1 = ~LATDbits.LATD1; } while(0)
#define IO_RD1_GetValue()           PORTDbits.RD1
#define IO_RD1_SetDigitalInput()    do { TRISDbits.TRISD1 = 1; } while(0)
#define IO_RD1_SetDigitalOutput()   do { TRISDbits.TRISD1 = 0; } while(0)

// get/set IO_RD2 aliases
#define IO_RD2_TRIS               TRISDbits.TRISD2
#define IO_RD2_LAT                LATDbits.LATD2
#define IO_RD2_PORT               PORTDbits.RD2
#define IO_RD2_SetHigh()            do { LATDbits.LATD2 = 1; } while(0)
#define IO_RD2_SetLow()             do { LATDbits.LATD2 = 0; } while(0)
#define IO_RD2_Toggle()             do { LATDbits.LATD2 = ~LATDbits.LATD2; } while(0)
#define IO_RD2_GetValue()           PORTDbits.RD2
#define IO_RD2_SetDigitalInput()    do { TRISDbits.TRISD2 = 1; } while(0)
#define IO_RD2_SetDigitalOutput()   do { TRISDbits.TRISD2 = 0; } while(0)

// get/set RelaySerialClk aliases
#define RelaySerialClk_TRIS               TRISEbits.TRISE0
#define RelaySerialClk_LAT                LATEbits.LATE0
#define RelaySerialClk_PORT               PORTEbits.RE0
#define RelaySerialClk_SetHigh()            do { LATEbits.LATE0 = 1; } while(0)
#define RelaySerialClk_SetLow()             do { LATEbits.LATE0 = 0; } while(0)
#define RelaySerialClk_Toggle()             do { LATEbits.LATE0 = ~LATEbits.LATE0; } while(0)
#define RelaySerialClk_GetValue()           PORTEbits.RE0
#define RelaySerialClk_SetDigitalInput()    do { TRISEbits.TRISE0 = 1; } while(0)
#define RelaySerialClk_SetDigitalOutput()   do { TRISEbits.TRISE0 = 0; } while(0)

// get/set RelaySerialData aliases
#define RelaySerialData_TRIS               TRISEbits.TRISE1
#define RelaySerialData_LAT                LATEbits.LATE1
#define RelaySerialData_PORT               PORTEbits.RE1
#define RelaySerialData_SetHigh()            do { LATEbits.LATE1 = 1; } while(0)
#define RelaySerialData_SetLow()             do { LATEbits.LATE1 = 0; } while(0)
#define RelaySerialData_Toggle()             do { LATEbits.LATE1 = ~LATEbits.LATE1; } while(0)
#define RelaySerialData_GetValue()           PORTEbits.RE1
#define RelaySerialData_SetDigitalInput()    do { TRISEbits.TRISE1 = 1; } while(0)
#define RelaySerialData_SetDigitalOutput()   do { TRISEbits.TRISE1 = 0; } while(0)

// get/set NoFlashWrProtect aliases
#define NoFlashWrProtect_TRIS               TRISEbits.TRISE2
#define NoFlashWrProtect_LAT                LATEbits.LATE2
#define NoFlashWrProtect_PORT               PORTEbits.RE2
#define NoFlashWrProtect_SetHigh()            do { LATEbits.LATE2 = 1; } while(0)
#define NoFlashWrProtect_SetLow()             do { LATEbits.LATE2 = 0; } while(0)
#define NoFlashWrProtect_Toggle()             do { LATEbits.LATE2 = ~LATEbits.LATE2; } while(0)
#define NoFlashWrProtect_GetValue()           PORTEbits.RE2
#define NoFlashWrProtect_SetDigitalInput()    do { TRISEbits.TRISE2 = 1; } while(0)
#define NoFlashWrProtect_SetDigitalOutput()   do { TRISEbits.TRISE2 = 0; } while(0)

// get/set ComCs aliases
#define ComCs_TRIS               TRISEbits.TRISE3
#define ComCs_LAT                LATEbits.LATE3
#define ComCs_PORT               PORTEbits.RE3
#define ComCs_SetHigh()            do { LATEbits.LATE3 = 1; } while(0)
#define ComCs_SetLow()             do { LATEbits.LATE3 = 0; } while(0)
#define ComCs_Toggle()             do { LATEbits.LATE3 = ~LATEbits.LATE3; } while(0)
#define ComCs_GetValue()           PORTEbits.RE3
#define ComCs_SetDigitalInput()    do { TRISEbits.TRISE3 = 1; } while(0)
#define ComCs_SetDigitalOutput()   do { TRISEbits.TRISE3 = 0; } while(0)

// get/set NoFlashCs aliases
#define NoFlashCs_TRIS               TRISEbits.TRISE4
#define NoFlashCs_LAT                LATEbits.LATE4
#define NoFlashCs_PORT               PORTEbits.RE4
#define NoFlashCs_SetHigh()            do { LATEbits.LATE4 = 1; } while(0)
#define NoFlashCs_SetLow()             do { LATEbits.LATE4 = 0; } while(0)
#define NoFlashCs_Toggle()             do { LATEbits.LATE4 = ~LATEbits.LATE4; } while(0)
#define NoFlashCs_GetValue()           PORTEbits.RE4
#define NoFlashCs_SetDigitalInput()    do { TRISEbits.TRISE4 = 1; } while(0)
#define NoFlashCs_SetDigitalOutput()   do { TRISEbits.TRISE4 = 0; } while(0)

// get/set IO_RE5 aliases
#define IO_RE5_TRIS               TRISEbits.TRISE5
#define IO_RE5_LAT                LATEbits.LATE5
#define IO_RE5_PORT               PORTEbits.RE5
#define IO_RE5_SetHigh()            do { LATEbits.LATE5 = 1; } while(0)
#define IO_RE5_SetLow()             do { LATEbits.LATE5 = 0; } while(0)
#define IO_RE5_Toggle()             do { LATEbits.LATE5 = ~LATEbits.LATE5; } while(0)
#define IO_RE5_GetValue()           PORTEbits.RE5
#define IO_RE5_SetDigitalInput()    do { TRISEbits.TRISE5 = 1; } while(0)
#define IO_RE5_SetDigitalOutput()   do { TRISEbits.TRISE5 = 0; } while(0)

// get/set channel_TResJ4 aliases
#define channel_TResJ4_TRIS               TRISFbits.TRISF1
#define channel_TResJ4_LAT                LATFbits.LATF1
#define channel_TResJ4_PORT               PORTFbits.RF1
#define channel_TResJ4_ANS                anselRF1bits.anselRF1
#define channel_TResJ4_SetHigh()            do { LATFbits.LATF1 = 1; } while(0)
#define channel_TResJ4_SetLow()             do { LATFbits.LATF1 = 0; } while(0)
#define channel_TResJ4_Toggle()             do { LATFbits.LATF1 = ~LATFbits.LATF1; } while(0)
#define channel_TResJ4_GetValue()           PORTFbits.RF1
#define channel_TResJ4_SetDigitalInput()    do { TRISFbits.TRISF1 = 1; } while(0)
#define channel_TResJ4_SetDigitalOutput()   do { TRISFbits.TRISF1 = 0; } while(0)
#define channel_TResJ4_SetAnalogMode()  do { anselRF1bits.anselRF1 = 1; } while(0)
#define channel_TResJ4_SetDigitalMode() do { anselRF1bits.anselRF1 = 0; } while(0)

// get/set channel_TResJ5 aliases
#define channel_TResJ5_TRIS               TRISFbits.TRISF2
#define channel_TResJ5_LAT                LATFbits.LATF2
#define channel_TResJ5_PORT               PORTFbits.RF2
#define channel_TResJ5_ANS                anselRF2bits.anselRF2
#define channel_TResJ5_SetHigh()            do { LATFbits.LATF2 = 1; } while(0)
#define channel_TResJ5_SetLow()             do { LATFbits.LATF2 = 0; } while(0)
#define channel_TResJ5_Toggle()             do { LATFbits.LATF2 = ~LATFbits.LATF2; } while(0)
#define channel_TResJ5_GetValue()           PORTFbits.RF2
#define channel_TResJ5_SetDigitalInput()    do { TRISFbits.TRISF2 = 1; } while(0)
#define channel_TResJ5_SetDigitalOutput()   do { TRISFbits.TRISF2 = 0; } while(0)
#define channel_TResJ5_SetAnalogMode()  do { anselRF2bits.anselRF2 = 1; } while(0)
#define channel_TResJ5_SetDigitalMode() do { anselRF2bits.anselRF2 = 0; } while(0)

// get/set channel_TResJ6 aliases
#define channel_TResJ6_TRIS               TRISFbits.TRISF3
#define channel_TResJ6_LAT                LATFbits.LATF3
#define channel_TResJ6_PORT               PORTFbits.RF3
#define channel_TResJ6_ANS                anselRF3bits.anselRF3
#define channel_TResJ6_SetHigh()            do { LATFbits.LATF3 = 1; } while(0)
#define channel_TResJ6_SetLow()             do { LATFbits.LATF3 = 0; } while(0)
#define channel_TResJ6_Toggle()             do { LATFbits.LATF3 = ~LATFbits.LATF3; } while(0)
#define channel_TResJ6_GetValue()           PORTFbits.RF3
#define channel_TResJ6_SetDigitalInput()    do { TRISFbits.TRISF3 = 1; } while(0)
#define channel_TResJ6_SetDigitalOutput()   do { TRISFbits.TRISF3 = 0; } while(0)
#define channel_TResJ6_SetAnalogMode()  do { anselRF3bits.anselRF3 = 1; } while(0)
#define channel_TResJ6_SetDigitalMode() do { anselRF3bits.anselRF3 = 0; } while(0)

// get/set channel_TResJ7 aliases
#define channel_TResJ7_TRIS               TRISFbits.TRISF4
#define channel_TResJ7_LAT                LATFbits.LATF4
#define channel_TResJ7_PORT               PORTFbits.RF4
#define channel_TResJ7_ANS                anselRF4bits.anselRF4
#define channel_TResJ7_SetHigh()            do { LATFbits.LATF4 = 1; } while(0)
#define channel_TResJ7_SetLow()             do { LATFbits.LATF4 = 0; } while(0)
#define channel_TResJ7_Toggle()             do { LATFbits.LATF4 = ~LATFbits.LATF4; } while(0)
#define channel_TResJ7_GetValue()           PORTFbits.RF4
#define channel_TResJ7_SetDigitalInput()    do { TRISFbits.TRISF4 = 1; } while(0)
#define channel_TResJ7_SetDigitalOutput()   do { TRISFbits.TRISF4 = 0; } while(0)
#define channel_TResJ7_SetAnalogMode()  do { anselRF4bits.anselRF4 = 1; } while(0)
#define channel_TResJ7_SetDigitalMode() do { anselRF4bits.anselRF4 = 0; } while(0)

// get/set channel_TResJ8 aliases
#define channel_TResJ8_TRIS               TRISFbits.TRISF5
#define channel_TResJ8_LAT                LATFbits.LATF5
#define channel_TResJ8_PORT               PORTFbits.RF5
#define channel_TResJ8_ANS                anselRF5bits.anselRF5
#define channel_TResJ8_SetHigh()            do { LATFbits.LATF5 = 1; } while(0)
#define channel_TResJ8_SetLow()             do { LATFbits.LATF5 = 0; } while(0)
#define channel_TResJ8_Toggle()             do { LATFbits.LATF5 = ~LATFbits.LATF5; } while(0)
#define channel_TResJ8_GetValue()           PORTFbits.RF5
#define channel_TResJ8_SetDigitalInput()    do { TRISFbits.TRISF5 = 1; } while(0)
#define channel_TResJ8_SetDigitalOutput()   do { TRISFbits.TRISF5 = 0; } while(0)
#define channel_TResJ8_SetAnalogMode()  do { anselRF5bits.anselRF5 = 1; } while(0)
#define channel_TResJ8_SetDigitalMode() do { anselRF5bits.anselRF5 = 0; } while(0)

// get/set channel_TResJ9 aliases
#define channel_TResJ9_TRIS               TRISFbits.TRISF6
#define channel_TResJ9_LAT                LATFbits.LATF6
#define channel_TResJ9_PORT               PORTFbits.RF6
#define channel_TResJ9_ANS                anselRF6bits.anselRF6
#define channel_TResJ9_SetHigh()            do { LATFbits.LATF6 = 1; } while(0)
#define channel_TResJ9_SetLow()             do { LATFbits.LATF6 = 0; } while(0)
#define channel_TResJ9_Toggle()             do { LATFbits.LATF6 = ~LATFbits.LATF6; } while(0)
#define channel_TResJ9_GetValue()           PORTFbits.RF6
#define channel_TResJ9_SetDigitalInput()    do { TRISFbits.TRISF6 = 1; } while(0)
#define channel_TResJ9_SetDigitalOutput()   do { TRISFbits.TRISF6 = 0; } while(0)
#define channel_TResJ9_SetAnalogMode()  do { anselRF6bits.anselRF6 = 1; } while(0)
#define channel_TResJ9_SetDigitalMode() do { anselRF6bits.anselRF6 = 0; } while(0)

// get/set RelayParClk aliases
#define RelayParClk_TRIS               TRISFbits.TRISF7
#define RelayParClk_LAT                LATFbits.LATF7
#define RelayParClk_PORT               PORTFbits.RF7
#define RelayParClk_SetHigh()            do { LATFbits.LATF7 = 1; } while(0)
#define RelayParClk_SetLow()             do { LATFbits.LATF7 = 0; } while(0)
#define RelayParClk_Toggle()             do { LATFbits.LATF7 = ~LATFbits.LATF7; } while(0)
#define RelayParClk_GetValue()           PORTFbits.RF7
#define RelayParClk_SetDigitalInput()    do { TRISFbits.TRISF7 = 1; } while(0)
#define RelayParClk_SetDigitalOutput()   do { TRISFbits.TRISF7 = 0; } while(0)

// get/set SerialLinkOut aliases
#define SerialLinkOut_TRIS               TRISGbits.TRISG4
#define SerialLinkOut_LAT                LATGbits.LATG4
#define SerialLinkOut_PORT               PORTGbits.RG4
#define SerialLinkOut_SetHigh()            do { LATGbits.LATG4 = 1; } while(0)
#define SerialLinkOut_SetLow()             do { LATGbits.LATG4 = 0; } while(0)
#define SerialLinkOut_Toggle()             do { LATGbits.LATG4 = ~LATGbits.LATG4; } while(0)
#define SerialLinkOut_GetValue()           PORTGbits.RG4
#define SerialLinkOut_SetDigitalInput()    do { TRISGbits.TRISG4 = 1; } while(0)
#define SerialLinkOut_SetDigitalOutput()   do { TRISGbits.TRISG4 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/
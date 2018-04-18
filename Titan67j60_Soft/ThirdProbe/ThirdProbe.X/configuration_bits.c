
#include <p18cxxx.h>    /* C18 General Include File */

/******************************************************************************/
/* Configuration Bits                                                         */
/*                                                                            */
/* Refer to 'HI-TECH PICC and PICC18 Toolchains > PICC18 Configuration        */
/* Settings' under Help > Contents in MPLAB X IDE for available PIC18         */
/* Configuration Bit Settings for the correct macros when using the C18       */
/* compiler.  When using the Hi-Tech PICC18 compiler, refer to the compiler   */
/* manual.pdf in the compiler installation doc directory section on           */
/* 'Configuration Fuses'.  The device header file in the HiTech PICC18        */
/* compiler installation directory contains the available macros to be        */
/* embedded.  The XC8 compiler contains documentation on the configuration    */
/* bit macros within the compiler installation /docs folder in a file called  */
/* pic18_chipinfo.html.                                                       */
/*                                                                            */
/* For additional information about what the hardware configurations mean in  */
/* terms of device operation, refer to the device datasheet.                  */
/*                                                                            */
/* General C18/XC8 syntax for configuration macros:                           */
/* #pragma config <Macro Name>=<Setting>, <Macro Name>=<Setting>, ...         */
/*                                                                            */
/* General HiTech PICC18 syntax:                                              */
/* __CONFIG(n,x);                                                             */
/*                                                                            */
/* n is the config word number and x represents the anded macros from the     */
/* device header file in the PICC18 compiler installation include directory.  */
/*                                                                            */
/* A feature of MPLAB X is the 'Generate Source Code to Output' utility in    */
/* the Configuration Bits window.  Under Window > PIC Memory Views >          */
/* Configuration Bits, a user controllable configuration bits window is       */
/* available to Generate Configuration Bits source code which the user can    */
/* paste into this project.                                                   */
/*                                                                            */
/******************************************************************************/

// Configuration bits: selected in the GUI

// CONFIG1L
#pragma config WDT = OFF    // Watchdog Timer Enable bit->WDT disabled (control is placed on SWDTEN bit)
#pragma config STVR = ON    // Stack Overflow/Underflow Reset Enable bit->Reset on stack overflow/underflow enabled
#pragma config XINST = OFF    // Extended Instruction Set Enable bit->Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
#pragma config DEBUG = ON    // Background Debugger Enable bit->Background debugger enabled; RB6 and RB7 are dedicated to In-Circuit Debug

// CONFIG1H
#pragma config CP0 = OFF    // Code Protection bit->Program memory is not code-protected

// CONFIG2L
#pragma config FOSC = HSPLL    // Oscillator Selection bits->HS oscillator, PLL enabled and under software control
#pragma config FOSC2 = ON    // Default/Reset System Clock Select bit->Clock selected by FOSC1:FOSC0 as system clock is enabled when OSCCON<1:0> = 00
#pragma config FCMEN = ON    // Fail-Safe Clock Monitor Enable->Fail-Safe Clock Monitor enabled
#pragma config IESO = ON    // Two-Speed Start-up (Internal/External Oscillator Switchover) Control bit->Two-Speed Start-up enabled

// CONFIG2H
#pragma config WDTPS = 32768    // Watchdog Timer Postscaler Select bits->1:32768

// CONFIG3H
#pragma config ETHLED = ON    // Ethernet LED Enable bit->RA0/RA1 are multiplexed with LEDA/LEDB when Ethernet module is enabled and function as I/O when Ethernet is disabled


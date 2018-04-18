/********************************************************************/
#ifndef TITAN_HARDWARE_PROFILE_H
#define TITAN_HARDWARE_PROFILE_H

#include "Compiler.h"

#define Titan_Board_Probe // Define a macro describing this hardware set up (used in other files)

// Set configuration fuses (but only in MainDemo.c where THIS_IS_STACK_APPLICATION is defined)
#if defined(THIS_IS_STACK_APPLICATION)
	#pragma config WDT=OFF, FOSC2=ON, FOSC=HSPLL, ETHLED=ON
	// Automatically set Extended Instruction Set fuse based on compiler setting
	#if defined(__EXTENDED18__)
		#pragma config XINST=ON
	#else
		#pragma config XINST=OFF
	#endif
#endif

// Clock frequency values
// These directly influence timed events using the Tick module.  They also are used for UART and SPI baud rate generation.
#define GetSystemClock()		(41666667ul)			// Hz
#define GetInstructionClock()	(GetSystemClock()/4)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Might need changing if using Doze modes.
#define GetPeripheralClock()	(GetSystemClock()/4)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Divisor may be different if using a PIC32 since it's configurable.


// Hardware I/O pin mappings

// AT25DF081A I/O pins
/*
#define SPIFLASH_CS_TRIS		(TRISEbits.TRISE4)
#define SPIFLASH_CS_IO			(LATEbits.LATE4)
#define SPIFLASH_SCK_TRIS		(TRISCbits.TRISC3)
#define SPIFLASH_SDI_TRIS		(TRISCbits.TRISC4)
#define SPIFLASH_SDI_IO			(PORTCbits.RC4)
#define SPIFLASH_SDO_TRIS		(TRISCbits.TRISC5)
#define SPIFLASH_SPI_IF			(PIR1bits.SSP1IF)
#define SPIFLASH_SSPBUF			(SSP1BUF)
#define SPIFLASH_SPICON1		(SSP1CON1)
#define SPIFLASH_SPICON1bits	(SSP1CON1bits)
#define SPIFLASH_SPICON2		(SSP1CON2)
#define SPIFLASH_SPISTAT		(SSP1STAT)
#define SPIFLASH_SPISTATbits	(SSP1STATbits)
 */

// UART mapping functions for consistent API names across 8-bit and 16 or 
// 32 bit compilers.  For simplicity, everything will use "UART" instead 
// of USART/EUSART/etc.
#define BusyUART()			BusyUSART()
#define CloseUART()			CloseUSART()
#define ConfigIntUART(a)	ConfigIntUSART(a)
#define DataRdyUART()		DataRdyUSART()
#define OpenUART(a,b,c)		OpenUSART(a,b,c)
#define ReadUART()			ReadUSART()
#define WriteUART(a)		WriteUSART(a)
#define getsUART(a,b,c)		getsUSART(b,a)
#define putsUART(a)			putsUSART(a)
#define getcUART()			ReadUSART()
#define putcUART(a)			WriteUSART(a)
#define putrsUART(a)		putrsUSART((far rom char*)a)

#endif // #ifndef TITAN_HARDWARE_PROFILE_H

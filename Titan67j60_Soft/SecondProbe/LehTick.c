/*********************************************************************
 *              Tick Manager for Timekeeping from Lehman
 *                Based on Microchip Technology, Inc.
********************************************************************/
#define __LehTICK_C

#include "Compiler.h"

// Internal counter to store Ticks.  This variable is incremented in an ISR and 
// therefore must be marked volatile to prevent the compiler optimizer from 
// reordering code to use this value in the main context while interrupts are 
// disabled.
static volatile WORD wLehInternalTicks = 0;

// 4-byte value to store LehTicks.  Allows for use over longer periods of time.
static volatile BYTE vLehTickReading[4] __attribute__ ((aligned));

static void GetLehTickCopy(void);


void LehTickInit(void)
/*****************************************************************************
 	This function is called only one during lifetime of the application.
  ***************************************************************************/
{
	// Use Timer1 for 8 bit processors
    // Initialize the time
    TMR1H = 0;
    TMR1L = 0;

	// Set up the timer interrupt
	IPR1bits.TMR1IP = 0;    // Low priority
    PIR1bits.TMR0IF = 0;    // Reset interrupt flag
    PIE1bits.TMR1IE = 1;    // Enable interrupt
    
    T1CON = 0x81; // Timer1 on, 16-bit, without prescalar, ON
}

/*****************************************************************************
	This function performs an interrupt-safe and synchronized read of the 
	32-bit Tick value.
  ***************************************************************************/
static void GetLehTickCopy(void)
{
	// Perform an Interrupt safe and synchronized read of the 32-bit tick value
	do
	{
		PIE1bits.TMR1IE = 1;    // Enable interrupt
		Nop();
		PIE1bits.TMR1IE = 0;	// Disable interrupt
		vLehTickReading[0] = TMR1L;
		vLehTickReading[1] = TMR1H;
		*((WORD*)&vLehTickReading[2]) = wLehInternalTicks;
	} while(PIR1bits.TMR0IF);
	PIE1bits.TMR1IE = 1;    // Enable interrupt
}


/*****************************************************************************
	This function retrieves the current Tick value, allowing timing and
	measurement code to be written in a non-blocking fashion.  This function
	retrieves the least significant 32 bits of the internal tick counter, 
	and is useful for measuring time increments ranging from a few 
	microseconds to a few hours.  Use TickGetDiv256 or TickGetDiv64K for
	longer periods of time.
  ***************************************************************************/
DWORD LehTickGet(void)
{
    DWORD dw;
    
	GetLehTickCopy();
	((BYTE*)&dw)[0] = vLehTickReading[0];	// Note: This copy must be done one byte at a time to 
	((BYTE*)&dw)[1] = vLehTickReading[1];	// prevent misaligned memory reads, which will reset the PIC.
	((BYTE*)&dw)[2] = vLehTickReading[2];	// 
	((BYTE*)&dw)[3] = vLehTickReading[3];
	return dw;
}

/*****************************************************************************
	Updates the tick value when an interrupt occurs.
  ***************************************************************************/
void LehTickUpdate(void)
{
    if(PIR1bits.TMR0IF)
    {
		wLehInternalTicks++;    // Increment internal high tick counter
        PIR1bits.TMR0IF = 0;    // Reset interrupt flag
    }
}


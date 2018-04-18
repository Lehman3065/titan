/*
 * TitanNonSafety.c
 *
 * Created: 20.02.2018 17:36:32
 *  Author: Алексей81
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <compat/deprecated.h>
#include "BitInstructions.h"

void InitArg(void);
void InitHardware(void);

ISR(PCINT0_vect)
{
	ClearBitInReg(PORTA, PORTA0);
}

int main(void)
{
	cli();
	if (RSTFLR & (1 << PORF)) InitArg();
	InitHardware();
    while(1)
    {
		PORTA |= (1<<PORTA0|1<<PORTA2);
		
    }
//	return 0;
}

void InitArg(void)
{
	PORTB &= ~(1<<PORTB1);
	RSTFLR &= ~(1 << PORF);
}

void InitHardware(void)
{
	sei();
}
/*
 * AssemblerApplicationEmpty.asm
 *
 *  Created: 11.04.2018 17:38:56
 *   Author: ???????81
 */ 

.MACRO WriteByteToRegCCP_r16	; Load reg through r16
	ldi	r16, 0xD8		; Write signature for change enable of protected I/O register
	out	CCP, r16
	ldi r16, (@1)
	out (@0), r16
.ENDMACRO				; WriteByteToRegCCP_r16

.MACRO WriteByteToReg_r16		; Load reg through r16
	ldi r16, (@1)
	out (@0), r16
.ENDMACRO				; WriteByteToReg_r16


 .CSEG
/* Программа */
.ORG 0x0
	rjmp power_reset	; Address 0x0000
	rjmp power_reset	; Address 0x0001 INT0_ISR
	rjmp power_reset	; Address 0x0002 PCINT0_ISR
	rjmp power_reset		; Address 0x0003 
	rjmp power_reset	; Address 0x0004 WDT_ISR
	rjmp power_reset	; Address 0x0005 TIM1_CAPT_ISR
	rjmp power_reset	; Address 0x0006 
	rjmp power_reset ; Address 0x0007 
	rjmp power_reset	; Address 0x0008 TIM1_OVF_ISR
	rjmp power_reset	; Address 0x0009 TIM0_COMPA_ISR
	rjmp power_reset	; Address 0x000A TIM0_COMPB_ISR
	rjmp power_reset	; Address 0x000B TIM0_OVF_ISR
	rjmp power_reset	; Address 0x000C ANA_COMP_ISR
	rjmp power_reset	; Address 0x000D ADC_ISR
	rjmp power_reset	; Address 0x000E TWI_SLAVE_ISR
	rjmp power_reset	; Address 0x000F SPI_ISR
	rjmp power_reset	; Address 0x0010 QTRIP_ISR

.ORG 0x0011
power_reset:
/*	init clock	*/
;	WriteByteToRegCCP_r16 CLKMSR, 1	; Internal 128 kHz Oscillator (WDT Oscillator) set is a main clock (through r16)
;	WriteByteToRegCCP_r16 CLKPSR, 0	; Prescaler = 1 (through r16)
	WriteByteToRegCCP_r16 CLKMSR, 0	; Calibrated Internal 8 MHz Oscillator set is a main clock (through r16) - after reset value
	WriteByteToRegCCP_r16 CLKPSR, 5	; Prescaler = 32 (through r16) => Fclk = 250 kHz


	WriteByteToRegCCP_r16 WDTCSR, ((1<<WDE) + 4) ; Watchdog enable Twd = 250ms (through r16)

	WriteByteToReg_r16	DIDR0, 0x17 ; отключаем цифровые входы, там, где аналог

	in	r16, RSTFLR		; polling Power On Reset
	clr	r17
	out	RSTFLR, r17
	sbrs r16, PORF
	rjmp HOT_reset

COOL_reset:
	clr	r26		; InputPrevPause
	clr r27		; InputDebounce

HOT_reset:
/*	init Power Management	*/
	WriteByteToReg_r16 PRR, ((1<<PRTIM0) + (1<<PRTWI) + (1<<PRSPI)) ; Stop clock for TIM0, I2C & SPI

	WriteByteToReg_r16 PORTCR, 3	; Break-Before-Make Mode for PORTA & PORTB Enable

/*	init PORTA	*/
	// WriteByteToReg_r16 PUEA, 0	; no pull-up - after reset value
	// WriteByteToReg_r16 PORTA, 0	; after reset value
	// WriteByteToReg_r16 DDRA, 0	; All - input

/*	init PORTB	*/
	WriteByteToReg_r16 PUEB, (1<<PUEB3) ; ~RESET: pull-up
	WriteByteToReg_r16 PORTB, 0x02 ; поджиг не активен
	WriteByteToReg_r16 DDRB, (0xFF - (0x01))	; PB0 - input

/* init Timer1  на счет циклов контроллера */
	// WriteByteToReg_r16 TCCR1A, 0 ; after reset value
	// WriteWordToReg_r16 OCR1AL, 0 ; after reset value
	// WriteWordToReg_r16 OCR1BL, 0 ; after reset value
	WriteByteToReg_r16 TCCR1B, (1<<ICNC1) ; Input Capture Noise Canceler ON  ??????????????????????????
	WriteByteToReg_r16 TCCR1B, (1<<CS10) ; clkI/O /1 (No prescaling) - start timer

/*	init ADC  */
	// WriteByteToReg_r16 ADCSRA, 0	; ADC Prescaler = 2 - after reset value


/*  init interrupt	
	WriteByteToReg_r16 PCMSK0, (1<<bLedIn) ; PCINT4 enable - прерывание по изменению сигнала посл. интерф.
	WriteByteToReg_r16 PCMSK1, (1<<bPhase) ; PCINT8 enable - прерывание по изменению фазы

	// WriteByteToReg_r16 TIMSK, 0 ; after reset value
	// WriteByteToReg_r16 GIMSK, 0 ; after reset value
	sei		; global interrupt enable
*/


	LOOOP:
	nop

	wdr

	rjmp LOOOP








/* 
���������:
- ������� ��������� ADC ��� ��������� ����������
- ������ ������� �� �����  bIgnition
- �������� ����� �������� 30 ��� � 6 ��� � ������ �������
- �������� 6 ���
�� ���������:
- �������� 30 ���
- ����� ����� �������� ������� ������
- ��������� ����� bFire ��� ������� �������
- ������������ ������ ��� �����������
�� �������:
- ���������� RJMP ? ������ ������ ������

 *	AssemblerNonSafety.asm
 *  ��������� ��� ����� ����� (�������������� ���������������)
 *  Created: 26.02.2018 11:44:07
 *   Author: Alexey81 */ 
 ;.include "tn20def.inc"

.EQU	Fclk = 250		; kHz - �������� ������� ����������
.EQU	bLedIn = 4		; PA4 ���� c ������� �������������� ��������. �������� ��������� = 0
						; ����� ��� ��������� �������. ��� ����� �������� �������� � �������� 25..30 ��
.EQU	bLedT1 = 7		; PA7 = T1 ���� c ������� �������������� ��������. �������� ��������� = 0
.EQU	PortLedIn = PORTA
.EQU	InUREF = 1		; ADC1 ���������� �������� ��������� 3,3 �
.EQU	InUGND = 2		; ADC2 ���������� ������� ������� ������������ ��������
.EQU	InUPhase = 3	; ADC3 ���������� ���� (����� ���������� ���������� ����������� ����)
.EQU	InUFire = 5		; ADC5 ���������� ������� �������
.EQU	bDEBUG = 6		; DEBUG pin
.EQU	PortU = PORTA

.EQU	bLedOut = 2		; PB2 = � ����� ���������� ������� �������������� ��������
.EQU	PortLedOut = PORTB
.EQU	bPhase = 0		; PB0 - �������� ������ ���� 50 �� � ��������� ����������
.EQU	PortPhase = PORTB
.EQU	bIgnitionOut = 1; PB1 - ����� �� ��������� ��������� �������. �������� ������� = 0
.EQU	PortIgnitionOut = PORTB

.EQU	Vcc = 5100			; mV (Vcc = 5100mV - BZX84-C5V1 DIOTEC, HOTTECH, SAMTECH)
.EQU	CorrectionT = 16	; �� CorrectionT ������ ���������� ��������� ������� ��� ��������� �� �������� ������������ ����
.EQU	SendStart = 25		; �������� ������ �������� ����� �������������� �������� �� ������ ��������
.EQU	Duration_0 = (Fclk/(3*4))	; ������������ ��������� ��� �������� 0 (0,25 ��)
.EQU	Duration_1 = (Fclk/(3*2))	; ������������ ��������� ��� �������� 1 (0,5 ��) - �������� 30 ��� ������������� ������������ � ������
.EQU	DurationStart = ((Duration_0 + Duration_1)/2)	; ������������ ���������� ��������� ��� ��������
.EQU	EndOfFrame = (Fclk * 3) ; �� 3 �� �� ����� ����� �������� ����� ������� ���� ����� 0 (Fclk ��� - ������� ����������)
.EQU	UFirePorog = 128	; ����� ������������ ������� �������
.EQU	CInputTimeout = ((50 * Fclk) / 256)	; 50 �� ����������� �������� �� ������� - ������ �� ����� : IgnitionStatus = 0
.EQU	CMinPeriodLength = ((12 * Fclk) / 256)	; 12 �� ����������� ������ �������� ����������
.EQU	CMaxPeriodLength = ((25 * Fclk) / 256)	; 25 �� ������������ ������ �������� ����������
.EQU	CInputDebounce = 3	; ������� ������ �������� �������� ���������, ����� IgnitionStatus ���� 1
.EQU	CInputMaxJitter = 2 ; ������������ �������� ������� ��������� ����������� ������ (��� ����� ���������� ��������)

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

.MACRO SetMachStat_r16
	ldi r16, (@1)
	sts (@0), r16
.ENDMACRO				; SetMachStat_r16

.MACRO WriteWordToReg_r16	; Load 16 bit reg through r16
	ldi r16, (HIGH(@1))
	out ((@0) + 1), r16
	ldi r16, (LOW(@1))
	out (@0), r16
.ENDMACRO				; WriteWordToReg_r16

.MACRO ReadWordRegToMem_r16	; Load 16 bit reg through r16
	in r16, (@0)
	sts (@1), r16
	in r16, ((@0) + 1)
	sts ((@1) + 1), r16
.ENDMACRO				; ReadWordRegToMem_r16

.MACRO ClrBitsReg31_r16	; Clr Register 20H..31H bits through r16
	in r16, (@0)
	andi r16, (0xFF - (@1))
	out (@0), r16
.ENDMACRO				; ClrBitsReg31_r16

.MACRO SetBitsReg31_r16	; Set Register 20H..31H bits through r16
	in r16, (@0)
	ori r16, (@1)
	out (@0), r16
.ENDMACRO				; SetBitsReg31_r16

.MACRO WriteByteToMem_r16	; Store Imm in Memiry through r16
	ldi r16, (@1)
	sts (@0), r16
.ENDMACRO				; WriteByteToMem_r16

.MACRO WaitTrue		; ��� "1" �� �����
LWait:
	sbis (@0), (@1) 
	rjmp LWait		;$-4		
.ENDMACRO			; WaitTrue

.MACRO WaitFalse	; ��� "0" �� �����
LWait:
	sbic (@0), (@1) 
	rjmp LWait		;$-4		
.ENDMACRO			; WaitFalse

.MACRO CopyWordWord_r16	; ����������� WORD to WORT � ������ through r16
	lds r16, (@1)
	sts (@0), r16
	lds r16, ((@1) + 1)
	sts ((@0) + 1), r16
.ENDMACRO

.MACRO Load_Z_Ptr	; �������� ��������� Z 
	ldi r31, (HIGH(@0))
	ldi r30, (LOW(@0))
.ENDMACRO			; Load_Z_Ptr

.MACRO Load16		; �������� ��������� �� ������
	lds @0, (@2)
	lds @1, ((@2) + 1)
.ENDMACRO			; Load16

.MACRO Store16		; ���������� ��������� � ������
	sts (@0), @1
	sts ((@0) + 1), @2
.ENDMACRO			; Store16

.MACRO sub16u		; 16 ��� ��������� ����������� ���
	sub	@0, @2
	sbc @1, @3 
.ENDMACRO			; sub16u

.MACRO subi16u		; 16 ��� ��������� ��������� �� ����������� ����
	subi @0, (LOW(@2))
	sbci @1, (HIGH(@2))
.ENDMACRO			; subi16u

.MACRO add16u		; 16 ��� �������� ����������� ���
	add	@0, @2
	adc @1, @3 
.ENDMACRO			; add16u

.MACRO div16u2		; 16 ��� ������� �� "2" ������� ������ �� 1 ������
	lsr	@1
	ror @0 
.ENDMACRO			; div16u2

.DSEG
/* ������ ��������� */
MachineState:	.BYTE	1	; �������� ������
.EQU	MachWaitStart = 11	; ��� ������ ��������� ������������ ��������� �����
.EQU	MachIgnition = 10	; �������� ������ � ������������ UFire
.EQU	MachEndStart = 9	; ����������� ���������� ������������ ��������� �����
.EQU	MachInUPhase0 = 8	; �������� InUPhase
.EQU	MachInUPhase1 = 7	; �������� InUPhase � ��������� ������� �������
.EQU	MachInUGND0 = 6		; �������� InUGND
.EQU	MachInUGND1 = 5		; �������� InUGND � ��������� ������� �������
.EQU	MachInUFire = 4		; ����������� ������� �� InUFire � ������ ������������ � ��������� InUREF
.EQU	MachSerialOut = 3	; 3..2 �������� ������ � ������� ����������
.EQU	MachSaveTime = 1	; ����������� ��������� ���������� ������������ ��������� �����

NewT1Value:		.BYTE	1	; 1 - ��������� ����� �������� T1Value
T1Value:		.BYTE	2	; ������� ����� ��������� ����� � ������ ����������� (� ������ �������� �������! ����)
PreT1Value:		.BYTE	2	; ���������� ����� ��������� ����� � ������ �����������
MachLength:		.BYTE	2	; ����� ��������� ����� � ������ �����������
TStartPeriod:		.BYTE	2	; ������ �������� ������� ���� (���� ���� � ��������!)
;StartT1:		.BYTE	2	; ������ ������� ������� ���� (���� ���� � ��������!)
;StartT2:		.BYTE	2	; ������ ������� ������� ���� (���� ���� � ��������!)
;StartT3:		.BYTE	2	; ������ �������� ������� ���� (���� ���� � ��������!)
;StartT4:		.BYTE	2	; ������ ���������� ������� ���� (���� ���� � ��������!)
;StartTMaxP:		.BYTE	2	; ������ ������������� �������������� ���������� ���� ������������ ������ ������� ����
LengthDiv2:		.BYTE	2	; PeriodLength/2 = ����� ������ �� 1 ������
LengthDiv4:		.BYTE	2	; PeriodLength/4 = ����� ������ �� 2 �������
LengthDiv8:		.BYTE	2	; PeriodLength/8 = ����� ������ �� 3 �������
;LengthDiv16:	.BYTE	2	; PeriodLength/16 = ����� ������ �� 4 �������
LengthDiv32:	.BYTE	2	; MachLength/32 = ����� ������ �� 5 �������� - UFire ������ ������
LengthDiv64:	.BYTE	2	; MachLength/64 = ����� ������ �� 6 ��������
Length3Div4:	.BYTE	2	; PeriodLength*3/4 = 3/4 ������� ���� - ������ ������ ���������� UFire ?
Length3Div8:	.BYTE	2	; PeriodLength*3/8 = 3/4 ����������� (3/8 �������) ���� - ������ ������ ����������
Length17Div32:	.BYTE	2	; PeriodLength*17/32 = UFire ������ ������ � ����� ������ ������� 
SendBuf:	; 4 ����� - ����� �������� ��� �������� � ������� ��������� ����� �������������� ��������
UPhase2Sum:		.BYTE	3	; ������� ����� ��������� �������� UPhase, ����� - �������������������� �������� ��� �������� (��. ����)
UGND2Sum:		.BYTE	3	; ������� ����� ��������� �������� UGND, ����� - �������������������� �������� ��� �������� (��. ����)
T1ToSend:	; 2 ����� - ��� �������� ����������� �������� �1 � ������ �������� � ������� ��������� ����� �������������� ��������
UFireSum:		.BYTE	2	; ����� �������� UFire
FireStatus:		.BYTE	1	; ������ Fire (������� �������) -  (��. ���)
.EQU	bFire = 0			; ���, ���������� �� ��, ��� ����� ����
UREFVal:		.BYTE	1	; ������ UREF - �������� ��� ��������
ReseiveByte:	.BYTE	1	; ����, �������� �� �������� ���������� ����� �������������� ��������
IgnitionStatus: .BYTE	1	; ������ ��������� �������
.EQU	bIgnition = 0		; ���, ���������� �� ��, ��� ����� �������� ��������� �������
InputTimeout:	.BYTE	1	; ������� ������ � �� (���� ������� �� CInputTimeout - ������ ������� �� ������ ���)
InputDebounce:	.BYTE	1	; ������� ������������ ��������� � ��������



PCINT1_ISR_regSave:	.BYTE	1 ; ����� ����������� �������� ��� PCINT1_ISR
TIM1_COMPB_ISR_regSave:	.BYTE	1 ; ����� ����������� �������� ��� TIM1_COMPB_ISR
 


.CSEG
/* ��������� */
.ORG 0x0
	rjmp power_reset	; Address 0x0000
	rjmp power_reset	; Address 0x0001 INT0_ISR
	rjmp power_reset	; Address 0x0002 PCINT0_ISR
	rjmp PCINT1_ISR		; Address 0x0003 
	rjmp power_reset	; Address 0x0004 WDT_ISR
	rjmp power_reset	; Address 0x0005 TIM1_CAPT_ISR
	rjmp TIM1_COMPA_ISR	; Address 0x0006 
	rjmp power_reset	; Address 0x0007 TIM1_COMPB_ISR
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

PCINT1_ISR:
	/* ��� ���������� ��������� ������ ��� ������������� ��������� ���� � ���� 
	MachineState = MachSaveTime, MachEndStart, MachWaitStart
	, ����� ��� ����������� ������������� ��������� ���� �������� ������ ��������� �����
	����������� � T1Value */
	sts PCINT1_ISR_regSave, r16				; ������� ������� �� ���������, �.�. ����� �� ��������
	ReadWordRegToMem_r16 TCNT1L, T1Value	; ��������� �������� �������1 � T1Value
	ldi r16, 1
	sts NewT1Value, r16
	lds r16, PCINT1_ISR_regSave
	reti

; TIM1_CAPT_ISR:
	/* ����� ����� ������ ��������� ��� �� ��������
	���� �� ��������
	������ ������� TIFR.ICF1 � �������� ��������� */
;	reti ���������� ������! - ��� ������� TIFR.ICF1 !!!

TIM1_COMPA_ISR:
	/* ����� ���� ��������� ADC
	����� ���������� �������  */
	sbi ADCSRA, ADEN			; ADC enable
	sbi ADCSRA, ADSC			; Start ADC Conversion
	reti

/*
TIM1_COMPB_ISR:
	// ����� ���� ��������� �������	��������
	sts TIM1_COMPB_ISR_regSave, r16
	WriteByteToReg_r16 TCCR1A, 0	; ���������� ��������� ������� ��� ���������� ����� - ����� ���
									; ���� �� ������� ���������� ��� �������� �� ��������� ��������
	lds r16, TIM1_COMPB_ISR_regSave
	reti
*/

power_reset:
/*	init clock	*/
;	WriteByteToRegCCP_r16 CLKMSR, 1	; Internal 128 kHz Oscillator (WDT Oscillator) set is a main clock (through r16)
;	WriteByteToRegCCP_r16 CLKPSR, 0	; Prescaler = 1 (through r16)

	WriteByteToRegCCP_r16 CLKMSR, 0	; Calibrated Internal 8 MHz Oscillator set is a main clock (through r16) - after reset value
	WriteByteToRegCCP_r16 CLKPSR, 5	; Prescaler = 32 (through r16) => Fclk = 250 kHz

	WriteByteToRegCCP_r16 WDTCSR, ((1<<WDE) + 4) ; Watchdog enable Twd = 250ms (through r16)
	WriteByteToReg_r16	DIDR0, ((1<<InUREF)|(1<<InUGND)|(1<<InUPhase)|(1<<InUFire)) ; ��������� �������� �����, ���, ��� ������

	in	r16, RSTFLR		; polling Power On Reset
	clr	r17
	out	RSTFLR, r17
	sbrs r16, PORF
	rjmp HOT_reset

COOL_reset:
	clr	r26		; InputPrevPause
	clr r27		; InputDebounce
	sts IgnitionStatus, r27 ; IgnitionStatus = 0
	sts FireStatus, r27		; FireStatus = 0

HOT_reset:
/*	init Power Management	*/
	WriteByteToReg_r16 PRR, ((1<<PRTIM0) + (1<<PRTWI) + (1<<PRSPI)) ; Stop clock for TIM0, I2C & SPI

	WriteByteToReg_r16 PORTCR, 3	; Break-Before-Make Mode for PORTA & PORTB Enable
/*	init PORTA	*/
	// WriteByteToReg_r16 PUEA, 0	; no pull-up - after reset value
	// WriteByteToReg_r16 PORTA, 0	; - after reset value
	WriteByteToReg_r16 DDRA, (1<<bDEBUG)	; bDEBUG - output

/*	init PORTB	*/
	WriteByteToReg_r16 PUEB, (1<<PUEB3) ; ~RESET: pull-up
	WriteByteToReg_r16 PORTB, (1<<bIgnitionOut) ; ������ �� �������
	WriteByteToReg_r16 DDRB, (0xFF - (1<<bPhase))	; PB0 - input

/* init Timer1  �� ���� ������ ����������� */
	// WriteByteToReg_r16 TCCR1A, 0 ; after reset value
	// WriteWordToReg_r16 OCR1AL, 0 ; after reset value
	// WriteWordToReg_r16 OCR1BL, 0 ; after reset value
	WriteByteToReg_r16 TCCR1B, (1<<ICNC1) ; Input Capture Noise Canceler ON  ??????????????????????????
	WriteByteToReg_r16 TCCR1B, (1<<CS10) ; clkI/O /1 (No prescaling) - start timer

/*	init ADC  */
	// WriteByteToReg_r16 ADCSRA, 0	; ADC Prescaler = 2 - after reset value

/*  init Machine
	������ ���� = 6 �������� ���� 50��
	- � ������ 2 ��������  ���������� ���������� InUPhase
	- � ��������� 2 - ���������� InUGND
	- � ��������� ������� ���������� InUREF, ������� ������� ������������ �� InUFire � ������ ������������
	- � ��������� 1 �������� ���� �������������� �������� 
	��������� � ������ � ������� ���������� ����� ���������������� �����
	� ���������� ��������� */
	SetMachStat_r16	MachineState, MachWaitStart
	clr r16
	sts NewT1Value, r16

/*  init interrupt	*/
	WriteByteToReg_r16 PCMSK0, (1<<bLedIn) ; PCINT4 enable - ���������� �� ��������� ������� ����. ������.
	WriteByteToReg_r16 PCMSK1, (1<<bPhase) ; PCINT8 enable - ���������� �� ��������� ����

	// WriteByteToReg_r16 TIMSK, 0 ; after reset value
	// WriteByteToReg_r16 GIMSK, 0 ; after reset value
	sei		; global interrupt enable




/*
LOOOP:
	wdr
	nop

	in r20, TCNT1L		; ���������� ������� �������� �������
	in r21, TCNT1H		; r20:r21 - ����������� ����� �������� ������� ��� ��������� �������
	bst r21, 0			; ����� ���� �
	brtc ClearDebug

SetDebug:
	sbi PORTA, bDEBUG

	rjmp LOOOP

ClearDebug:
	cbi PORTA, bDEBUG


	rjmp LOOOP



	sbi PORTA, bDEBUG

	nop

	cbi PORTA, bDEBUG



	rjmp LOOOP




*/


;	rjmp Send30BitToMain

	rjmp MainLoop

SetSendBuf:					; - must be MACRO ???
	clr r19					; ����� ����������� ����������� �����, ������� ����� ������� �� 4 ��� ����������� ��� nibbles
	lds r16, UPhase2Sum
	add	r19, r16
	sts	(SendBuf + 1), r16
	lds r16, UGND2Sum
	add	r19, r16
	sts	(SendBuf + 2), r16
	lds r16, UREFVal
	add	r19, r16
	sts	(SendBuf + 3), r16
	lds r16, FireStatus		; bit 0 - FireStatus
	lds r18, IgnitionStatus
	bst r18, bIgnition		; ����� ���� �
	bld r16, 1				; bit 1 - bIgnition - ���������� ��� ������������� ������
	andi r16, 0x03			; ��������� ���� 0, 1
	add	r19, r16			; r19 - ����������� �����
	mov	r18, r19			; ����������� � �� 4 ���
	swap r18
	add r19, r18
	lsl r19
	lsl r19
	or r16, r19
	andi r16, 0x3F			; ��������� 6 ��� (0 - FireStatus, 1 - Ignition, 2..5 - control sum)
	sts	(SendBuf + 0), r16  ; ������� �������� ����� � ����������� �����
	ret

SendFire:
	lds r18, FireStatus		; bit 0 - FireStatus
	bst r18, bFire			; ����� ���� �
	bld r16, 0				; bit 0 - bFire - ���������� ���� ������� �������
	bld r16, 2				; bit 2 - bFire - ���������� ���� ������� �������
	bld r16, 4				; bit 4 - bFire - ���������� ���� ������� �������

	lds r18, IgnitionStatus
	bst r18, bIgnition		; ����� ���� �
	bld r16, 1				; bit 1 - bIgnition - ���������� ��� ������������� ������
	bld r16, 3				; bit 1 - bIgnition - ���������� ��� ������������� ������
	bld r16, 5				; bit 1 - bIgnition - ���������� ��� ������������� ������

	ldi r18, ((1<<2)|(1<<3)); ����������� 2 ������� ����
	eor r16, r18
	andi r16, 0x3F
	sts	(SendBuf + 0), r16  ; �������� ����� � ����������� �����
	ldi r24, 6				; ����� 6 ���: 2 �����, 2 ����� ��������� � ����� 2 �����
	rjmp SendBuffer

Send30BitToMain:
	ldi r24, 30				; ����� ���������� 30 ���

SendBuffer:					; - must be MACRO ???
	Load_Z_Ptr SendBuf	; ������ ����� ����������
	ldi r18, 1			; ��������� �������
	ldi r19, 0			; ���������
	rcall SendImpuls
	ldi r18, (DurationStart)	; ��������� ��������
	ldi r19, 3			; ���������
	rcall SendImpuls

	ldi r19, 6
SendByteLoop:
	ldi r23, 6			; ������� �������� 6 ��������� ���� (2 ����� � 4 ��� ����������� �����) 
						; ���� bIgnition = 0, �� ���������� ��� � 3 ����� �������� ����������
	ld r22, Z+
SendBitLoop:
	ror r22				; �������� ������� ����� ������
	rcall SendCarry
	dec r24
	breq SendToMainExit
	dec r23
	ldi r19, 7
	nop
	nop
	brne SendBitLoop
	ldi r19, 9
	nop
	rjmp SendByteLoop
SendToMainExit:
	ret

SendCarry:
	brcs SendCarry1
	ldi r18, (Duration_0)
	rjmp SendImpuls
SendCarry1:
	ldi r18, (Duration_1)
	nop
SendImpuls:				;
	sub r18, r19
SendImpulsLoop:
	dec r18
	brne SendImpulsLoop
	sbi	PORTB, bLedOut
	nop
	cbi PORTB, bLedOut
	ret


IgnitionImpuls:			; ��������� ������ ����� �������� � �� �������������
	cbi PortIgnitionOut, bIgnitionOut	; +Ig � ����������� �������� ���������
IgnitionImpulsLoop:
	dec r16
	brne IgnitionImpulsLoop
	sbi PortIgnitionOut, bIgnitionOut	; ���������� +Ig
	ret

;**************************************************** ������ ��� ��������� ������ �������������� �������� (< 127)
L_MachInUFire:
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������

	clr r16
	sts	UFireSum, r16			; ����� ����� UFire
	sts (UFireSum + 1), r16		; ������� �������� �
	ldi r17, InUFire			; � ����� ����� ADC

	Load16 r18, r19, TStartPeriod	; ��������� �������� �������
	rcall Get_2_UFireSample_UREF
	ldi r16, MachSerialOut	; MachSerialOut - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������
	rcall GetFireStatus			; ��� ������������� ��������� ������� ������ Fire
	rcall SetSendBuf			; � ��������� ����� ��� ��������
	rjmp MainLoop

L_MachSerialOut:
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������

	rcall Send30BitToMain
	
;	SetMachStat_r16	MachineState, MachSaveTime	; MachineState = MachSaveTime - ��������� ��� �����
;	rjmp MainLoop

L_MachSaveTime:
	rjmp L_MachFrameEnd

;**************************************************** ������ ��� ��������� ������ �������������� �������� (< 127)


; *********** MAIN LOOP ****************************************************
MainLoop:
	wdr
	/* ������ MachineState */
	lds	r16, MachineState
	cpi r16, MachInUPhase0
	brlo BelowMachInUPhase0
	breq L_MachInUPhase0

	cpi r16, MachWaitStart
	brsh L_MachWaitStart

	cpi r16, MachEndStart
	breq L_MachEndStart
	rjmp L_MachIgnition		; �� �� MachWaitStart �� MachEndStart

BelowMachInUPhase0:
	cpi r16, MachInUFire
	brlo BelowMachInUFire
	breq L_MachInUFire

	cpi r16, MachInUGND0
	breq L_MachInUGND0
	brlo L_MachInUGND1
	rjmp L_MachInUPhase1

BelowMachInUFire:
	cpi r16, MachSaveTime	; ����� �������� - ��, ��� �� MachSaveTime ���� �� MachSerialOut
	breq L_MachSaveTime
	rjmp L_MachSerialOut

L_MachWaitStart:		; **********
	ldi r16, MachEndStart	; MachEndStart - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������ MachEndStart
	rjmp MainLoop

L_MachIgnition:			; **********
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������

	clr r16
	sts	UFireSum, r16			; ����� ����� UFire
	sts (UFireSum + 1), r16		; ������� �������� �
	ldi r17, InUFire			; � ����� ����� ADC

	Load16 r18, r19, TStartPeriod	; ��������� �������� �������
	rcall Get_2_UFireSample_UREF

	ldi r16, 60					; �� ������� �������� ����� ������� UFire
IgnLoop:
	dec r16
	nop
	brne IgnLoop

	ldi r16, 30					; ������������ �������� �������
	rcall IgnitionImpuls

	rcall GetFireStatus			; ��� ������������� ��������� ������� ������ Fire
	rcall SendFire				; ��������� ����� ��� �������� � �������� 6 ��������� ���� (2 ����� � 4 ��� ����������� �����)

	rcall WaitPhaseTrue_WaitStopIgnition	; ����� (+) ��������� ���� � ����� ��������� �������
	rjmp MainLoop

L_MachEndStart:			; **********
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) 
							; � ���������� ��� ������� (�����������, �.�. ��� ����������� �������� �1 !!!)
L_MachFrameEnd:
	ldi r16, MachInUPhase0	; MachInUPhase0 - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������
	rjmp MainLoop

L_MachInUPhase0: ; ********** ����� ���������� ������� �������� ���������� ���������� (��� ������� �� ����������) 
							; � �������� ����������� �������� UPhase
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������

	Load_Z_Ptr UPhase2Sum	; ����� ����� ��������� UPhase
	rcall ClearPZ_24_r16	; ������� �������� �
	ldi r17, InUPhase		; � ����� ����� ADC

	Load16 r18, r19, TStartPeriod	; ��������� �������� �������
	rcall Add_3_Sample		; ��������� 3 ����� ��������� �������� � 
	ldi r16, MachInUPhase1	; MachInUPhase1 - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������
	rjmp MainLoop

L_MachInUPhase1: ; ********** ���������� ����������� �������� UPhase (��� ��� �������)
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������
	Load16 r18, r19, TStartPeriod	; ��������� �������� �������
	rcall Add_3_Sample		; ��������� 3 ����� ��������� �������� � 
	ldi r16, MachInUGND0	; MachInUGND0 - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������
	rcall SQRT_Z			; 179 ��� ������������� ��������� ������� ������� ���������� ������
	rjmp MainLoop

L_MachInUGND0:  ; ********** �������� ����������� �������� �������� UGND
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������

	Load_Z_Ptr UGND2Sum ; ����� ����� ��������� UGND
	rcall ClearPZ_24_r16	; ������� �������� �
	ldi r17, InUGND			; � ����� ����� ADC

	Load16 r18, r19, TStartPeriod	; ��������� �������� �������
	rcall Add_3_Sample		; ��������� 3 ����� ��������� �������� � 
	ldi r16, MachInUGND1	; MachInUGND1 - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������
	rjmp MainLoop

L_MachInUGND1:	 ; ********** ���������� ����������� �������� �������� UGND
	rcall WaitPhaseFalse	; ����� (-) ��������� ���� ( T1Value = ����� ��������� �1) � ���������� ��� �������
	Load16 r18, r19, TStartPeriod	; ��������� �������� �������
	rcall Add_3_Sample		; ��������� 3 ����� ��������� �������� � 
	ldi r16, MachInUFire	; MachInUFire - ��������� ��������� ������
	rcall WaitPhaseTrueAndSetMachineState	; ����� (+) ��������� ���� � ���������� ��������� ������
	rcall SQRT_Z			; 179 ��� ������������� ��������� ������� ������� ���������� ������
	rjmp MainLoop

WaitPhaseTrueAndSetMachineState:
	WaitTrue PINB, bPhase	; ����� (+) ��������� ����
	sts MachineState, r16	; ���� IgnitionStatus <> 0 �� ��������� � ��������� ������ MachIgnition
	lds r16, IgnitionStatus
	cpi r16, 0
	brne SetIgnitionState
	ret
SetIgnitionState:
	ldi r16, MachIgnition
	sts MachineState, r16
	ret

WaitPhaseTrue_WaitStopIgnition:	; ����� (+) ��������� ���� � ����� ��������� �������
	WaitTrue PINB, bPhase	; ����� (+) ��������� ����
	lds r16, IgnitionStatus
	cpi r16, 0
	brne ExitStopIgnition
StopIgnition:
	ldi r16, MachEndStart	; MachEndStart - ��������� ��������� ������ (������ ���������� ����� ������ ����� ������ ����)
	sts MachineState, r16
ExitStopIgnition:
	ret

.MACRO SetTimeSamples
	Load16 r24, r25, T1Value	; ��������� ����� �������
	subi16u r24, r25, CorrectionT	; �������� CorrectionT, ��� ��� �������� ������ ����� ������� �� �������� ���� ����� ����
		; � ���� ��� � ������ ADC ������� �� ������������ ������� �1 - � ��� � ��� ����������� ����� ��������� ����������
	Store16 TStartPeriod, r24, r25	; r24:r25 = TStartPeriod -> ����� 0-�� ������� (���� ���� � ��������!)
	
	Load16 r24, r25, T1Value	; ��������� ����� �������
	Load16 r22, r23, PreT1Value
	Store16 PreT1Value, r24, r25; ��������� ��� ���������� �������� T1Value ��� ���������� �������

	sub16u r24, r25, r22, r23	; PeriodLength = r24:r25 = r24:r25 - r22:r23
TestMaxPeriodLength:
	cpi r25, CMinPeriodLength	; ����������� ������ �������� ���������� ������ ���� ��������
	brlo BedPeriodLength
	cpi r25, CMaxPeriodLength	; � ������������ ������ �������� ���������� - ���
	brlo StorePeriodLength
BedPeriodLength:
	clr r16
	rjmp StorePeriodStatus
StorePeriodLength:
	Store16 MachLength, r24, r25; PeriodLength = T1Value - PreT1Value


	div16u2 r24, r25			; PeriodLength/2
	Store16 LengthDiv2, r24, r25
	mov r22, r24
	mov r23, r25				; PeriodLength/2
	div16u2 r24, r25			; PeriodLength/4
	Store16 LengthDiv4, r24, r25

	add16u r22, r23, r24, r25
	Store16 Length3Div4, r22, r23	; 3/4 ������� ����

	mov r22, r24
	mov r23, r25				; PeriodLength/4
	div16u2 r24, r25			; PeriodLength/8
	Store16 LengthDiv8, r24, r25	; - ����������� �����������

	add16u r22, r23, r24, r25
	Store16 Length3Div8, r22, r23	; 3/4 ����������� ����

	div16u2 r24, r25			; PeriodLength/16
	div16u2 r24, r25			; PeriodLength/32
	Store16 LengthDiv32, r24, r25	; - 1/16 ����������� ����
	Load16 r22, r23, LengthDiv2
	add16u r22, r23, r24, r25
	Store16 Length17Div32, r22, r23	; 17/32 ������� ���� - � ���� ������ ����� ������ ������
	ldi r16, 1
StorePeriodStatus:
.ENDMACRO	; SetTimeSamples


WaitPhaseFalse:
	rcall Receive_r16		; ����� - must be MACRO ????
;	rcall SetIgnitionStatusTrue_r16	; DEBUG
	
	WriteByteToReg_r16 GIFR, (1<<PCIF1) ; ���������� ���� ����������
	WriteByteToMem_r16 NewT1Value, 0	; ���������� ���� NewT1Value
	sbi GIMSK, PCIE1		; ��������� ���������� PCINT1 -> PCINT1_ISR

WaitNewT1Value:				;	WaitFalse PINB, bPhase	; ����� (-) ��������� ����
	lds r16, NewT1Value
	tst r16
	breq WaitNewT1Value
	cbi GIMSK, PCIE1		; ��������� ���������� PCINT1 -> PCINT1_ISR
	SetTimeSamples			; ���� r16 = 1, �� ������ �������� � ������ � ��� ������� �����������
	tst r16
	breq PeriodBed
	ret
PeriodBed:
	WaitTrue PINB, bPhase	; ����� (+) ��������� ����
	rjmp WaitPhaseFalse



Receive_r16:	; ��� ���� Input Capture Flag T1 .. r29 - InputTimeout increment 
	; r26 - InputPrevPause ���������� ����� *2 /256
	; r27 - InputDebounce
	; r28 - �1 ������� �������� *2 /256
	; r29 - InputTimeout increment or local variable
	in r16, TIFR
	sbrc r16, ICF1 
	rjmp ReceiveTrue
	in r16, TCNT1L
	in r16, TCNT1H
	sub r16, r28
	cpi r16, CInputTimeout
	brlo Receive_Exit
	clr r27				; InputDebounce = 0
	sts IgnitionStatus, r27
	ret
ReceiveTrue:
	ldi r16, (1 << ICF1)
	out TIFR, r16
	in r16, ICR1L
	in r16, ICR1H
	mov	r29, r28		; Prev T1
	mov	r28, r16
	sub r16, r29
	mov r29, r16		; ActualPause
	sub r16, r26		; InputPrevPause
	mov r26, r29
	brcs DeltaMinus
	cpi r16, (CInputMaxJitter + 1)
	brcc ClearInputDebounce
IncInputDebounce:
	inc	r27
	cpi	r27, CInputDebounce
	brcs Receive_Exit
SetIgnitionStatusTrue_r16:
	ldi r16, 1
	sts IgnitionStatus, r16
	ret
DeltaMinus:
	cpi r16, (0 - CInputMaxJitter)
	brcc IncInputDebounce
ClearInputDebounce:
	clr r27
Receive_Exit:
	ret

ClearPZ_24_r16:		; ��������� 24 ��� �������� �� ��������� Z ��������� r16
	clr r16
	st Z+,r16
	st Z+,r16
	st Z+,r16
	subi r30, 3		; ���������� Z �� �������� ��������
	sbci r31, 0
	ret

AddSample:
	out ADMUX, r17	; ����� ADC
	out OCR1AH, r21	; ������������� ������ ������� ADC
	out OCR1AL, r20
	ldi r16, (1<<ADLAR) ; ������������ ����� (������� 2 ���� �����������)
	out ADCSRB, r16
	sbi ADCSRA, ADIF	; ����� ����� ����������
	ldi r16, (1<<OCIE1A); ��������� ���������� TIM1_COMPA_ISR
	out TIMSK, r16
	WaitTrue ADCSRA, ADIF	; ����� ADC
	in r22, ADCH	; result
	ldi r16, (1<<ADIF) ; ����� ����� � ���������� ADC
	out ADCSRA, r16
	clr r16			; ������ ���������� TIM1_COMPA_ISR
	out TIMSK, r16 
	mov r24, r22
	rcall mpy8u
	ld r22, Z
	add r22, r24
	st Z+, r22
	ld r22, Z
	adc r22, r25
	st Z+, r22
	clr r16
	ld r22, Z
	adc r22, r16
	st Z+, r22
	subi r30, 3		; ���������� Z �� �������� ��������
	sbci r31, 0
	ret

Add_3_Sample:
	Load16 r20, r21, LengthDiv8
	add16u r20, r21, r18, r19	; ���� ������ ������ � ������ r20:r21
	rcall AddSample

	Load16 r20, r21, LengthDiv4
	add16u r20, r21, r18, r19	; ���� ������ ������ � ������ r20:r21
	rcall AddSample

	Load16 r20, r21, Length3Div8
	add16u r20, r21, r18, r19	; ���� ������ ������ � ������ r20:r21
	rcall AddSample
	ret

AddUFire:
	out ADMUX, r17	; ����� ADC
	out OCR1AH, r21	; ������������� ������ ������� ADC
	out OCR1AL, r20
	clr r16			; ������������ ������ (10 ���)
	out ADCSRB, r16
	sbi ADCSRA, ADIF	; ����� ����� ����������
	ldi r16, (1<<OCIE1A); ��������� ���������� TIM1_COMPA_ISR
	out TIMSK, r16 
	WaitTrue ADCSRA, ADIF	; ����� ADC
	in r24, ADCL	; result UFire
	in r25, ADCH
	ldi r16, (1<<ADIF) ; ����� ����� � ���������� ADC
	out ADCSRA, r16
	clr r16			; ������ ���������� TIM1_COMPA_ISR
	out TIMSK, r16 

	lds r16, UFireSum
	add	r16, r24
	sts	UFireSum, r16
	lds r16, (UFireSum + 1)
	add	r16, r25
	sts	(UFireSum + 1), r16
	ret

GetUREF:				; - must be MACRO ???
	sbi ADCSRA, ADEN	; ADC enable
	ldi r16, InUREF
	out ADMUX, r16		; ����� ADC
	sbi ADCSRB, ADLAR	; ������������ ����� (������� 2 ���� �����������)
	sbi ADCSRA, ADIF	; ����� ����� ����������
	sbi ADCSRA, ADSC	; Start ADC Conversion
	WaitTrue ADCSRA, ADIF	; ����� ADC
	in r16, ADCH		; result UREF
	sts UREFVal, r16
	ldi r16, (1<<ADIF) ; ����� ����� � ���������� ADC
	out ADCSRA, r16
	ret

Get_2_UFireSample_UREF:			; - must be MACRO ???
	Load16 r20, r21, LengthDiv32
	add16u r20, r21, r18, r19	; ���� ������ ������ UFire � ������ r20:r21
	rcall AddUFire
	rcall GetUREF
	Load16 r20, r21, Length17Div32
	add16u r20, r21, r18, r19	; ���� ������ ������ UFire � ������ r20:r21
	rcall AddUFire
	ret

GetFireStatus:  ; ����� UFireSum �� ��� ������� ������ (����� 2-� 10-��� �������� �������� � 8 �����) - must be MACRO ???
				; � ��������� � UFirePorog. ��������� - ������� ��� � FireStatus
	ldi r16, 3
	lds r23, (UFireSum + 1)
	lds r22, UFireSum
GetFireStatus_L0:
	lsr r23
	ror	r22
	dec	r16
	brne GetFireStatus_L0
	; r22 - UFire
	subi r22, UFirePorog
	clr r22
	rol r22
	sts FireStatus, r22
	ret

SQRT_Z: ; ���������� ������ �� ��������� �� 8 ����, �� ��� ��������� Z 
		; �� ����� ���� ������������� 6 ��������� ��������, ���� 2 �������. �������� ���������� �����
	ldi r16, 3
	ld r22, Z+
	ld r23, Z+
	ld r24, Z+
SQRT_Z_L0:
	lsr r24
	ror	r23
	ror	r22
	dec	r16
	brne SQRT_Z_L0	; �������� �� 8. ��������� �� ����� 16 ���.
	rcall SQRT		; �� 195 ������; r22:r23. Value - ������� ��������; �������� r20:r21 - ������
	subi r30, 3		; ���������� Z �� �������� ��������
	sbci r31, 0
	st Z, r20
	ret

	
;***************************************************************************
;*
;* "mpy8u" - 8x8 Bit Unsigned Multiplication
;*
;* This subroutine multiplies the two register variables mp8uL and mc8u.
;* The result is placed in registers m8uH, mp8uL
;*  
;* Number of words	:9 + return
;* Number of cycles	:58 + return
;* Low registers used	:None
;* High registers used  :4 (mc8u,mp8uL,m8uH,mcnt8u)	
;*
;* Note: Result Low byte and the multiplier share the same register.
;* This causes the multiplier to be overwritten by the result.
;*
;***************************************************************************

;***** Subroutine Register Variables

.def	mc8u	=r22		;multiplicand
.def	mcnt8u	=r23		;loop counter
.def	mp8uL	=r24		;multiplier & result Low byte
.def	m8uH	=r25		;result High byte

;***** Code
mpy8u:	
	clr	m8uH		;clear result High byte
	ldi	mcnt8u,8	;init loop counter
	lsr	mp8uL		;rotate right result L byte and multiplier
m8u_1:
	brcc m8u_2		;carry set 
	add m8uH,mc8u	;add multiplicand to result High byte
m8u_2:	
	ror	m8uH		;rotate right result High byte
	ror	mp8uL		;rotate right result L byte and multiplier
	dec	mcnt8u		;decrement loop counter
	brne m8u_1		;if not done, loop more
	ret

; ****** http://www.microchip.com/forums/m577584.aspx ******
SQRT: ; ���������� ����������� ����� ������������ 16 ��� �����. �� 179 ������
	; r22:r23. Value - ������� ��������, �������� r20:r21 - ������
	; r20:r21 - Root
	; r24:r25 - Bit
	; r18:r19 - Trial
	clr r20			; unsigned Root = 0
	clr r21
	clr r24			; unsigned Bit    for ( Bit = 0x4000; Bit > 0; Bit >>= 2 )
	ldi r25, 0x40
SQRT_L1:
	mov r18, r20	; unsigned Trial = Root + Bit;
	mov r19, r21
	add r18, r24
	adc r19, r25
	lsr r21			; Root >>= 1;
	ror r20
	cp r22, r18		; if ( Trial <= Value )
	cpc r23, r19
	brcs SQRT_L2
	add r20, r24	; Root += Bit;
	adc r21, r25
	sub r22, r18	; Value -= Trial;
	sbc r23, r19
SQRT_L2:
	lsr r25			; Bit >>= 2
	ror r24
	lsr r25
	ror r24
	tst r24			; Bit > 0 ?
	brne SQRT_L1
	tst r25
	brne SQRT_L1
	ret

; Fill memory by NOP (code = 0x0000) in ST Visual Programmer

	.ORG	FLASHEND
LastProgMemory:
	rjmp	HOT_reset


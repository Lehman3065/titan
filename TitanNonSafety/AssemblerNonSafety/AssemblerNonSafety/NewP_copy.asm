; NewP_start.asm 
; Программа для простого таймера
; Created: 19.05.2017 13:39:17
; Author : Алексей81
;
;.include "tn10def.inc"

.EQU	bTKeyInput = 1	; --> Depends on PCB layout
.EQU	bPhazeInput = 0
.EQU	bOutput = 2
.EQU	bTimeTrimmer = 3

.EQU	Vcc = 5500			; mV (Vcc = 5600mV - BZX84-C5V6 DIOTEC); (Vcc = 4100mV - BZX84-C5V1 NXP)
.EQU	cTriacDelay = 75	; for delay after U phaze cross zero before Triac ignition in (3*Clock)
.EQU	cNumOfIgnition = 9	; quantity of impuls for Triac ignition
.EQU	cBetweenIgnition = 5; for delay between impulss for Triac ignition in (3*Clock)
.EQU	cIgnitionDuration = 2 + cTriacDelay + 5 + (cNumOfIgnition * (2 + cBetweenIgnition))	; Triac ignition duration in (3*Clock)
.EQU	cDelayForADC = 43	; for delay after Triac ignition before ADC sample in (3*Clock) = 5 ms after U phaze cross zero
.EQU	cTKeyDebounce = 8	; periods of electric power - TKeyInput debounce interval
.EQU	cTmin = ((15 * 50) - cTKeyDebounce)	; minimum motor running time in periods of electric power
.EQU	cTKeyLevel = (1587 * 256 / Vcc)	; 1587mV - porog level depended from (RPU - I/O Pin Pull-up Resistor)min and R TKeyInput (3M) and Vac min = 180VAC
.EQU	cMaxGetRegCnt = 50	; GetRegCnt = 0..49
.EQU	cNotGetTrimmer = 4	; GetRegCnt = 1..3
.EQU	cRegDebounce = 5	; in cMaxGetRegCnt * periods of electric power - fRegime debounce interval
.EQU	cResetHOutVol = (3600 * 256 / Vcc)	; 3600 mV max of Hi output voltage on "Reset" pin
.EQU	cChargePorog = 	(cResetHOutVol / 6)	; min deviaton of Trimmer ADC result after charge/discharge capasitor if jamper 'Reg' is set
.EQU	cMinBathLight = ((90 * 50) - cTKeyDebounce)	; min duration of light in bathroom for restart TimerCnt


.MACRO LoadRegCCP		; Load reg through r16
	ldi	r16, 0xD8		; Write signature for change enable of protected I/O register
	out	CCP, r16
	ldi r16, @1
	out @0, r16
.ENDMACRO				; LoadReg

.MACRO LoadReg			; Load reg through r16
	ldi r16, @1
	out @0, r16
.ENDMACRO				; LoadReg

.DSEG
TimerFlags:	.BYTE	1	; Flags of timer ->
.EQU	fTKeyToggle = 0
.EQU	fTKeyOn = 1
.EQU	fMotorOn = 2
.EQU	fWaitMinus = 3
.EQU	fRegime = 4		; 1 - bathroom
.EQU	fBathLightLong = 5	; 1 - duration of light in bathroom more then cMinBathLight
.EQU	fTimerCntWorking = 6

TimeShift:	.BYTE	1	; shift instant of TKeyInput ADC sample for detuning from periodic interference
TimerCnt:	.BYTE	3	; timer delay counter
TKeyDebCnt:	.BYTE	1	; debounce counter for TKeyInput
FiltrADC:	.BYTE	2	; filtered value of TimeTrimmer
GetRegCnt:	.BYTE	1	; ++ each 20mS, GetRegCnt == 0 -> call GetRegime;  GetRegCnt == 1..cNotGetTrimmer -> can not call GetADC;  GetRegCnt = 0..(cMaxGetRegCnt-1)
RegDebCnt:	.BYTE	1	; debounce counter for fRegime
BathTimeCnt: .BYTE	2	; time of light in bathroom

.CSEG 
.ORG 0x0
	rjmp power_reset	; Reset Handler - External Pin, Power-on Reset, VLM Reset and Watchdog Reset
	rjmp power_reset	; IRQ0 Handler - External Interrupt Request 0
	rjmp power_reset	; PCINT0 Handler - Pin Change Interrupt Request 0
	rjmp power_reset	; Timer0 Capture Handler
	rjmp power_reset	; Timer0 Overflow Handler
	rjmp power_reset	; Timer0 Compare A Handler
	rjmp power_reset	; Timer0 Compare B Handler
	rjmp power_reset	; Analog Comparator Handler
	rjmp power_reset	; Watchdog Interrupt Handler
	rjmp power_reset	; Voltage Level Monitor Handler
	rjmp power_reset	; ADC Conversion Handler - ADC Conversion Complete

.ORG 0x000b
power_reset:
	LoadRegCCP CLKMSR, 1	; Internal 128 kHz Oscillator (WDT Oscillator) set is a main clock (through r16)
	LoadRegCCP CLKPSR, 0	; Prescaler = 1 (through r16)
	LoadRegCCP WDTCSR, ((1<<WDE) + 4) ; Watchdog enable Twd = 250ms (through r16)
	LoadReg	DIDR0, ((1<<bTKeyInput) + (1<<bTimeTrimmer)) ; 

	in	r16, RSTFLR		; polling Power On Reset
	clr	r17
	out	RSTFLR, r17
	sbrs r16, PORF
	rjmp HOT_reset

COOL_reset:
	clr	r16
	sts	TimerFlags, r16			; FiltrADCEmpty!, TKeyOn = 0, MotorOn = 0, WaitPlus, Regime = 0
	sts	(TimerCnt+0), r16
	sts	(TimerCnt+1), r16
	sts	(TimerCnt+2), r16
	sts	TKeyDebCnt, r16
	sts	GetRegCnt, r16
	sts	(BathTimeCnt+0), r16
	sts	(BathTimeCnt+1), r16

	sts	(FiltrADC+0), r16		; FiltrADC initialization

	ldi	r17, bTimeTrimmer		; ADC input = TimeTrimmer
	rcall GetADC				; r17 = result
	com	r17				; if trimmer have reverse polarity
	sts	(FiltrADC+1), r17		; At once in "after filtration"
	ldi r16, (cRegDebounce -1)	; set fRegime straight off
	sts	RegDebCnt, r16
	rcall GetRegime

HOT_reset:
	LoadReg PORTCR, 2	; Break-Before-Make Mode Enable
	LoadReg PUEB, (1<<bTKeyInput) ; TKeyInput: pull-up
	LoadReg PRR, ((1<<PRADC) + (1<<PRTIM0)) ; Stop clock for ADC and Timer0
	LoadReg	ADCSRA, 0	; ADC Prescaler = 2



;	nop
;qqq: 
;	wdr
;	rcall ShiftTKeySample; !!!!!!!!!!!!!!!!!
;	rjmp qqq
;	rjmp M_




	lds	r20,TimerFlags
	sbrc r20, fWaitMinus
	rjmp WaitPhazeInputMinus

; *********** MAIN LOOP ****************************************************
WaitPhazeInputPlus:				; ++++++++++++++++++++++++++++++++++++++++++
	sbis PINB,bPhazeInput		; ++++++++++++++++++++++++++++++++++++++++++
	rjmp WaitPhazeInputPlus		; ++++++++++++++++++++++++++++++++++++++++++
P_:	ldi r17, (1<<bOutput)
	rcall TriacAfterDelay

	lds	r16, GetRegCnt			; depending on GetRegCnt functions separator
	inc	r16
	sts	GetRegCnt, r16
	cpi	r16, cNotGetTrimmer
	brlo AfterGetTrimmer		; 1..(cNotGetTrimmer-1) -> not GetTrimmer
	cpi	r16, cMaxGetRegCnt
	brlo GetTrimmer				; cNotGetTrimmer..(cMaxGetRegCnt-1) - GetTrimmer
	clr	r16
	sts	GetRegCnt, r16
	rcall GetRegime
	rjmp AfterGetTrimmer

GetTrimmer:
	ldi	r17, bTimeTrimmer		; ADC input = TimeTrimmer
	rcall GetADC				; r17 = result
	com	r17				; if trimmer have reverse polarity
	rcall GetFiltrADC			; FiltrADC = FiltrADC - FiltrADC/8 + r17*32
AfterGetTrimmer:
	rcall GetLogic

	sbr r20, (1<<fWaitMinus)		; BitS !!!
	sts TimerFlags, r20

WaitPhazeInputMinus:			; -------------------------------------------------
	sbic PINB,bPhazeInput		; ------------------------------------------------
	rjmp WaitPhazeInputMinus	; ------------------------------------------------
M_:	clr r17
	rcall TriacAfterDelay
	rcall ShiftTKeySample
	rcall WaitStartADC
	ldi	r17, bTKeyInput			; ADC input = TKeyInput
	rcall GetADC				; r17 = result
	rcall GetTKey
	rcall TKeyHandling

	wdr							; Watchdog reset
	cbr r20, (1<<fWaitMinus)		; BitS !!!
	sts TimerFlags, r20
	rjmp WaitPhazeInputPlus

;***************************************************************************
GetRegime:
	ldi	r17, bTimeTrimmer		; ADC input = TimeTrimmer
	rcall GetADC				; r17 = result
	mov	r18, r17

	ldi	r16, (1<<bTimeTrimmer)	; charge or discharge capasitor
	cpi r17, (cResetHOutVol	/ 2); depending on trimmer position relative cResetHOutVol
	brlo RegimeImpuls
	clr	r16
RegimeImpuls:
	out	PORTB, r16
	ldi	r16, (1<<bTimeTrimmer)
	out DDRB, r16				; bTimeTrimmer = output
	ldi	r16, 4						; charge or discharge in progress now
RegimeImpStand:
	dec	r16
	brne RegimeImpStand
	out DDRB, r16				; = 0 -> all = input - charge or discharge complete

	ldi	r16, 5						; charge or discharge in progress now
WaitRegimeImpTrack:
	dec	r16
	brne WaitRegimeImpTrack
	ldi	r17, bTimeTrimmer		; ADC input = TimeTrimmer
	rcall GetADC				; r17 = result
	sub	r18, r17
	brcc SubResult
	neg	r18
SubResult:						; r18 = abs deviation of Trimmer ADC

	lds	r20, TimerFlags
	ldi	r16, (1<<fRegime)
	cpi	r18, cChargePorog		; abs deviation of Trimmer ADC
	brlo Reg_On					; if jamper NOT set, then deviation low and Reg = bathroom
Reg_Off:
	sbrs r20, fRegime
	rjmp ClrRegDebCnt
IncRegDebCnt:
	lds	r17, RegDebCnt
	inc	r17
	sts	RegDebCnt, r17
	cpi	r17, cRegDebounce
	brlo GetRegExit
	eor	r20, r16
	sts	TimerFlags, r20
	rjmp ClrRegDebCnt

Reg_On:
	sbrs r20, fRegime
	rjmp IncRegDebCnt
ClrRegDebCnt:
	clr	r17
	sts	RegDebCnt, r17
GetRegExit:
	ret
;***************************************************************************
ShiftTKeySample:
	lds	r17, TimeShift	; for detuning from periodic interference in High VAC net
	subi r17, 4
	cpi	r17, 16
	brcs SaveTimeShift
	ldi	r17, 16
SaveTimeShift:
	sts	TimeShift, r17
	add	r16, r17
	ret

;***************************************************************************
GetLogic:
	lds	r20, TimerFlags
	sbrc r20, fRegime
	rjmp GetBathroomLogic
WCLogic:
	sbrs r20, fTKeyOn				; r20 = TimerFlags
	rjmp MotorHandling
MotorOn:
	clr	r16
	sts	(TimerCnt+0), r16
	sts	(TimerCnt+1), r16
	sts	(TimerCnt+2), r16
SetMotorOn:
	sbr	r20, ((1<<fMotorOn)	+ (1<<fTimerCntWorking))	; BitS !!!
	sts	TimerFlags, r20
	ret
MotorHandling:
	sbrs r20, fMotorOn
	ret
TimerCntHandling:
	rcall CounterHandling			; if ++TimerCnt < (FiltrADCH * 132 * 4 + cTmin) then C = 1
	brsh SetMotorOn
MotorOff:
	cbr	r20, ((1<<fMotorOn)	+ (1<<fTimerCntWorking))	; BitS !!!
	sts	TimerFlags, r20
	ret

GetBathroomLogic:
	sbrc r20, fTKeyOn				; r20 = TimerFlags
	rjmp LightBath_ON
LightBath_OFF:
	clr	r16
	sts	(BathTimeCnt+0), r16
	sts	(BathTimeCnt+1), r16
	sbrc r20, fBathLightLong
	rjmp BathStartMotor
	sbrs r20, fTimerCntWorking
	ret
	rjmp TimerCntHandling
BathStartMotor:
	cbr r20, (1<<fBathLightLong)	; BitS !!!
	rjmp MotorOn					; Start from 0
	
LightBath_ON:
	lds	r16, (BathTimeCnt+0)		; ++BathTimeCnt
	lds	r17, (BathTimeCnt+1)
	subi r16, 0xFF					; +1
	sbci r17, 0xFF
	sts	(BathTimeCnt+0), r16
	sts	(BathTimeCnt+1), r17

	subi r16, low(cMinBathLight)	; (++BathTimeCnt) - cMinBathLight
	sbci r17, high(cMinBathLight)
	brlo BathStopMotor
	sbr	r20, (1<<fBathLightLong)	; BitS !!!
BathStopMotor:
	cbr	r20, (1<<fMotorOn)			; BitS !!!
	sts	TimerFlags, r20

	ret

;***************************************************************************
TKeyHandling:
	lds	r20, TimerFlags
	cbr	r20, (1<<fTKeyToggle)		; BitS !!! Do nothing
	sts	TimerFlags, r20
	ret

;***************************************************************************
GetTKey:
	lds	r20, TimerFlags
	ldi	r16, (1<<fTKeyOn)
	cpi	r17, (255 - cTKeyLevel)
	brcs TKey_On
TKey_Off:
	sbrs r20, fTKeyOn
	rjmp ClrKeyDebCnt
IncKeyDebCnt:
	lds	r17, TKeyDebCnt
	inc	r17
	sts	TKeyDebCnt, r17
	cpi	r17, cTKeyDebounce
	brlo GetTKeyExit
	eor	r20, r16
	sbr	r20, (1<<fTKeyToggle)
	sts	TimerFlags, r20
	rjmp ClrKeyDebCnt

TKey_On:
	sbrs r20, fTKeyOn
	rjmp IncKeyDebCnt
ClrKeyDebCnt:
	clr	r17
	sts	TKeyDebCnt, r17
GetTKeyExit:
	ret
;***************************************************************************
GetFiltrADC:					; FiltrADC = FiltrADC - FiltrADC/8 + r17*32
	lds	XL, (FiltrADC+0)
	mov r18, XL
	lds	XH, (FiltrADC+1)
	mov	r19, XH
	ldi	r16, 3
Shift_FiltrADC:
	clc
	ror	r19
	ror	r18
	dec	r16
	brne Shift_FiltrADC
	sub	XL, r18
	sbc	XH, r19

	clr	r18
	ldi	r16, 3
Shift_r17:
	clc
	ror	r17
	ror	r18
	dec	r16
	brne Shift_r17
	add	XL, r18
	adc	XH, r17
	sts	(FiltrADC+0), XL
	sts	(FiltrADC+1), XH
	ret

;***************************************************************************
CounterHandling:				; if ++TimerCnt < (FiltrADCH * 132 * 4 + cTmin) then C = 1 (24 bit arithmetic)
	lds	mp8u, (FiltrADC+1)		; FiltrADCH * 132
	ldi	mc8u, 132
	rcall mpy8u

	clr	r21						;  * 4, r21 - most value byte
	ldi	r16, 2
Shift_132_FiltrADC:
	clc
	rol m8uL
	rol	m8uH
	rol	r21
	dec	r16
	brne Shift_132_FiltrADC

	ldi	r17, low(cTmin)			;  + cTmin
	add	m8uL, r17
	ldi	r17, high(cTmin)
	adc	m8uH, r17
	clr	r17
	adc	r21, r17

	lds	r16, (TimerCnt+0)		; ++TimerCnt
	lds	r17, (TimerCnt+1)
	lds	r18, (TimerCnt+2)
	subi r16, 0xFF				; +1
	sbci r17, 0xFF
	sbci r18, 0xFF
	sts	(TimerCnt+0), r16
	sts	(TimerCnt+1), r17
	sts	(TimerCnt+2), r18

	sub	m8uL, r16 				; (FiltrADCH * 132 * 4 + cTmin) - (++TimerCnt)
	sbc	m8uH, r17
	sbc	r21, r18
	ret							; C = result

;***************************************************************************
TriacAfterDelay:				; Ignition of triac if flag fMotorOn set one.
								; retern in r16 quantity of loop cycles before start ADC
	ldi	r16, (cDelayForADC + cIgnitionDuration)
	lds	r20, TimerFlags
	sbrs r20, fMotorOn
	ret
	ldi	r16, cTriacDelay
TriacDelayLoop:
	dec	r16
	brne TriacDelayLoop
	out	PORTB, r17
	ldi	r18, (1<<bOutput)
	ldi	r17, cNumOfIgnition
TriacIgnition:
	out DDRB, r18
	nop
	nop
	nop
	out DDRB, r16		; must = 0
	ldi	r16, cBetweenIgnition
BetweenIgnitionLoop:
	dec	r16
	brne BetweenIgnitionLoop
	dec	r17
	brne TriacIgnition

	ldi	r16, cDelayForADC
	ret

;***************************************************************************
WaitStartADC:
	dec	r16
	brne WaitStartADC
	ret

;***************************************************************************
GetADC:							; Get ADC sample. Input chanel - r16, result - r16
	LoadReg PRR,  (1<<PRTIM0)	; ADC Clock = On, Stop clock for Timer0
	out	ADMUX, r17
	sbi ADCSRA, ADEN			; ADC enable
	sbi ADCSRA, ADSC			; Start ADC Conversion
WaitCompleteADC:
	sbic ADCSRA,ADSC
	rjmp WaitCompleteADC
	in	r17, ADCL
	cbi ADCSRA, ADEN			; ADC disable
	LoadReg PRR, ((1<<PRADC) + (1<<PRTIM0)) ; Stop clock for ADC and Timer0
	ret

;***************************************************************************
;*
;* "mpy8u" - 8x8 Bit Unsigned Multiplication
;*
;* This subroutine multiplies the two register variables mp8u and mc8u.
;* The result is placed in registers m8uH, m8uL
;*  
;* Number of words	:9 + return
;* Number of cycles	:58 + return
;* Low registers used	:None
;* High registers used  :4 (mp8u,mc8u/m8uL,m8uH,mcnt8u)	
;*
;* Note: Result Low byte and the multiplier share the same register.
;* This causes the multiplier to be overwritten by the result.
;*
;***************************************************************************

;***** Subroutine Register Variables

.def	mc8u	=r22		;multiplicand
.def	mcnt8u	=r23		;loop counter
.def	mp8u	=r24		;multiplier
.def	m8uL	=r24		;result Low byte
.def	m8uH	=r25		;result High byte

;***** Code
mpy8u:	
	clr	m8uH		;clear result High byte
	ldi	mcnt8u,8	;init loop counter
	lsr	mp8u		;rotate multiplier
m8u_1:	
	brcc m8u_2		;carry set 
	add m8uH,mc8u	;add multiplicand to result High byte
m8u_2:	
	ror	m8uH		;rotate right result High byte
	ror	m8uL		;rotate right result L byte and multiplier
	dec	mcnt8u		;decrement loop counter
	brne m8u_1		;if not done, loop more
	ret

; Fill memory by NOP (code = 0x0000) in ST Visual Programmer

	.ORG	FLASHEND
LastProgMemory:
	rjmp	HOT_reset



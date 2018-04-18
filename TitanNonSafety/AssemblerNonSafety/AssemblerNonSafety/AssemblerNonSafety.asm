/* 
Проверено:
- моменты включения ADC для измерения напряжений
- работа поджига по флагу  bIgnition
- передача через оптопару 30 бит и 6 бит в разных режимах
- значения 6 бит
Не проверено:
- значения 30 бит
- прием через оптопару команды ПОДЖИГ
- установка флага bFire при наличии пламени
- устойчивость работы при пересбросах
Не сделано:
- заполнение RJMP ? пустой облати памяти

 *	AssemblerNonSafety.asm
 *  Программа для котла Титан (высоковольтный микроконтроллер)
 *  Created: 26.02.2018 11:44:07
 *   Author: Alexey81 */ 
 ;.include "tn20def.inc"

.EQU	Fclk = 250		; kHz - тактовая частота процессора
.EQU	bLedIn = 4		; PA4 вход c оптрона гальванической изоляции. Активное состояние = 0
						; Нужно для включения поджига. Для этого подаются импульсы с периодом 25..30 мс
.EQU	bLedT1 = 7		; PA7 = T1 вход c оптрона гальванической изоляции. Активное состояние = 0
.EQU	PortLedIn = PORTA
.EQU	InUREF = 1		; ADC1 напряжение опорного источника 3,3 В
.EQU	InUGND = 2		; ADC2 напряжение корпуса прибора относительно нейтрали
.EQU	InUPhase = 3	; ADC3 напряжение фазы (после аварийного термостата тепрературы воды)
.EQU	InUFire = 5		; ADC5 напряжение датчика пламени
.EQU	bDEBUG = 6		; DEBUG pin
.EQU	PortU = PORTA

.EQU	bLedOut = 2		; PB2 = к аноду светодиода оптрона гальванической развязки
.EQU	PortLedOut = PORTB
.EQU	bPhase = 0		; PB0 - цифровой сигнал фазы 50 Гц с питающего напряжения
.EQU	PortPhase = PORTB
.EQU	bIgnitionOut = 1; PB1 - выход на включение тиристора поджига. Активный уровень = 0
.EQU	PortIgnitionOut = PORTB

.EQU	Vcc = 5100			; mV (Vcc = 5100mV - BZX84-C5V1 DIOTEC, HOTTECH, SAMTECH)
.EQU	CorrectionT = 16	; на CorrectionT тактов процессора опережаем отсчеты для попадания на середины полупериодов сети
.EQU	SendStart = 25		; задержка начала передачи через гальваническую развязку от старта передачи
.EQU	Duration_0 = (Fclk/(3*4))	; длительность интервала при передаче 0 (0,25 мс)
.EQU	Duration_1 = (Fclk/(3*2))	; длительность интервала при передаче 1 (0,5 мс) - передача 30 бит гарантировано укладывается в период
.EQU	DurationStart = ((Duration_0 + Duration_1)/2)	; длительность стартового интервала при передаче
.EQU	EndOfFrame = (Fclk * 3) ; за 3 мс до конца кадра начинаем ждать переход фазы через 0 (Fclk кГц - частора процессора)
.EQU	UFirePorog = 128	; порог срабатывания датчика пламени
.EQU	CInputTimeout = ((50 * Fclk) / 256)	; 50 мс отсытствуют импульсы от оптрона - поджиг не нужен : IgnitionStatus = 0
.EQU	CMinPeriodLength = ((12 * Fclk) / 256)	; 12 мс минимальный период сетевого напряжения
.EQU	CMaxPeriodLength = ((25 * Fclk) / 256)	; 25 мс максимальный период сетевого напряжения
.EQU	CInputDebounce = 3	; сколько должно совпасть периодов импульсов, чтобы IgnitionStatus стал 1
.EQU	CInputMaxJitter = 2 ; максимальное дрожание периода импульсов разрешающих поджиг (для учета совпадения периодов)

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

.MACRO WaitTrue		; Ждём "1" на входе
LWait:
	sbis (@0), (@1) 
	rjmp LWait		;$-4		
.ENDMACRO			; WaitTrue

.MACRO WaitFalse	; Ждём "0" на входе
LWait:
	sbic (@0), (@1) 
	rjmp LWait		;$-4		
.ENDMACRO			; WaitFalse

.MACRO CopyWordWord_r16	; копирование WORD to WORT в памяти through r16
	lds r16, (@1)
	sts (@0), r16
	lds r16, ((@1) + 1)
	sts ((@0) + 1), r16
.ENDMACRO

.MACRO Load_Z_Ptr	; загрузка указателя Z 
	ldi r31, (HIGH(@0))
	ldi r30, (LOW(@0))
.ENDMACRO			; Load_Z_Ptr

.MACRO Load16		; загрузка регистров из памяти
	lds @0, (@2)
	lds @1, ((@2) + 1)
.ENDMACRO			; Load16

.MACRO Store16		; сщхранение регистров в память
	sts (@0), @1
	sts ((@0) + 1), @2
.ENDMACRO			; Store16

.MACRO sub16u		; 16 бит вычитание регистровых пар
	sub	@0, @2
	sbc @1, @3 
.ENDMACRO			; sub16u

.MACRO subi16u		; 16 бит вычитание константы из регистровой пары
	subi @0, (LOW(@2))
	sbci @1, (HIGH(@2))
.ENDMACRO			; subi16u

.MACRO add16u		; 16 бит сложение регистровых пар
	add	@0, @2
	adc @1, @3 
.ENDMACRO			; add16u

.MACRO div16u2		; 16 бит деление на "2" сдвигом вправо на 1 разряд
	lsr	@1
	ror @0 
.ENDMACRO			; div16u2

.DSEG
/* Данные программы */
MachineState:	.BYTE	1	; сотояние машины
.EQU	MachWaitStart = 11	; ждём начала измерения длительности машинного цикла
.EQU	MachIgnition = 10	; включаем поджиг и контролируем UFire
.EQU	MachEndStart = 9	; подготовить сохранение длительности машинного цикла
.EQU	MachInUPhase0 = 8	; измеряем InUPhase
.EQU	MachInUPhase1 = 7	; измеряем InUPhase и вычисляем средний квадрат
.EQU	MachInUGND0 = 6		; измеряем InUGND
.EQU	MachInUGND1 = 5		; измеряем InUGND и вычисляем средний квадрат
.EQU	MachInUFire = 4		; определение пламени по InUFire в разных полупериодах и измерение InUREF
.EQU	MachSerialOut = 3	; 3..2 передачи данных в главный контроллер
.EQU	MachSaveTime = 1	; подготовить очередное сохранение длительности машинного цикла

NewT1Value:		.BYTE	1	; 1 - запомнено новое значение T1Value
T1Value:		.BYTE	2	; текущий старт машинного цикла в циклах контроллера (и начало нулевого периода! сети)
PreT1Value:		.BYTE	2	; предыдущий старт машинного цикла в циклах контроллера
MachLength:		.BYTE	2	; длина машинного цикла в циклах контроллера
TStartPeriod:		.BYTE	2	; начало нулевого периода сети (счет идет с нулевого!)
;StartT1:		.BYTE	2	; начало первого периода сети (счет идет с нулевого!)
;StartT2:		.BYTE	2	; начало второго периода сети (счет идет с нулевого!)
;StartT3:		.BYTE	2	; начало третьего периода сети (счет идет с нулевого!)
;StartT4:		.BYTE	2	; начало четвертого периода сети (счет идет с нулевого!)
;StartTMaxP:		.BYTE	2	; момент максимального положительного напряжения сети относительно начала периода сети
LengthDiv2:		.BYTE	2	; PeriodLength/2 = сдвиг вправо на 1 разряд
LengthDiv4:		.BYTE	2	; PeriodLength/4 = сдвиг вправо на 2 разряда
LengthDiv8:		.BYTE	2	; PeriodLength/8 = сдвиг вправо на 3 разряда
;LengthDiv16:	.BYTE	2	; PeriodLength/16 = сдвиг вправо на 4 разряда
LengthDiv32:	.BYTE	2	; MachLength/32 = сдвиг вправо на 5 разрядов - UFire первый отсчет
LengthDiv64:	.BYTE	2	; MachLength/64 = сдвиг вправо на 6 разрядов
Length3Div4:	.BYTE	2	; PeriodLength*3/4 = 3/4 периода сети - второй отсчет напряжения UFire ?
Length3Div8:	.BYTE	2	; PeriodLength*3/8 = 3/4 полупериода (3/8 периода) сети - третий отсчет напряжения
Length17Div32:	.BYTE	2	; PeriodLength*17/32 = UFire второй отсчет и затем момент поджига 
SendBuf:	; 4 байта - буфер значений для передачи в главный процессор через гальваническую развязку
UPhase2Sum:		.BYTE	3	; Сначала сумма квадратов отсчетов UPhase, потом - среднеквадратическое значение для передачи (мл. байт)
UGND2Sum:		.BYTE	3	; Сначала сумма квадратов отсчетов UGND, потом - среднеквадратическое значение для передачи (мл. байт)
T1ToSend:	; 2 байта - для текущего запоминания значения Т1 в начале передачи в главный процессор через гальваническую развязку
UFireSum:		.BYTE	2	; Сумма отсчетов UFire
FireStatus:		.BYTE	1	; Статус Fire (датчика пламени) -  (мл. бит)
.EQU	bFire = 0			; Бит, уазывающий на то, что пламя есть
UREFVal:		.BYTE	1	; Отсчет UREF - значение для передачи
ReseiveByte:	.BYTE	1	; Байт, принятый от главного процессора через гальваническую развязку
IgnitionStatus: .BYTE	1	; Статус зажигания горелки
.EQU	bIgnition = 0		; Бит, уазывающий на то, что нужно включить зажигание горелки
InputTimeout:	.BYTE	1	; Таймаут приема в мс (если доходит до CInputTimeout - значит сигнала на поджиг нет)
InputDebounce:	.BYTE	1	; Счетчик антидребезга приемника с оптопары



PCINT1_ISR_regSave:	.BYTE	1 ; здесь сохраняются регистры при PCINT1_ISR
TIM1_COMPB_ISR_regSave:	.BYTE	1 ; здесь сохраняются регистры при TIM1_COMPB_ISR
 


.CSEG
/* Программа */
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
	/* это прерывание разрешаем только при положительной полуволне фазы и кода 
	MachineState = MachSaveTime, MachEndStart, MachWaitStart
	, тогда при наступлении отрицательной полуволны фазы значение номера машинного цикла
	сохраняется в T1Value */
	sts PCINT1_ISR_regSave, r16				; регистр статуса не сохраняем, т.к. флаги не меняются
	ReadWordRegToMem_r16 TCNT1L, T1Value	; сохраняем значение Таймера1 в T1Value
	ldi r16, 1
	sts NewT1Value, r16
	lds r16, PCINT1_ISR_regSave
	reti

; TIM1_CAPT_ISR:
	/* здесь когда принят очередной бит от оптопары
	ПОКА НЕ ПРИДУМАЛ
	делаем поллинг TIFR.ICF1 в основной программе */
;	reti прерывание нельзя! - оно сбросит TIFR.ICF1 !!!

TIM1_COMPA_ISR:
	/* здесь надо запускать ADC
	канал установлен заранее  */
	sbi ADCSRA, ADEN			; ADC enable
	sbi ADCSRA, ADSC			; Start ADC Conversion
	reti

/*
TIM1_COMPB_ISR:
	// здесь надо закончить импульс	оптопары
	sts TIM1_COMPB_ISR_regSave, r16
	WriteByteToReg_r16 TCCR1A, 0	; возвращаем светодиод оптрона под управления порта - гасим его
									; этот же регистр используем для поллинга об окончании импульса
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
	WriteByteToReg_r16	DIDR0, ((1<<InUREF)|(1<<InUGND)|(1<<InUPhase)|(1<<InUFire)) ; отключаем цифровые входы, там, где аналог

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
	WriteByteToReg_r16 PORTB, (1<<bIgnitionOut) ; поджиг не активен
	WriteByteToReg_r16 DDRB, (0xFF - (1<<bPhase))	; PB0 - input

/* init Timer1  на счет циклов контроллера */
	// WriteByteToReg_r16 TCCR1A, 0 ; after reset value
	// WriteWordToReg_r16 OCR1AL, 0 ; after reset value
	// WriteWordToReg_r16 OCR1BL, 0 ; after reset value
	WriteByteToReg_r16 TCCR1B, (1<<ICNC1) ; Input Capture Noise Canceler ON  ??????????????????????????
	WriteByteToReg_r16 TCCR1B, (1<<CS10) ; clkI/O /1 (No prescaling) - start timer

/*	init ADC  */
	// WriteByteToReg_r16 ADCSRA, 0	; ADC Prescaler = 2 - after reset value

/*  init Machine
	Полный цикл = 6 периодав сети 50Гц
	- в первых 2 периодах  измеряется напряжение InUPhase
	- в следующих 2 - измеряется InUGND
	- в следующем периоде измеряется InUREF, наличие пламени определяется по InUFire в разных полупериодах
	- в остальных 1 периодах сети осуществляется передача 
	измерений и флагов в главный контроллер через последовательный канал
	с оптической развязкой */
	SetMachStat_r16	MachineState, MachWaitStart
	clr r16
	sts NewT1Value, r16

/*  init interrupt	*/
	WriteByteToReg_r16 PCMSK0, (1<<bLedIn) ; PCINT4 enable - прерывание по изменению сигнала посл. интерф.
	WriteByteToReg_r16 PCMSK1, (1<<bPhase) ; PCINT8 enable - прерывание по изменению фазы

	// WriteByteToReg_r16 TIMSK, 0 ; after reset value
	// WriteByteToReg_r16 GIMSK, 0 ; after reset value
	sei		; global interrupt enable




/*
LOOOP:
	wdr
	nop

	in r20, TCNT1L		; запоминаем текущее значение таймера
	in r21, TCNT1H		; r20:r21 - накапливаем новые значения таймера для включений оптрона
	bst r21, 0			; через флаг Т
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
	clr r19					; здесь накапливаем контрольную сумму, которую потом свернем до 4 бит исключающим или nibbles
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
	bst r18, bIgnition		; через флаг Т
	bld r16, 1				; bit 1 - bIgnition - возвращаем как подтверждение приема
	andi r16, 0x03			; оставляем биты 0, 1
	add	r19, r16			; r19 - контрольная сумма
	mov	r18, r19			; сворачиваем её до 4 бит
	swap r18
	add r19, r18
	lsl r19
	lsl r19
	or r16, r19
	andi r16, 0x3F			; оставляем 6 бит (0 - FireStatus, 1 - Ignition, 2..5 - control sum)
	sts	(SendBuf + 0), r16  ; сначала передаем флаги и контрольную сумму
	ret

SendFire:
	lds r18, FireStatus		; bit 0 - FireStatus
	bst r18, bFire			; через флаг Т
	bld r16, 0				; bit 0 - bFire - возвращаем флаг наличия пламени
	bld r16, 2				; bit 2 - bFire - возвращаем флаг наличия пламени
	bld r16, 4				; bit 4 - bFire - возвращаем флаг наличия пламени

	lds r18, IgnitionStatus
	bst r18, bIgnition		; через флаг Т
	bld r16, 1				; bit 1 - bIgnition - возвращаем как подтверждение приема
	bld r16, 3				; bit 1 - bIgnition - возвращаем как подтверждение приема
	bld r16, 5				; bit 1 - bIgnition - возвращаем как подтверждение приема

	ldi r18, ((1<<2)|(1<<3)); инвертируем 2 средних бита
	eor r16, r18
	andi r16, 0x3F
	sts	(SendBuf + 0), r16  ; передаем флаги и контрольную сумму
	ldi r24, 6				; всего 6 бит: 2 флага, 2 флага инверсных и снова 2 флага
	rjmp SendBuffer

Send30BitToMain:
	ldi r24, 30				; будем передавать 30 бит

SendBuffer:					; - must be MACRO ???
	Load_Z_Ptr SendBuf	; отсюда будем передавать
	ldi r18, 1			; стартовый импульс
	ldi r19, 0			; коррекция
	rcall SendImpuls
	ldi r18, (DurationStart)	; стартовый интервал
	ldi r19, 3			; коррекция
	rcall SendImpuls

	ldi r19, 6
SendByteLoop:
	ldi r23, 6			; сначала передаем 6 служебных байт (2 флага и 4 бит контрольной суммы) 
						; если bIgnition = 0, то передаются ещё и 3 байта значений напряжений
	ld r22, Z+
SendBitLoop:
	ror r22				; передаем МЛАДШИМ битом вперед
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


IgnitionImpuls:			; запустить поджиг через тиристор и ВВ трансформатор
	cbi PortIgnitionOut, bIgnitionOut	; +Ig в управляющий электрод тиристора
IgnitionImpulsLoop:
	dec r16
	brne IgnitionImpulsLoop
	sbi PortIgnitionOut, bIgnitionOut	; прекратить +Ig
	ret

;**************************************************** Врезка для избежания ошибки относительного перехода (< 127)
L_MachInUFire:
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена

	clr r16
	sts	UFireSum, r16			; здесь сумма UFire
	sts (UFireSum + 1), r16		; сначала обнуляем её
	ldi r17, InUFire			; с этого входа ADC

	Load16 r18, r19, TStartPeriod	; начальное значение периода
	rcall Get_2_UFireSample_UREF
	ldi r16, MachSerialOut	; MachSerialOut - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины
	rcall GetFireStatus			; при положительной полуволне считаем статус Fire
	rcall SetSendBuf			; и формируем буфер для передачи
	rjmp MainLoop

L_MachSerialOut:
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена

	rcall Send30BitToMain
	
;	SetMachStat_r16	MachineState, MachSaveTime	; MachineState = MachSaveTime - следующий шаг цикла
;	rjmp MainLoop

L_MachSaveTime:
	rjmp L_MachFrameEnd

;**************************************************** Врезка для избежания ошибки относительного перехода (< 127)


; *********** MAIN LOOP ****************************************************
MainLoop:
	wdr
	/* парсим MachineState */
	lds	r16, MachineState
	cpi r16, MachInUPhase0
	brlo BelowMachInUPhase0
	breq L_MachInUPhase0

	cpi r16, MachWaitStart
	brsh L_MachWaitStart

	cpi r16, MachEndStart
	breq L_MachEndStart
	rjmp L_MachIgnition		; всё от MachWaitStart до MachEndStart

BelowMachInUPhase0:
	cpi r16, MachInUFire
	brlo BelowMachInUFire
	breq L_MachInUFire

	cpi r16, MachInUGND0
	breq L_MachInUGND0
	brlo L_MachInUGND1
	rjmp L_MachInUPhase1

BelowMachInUFire:
	cpi r16, MachSaveTime	; здесь хитрость - всё, что не MachSaveTime идет на MachSerialOut
	breq L_MachSaveTime
	rjmp L_MachSerialOut

L_MachWaitStart:		; **********
	ldi r16, MachEndStart	; MachEndStart - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины MachEndStart
	rjmp MainLoop

L_MachIgnition:			; **********
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена

	clr r16
	sts	UFireSum, r16			; здесь сумма UFire
	sts (UFireSum + 1), r16		; сначала обнуляем её
	ldi r17, InUFire			; с этого входа ADC

	Load16 r18, r19, TStartPeriod	; начальное значение периода
	rcall Get_2_UFireSample_UREF

	ldi r16, 60					; на столько задержка после отсчета UFire
IgnLoop:
	dec r16
	nop
	brne IgnLoop

	ldi r16, 30					; длительность импульса поджига
	rcall IgnitionImpuls

	rcall GetFireStatus			; при положительной полуволне считаем статус Fire
	rcall SendFire				; формируем буфер для передачи и передаем 6 служебных байт (2 флага и 4 бит контрольной суммы)

	rcall WaitPhaseTrue_WaitStopIgnition	; ждать (+) полуволну фазы и ждать окончание поджига
	rjmp MainLoop

L_MachEndStart:			; **********
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) 
							; и установить все времена (неправильно, т.к. нет предыдущего значения Т1 !!!)
L_MachFrameEnd:
	ldi r16, MachInUPhase0	; MachInUPhase0 - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины
	rjmp MainLoop

L_MachInUPhase0: ; ********** здесь определяем моменты отсчетов переменных напряжений (три отсчета на полупериод) 
							; и начинаем накапливать квадраты UPhase
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена

	Load_Z_Ptr UPhase2Sum	; здесь сумма квадратов UPhase
	rcall ClearPZ_24_r16	; сначала обнуляем её
	ldi r17, InUPhase		; с этого входа ADC

	Load16 r18, r19, TStartPeriod	; начальное значение периода
	rcall Add_3_Sample		; добавляем 3 суммы квадратов отсчетов и 
	ldi r16, MachInUPhase1	; MachInUPhase1 - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины
	rjmp MainLoop

L_MachInUPhase1: ; ********** продолжаем накапливать квадраты UPhase (ещё три отсчета)
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена
	Load16 r18, r19, TStartPeriod	; начальное значение периода
	rcall Add_3_Sample		; добавляем 3 суммы квадратов отсчетов и 
	ldi r16, MachInUGND0	; MachInUGND0 - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины
	rcall SQRT_Z			; 179 при положительной полуволне считаем средний квадратный корень
	rjmp MainLoop

L_MachInUGND0:  ; ********** начинаем накапливать квадраты отсчетов UGND
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена

	Load_Z_Ptr UGND2Sum ; здесь сумма квадратов UGND
	rcall ClearPZ_24_r16	; сначала обнуляем её
	ldi r17, InUGND			; с этого входа ADC

	Load16 r18, r19, TStartPeriod	; начальное значение периода
	rcall Add_3_Sample		; добавляем 3 суммы квадратов отсчетов и 
	ldi r16, MachInUGND1	; MachInUGND1 - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины
	rjmp MainLoop

L_MachInUGND1:	 ; ********** продолжаем накапливать квадраты отсчетов UGND
	rcall WaitPhaseFalse	; ждать (-) полуволну фазы ( T1Value = НОВОЕ состояние Т1) и установить все времена
	Load16 r18, r19, TStartPeriod	; начальное значение периода
	rcall Add_3_Sample		; добавляем 3 суммы квадратов отсчетов и 
	ldi r16, MachInUFire	; MachInUFire - следующий состояние машины
	rcall WaitPhaseTrueAndSetMachineState	; ждать (+) полуволну фазы и установить состояние машины
	rcall SQRT_Z			; 179 при положительной полуволне считаем средний квадратный корень
	rjmp MainLoop

WaitPhaseTrueAndSetMachineState:
	WaitTrue PINB, bPhase	; ждать (+) полуволну фазы
	sts MachineState, r16	; если IgnitionStatus <> 0 то переходим к состоянию машины MachIgnition
	lds r16, IgnitionStatus
	cpi r16, 0
	brne SetIgnitionState
	ret
SetIgnitionState:
	ldi r16, MachIgnition
	sts MachineState, r16
	ret

WaitPhaseTrue_WaitStopIgnition:	; ждать (+) полуволну фазы и ждать окончание поджига
	WaitTrue PINB, bPhase	; ждать (+) полуволну фазы
	lds r16, IgnitionStatus
	cpi r16, 0
	brne ExitStopIgnition
StopIgnition:
	ldi r16, MachEndStart	; MachEndStart - следующий состояние машины (замеры напряжений будем делать через период сети)
	sts MachineState, r16
ExitStopIgnition:
	ret

.MACRO SetTimeSamples
	Load16 r24, r25, T1Value	; Вычисляем длину периода
	subi16u r24, r25, CorrectionT	; Вычитаем CorrectionT, так как фиксация начала цикла отстает от перехода фазы через ноль
		; и плюс ещё и запуск ADC отстает от срабатывания таймера Т1 - и там и там добавляется время обработки прерывания
	Store16 TStartPeriod, r24, r25	; r24:r25 = TStartPeriod -> Старт 0-го периода (счет идет с нулевого!)
	
	Load16 r24, r25, T1Value	; Вычисляем длину периода
	Load16 r22, r23, PreT1Value
	Store16 PreT1Value, r24, r25; сохраняем как предыдущее значение T1Value для следующего периода

	sub16u r24, r25, r22, r23	; PeriodLength = r24:r25 = r24:r25 - r22:r23
TestMaxPeriodLength:
	cpi r25, CMinPeriodLength	; минимальный период сетевого напряжения должен быть превышен
	brlo BedPeriodLength
	cpi r25, CMaxPeriodLength	; а максимальный период сетевого напряжения - нет
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
	Store16 Length3Div4, r22, r23	; 3/4 периода сети

	mov r22, r24
	mov r23, r25				; PeriodLength/4
	div16u2 r24, r25			; PeriodLength/8
	Store16 LengthDiv8, r24, r25	; - четвертушка полупериода

	add16u r22, r23, r24, r25
	Store16 Length3Div8, r22, r23	; 3/4 полупериода сети

	div16u2 r24, r25			; PeriodLength/16
	div16u2 r24, r25			; PeriodLength/32
	Store16 LengthDiv32, r24, r25	; - 1/16 полупериода сети
	Load16 r22, r23, LengthDiv2
	add16u r22, r23, r24, r25
	Store16 Length17Div32, r22, r23	; 17/32 периода сети - в этот момент будем делать поджиг
	ldi r16, 1
StorePeriodStatus:
.ENDMACRO	; SetTimeSamples


WaitPhaseFalse:
	rcall Receive_r16		; прием - must be MACRO ????
;	rcall SetIgnitionStatusTrue_r16	; DEBUG
	
	WriteByteToReg_r16 GIFR, (1<<PCIF1) ; сбрасываем флаг прерывания
	WriteByteToMem_r16 NewT1Value, 0	; сбрасываем флаг NewT1Value
	sbi GIMSK, PCIE1		; разрешаем прерывание PCINT1 -> PCINT1_ISR

WaitNewT1Value:				;	WaitFalse PINB, bPhase	; ждать (-) полуволну фазы
	lds r16, NewT1Value
	tst r16
	breq WaitNewT1Value
	cbi GIMSK, PCIE1		; запрещаем прерывание PCINT1 -> PCINT1_ISR
	SetTimeSamples			; если r16 = 1, то период уложился в допуск и все времена расставлены
	tst r16
	breq PeriodBed
	ret
PeriodBed:
	WaitTrue PINB, bPhase	; ждать (+) полуволну фазы
	rjmp WaitPhaseFalse



Receive_r16:	; Ждём флаг Input Capture Flag T1 .. r29 - InputTimeout increment 
	; r26 - InputPrevPause предыдущая пауза *2 /256
	; r27 - InputDebounce
	; r28 - Т1 текущее значение *2 /256
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

ClearPZ_24_r16:		; обнуление 24 бит значения по указателю Z используя r16
	clr r16
	st Z+,r16
	st Z+,r16
	st Z+,r16
	subi r30, 3		; возвращаем Z на исходное значение
	sbci r31, 0
	ret

AddSample:
	out ADMUX, r17	; канал ADC
	out OCR1AH, r21	; устанавливаем момент запуска ADC
	out OCR1AL, r20
	ldi r16, (1<<ADLAR) ; выравнивание влево (младшие 2 бита отбрасываем)
	out ADCSRB, r16
	sbi ADCSRA, ADIF	; сброс флага прерывания
	ldi r16, (1<<OCIE1A); разрешить прерывание TIM1_COMPA_ISR
	out TIMSK, r16
	WaitTrue ADCSRA, ADIF	; ждать ADC
	in r22, ADCH	; result
	ldi r16, (1<<ADIF) ; сброс флага и выключение ADC
	out ADCSRA, r16
	clr r16			; запрет прерывания TIM1_COMPA_ISR
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
	subi r30, 3		; возвращаем Z на исходное значение
	sbci r31, 0
	ret

Add_3_Sample:
	Load16 r20, r21, LengthDiv8
	add16u r20, r21, r18, r19	; Ждем первый отсчет в момент r20:r21
	rcall AddSample

	Load16 r20, r21, LengthDiv4
	add16u r20, r21, r18, r19	; Ждем второй отсчет в момент r20:r21
	rcall AddSample

	Load16 r20, r21, Length3Div8
	add16u r20, r21, r18, r19	; Ждем третий отсчет в момент r20:r21
	rcall AddSample
	ret

AddUFire:
	out ADMUX, r17	; канал ADC
	out OCR1AH, r21	; устанавливаем момент запуска ADC
	out OCR1AL, r20
	clr r16			; выравнивание вправо (10 бит)
	out ADCSRB, r16
	sbi ADCSRA, ADIF	; сброс флага прерывания
	ldi r16, (1<<OCIE1A); разрешить прерывание TIM1_COMPA_ISR
	out TIMSK, r16 
	WaitTrue ADCSRA, ADIF	; ждать ADC
	in r24, ADCL	; result UFire
	in r25, ADCH
	ldi r16, (1<<ADIF) ; сброс флага и выключение ADC
	out ADCSRA, r16
	clr r16			; запрет прерывания TIM1_COMPA_ISR
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
	out ADMUX, r16		; канал ADC
	sbi ADCSRB, ADLAR	; выравнивание влево (младшие 2 бита отбрасываем)
	sbi ADCSRA, ADIF	; сброс флага прерывания
	sbi ADCSRA, ADSC	; Start ADC Conversion
	WaitTrue ADCSRA, ADIF	; ждать ADC
	in r16, ADCH		; result UREF
	sts UREFVal, r16
	ldi r16, (1<<ADIF) ; сброс флага и выключение ADC
	out ADCSRA, r16
	ret

Get_2_UFireSample_UREF:			; - must be MACRO ???
	Load16 r20, r21, LengthDiv32
	add16u r20, r21, r18, r19	; Ждем первый отсчет UFire в момент r20:r21
	rcall AddUFire
	rcall GetUREF
	Load16 r20, r21, Length17Div32
	add16u r20, r21, r18, r19	; Ждем второй отсчет UFire в момент r20:r21
	rcall AddUFire
	ret

GetFireStatus:  ; сдвиг UFireSum на три разряда вправо (сумму 2-х 10-бит значений приводим к 8 битам) - must be MACRO ???
				; и сравнение с UFirePorog. Результат - младший бит в FireStatus
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

SQRT_Z: ; квадратный корень из деленного на 8 того, на что указывает Z 
		; на самом деле суммировались 6 квадратов отсчетов, плюс 2 нулевых. Регистры используем ЛЮБЫЕ
	ldi r16, 3
	ld r22, Z+
	ld r23, Z+
	ld r24, Z+
SQRT_Z_L0:
	lsr r24
	ror	r23
	ror	r22
	dec	r16
	brne SQRT_Z_L0	; поделили на 8. Результат не более 16 бит.
	rcall SQRT		; До 195 тактов; r22:r23. Value - входное значение; выходное r20:r21 - корень
	subi r30, 3		; возвращаем Z на исходное значение
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
SQRT: ; Вычисление квадратного корня беззнакового 16 бит числа. До 179 тактов
	; r22:r23. Value - входное значение, выходное r20:r21 - корень
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


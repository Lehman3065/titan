
	; Microchip MPLAB XC8 C Compiler V1.44
	; Copyright (C) 1984-2017 HI-TECH Software

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; --chip=18F67J60 -G \
	; -mdist/default/production/ThirdProbe.production.map --double=24 \
	; --float=24 --emi=wordwrite \
	; --opt=+asm,+asmfile,-speed,+space,+debug,-local --addrqual=ignore \
	; --mode=pro -P -N255 --warn=-3 --asmlist -DXPRJ_default=default \
	; --summary=default,-psect,-class,+mem,-hex,-file \
	; --output=default,-inhx032 \
	; --runtime=default,-clear,-init,+keep,-no_startup,-download,+config,+clib,-plib \
	; --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto \
	; --errformat=%f:%l: error: (%n) %s \
	; --warnformat=%f:%l: warning: (%n) %s \
	; --msgformat=%f:%l: advisory: (%n) %s --summary=+xml \
	; --summarydir=dist/default/production/memoryfile.xml \
	; -odist/default/production/ThirdProbe.production.elf \
	; build/default/production/main.p1 build/default/production/timers.p1 \
	; build/default/production/titan.p1
	;


	processor	18F67J60

GLOBAL ___extmem_base
___extmem_base EQU 131072

	GLOBAL	_main,start
	FNROOT	_main

	pic18cxx	equ	1

	psect	jflash_buffer,class=CODE,space=0,noexec
	psect	config,class=CONFIG,delta=1,noexec
	psect	idloc,class=IDLOC,delta=1,noexec
	psect	const,class=CONST,delta=1,reloc=2,noexec
	psect	smallconst,class=SMALLCONST,delta=1,reloc=2,noexec
	psect	mediumconst,class=MEDIUMCONST,delta=1,reloc=2,noexec
	psect	rbss,class=COMRAM,space=1,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	rdata,class=COMRAM,space=1,noexec
	psect	irdata,class=CODE,space=0,reloc=2,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	data,class=RAM,space=1,noexec
	psect	idata,class=CODE,space=0,reloc=2,noexec
	psect	nvrram,class=COMRAM,space=1,noexec
	psect	nvbit,class=COMRAM,bit,space=1,noexec
	psect	temp,ovrld,class=COMRAM,space=1,noexec
	psect	struct,ovrld,class=COMRAM,space=1,noexec
	psect	rbit,class=COMRAM,bit,space=1,noexec
	psect	bigbss,class=BIGRAM,space=1,noexec
	psect	bigdata,class=BIGRAM,space=1,noexec
	psect	ibigdata,class=CODE,space=0,reloc=2,noexec
	psect	farbss,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	nvFARRAM,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	fardata,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	ifardata,class=CODE,space=0,reloc=2,delta=1,noexec

	psect	reset_vec,class=CODE,delta=1,reloc=2
	psect	powerup,class=CODE,delta=1,reloc=2
	psect	init,class=CODE,delta=1,reloc=2
	psect	text,class=CODE,delta=1,reloc=2
GLOBAL	intlevel0,intlevel1,intlevel2
intlevel0:
intlevel1:
intlevel2:
GLOBAL	intlevel3
intlevel3:
	psect	clrtext,class=CODE,delta=1,reloc=2

	psect	intcode,class=CODE,delta=1,reloc=2
	psect	intcode_body,class=CODE,delta=1,reloc=2
	psect	intcodelo,class=CODE,delta=1,reloc=2
	psect	intret,class=CODE,delta=1,reloc=2
	psect	intentry,class=CODE,delta=1,reloc=2
	psect	intsave_regs,class=BIGRAM,space=1

	psect	smallconst
	GLOBAL	__smallconst
__smallconst:
	psect	mediumconst
	GLOBAL	__mediumconst
__mediumconst:
wreg	EQU	0FE8h
fsr0l	EQU	0FE9h
fsr0h	EQU	0FEAh
fsr1l	EQU	0FE1h
fsr1h	EQU	0FE2h
fsr2l	EQU	0FD9h
fsr2h	EQU	0FDAh
postinc0	EQU	0FEEh
postdec0	EQU	0FEDh
postinc1	EQU	0FE6h
postdec1	EQU	0FE5h
postinc2	EQU	0FDEh
postdec2	EQU	0FDDh
tblptrl	EQU	0FF6h
tblptrh	EQU	0FF7h
tblptru	EQU	0FF8h
tablat		EQU	0FF5h

	PSECT	ramtop,class=RAM,noexec
	GLOBAL	__S1			; top of RAM usage
	GLOBAL	__ramtop
	GLOBAL	__LRAM,__HRAM
__ramtop:

	psect	reset_vec
reset_vec:
	; No powerup routine
	global start

; jump to start
	goto start
	GLOBAL __accesstop
__accesstop EQU 96

;Initialize the stack pointer (FSR1)
	global stacklo, stackhi
	stacklo	equ	0A6h
	stackhi	equ	0E7Fh


	psect	stack,class=STACK,space=2,noexec
	global ___sp,___inthi_sp,___intlo_sp
___sp:
___inthi_sp:
___intlo_sp:



	psect	init
start:
	global start_initialization
	goto start_initialization	;jump to C runtime clear & initialization

; Config register CONFIG1L @ 0x1FFF8
;	Watchdog Timer Enable bit
;	WDT = ON, WDT enabled
;	Stack Overflow/Underflow Reset Enable bit
;	STVR = ON, Reset on stack overflow/underflow enabled
;	Extended Instruction Set Enable bit
;	XINST = OFF, Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
;	Background Debugger Enable bit
;	DEBUG = ON, Background debugger enabled; RB6 and RB7 are dedicated to In-Circuit Debug

	psect	config,class=CONFIG,delta=1,noexec
		org 0x0
		db 0x21

; Config register CONFIG1H @ 0x1FFF9
;	Code Protection bit
;	CP0 = OFF, Program memory is not code-protected

	psect	config,class=CONFIG,delta=1,noexec
		org 0x1
		db 0xF4

; Config register CONFIG2L @ 0x1FFFA
;	Oscillator Selection bits
;	FOSC = HSPLL, HS oscillator, PLL enabled and under software control
;	Default/Reset System Clock Select bit
;	FOSC2 = ON, Clock selected by FOSC1:FOSC0 as system clock is enabled when OSCCON<1:0> = 00
;	Fail-Safe Clock Monitor Enable
;	FCMEN = ON, Fail-Safe Clock Monitor enabled
;	Two-Speed Start-up (Internal/External Oscillator Switchover) Control bit
;	IESO = ON, Two-Speed Start-up enabled

	psect	config,class=CONFIG,delta=1,noexec
		org 0x2
		db 0xC5

; Config register CONFIG2H @ 0x1FFFB
;	Watchdog Timer Postscaler Select bits
;	WDTPS = 64, 1:64

	psect	config,class=CONFIG,delta=1,noexec
		org 0x3
		db 0xF6

; Config register CONFIG3L @ 0x1FFFC
;	unspecified using default value

	psect	config,class=CONFIG,delta=1,noexec
		org 0x4
		db 0xF8

; Config register CONFIG3H @ 0x1FFFD
;	Ethernet LED Enable bit
;	ETHLED = ON, RA0/RA1 are multiplexed with LEDA/LEDB when Ethernet module is enabled and function as I/O when Ethernet is disabled

	psect	config,class=CONFIG,delta=1,noexec
		org 0x5
		db 0xF7


psect comram,class=COMRAM,space=1
psect abs1,class=ABS1,space=1
psect bigram,class=BIGRAM,space=1
psect ram,class=RAM,space=1
psect bank0,class=BANK0,space=1
psect bank1,class=BANK1,space=1
psect bank2,class=BANK2,space=1
psect bank3,class=BANK3,space=1
psect bank4,class=BANK4,space=1
psect bank5,class=BANK5,space=1
psect bank6,class=BANK6,space=1
psect bank7,class=BANK7,space=1
psect bank8,class=BANK8,space=1
psect bank9,class=BANK9,space=1
psect bank10,class=BANK10,space=1
psect bank11,class=BANK11,space=1
psect bank12,class=BANK12,space=1
psect bank13,class=BANK13,space=1
psect bank14,class=BANK14,space=1
psect bank15,class=BANK15,space=1
psect sfr,class=SFR,space=1


	end	start

opt subtitle "Microchip Technology Omniscient Code Generator v1.44 (Free mode) build 201709140600"

opt pagewidth 120

	opt lm

	processor	18F67J60
opt include "C:\Program Files\Microchip\xc8\v1.44\include\18f67j60.cgen.inc"
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 52 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR5 equ 0E80h ;# 
# 59 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR6 equ 0E81h ;# 
# 66 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR3 equ 0E82h ;# 
# 73 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR4 equ 0E83h ;# 
# 80 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR1 equ 0E84h ;# 
# 87 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR2 equ 0E85h ;# 
# 94 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MISTAT equ 0E8Ah ;# 
# 127 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EFLOCON equ 0E97h ;# 
# 159 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUS equ 0E98h ;# 
# 166 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUSL equ 0E98h ;# 
# 173 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUSH equ 0E99h ;# 
# 180 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON1 equ 0EA0h ;# 
# 218 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON3 equ 0EA2h ;# 
# 289 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON4 equ 0EA3h ;# 
# 311 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MABBIPG equ 0EA4h ;# 
# 367 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPG equ 0EA6h ;# 
# 374 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPGL equ 0EA6h ;# 
# 381 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPGH equ 0EA7h ;# 
# 388 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFL equ 0EAAh ;# 
# 395 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFLL equ 0EAAh ;# 
# 402 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFLH equ 0EABh ;# 
# 409 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MICMD equ 0EB2h ;# 
# 435 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIREGADR equ 0EB4h ;# 
# 442 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWR equ 0EB6h ;# 
# 449 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWRL equ 0EB6h ;# 
# 456 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWRH equ 0EB7h ;# 
# 463 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRD equ 0EB8h ;# 
# 470 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRDL equ 0EB8h ;# 
# 477 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRDH equ 0EB9h ;# 
# 484 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT0 equ 0EC0h ;# 
# 491 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT1 equ 0EC1h ;# 
# 498 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT2 equ 0EC2h ;# 
# 505 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT3 equ 0EC3h ;# 
# 512 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT4 equ 0EC4h ;# 
# 519 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT5 equ 0EC5h ;# 
# 526 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT6 equ 0EC6h ;# 
# 533 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT7 equ 0EC7h ;# 
# 540 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM0 equ 0EC8h ;# 
# 547 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM1 equ 0EC9h ;# 
# 554 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM2 equ 0ECAh ;# 
# 561 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM3 equ 0ECBh ;# 
# 568 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM4 equ 0ECCh ;# 
# 575 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM5 equ 0ECDh ;# 
# 582 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM6 equ 0ECEh ;# 
# 589 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM7 equ 0ECFh ;# 
# 596 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCS equ 0ED0h ;# 
# 603 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCSL equ 0ED0h ;# 
# 610 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCSH equ 0ED1h ;# 
# 617 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMO equ 0ED4h ;# 
# 624 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMOL equ 0ED4h ;# 
# 631 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMOH equ 0ED5h ;# 
# 638 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXFCON equ 0ED8h ;# 
# 700 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPKTCNT equ 0ED9h ;# 
# 707 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPT equ 0EE2h ;# 
# 714 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPTL equ 0EE2h ;# 
# 721 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPTH equ 0EE3h ;# 
# 728 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXST equ 0EE4h ;# 
# 735 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXSTL equ 0EE4h ;# 
# 742 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXSTH equ 0EE5h ;# 
# 749 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXND equ 0EE6h ;# 
# 756 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXNDL equ 0EE6h ;# 
# 763 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXNDH equ 0EE7h ;# 
# 770 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXST equ 0EE8h ;# 
# 777 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXSTL equ 0EE8h ;# 
# 784 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXSTH equ 0EE9h ;# 
# 791 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXND equ 0EEAh ;# 
# 798 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXNDL equ 0EEAh ;# 
# 805 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXNDH equ 0EEBh ;# 
# 812 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPT equ 0EECh ;# 
# 819 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPTL equ 0EECh ;# 
# 826 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPTH equ 0EEDh ;# 
# 833 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPT equ 0EEEh ;# 
# 840 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPTL equ 0EEEh ;# 
# 847 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPTH equ 0EEFh ;# 
# 854 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMAST equ 0EF0h ;# 
# 861 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMASTL equ 0EF0h ;# 
# 868 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMASTH equ 0EF1h ;# 
# 875 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMAND equ 0EF2h ;# 
# 882 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMANDL equ 0EF2h ;# 
# 889 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMANDH equ 0EF3h ;# 
# 896 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADST equ 0EF4h ;# 
# 903 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADSTL equ 0EF4h ;# 
# 910 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADSTH equ 0EF5h ;# 
# 917 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACS equ 0EF6h ;# 
# 924 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACSL equ 0EF6h ;# 
# 931 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACSH equ 0EF7h ;# 
# 938 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EIE equ 0EFBh ;# 
# 998 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ESTAT equ 0EFDh ;# 
# 1038 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECON2 equ 0EFEh ;# 
# 1071 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EIR equ 0F60h ;# 
# 1131 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDATA equ 0F61h ;# 
# 1193 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2DEL equ 0F67h ;# 
# 1313 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2AS equ 0F68h ;# 
# 1445 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3DEL equ 0F69h ;# 
# 1565 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3AS equ 0F6Ah ;# 
# 1697 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP5CON equ 0F70h ;# 
# 1776 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5 equ 0F71h ;# 
# 1783 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5L equ 0F71h ;# 
# 1790 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5H equ 0F72h ;# 
# 1797 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP4CON equ 0F73h ;# 
# 1876 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4 equ 0F74h ;# 
# 1883 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4L equ 0F74h ;# 
# 1890 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4H equ 0F75h ;# 
# 1897 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T4CON equ 0F76h ;# 
# 1968 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PR4 equ 0F77h ;# 
# 1975 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR4 equ 0F78h ;# 
# 1982 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1DEL equ 0F79h ;# 
# 2102 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPT equ 0F7Ah ;# 
# 2109 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPTL equ 0F7Ah ;# 
# 2116 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPTH equ 0F7Bh ;# 
# 2123 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCON1 equ 0F7Eh ;# 
# 2128 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCON equ 0F7Eh ;# 
# 2132 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCTL equ 0F7Eh ;# 
# 2136 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCTL1 equ 0F7Eh ;# 
# 2801 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRGH1 equ 0F7Fh ;# 
# 2806 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRGH equ 0F7Fh ;# 
# 2813 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTA equ 0F80h ;# 
# 2942 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTB equ 0F81h ;# 
# 3084 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTC equ 0F82h ;# 
# 3324 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTD equ 0F83h ;# 
# 3380 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTE equ 0F84h ;# 
# 3515 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTF equ 0F85h ;# 
# 3684 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTG equ 0F86h ;# 
# 3714 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATA equ 0F89h ;# 
# 3835 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATB equ 0F8Ah ;# 
# 3947 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATC equ 0F8Bh ;# 
# 4059 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATD equ 0F8Ch ;# 
# 4111 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATE equ 0F8Dh ;# 
# 4199 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATF equ 0F8Eh ;# 
# 4301 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATG equ 0F8Fh ;# 
# 4331 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISA equ 0F92h ;# 
# 4336 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRA equ 0F92h ;# 
# 4505 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISB equ 0F93h ;# 
# 4510 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRB equ 0F93h ;# 
# 4727 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISC equ 0F94h ;# 
# 4732 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRC equ 0F94h ;# 
# 4949 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISD equ 0F95h ;# 
# 4954 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRD equ 0F95h ;# 
# 5051 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISE equ 0F96h ;# 
# 5056 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRE equ 0F96h ;# 
# 5225 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISF equ 0F97h ;# 
# 5230 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRF equ 0F97h ;# 
# 5427 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISG equ 0F98h ;# 
# 5432 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRG equ 0F98h ;# 
# 5485 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
OSCTUNE equ 0F9Bh ;# 
# 5539 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE1 equ 0F9Dh ;# 
# 5616 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR1 equ 0F9Eh ;# 
# 5696 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR1 equ 0F9Fh ;# 
# 5773 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE2 equ 0FA0h ;# 
# 5834 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR2 equ 0FA1h ;# 
# 5895 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR2 equ 0FA2h ;# 
# 5956 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE3 equ 0FA3h ;# 
# 6029 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR3 equ 0FA4h ;# 
# 6076 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR3 equ 0FA5h ;# 
# 6123 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EECON1 equ 0FA6h ;# 
# 6162 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EECON2 equ 0FA7h ;# 
# 6169 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCSTA1 equ 0FABh ;# 
# 6174 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCSTA equ 0FABh ;# 
# 6493 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXSTA1 equ 0FACh ;# 
# 6498 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXSTA equ 0FACh ;# 
# 6781 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXREG1 equ 0FADh ;# 
# 6786 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXREG equ 0FADh ;# 
# 6793 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCREG1 equ 0FAEh ;# 
# 6798 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCREG equ 0FAEh ;# 
# 6805 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRG1 equ 0FAFh ;# 
# 6810 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRG equ 0FAFh ;# 
# 6817 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T3CON equ 0FB1h ;# 
# 6938 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3 equ 0FB2h ;# 
# 6945 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3L equ 0FB2h ;# 
# 6952 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3H equ 0FB3h ;# 
# 6959 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CMCON equ 0FB4h ;# 
# 7049 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CVRCON equ 0FB5h ;# 
# 7128 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1AS equ 0FB6h ;# 
# 7260 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP3CON equ 0FB7h ;# 
# 7265 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3CON equ 0FB7h ;# 
# 7452 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3 equ 0FB8h ;# 
# 7459 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3L equ 0FB8h ;# 
# 7466 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3H equ 0FB9h ;# 
# 7473 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP2CON equ 0FBAh ;# 
# 7478 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2CON equ 0FBAh ;# 
# 7665 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2 equ 0FBBh ;# 
# 7672 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2L equ 0FBBh ;# 
# 7679 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2H equ 0FBCh ;# 
# 7686 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP1CON equ 0FBDh ;# 
# 7691 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1CON equ 0FBDh ;# 
# 7878 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1 equ 0FBEh ;# 
# 7885 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1L equ 0FBEh ;# 
# 7892 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1H equ 0FBFh ;# 
# 7899 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON2 equ 0FC0h ;# 
# 7970 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON1 equ 0FC1h ;# 
# 8055 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON0 equ 0FC2h ;# 
# 8181 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRES equ 0FC3h ;# 
# 8188 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRESL equ 0FC3h ;# 
# 8195 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRESH equ 0FC4h ;# 
# 8202 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1CON2 equ 0FC5h ;# 
# 8207 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPCON2 equ 0FC5h ;# 
# 8574 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1CON1 equ 0FC6h ;# 
# 8579 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPCON1 equ 0FC6h ;# 
# 8812 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1STAT equ 0FC7h ;# 
# 8817 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPSTAT equ 0FC7h ;# 
# 9410 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1ADD equ 0FC8h ;# 
# 9415 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPADD equ 0FC8h ;# 
# 9632 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1BUF equ 0FC9h ;# 
# 9637 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPBUF equ 0FC9h ;# 
# 9644 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T2CON equ 0FCAh ;# 
# 9715 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PR2 equ 0FCBh ;# 
# 9720 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MEMCON equ 0FCBh ;# 
# 9825 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR2 equ 0FCCh ;# 
# 9832 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T1CON equ 0FCDh ;# 
# 9944 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1 equ 0FCEh ;# 
# 9951 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1L equ 0FCEh ;# 
# 9958 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1H equ 0FCFh ;# 
# 9965 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCON equ 0FD0h ;# 
# 10113 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
WDTCON equ 0FD1h ;# 
# 10141 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECON1 equ 0FD2h ;# 
# 10192 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
OSCCON equ 0FD3h ;# 
# 10240 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T0CON equ 0FD5h ;# 
# 10310 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0 equ 0FD6h ;# 
# 10317 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0L equ 0FD6h ;# 
# 10324 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0H equ 0FD7h ;# 
# 10331 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
STATUS equ 0FD8h ;# 
# 10402 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2 equ 0FD9h ;# 
# 10409 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2L equ 0FD9h ;# 
# 10416 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2H equ 0FDAh ;# 
# 10423 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW2 equ 0FDBh ;# 
# 10430 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC2 equ 0FDCh ;# 
# 10437 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC2 equ 0FDDh ;# 
# 10444 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC2 equ 0FDEh ;# 
# 10451 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF2 equ 0FDFh ;# 
# 10458 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BSR equ 0FE0h ;# 
# 10465 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1 equ 0FE1h ;# 
# 10472 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1L equ 0FE1h ;# 
# 10479 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1H equ 0FE2h ;# 
# 10486 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW1 equ 0FE3h ;# 
# 10493 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC1 equ 0FE4h ;# 
# 10500 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC1 equ 0FE5h ;# 
# 10507 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC1 equ 0FE6h ;# 
# 10514 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF1 equ 0FE7h ;# 
# 10521 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
WREG equ 0FE8h ;# 
# 10528 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0 equ 0FE9h ;# 
# 10535 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0L equ 0FE9h ;# 
# 10542 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0H equ 0FEAh ;# 
# 10549 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW0 equ 0FEBh ;# 
# 10556 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC0 equ 0FECh ;# 
# 10563 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC0 equ 0FEDh ;# 
# 10570 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC0 equ 0FEEh ;# 
# 10577 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF0 equ 0FEFh ;# 
# 10584 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON3 equ 0FF0h ;# 
# 10696 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON2 equ 0FF1h ;# 
# 10783 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON equ 0FF2h ;# 
# 10900 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PROD equ 0FF3h ;# 
# 10907 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PRODL equ 0FF3h ;# 
# 10914 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PRODH equ 0FF4h ;# 
# 10921 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TABLAT equ 0FF5h ;# 
# 10930 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTR equ 0FF6h ;# 
# 10937 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRL equ 0FF6h ;# 
# 10944 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRH equ 0FF7h ;# 
# 10951 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRU equ 0FF8h ;# 
# 10960 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLAT equ 0FF9h ;# 
# 10967 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PC equ 0FF9h ;# 
# 10974 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCL equ 0FF9h ;# 
# 10981 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLATH equ 0FFAh ;# 
# 10988 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLATU equ 0FFBh ;# 
# 10995 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
STKPTR equ 0FFCh ;# 
# 11101 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOS equ 0FFDh ;# 
# 11108 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSL equ 0FFDh ;# 
# 11115 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSH equ 0FFEh ;# 
# 11122 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSU equ 0FFFh ;# 
# 52 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR5 equ 0E80h ;# 
# 59 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR6 equ 0E81h ;# 
# 66 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR3 equ 0E82h ;# 
# 73 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR4 equ 0E83h ;# 
# 80 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR1 equ 0E84h ;# 
# 87 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR2 equ 0E85h ;# 
# 94 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MISTAT equ 0E8Ah ;# 
# 127 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EFLOCON equ 0E97h ;# 
# 159 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUS equ 0E98h ;# 
# 166 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUSL equ 0E98h ;# 
# 173 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUSH equ 0E99h ;# 
# 180 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON1 equ 0EA0h ;# 
# 218 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON3 equ 0EA2h ;# 
# 289 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON4 equ 0EA3h ;# 
# 311 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MABBIPG equ 0EA4h ;# 
# 367 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPG equ 0EA6h ;# 
# 374 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPGL equ 0EA6h ;# 
# 381 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPGH equ 0EA7h ;# 
# 388 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFL equ 0EAAh ;# 
# 395 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFLL equ 0EAAh ;# 
# 402 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFLH equ 0EABh ;# 
# 409 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MICMD equ 0EB2h ;# 
# 435 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIREGADR equ 0EB4h ;# 
# 442 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWR equ 0EB6h ;# 
# 449 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWRL equ 0EB6h ;# 
# 456 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWRH equ 0EB7h ;# 
# 463 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRD equ 0EB8h ;# 
# 470 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRDL equ 0EB8h ;# 
# 477 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRDH equ 0EB9h ;# 
# 484 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT0 equ 0EC0h ;# 
# 491 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT1 equ 0EC1h ;# 
# 498 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT2 equ 0EC2h ;# 
# 505 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT3 equ 0EC3h ;# 
# 512 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT4 equ 0EC4h ;# 
# 519 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT5 equ 0EC5h ;# 
# 526 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT6 equ 0EC6h ;# 
# 533 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT7 equ 0EC7h ;# 
# 540 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM0 equ 0EC8h ;# 
# 547 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM1 equ 0EC9h ;# 
# 554 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM2 equ 0ECAh ;# 
# 561 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM3 equ 0ECBh ;# 
# 568 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM4 equ 0ECCh ;# 
# 575 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM5 equ 0ECDh ;# 
# 582 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM6 equ 0ECEh ;# 
# 589 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM7 equ 0ECFh ;# 
# 596 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCS equ 0ED0h ;# 
# 603 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCSL equ 0ED0h ;# 
# 610 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCSH equ 0ED1h ;# 
# 617 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMO equ 0ED4h ;# 
# 624 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMOL equ 0ED4h ;# 
# 631 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMOH equ 0ED5h ;# 
# 638 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXFCON equ 0ED8h ;# 
# 700 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPKTCNT equ 0ED9h ;# 
# 707 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPT equ 0EE2h ;# 
# 714 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPTL equ 0EE2h ;# 
# 721 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPTH equ 0EE3h ;# 
# 728 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXST equ 0EE4h ;# 
# 735 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXSTL equ 0EE4h ;# 
# 742 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXSTH equ 0EE5h ;# 
# 749 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXND equ 0EE6h ;# 
# 756 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXNDL equ 0EE6h ;# 
# 763 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXNDH equ 0EE7h ;# 
# 770 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXST equ 0EE8h ;# 
# 777 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXSTL equ 0EE8h ;# 
# 784 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXSTH equ 0EE9h ;# 
# 791 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXND equ 0EEAh ;# 
# 798 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXNDL equ 0EEAh ;# 
# 805 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXNDH equ 0EEBh ;# 
# 812 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPT equ 0EECh ;# 
# 819 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPTL equ 0EECh ;# 
# 826 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPTH equ 0EEDh ;# 
# 833 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPT equ 0EEEh ;# 
# 840 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPTL equ 0EEEh ;# 
# 847 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPTH equ 0EEFh ;# 
# 854 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMAST equ 0EF0h ;# 
# 861 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMASTL equ 0EF0h ;# 
# 868 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMASTH equ 0EF1h ;# 
# 875 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMAND equ 0EF2h ;# 
# 882 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMANDL equ 0EF2h ;# 
# 889 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMANDH equ 0EF3h ;# 
# 896 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADST equ 0EF4h ;# 
# 903 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADSTL equ 0EF4h ;# 
# 910 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADSTH equ 0EF5h ;# 
# 917 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACS equ 0EF6h ;# 
# 924 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACSL equ 0EF6h ;# 
# 931 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACSH equ 0EF7h ;# 
# 938 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EIE equ 0EFBh ;# 
# 998 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ESTAT equ 0EFDh ;# 
# 1038 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECON2 equ 0EFEh ;# 
# 1071 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EIR equ 0F60h ;# 
# 1131 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDATA equ 0F61h ;# 
# 1193 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2DEL equ 0F67h ;# 
# 1313 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2AS equ 0F68h ;# 
# 1445 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3DEL equ 0F69h ;# 
# 1565 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3AS equ 0F6Ah ;# 
# 1697 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP5CON equ 0F70h ;# 
# 1776 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5 equ 0F71h ;# 
# 1783 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5L equ 0F71h ;# 
# 1790 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5H equ 0F72h ;# 
# 1797 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP4CON equ 0F73h ;# 
# 1876 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4 equ 0F74h ;# 
# 1883 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4L equ 0F74h ;# 
# 1890 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4H equ 0F75h ;# 
# 1897 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T4CON equ 0F76h ;# 
# 1968 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PR4 equ 0F77h ;# 
# 1975 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR4 equ 0F78h ;# 
# 1982 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1DEL equ 0F79h ;# 
# 2102 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPT equ 0F7Ah ;# 
# 2109 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPTL equ 0F7Ah ;# 
# 2116 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPTH equ 0F7Bh ;# 
# 2123 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCON1 equ 0F7Eh ;# 
# 2128 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCON equ 0F7Eh ;# 
# 2132 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCTL equ 0F7Eh ;# 
# 2136 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCTL1 equ 0F7Eh ;# 
# 2801 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRGH1 equ 0F7Fh ;# 
# 2806 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRGH equ 0F7Fh ;# 
# 2813 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTA equ 0F80h ;# 
# 2942 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTB equ 0F81h ;# 
# 3084 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTC equ 0F82h ;# 
# 3324 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTD equ 0F83h ;# 
# 3380 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTE equ 0F84h ;# 
# 3515 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTF equ 0F85h ;# 
# 3684 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTG equ 0F86h ;# 
# 3714 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATA equ 0F89h ;# 
# 3835 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATB equ 0F8Ah ;# 
# 3947 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATC equ 0F8Bh ;# 
# 4059 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATD equ 0F8Ch ;# 
# 4111 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATE equ 0F8Dh ;# 
# 4199 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATF equ 0F8Eh ;# 
# 4301 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATG equ 0F8Fh ;# 
# 4331 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISA equ 0F92h ;# 
# 4336 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRA equ 0F92h ;# 
# 4505 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISB equ 0F93h ;# 
# 4510 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRB equ 0F93h ;# 
# 4727 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISC equ 0F94h ;# 
# 4732 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRC equ 0F94h ;# 
# 4949 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISD equ 0F95h ;# 
# 4954 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRD equ 0F95h ;# 
# 5051 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISE equ 0F96h ;# 
# 5056 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRE equ 0F96h ;# 
# 5225 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISF equ 0F97h ;# 
# 5230 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRF equ 0F97h ;# 
# 5427 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISG equ 0F98h ;# 
# 5432 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRG equ 0F98h ;# 
# 5485 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
OSCTUNE equ 0F9Bh ;# 
# 5539 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE1 equ 0F9Dh ;# 
# 5616 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR1 equ 0F9Eh ;# 
# 5696 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR1 equ 0F9Fh ;# 
# 5773 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE2 equ 0FA0h ;# 
# 5834 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR2 equ 0FA1h ;# 
# 5895 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR2 equ 0FA2h ;# 
# 5956 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE3 equ 0FA3h ;# 
# 6029 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR3 equ 0FA4h ;# 
# 6076 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR3 equ 0FA5h ;# 
# 6123 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EECON1 equ 0FA6h ;# 
# 6162 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EECON2 equ 0FA7h ;# 
# 6169 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCSTA1 equ 0FABh ;# 
# 6174 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCSTA equ 0FABh ;# 
# 6493 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXSTA1 equ 0FACh ;# 
# 6498 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXSTA equ 0FACh ;# 
# 6781 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXREG1 equ 0FADh ;# 
# 6786 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXREG equ 0FADh ;# 
# 6793 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCREG1 equ 0FAEh ;# 
# 6798 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCREG equ 0FAEh ;# 
# 6805 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRG1 equ 0FAFh ;# 
# 6810 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRG equ 0FAFh ;# 
# 6817 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T3CON equ 0FB1h ;# 
# 6938 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3 equ 0FB2h ;# 
# 6945 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3L equ 0FB2h ;# 
# 6952 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3H equ 0FB3h ;# 
# 6959 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CMCON equ 0FB4h ;# 
# 7049 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CVRCON equ 0FB5h ;# 
# 7128 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1AS equ 0FB6h ;# 
# 7260 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP3CON equ 0FB7h ;# 
# 7265 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3CON equ 0FB7h ;# 
# 7452 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3 equ 0FB8h ;# 
# 7459 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3L equ 0FB8h ;# 
# 7466 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3H equ 0FB9h ;# 
# 7473 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP2CON equ 0FBAh ;# 
# 7478 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2CON equ 0FBAh ;# 
# 7665 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2 equ 0FBBh ;# 
# 7672 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2L equ 0FBBh ;# 
# 7679 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2H equ 0FBCh ;# 
# 7686 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP1CON equ 0FBDh ;# 
# 7691 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1CON equ 0FBDh ;# 
# 7878 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1 equ 0FBEh ;# 
# 7885 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1L equ 0FBEh ;# 
# 7892 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1H equ 0FBFh ;# 
# 7899 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON2 equ 0FC0h ;# 
# 7970 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON1 equ 0FC1h ;# 
# 8055 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON0 equ 0FC2h ;# 
# 8181 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRES equ 0FC3h ;# 
# 8188 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRESL equ 0FC3h ;# 
# 8195 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRESH equ 0FC4h ;# 
# 8202 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1CON2 equ 0FC5h ;# 
# 8207 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPCON2 equ 0FC5h ;# 
# 8574 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1CON1 equ 0FC6h ;# 
# 8579 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPCON1 equ 0FC6h ;# 
# 8812 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1STAT equ 0FC7h ;# 
# 8817 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPSTAT equ 0FC7h ;# 
# 9410 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1ADD equ 0FC8h ;# 
# 9415 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPADD equ 0FC8h ;# 
# 9632 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1BUF equ 0FC9h ;# 
# 9637 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPBUF equ 0FC9h ;# 
# 9644 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T2CON equ 0FCAh ;# 
# 9715 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PR2 equ 0FCBh ;# 
# 9720 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MEMCON equ 0FCBh ;# 
# 9825 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR2 equ 0FCCh ;# 
# 9832 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T1CON equ 0FCDh ;# 
# 9944 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1 equ 0FCEh ;# 
# 9951 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1L equ 0FCEh ;# 
# 9958 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1H equ 0FCFh ;# 
# 9965 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCON equ 0FD0h ;# 
# 10113 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
WDTCON equ 0FD1h ;# 
# 10141 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECON1 equ 0FD2h ;# 
# 10192 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
OSCCON equ 0FD3h ;# 
# 10240 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T0CON equ 0FD5h ;# 
# 10310 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0 equ 0FD6h ;# 
# 10317 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0L equ 0FD6h ;# 
# 10324 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0H equ 0FD7h ;# 
# 10331 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
STATUS equ 0FD8h ;# 
# 10402 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2 equ 0FD9h ;# 
# 10409 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2L equ 0FD9h ;# 
# 10416 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2H equ 0FDAh ;# 
# 10423 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW2 equ 0FDBh ;# 
# 10430 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC2 equ 0FDCh ;# 
# 10437 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC2 equ 0FDDh ;# 
# 10444 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC2 equ 0FDEh ;# 
# 10451 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF2 equ 0FDFh ;# 
# 10458 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BSR equ 0FE0h ;# 
# 10465 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1 equ 0FE1h ;# 
# 10472 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1L equ 0FE1h ;# 
# 10479 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1H equ 0FE2h ;# 
# 10486 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW1 equ 0FE3h ;# 
# 10493 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC1 equ 0FE4h ;# 
# 10500 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC1 equ 0FE5h ;# 
# 10507 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC1 equ 0FE6h ;# 
# 10514 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF1 equ 0FE7h ;# 
# 10521 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
WREG equ 0FE8h ;# 
# 10528 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0 equ 0FE9h ;# 
# 10535 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0L equ 0FE9h ;# 
# 10542 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0H equ 0FEAh ;# 
# 10549 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW0 equ 0FEBh ;# 
# 10556 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC0 equ 0FECh ;# 
# 10563 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC0 equ 0FEDh ;# 
# 10570 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC0 equ 0FEEh ;# 
# 10577 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF0 equ 0FEFh ;# 
# 10584 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON3 equ 0FF0h ;# 
# 10696 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON2 equ 0FF1h ;# 
# 10783 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON equ 0FF2h ;# 
# 10900 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PROD equ 0FF3h ;# 
# 10907 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PRODL equ 0FF3h ;# 
# 10914 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PRODH equ 0FF4h ;# 
# 10921 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TABLAT equ 0FF5h ;# 
# 10930 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTR equ 0FF6h ;# 
# 10937 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRL equ 0FF6h ;# 
# 10944 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRH equ 0FF7h ;# 
# 10951 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRU equ 0FF8h ;# 
# 10960 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLAT equ 0FF9h ;# 
# 10967 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PC equ 0FF9h ;# 
# 10974 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCL equ 0FF9h ;# 
# 10981 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLATH equ 0FFAh ;# 
# 10988 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLATU equ 0FFBh ;# 
# 10995 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
STKPTR equ 0FFCh ;# 
# 11101 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOS equ 0FFDh ;# 
# 11108 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSL equ 0FFDh ;# 
# 11115 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSH equ 0FFEh ;# 
# 11122 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSU equ 0FFFh ;# 
# 52 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR5 equ 0E80h ;# 
# 59 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR6 equ 0E81h ;# 
# 66 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR3 equ 0E82h ;# 
# 73 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR4 equ 0E83h ;# 
# 80 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR1 equ 0E84h ;# 
# 87 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAADR2 equ 0E85h ;# 
# 94 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MISTAT equ 0E8Ah ;# 
# 127 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EFLOCON equ 0E97h ;# 
# 159 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUS equ 0E98h ;# 
# 166 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUSL equ 0E98h ;# 
# 173 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPAUSH equ 0E99h ;# 
# 180 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON1 equ 0EA0h ;# 
# 218 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON3 equ 0EA2h ;# 
# 289 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MACON4 equ 0EA3h ;# 
# 311 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MABBIPG equ 0EA4h ;# 
# 367 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPG equ 0EA6h ;# 
# 374 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPGL equ 0EA6h ;# 
# 381 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAIPGH equ 0EA7h ;# 
# 388 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFL equ 0EAAh ;# 
# 395 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFLL equ 0EAAh ;# 
# 402 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MAMXFLH equ 0EABh ;# 
# 409 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MICMD equ 0EB2h ;# 
# 435 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIREGADR equ 0EB4h ;# 
# 442 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWR equ 0EB6h ;# 
# 449 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWRL equ 0EB6h ;# 
# 456 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIWRH equ 0EB7h ;# 
# 463 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRD equ 0EB8h ;# 
# 470 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRDL equ 0EB8h ;# 
# 477 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MIRDH equ 0EB9h ;# 
# 484 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT0 equ 0EC0h ;# 
# 491 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT1 equ 0EC1h ;# 
# 498 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT2 equ 0EC2h ;# 
# 505 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT3 equ 0EC3h ;# 
# 512 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT4 equ 0EC4h ;# 
# 519 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT5 equ 0EC5h ;# 
# 526 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT6 equ 0EC6h ;# 
# 533 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EHT7 equ 0EC7h ;# 
# 540 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM0 equ 0EC8h ;# 
# 547 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM1 equ 0EC9h ;# 
# 554 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM2 equ 0ECAh ;# 
# 561 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM3 equ 0ECBh ;# 
# 568 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM4 equ 0ECCh ;# 
# 575 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM5 equ 0ECDh ;# 
# 582 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM6 equ 0ECEh ;# 
# 589 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMM7 equ 0ECFh ;# 
# 596 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCS equ 0ED0h ;# 
# 603 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCSL equ 0ED0h ;# 
# 610 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMCSH equ 0ED1h ;# 
# 617 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMO equ 0ED4h ;# 
# 624 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMOL equ 0ED4h ;# 
# 631 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPMOH equ 0ED5h ;# 
# 638 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXFCON equ 0ED8h ;# 
# 700 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EPKTCNT equ 0ED9h ;# 
# 707 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPT equ 0EE2h ;# 
# 714 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPTL equ 0EE2h ;# 
# 721 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EWRPTH equ 0EE3h ;# 
# 728 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXST equ 0EE4h ;# 
# 735 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXSTL equ 0EE4h ;# 
# 742 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXSTH equ 0EE5h ;# 
# 749 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXND equ 0EE6h ;# 
# 756 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXNDL equ 0EE6h ;# 
# 763 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ETXNDH equ 0EE7h ;# 
# 770 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXST equ 0EE8h ;# 
# 777 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXSTL equ 0EE8h ;# 
# 784 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXSTH equ 0EE9h ;# 
# 791 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXND equ 0EEAh ;# 
# 798 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXNDL equ 0EEAh ;# 
# 805 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXNDH equ 0EEBh ;# 
# 812 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPT equ 0EECh ;# 
# 819 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPTL equ 0EECh ;# 
# 826 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXRDPTH equ 0EEDh ;# 
# 833 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPT equ 0EEEh ;# 
# 840 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPTL equ 0EEEh ;# 
# 847 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERXWRPTH equ 0EEFh ;# 
# 854 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMAST equ 0EF0h ;# 
# 861 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMASTL equ 0EF0h ;# 
# 868 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMASTH equ 0EF1h ;# 
# 875 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMAND equ 0EF2h ;# 
# 882 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMANDL equ 0EF2h ;# 
# 889 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMANDH equ 0EF3h ;# 
# 896 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADST equ 0EF4h ;# 
# 903 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADSTL equ 0EF4h ;# 
# 910 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMADSTH equ 0EF5h ;# 
# 917 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACS equ 0EF6h ;# 
# 924 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACSL equ 0EF6h ;# 
# 931 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDMACSH equ 0EF7h ;# 
# 938 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EIE equ 0EFBh ;# 
# 998 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ESTAT equ 0EFDh ;# 
# 1038 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECON2 equ 0EFEh ;# 
# 1071 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EIR equ 0F60h ;# 
# 1131 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EDATA equ 0F61h ;# 
# 1193 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2DEL equ 0F67h ;# 
# 1313 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2AS equ 0F68h ;# 
# 1445 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3DEL equ 0F69h ;# 
# 1565 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3AS equ 0F6Ah ;# 
# 1697 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP5CON equ 0F70h ;# 
# 1776 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5 equ 0F71h ;# 
# 1783 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5L equ 0F71h ;# 
# 1790 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR5H equ 0F72h ;# 
# 1797 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP4CON equ 0F73h ;# 
# 1876 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4 equ 0F74h ;# 
# 1883 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4L equ 0F74h ;# 
# 1890 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR4H equ 0F75h ;# 
# 1897 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T4CON equ 0F76h ;# 
# 1968 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PR4 equ 0F77h ;# 
# 1975 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR4 equ 0F78h ;# 
# 1982 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1DEL equ 0F79h ;# 
# 2102 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPT equ 0F7Ah ;# 
# 2109 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPTL equ 0F7Ah ;# 
# 2116 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ERDPTH equ 0F7Bh ;# 
# 2123 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCON1 equ 0F7Eh ;# 
# 2128 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCON equ 0F7Eh ;# 
# 2132 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCTL equ 0F7Eh ;# 
# 2136 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BAUDCTL1 equ 0F7Eh ;# 
# 2801 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRGH1 equ 0F7Fh ;# 
# 2806 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRGH equ 0F7Fh ;# 
# 2813 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTA equ 0F80h ;# 
# 2942 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTB equ 0F81h ;# 
# 3084 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTC equ 0F82h ;# 
# 3324 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTD equ 0F83h ;# 
# 3380 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTE equ 0F84h ;# 
# 3515 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTF equ 0F85h ;# 
# 3684 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PORTG equ 0F86h ;# 
# 3714 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATA equ 0F89h ;# 
# 3835 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATB equ 0F8Ah ;# 
# 3947 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATC equ 0F8Bh ;# 
# 4059 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATD equ 0F8Ch ;# 
# 4111 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATE equ 0F8Dh ;# 
# 4199 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATF equ 0F8Eh ;# 
# 4301 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
LATG equ 0F8Fh ;# 
# 4331 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISA equ 0F92h ;# 
# 4336 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRA equ 0F92h ;# 
# 4505 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISB equ 0F93h ;# 
# 4510 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRB equ 0F93h ;# 
# 4727 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISC equ 0F94h ;# 
# 4732 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRC equ 0F94h ;# 
# 4949 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISD equ 0F95h ;# 
# 4954 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRD equ 0F95h ;# 
# 5051 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISE equ 0F96h ;# 
# 5056 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRE equ 0F96h ;# 
# 5225 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISF equ 0F97h ;# 
# 5230 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRF equ 0F97h ;# 
# 5427 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TRISG equ 0F98h ;# 
# 5432 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
DDRG equ 0F98h ;# 
# 5485 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
OSCTUNE equ 0F9Bh ;# 
# 5539 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE1 equ 0F9Dh ;# 
# 5616 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR1 equ 0F9Eh ;# 
# 5696 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR1 equ 0F9Fh ;# 
# 5773 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE2 equ 0FA0h ;# 
# 5834 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR2 equ 0FA1h ;# 
# 5895 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR2 equ 0FA2h ;# 
# 5956 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIE3 equ 0FA3h ;# 
# 6029 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PIR3 equ 0FA4h ;# 
# 6076 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
IPR3 equ 0FA5h ;# 
# 6123 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EECON1 equ 0FA6h ;# 
# 6162 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
EECON2 equ 0FA7h ;# 
# 6169 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCSTA1 equ 0FABh ;# 
# 6174 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCSTA equ 0FABh ;# 
# 6493 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXSTA1 equ 0FACh ;# 
# 6498 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXSTA equ 0FACh ;# 
# 6781 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXREG1 equ 0FADh ;# 
# 6786 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TXREG equ 0FADh ;# 
# 6793 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCREG1 equ 0FAEh ;# 
# 6798 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCREG equ 0FAEh ;# 
# 6805 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRG1 equ 0FAFh ;# 
# 6810 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SPBRG equ 0FAFh ;# 
# 6817 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T3CON equ 0FB1h ;# 
# 6938 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3 equ 0FB2h ;# 
# 6945 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3L equ 0FB2h ;# 
# 6952 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR3H equ 0FB3h ;# 
# 6959 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CMCON equ 0FB4h ;# 
# 7049 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CVRCON equ 0FB5h ;# 
# 7128 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1AS equ 0FB6h ;# 
# 7260 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP3CON equ 0FB7h ;# 
# 7265 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP3CON equ 0FB7h ;# 
# 7452 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3 equ 0FB8h ;# 
# 7459 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3L equ 0FB8h ;# 
# 7466 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR3H equ 0FB9h ;# 
# 7473 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP2CON equ 0FBAh ;# 
# 7478 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP2CON equ 0FBAh ;# 
# 7665 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2 equ 0FBBh ;# 
# 7672 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2L equ 0FBBh ;# 
# 7679 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR2H equ 0FBCh ;# 
# 7686 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCP1CON equ 0FBDh ;# 
# 7691 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECCP1CON equ 0FBDh ;# 
# 7878 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1 equ 0FBEh ;# 
# 7885 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1L equ 0FBEh ;# 
# 7892 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
CCPR1H equ 0FBFh ;# 
# 7899 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON2 equ 0FC0h ;# 
# 7970 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON1 equ 0FC1h ;# 
# 8055 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADCON0 equ 0FC2h ;# 
# 8181 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRES equ 0FC3h ;# 
# 8188 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRESL equ 0FC3h ;# 
# 8195 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ADRESH equ 0FC4h ;# 
# 8202 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1CON2 equ 0FC5h ;# 
# 8207 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPCON2 equ 0FC5h ;# 
# 8574 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1CON1 equ 0FC6h ;# 
# 8579 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPCON1 equ 0FC6h ;# 
# 8812 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1STAT equ 0FC7h ;# 
# 8817 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPSTAT equ 0FC7h ;# 
# 9410 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1ADD equ 0FC8h ;# 
# 9415 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPADD equ 0FC8h ;# 
# 9632 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSP1BUF equ 0FC9h ;# 
# 9637 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
SSPBUF equ 0FC9h ;# 
# 9644 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T2CON equ 0FCAh ;# 
# 9715 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PR2 equ 0FCBh ;# 
# 9720 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
MEMCON equ 0FCBh ;# 
# 9825 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR2 equ 0FCCh ;# 
# 9832 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T1CON equ 0FCDh ;# 
# 9944 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1 equ 0FCEh ;# 
# 9951 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1L equ 0FCEh ;# 
# 9958 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR1H equ 0FCFh ;# 
# 9965 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
RCON equ 0FD0h ;# 
# 10113 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
WDTCON equ 0FD1h ;# 
# 10141 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
ECON1 equ 0FD2h ;# 
# 10192 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
OSCCON equ 0FD3h ;# 
# 10240 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
T0CON equ 0FD5h ;# 
# 10310 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0 equ 0FD6h ;# 
# 10317 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0L equ 0FD6h ;# 
# 10324 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TMR0H equ 0FD7h ;# 
# 10331 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
STATUS equ 0FD8h ;# 
# 10402 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2 equ 0FD9h ;# 
# 10409 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2L equ 0FD9h ;# 
# 10416 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR2H equ 0FDAh ;# 
# 10423 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW2 equ 0FDBh ;# 
# 10430 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC2 equ 0FDCh ;# 
# 10437 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC2 equ 0FDDh ;# 
# 10444 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC2 equ 0FDEh ;# 
# 10451 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF2 equ 0FDFh ;# 
# 10458 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
BSR equ 0FE0h ;# 
# 10465 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1 equ 0FE1h ;# 
# 10472 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1L equ 0FE1h ;# 
# 10479 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR1H equ 0FE2h ;# 
# 10486 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW1 equ 0FE3h ;# 
# 10493 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC1 equ 0FE4h ;# 
# 10500 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC1 equ 0FE5h ;# 
# 10507 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC1 equ 0FE6h ;# 
# 10514 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF1 equ 0FE7h ;# 
# 10521 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
WREG equ 0FE8h ;# 
# 10528 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0 equ 0FE9h ;# 
# 10535 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0L equ 0FE9h ;# 
# 10542 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
FSR0H equ 0FEAh ;# 
# 10549 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PLUSW0 equ 0FEBh ;# 
# 10556 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PREINC0 equ 0FECh ;# 
# 10563 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTDEC0 equ 0FEDh ;# 
# 10570 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
POSTINC0 equ 0FEEh ;# 
# 10577 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INDF0 equ 0FEFh ;# 
# 10584 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON3 equ 0FF0h ;# 
# 10696 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON2 equ 0FF1h ;# 
# 10783 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
INTCON equ 0FF2h ;# 
# 10900 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PROD equ 0FF3h ;# 
# 10907 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PRODL equ 0FF3h ;# 
# 10914 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PRODH equ 0FF4h ;# 
# 10921 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TABLAT equ 0FF5h ;# 
# 10930 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTR equ 0FF6h ;# 
# 10937 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRL equ 0FF6h ;# 
# 10944 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRH equ 0FF7h ;# 
# 10951 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TBLPTRU equ 0FF8h ;# 
# 10960 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLAT equ 0FF9h ;# 
# 10967 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PC equ 0FF9h ;# 
# 10974 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCL equ 0FF9h ;# 
# 10981 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLATH equ 0FFAh ;# 
# 10988 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
PCLATU equ 0FFBh ;# 
# 10995 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
STKPTR equ 0FFCh ;# 
# 11101 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOS equ 0FFDh ;# 
# 11108 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSL equ 0FFDh ;# 
# 11115 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSH equ 0FFEh ;# 
# 11122 "C:\Program Files\Microchip\xc8\v1.44\include\pic18f67j60.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_HardwareInit
	FNCALL	_main,_VariablesInit
	FNCALL	_HardwareInit,_INTERRUPT_Initialize
	FNCALL	_HardwareInit,_OSCILLATOR_Initialize
	FNCALL	_HardwareInit,_Timers_Initialize
	FNROOT	_main
	FNCALL	_INTERRUPT_InterruptManager,_CCP4_ISR
	FNCALL	_INTERRUPT_InterruptManager,_CCP5_ISR
	FNCALL	_INTERRUPT_InterruptManager,_TMR3_ISR
	FNCALL	_CCP5_ISR,_TitanApp
	FNCALL	_TitanApp,_BoilerLogic
	FNCALL	_TitanApp,_GetAllSensor
	FNCALL	_TitanApp,_StartADC
	FNCALL	_GetAllSensor,_LowPassFilterADC
	FNCALL	_GetAllSensor,_WriteRelayRegister
	FNCALL	_CCP4_ISR,_TMR3_ISR
	FNCALL	intlevel2,_INTERRUPT_InterruptManager
	global	intlevel2
	FNROOT	intlevel2
	global	_ADC_Input
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	file	"titan.c"
	line	15
_ADC_Input:
	db	low(06h)
	db	low(07h)
	db	low(08h)
	db	low(09h)
	db	low(0Ah)
	db	low(0Bh)
	db	low(02h)
	db	low(04h)
	global __end_of_ADC_Input
__end_of_ADC_Input:
	global	_ADC_Input
	global	_DebounceCounter
	global	_PrevExtendedCCP4
	global	_DataInterval
	global	_ReceiveBuffer
	global	_ExtendedCCP4
	global	titan@RelayRegister
	global	_T3compare
	global	WriteRelayRegister@MakeIgnitionCounter
	global	_ADC_Channel
	global	_AfterPOResetTimer
	global	_TitanSwitchPrev
	global	titan@TitanHwFlags
	global	titan@TitanSwitch
	global	CCP4_ISR@ByteToShift
	global	CCP4_ISR@ReceiverBitCounter
	global	_Precizion1msCounter
	global	_Interval_Lo
	global	_Interval_Hi
	global	_PorogInterval
	global	_TimersCCP
	global	_ReceiverStatus
	global	_ReceiveQuantity
	global	_Count_1_ms
	global	_ADC_500uA
	global	_ADC_10uA
	global	_ResetSource
psect	nvCOMRAM,class=COMRAM,space=1,noexec
global __pnvCOMRAM
__pnvCOMRAM:
_ResetSource:
       ds      1
	global	_ADRES
_ADRES	set	0xFC3
	global	_CCPR4
_CCPR4	set	0xF74
	global	_CCPR5
_CCPR5	set	0xF71
	global	_LATFbits
_LATFbits	set	0xF8E
	global	_PORTGbits
_PORTGbits	set	0xF86
	global	_LATEbits
_LATEbits	set	0xF8D
	global	_ADCON0
_ADCON0	set	0xFC2
	global	_PORTEbits
_PORTEbits	set	0xF84
	global	_OSCTUNE
_OSCTUNE	set	0xF9B
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_LATG
_LATG	set	0xF8F
	global	_LATF
_LATF	set	0xF8E
	global	_LATE
_LATE	set	0xF8D
	global	_LATD
_LATD	set	0xF8C
	global	_LATC
_LATC	set	0xF8B
	global	_LATB
_LATB	set	0xF8A
	global	_LATA
_LATA	set	0xF89
	global	_TRISG
_TRISG	set	0xF98
	global	_TRISF
_TRISF	set	0xF97
	global	_TRISE
_TRISE	set	0xF96
	global	_TRISD
_TRISD	set	0xF95
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISA
_TRISA	set	0xF92
	global	_ADCON2
_ADCON2	set	0xFC0
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_ADCON0bits
_ADCON0bits	set	0xFC2
	global	_CCPR5H
_CCPR5H	set	0xF72
	global	_PIR2bits
_PIR2bits	set	0xFA1
	global	_TMR3H
_TMR3H	set	0xFB3
	global	_TMR3L
_TMR3L	set	0xFB2
	global	_CCP5CON
_CCP5CON	set	0xF70
	global	_PIE3bits
_PIE3bits	set	0xFA3
	global	_PIR3bits
_PIR3bits	set	0xFA4
	global	_CCP4CON
_CCP4CON	set	0xF73
	global	_PIE2bits
_PIE2bits	set	0xFA0
	global	_T3CON
_T3CON	set	0xFB1
	global	_RCONbits
_RCONbits	set	0xFD0
	global	_RCON
_RCON	set	0xFD0
; #config settings
global __CFG_WDT$ON
__CFG_WDT$ON equ 0x0
global __CFG_STVR$ON
__CFG_STVR$ON equ 0x0
global __CFG_XINST$OFF
__CFG_XINST$OFF equ 0x0
global __CFG_DEBUG$ON
__CFG_DEBUG$ON equ 0x0
global __CFG_CP0$OFF
__CFG_CP0$OFF equ 0x0
global __CFG_FOSC$HSPLL
__CFG_FOSC$HSPLL equ 0x0
global __CFG_FOSC2$ON
__CFG_FOSC2$ON equ 0x0
global __CFG_FCMEN$ON
__CFG_FCMEN$ON equ 0x0
global __CFG_IESO$ON
__CFG_IESO$ON equ 0x0
global __CFG_WDTPS$64
__CFG_WDTPS$64 equ 0x0
global __CFG_ETHLED$ON
__CFG_ETHLED$ON equ 0x0
	file	"dist/default/debug\ThirdProbe.debug.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec
global __pbssCOMRAM
__pbssCOMRAM:
_DebounceCounter:
       ds      8
_PrevExtendedCCP4:
       ds      4
_DataInterval:
       ds      4
	global	_ReceiveBuffer
_ReceiveBuffer:
       ds      4
	global	_ExtendedCCP4
_ExtendedCCP4:
       ds      4
titan@RelayRegister:
       ds      2
_T3compare:
       ds      2
_RelayRegister:
       ds      2
WriteRelayRegister@MakeIgnitionCounter:
       ds      1
_ADC_Channel:
       ds      1
_AfterPOResetTimer:
       ds      1
_TitanSwitchPrev:
       ds      1
titan@TitanHwFlags:
       ds      1
titan@TitanSwitch:
       ds      1
CCP4_ISR@ByteToShift:
       ds      1
CCP4_ISR@ReceiverBitCounter:
       ds      1
_Precizion1msCounter:
       ds      1
_Interval_Lo:
       ds      1
_Interval_Hi:
       ds      1
_PorogInterval:
       ds      1
_TitanHwFlags:
       ds      1
_TitanSwitch:
       ds      1
	global	_TimersCCP
_TimersCCP:
       ds      1
	global	_ReceiverStatus
_ReceiverStatus:
       ds      1
	global	_ReceiveQuantity
_ReceiveQuantity:
       ds      1
	global	_Count_1_ms
_Count_1_ms:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
_DeltaTitanTemp:
       ds      12
titan@TitanTemp:
       ds      12
_TitanTemp:
       ds      12
_ADC_500uA:
       ds      16
_ADC_10uA:
       ds      16
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	GLOBAL	__Lsmallconst
	movlw	low highword(__Lsmallconst)
	movwf	tblptru
	movlw	high(__Lsmallconst)
	movwf	tblptrh
movlb 0
goto _main	;jump to C main() function
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_VariablesInit:	; 1 bytes @ 0x0
??_HardwareInit:	; 1 bytes @ 0x0
??_OSCILLATOR_Initialize:	; 1 bytes @ 0x0
??_INTERRUPT_Initialize:	; 1 bytes @ 0x0
??_Timers_Initialize:	; 1 bytes @ 0x0
	global	HardwareInit@i
HardwareInit@i:	; 1 bytes @ 0x0
	ds   1
??_main:	; 1 bytes @ 0x1
	ds   1
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_VariablesInit:	; 1 bytes @ 0x0
?_HardwareInit:	; 1 bytes @ 0x0
?_TMR3_ISR:	; 1 bytes @ 0x0
??_TMR3_ISR:	; 1 bytes @ 0x0
?_TitanApp:	; 1 bytes @ 0x0
?_OSCILLATOR_Initialize:	; 1 bytes @ 0x0
?_INTERRUPT_Initialize:	; 1 bytes @ 0x0
?_LowPassFilterADC:	; 1 bytes @ 0x0
?_WriteRelayRegister:	; 1 bytes @ 0x0
??_WriteRelayRegister:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Timers_Initialize:	; 1 bytes @ 0x0
?_CCP4_ISR:	; 1 bytes @ 0x0
??_CCP4_ISR:	; 1 bytes @ 0x0
?_CCP5_ISR:	; 1 bytes @ 0x0
?_INTERRUPT_InterruptManager:	; 1 bytes @ 0x0
?_StartADC:	; 1 bytes @ 0x0
??_StartADC:	; 1 bytes @ 0x0
?_GetAllSensor:	; 1 bytes @ 0x0
?_BoilerLogic:	; 1 bytes @ 0x0
??_BoilerLogic:	; 1 bytes @ 0x0
	global	_BoilerLogic$1187
_BoilerLogic$1187:	; 1 bytes @ 0x0
	global	WriteRelayRegister@ByteToShift
WriteRelayRegister@ByteToShift:	; 1 bytes @ 0x0
	global	LowPassFilterADC@pFiltrValue
LowPassFilterADC@pFiltrValue:	; 2 bytes @ 0x0
	ds   1
	global	WriteRelayRegister@BitCounter
WriteRelayRegister@BitCounter:	; 1 bytes @ 0x1
	ds   1
	global	LowPassFilterADC@Ch
LowPassFilterADC@Ch:	; 1 bytes @ 0x2
	ds   1
??_LowPassFilterADC:	; 1 bytes @ 0x3
	ds   3
	global	LowPassFilterADC@Val
LowPassFilterADC@Val:	; 2 bytes @ 0x6
	ds   2
	global	LowPassFilterADC@p
LowPassFilterADC@p:	; 2 bytes @ 0x8
	ds   2
??_GetAllSensor:	; 1 bytes @ 0xA
	ds   2
	global	GetAllSensor@ChMask
GetAllSensor@ChMask:	; 1 bytes @ 0xC
	ds   1
	global	GetAllSensor@NumChannel
GetAllSensor@NumChannel:	; 1 bytes @ 0xD
	ds   1
??_TitanApp:	; 1 bytes @ 0xE
	ds   1
??_CCP5_ISR:	; 1 bytes @ 0xF
	ds   1
??_INTERRUPT_InterruptManager:	; 1 bytes @ 0x10
	ds   18
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    8
;!    Data        0
;!    BSS         116
;!    Persistent  1
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     34      83
;!    BANK0           160      2      70
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0
;!    BANK8           256      0       0
;!    BANK9           256      0       0
;!    BANK10          256      0       0
;!    BANK11          256      0       0
;!    BANK12          256      0       0
;!    BANK13          256      0       0
;!    BANK14          128      0       0
;!    BANK15           96      0       0

;!
;!Pointer List with Targets:
;!
;!    LowPassFilterADC@pFiltrValue	PTR struct . size(2) Largest target is 16
;!		 -> ADC_500uA(BANK0[16]), ADC_10uA(BANK0[16]), 
;!
;!    LowPassFilterADC@p	PTR unsigned int  size(2) Largest target is 3935
;!		 -> RAM(DATA[3935]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in COMRAM
;!
;!    _INTERRUPT_InterruptManager->_CCP5_ISR
;!    _CCP5_ISR->_TitanApp
;!    _TitanApp->_GetAllSensor
;!    _GetAllSensor->_LowPassFilterADC
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_HardwareInit
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK7
;!
;!    None.
;!
;!Critical Paths under _main in BANK8
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK8
;!
;!    None.
;!
;!Critical Paths under _main in BANK9
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK9
;!
;!    None.
;!
;!Critical Paths under _main in BANK10
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK10
;!
;!    None.
;!
;!Critical Paths under _main in BANK11
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK11
;!
;!    None.
;!
;!Critical Paths under _main in BANK12
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK12
;!
;!    None.
;!
;!Critical Paths under _main in BANK13
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK13
;!
;!    None.
;!
;!Critical Paths under _main in BANK14
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK14
;!
;!    None.
;!
;!Critical Paths under _main in BANK15
;!
;!    None.
;!
;!Critical Paths under _INTERRUPT_InterruptManager in BANK15
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 1     1      0      68
;!                                              1 BANK0      1     1      0
;!                       _HardwareInit
;!                      _VariablesInit
;! ---------------------------------------------------------------------------------
;! (1) _VariablesInit                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _HardwareInit                                         1     1      0      68
;!                                              0 BANK0      1     1      0
;!               _INTERRUPT_Initialize
;!              _OSCILLATOR_Initialize
;!                  _Timers_Initialize
;! ---------------------------------------------------------------------------------
;! (2) _Timers_Initialize                                    0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _OSCILLATOR_Initialize                                0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _INTERRUPT_Initialize                                 0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (3) _INTERRUPT_InterruptManager                          18    18      0    1048
;!                                             16 COMRAM    18    18      0
;!                           _CCP4_ISR
;!                           _CCP5_ISR
;!                           _TMR3_ISR
;! ---------------------------------------------------------------------------------
;! (4) _CCP5_ISR                                             1     1      0    1048
;!                                             15 COMRAM     1     1      0
;!                           _TitanApp
;! ---------------------------------------------------------------------------------
;! (5) _TitanApp                                             1     1      0    1048
;!                                             14 COMRAM     1     1      0
;!                        _BoilerLogic
;!                       _GetAllSensor
;!                           _StartADC
;! ---------------------------------------------------------------------------------
;! (6) _StartADC                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (6) _GetAllSensor                                         4     4      0    1024
;!                                             10 COMRAM     4     4      0
;!                   _LowPassFilterADC
;!                 _WriteRelayRegister
;! ---------------------------------------------------------------------------------
;! (7) _WriteRelayRegister                                   2     2      0     184
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (7) _LowPassFilterADC                                    10     7      3     485
;!                                              0 COMRAM    10     7      3
;! ---------------------------------------------------------------------------------
;! (6) _BoilerLogic                                          1     1      0      24
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (4) _CCP4_ISR                                             0     0      0       0
;!                           _TMR3_ISR
;! ---------------------------------------------------------------------------------
;! (4) _TMR3_ISR                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 7
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _HardwareInit
;!     _INTERRUPT_Initialize
;!     _OSCILLATOR_Initialize
;!     _Timers_Initialize
;!   _VariablesInit
;!
;! _INTERRUPT_InterruptManager (ROOT)
;!   _CCP4_ISR
;!     _TMR3_ISR
;!   _CCP5_ISR
;!     _TitanApp
;!       _BoilerLogic
;!       _GetAllSensor
;!         _LowPassFilterADC
;!         _WriteRelayRegister
;!       _StartADC
;!   _TMR3_ISR
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMRAM           5E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMRAM              5E     22      53       1       88.3%
;!STACK                0      0       0       2        0.0%
;!DATA                 0      0      99       3        0.0%
;!BITBANK0            A0      0       0       4        0.0%
;!BANK0               A0      2      46       5       43.8%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!BITBANK8           100      0       0      20        0.0%
;!BANK8              100      0       0      21        0.0%
;!BITBANK9           100      0       0      22        0.0%
;!BANK9              100      0       0      23        0.0%
;!BITBANK10          100      0       0      24        0.0%
;!BANK10             100      0       0      25        0.0%
;!BITBANK11          100      0       0      26        0.0%
;!BANK11             100      0       0      27        0.0%
;!BANK12             100      0       0      28        0.0%
;!ABS                  0      0      99      29        0.0%
;!BITBANK12          100      0       0      30        0.0%
;!BITBANK13          100      0       0      31        0.0%
;!BANK13             100      0       0      32        0.0%
;!BITBANK14           80      0       0      33        0.0%
;!BANK14              80      0       0      34        0.0%
;!BITBANK15           60      0       0      35        0.0%
;!BANK15              60      0       0      36        0.0%
;!BIGRAM_1            60      0       0      37        0.0%
;!BIGRAM             E7F      0       0      38        0.0%
;!BITSFR_1             0      0       0     200        0.0%
;!SFR_1                0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 12 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_HardwareInit
;;		_VariablesInit
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	12
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 24
	line	14
	
l1497:
;main.c: 14: ResetSource = RCON;
	movff	(c:4048),(c:_ResetSource)	;volatile
	line	15
	
l1499:
;main.c: 15: if ((ResetSource & 0x03) == 0x00) {
	movff	(c:_ResetSource),??_main+0+0
	movlw	03h
	movlb	0	; () banked
	andwf	(??_main+0+0)&0ffh
	btfss	status,2
	goto	u1021
	goto	u1020
u1021:
	goto	l1507
u1020:
	line	16
	
l1501:; BSR set to: 0

;main.c: 16: VariablesInit();
	call	_VariablesInit	;wreg free
	line	17
	
l1503:
;main.c: 17: RCONbits.POR = 1;
	bsf	((c:4048)),c,1	;volatile
	line	18
	
l1505:
;main.c: 18: RCONbits.BOR = 1;
	bsf	((c:4048)),c,0	;volatile
	goto	l1507
	line	19
	
l35:
	line	20
	
l1507:
;main.c: 19: }
;main.c: 20: HardwareInit();
	call	_HardwareInit	;wreg free
	line	21
;main.c: 21: while (1) {
	
l36:
	line	22
# 22 "main.c"
clrwdt ;# 
psect	text0
	goto	l36
	line	23
	
l37:
	line	21
	goto	l36
	
l38:
	line	25
;main.c: 23: }
;main.c: 24: return;
	
l39:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_VariablesInit

;; *************** function _VariablesInit *****************
;; Defined at:
;;		line 63 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	file	"titan.c"
	line	63
global __ptext1
__ptext1:
psect	text1
	file	"titan.c"
	line	63
	global	__size_of_VariablesInit
	__size_of_VariablesInit	equ	__end_of_VariablesInit-_VariablesInit
	
_VariablesInit:
;incstack = 0
	opt	stack 25
	line	64
	
l1465:
;titan.c: 64: LATA = 0x00;
	movlw	low(0)
	movwf	((c:3977)),c	;volatile
	line	65
;titan.c: 65: LATB = 0x00;
	movlw	low(0)
	movwf	((c:3978)),c	;volatile
	line	66
;titan.c: 66: LATC = (1<<6);
	movlw	low(040h)
	movwf	((c:3979)),c	;volatile
	line	67
;titan.c: 67: LATD = (1<<0);
	movlw	low(01h)
	movwf	((c:3980)),c	;volatile
	line	68
;titan.c: 68: LATE = ((1<<0)|(1<<4));
	movlw	low(011h)
	movwf	((c:3981)),c	;volatile
	line	69
;titan.c: 69: LATF = 0x00;
	movlw	low(0)
	movwf	((c:3982)),c	;volatile
	line	70
;titan.c: 70: LATG = 0x00;
	movlw	low(0)
	movwf	((c:3983)),c	;volatile
	line	72
;titan.c: 72: AfterPOResetTimer = 100;
	movlw	low(064h)
	movwf	((c:_AfterPOResetTimer)),c
	line	76
;titan.c: 76: TitanHwFlags.value = 0;
	movlw	low(0)
	movwf	((c:titan@TitanHwFlags)),c
	line	78
;titan.c: 78: ADC_Channel = 0x20;
	movlw	low(020h)
	movwf	((c:_ADC_Channel)),c
	line	79
;titan.c: 79: RelayRegister.value = (0x0208 + (0x20 & 0x07));
	movlw	high(0208h)
	movwf	((c:titan@RelayRegister+1)),c
	movlw	low(0208h)
	movwf	((c:titan@RelayRegister)),c
	line	81
;titan.c: 81: TitanSwitch.value = 0x00;
	movlw	low(0)
	movwf	((c:titan@TitanSwitch)),c
	line	82
	
l1467:
;titan.c: 82: TitanSwitchPrev = TitanSwitch;
	movff	(c:titan@TitanSwitch),(c:_TitanSwitchPrev)
	line	83
	
l257:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_VariablesInit
	__end_of_VariablesInit:
	signat	_VariablesInit,89
	global	_HardwareInit

;; *************** function _HardwareInit *****************
;; Defined at:
;;		line 33 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_INTERRUPT_Initialize
;;		_OSCILLATOR_Initialize
;;		_Timers_Initialize
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	33
global __ptext2
__ptext2:
psect	text2
	file	"titan.c"
	line	33
	global	__size_of_HardwareInit
	__size_of_HardwareInit	equ	__end_of_HardwareInit-_HardwareInit
	
_HardwareInit:
;incstack = 0
	opt	stack 24
	line	34
	
l1469:
;titan.c: 34: ADCON0bits.ADCAL = 1;
	bsf	((c:4034)),c,7	;volatile
	line	35
	
l1471:
;titan.c: 35: ADCON1 = 0x13;
	movlw	low(013h)
	movwf	((c:4033)),c	;volatile
	line	36
;titan.c: 36: ADCON2 = 0xBE;
	movlw	low(0BEh)
	movwf	((c:4032)),c	;volatile
	line	38
	
l1473:
;titan.c: 38: ADCON0bits.ADON = 1;
	bsf	((c:4034)),c,0	;volatile
	line	42
;titan.c: 42: TRISA = ((1<<2)|(1<<5)|(1<<3));
	movlw	low(02Ch)
	movwf	((c:3986)),c	;volatile
	line	43
;titan.c: 43: TRISB = (0xFF - (1<<5)- (1<<4));
	movlw	low(0CFh)
	movwf	((c:3987)),c	;volatile
	line	44
;titan.c: 44: TRISC = ((1<<4)|(1<<7));
	movlw	low(090h)
	movwf	((c:3988)),c	;volatile
	line	45
;titan.c: 45: TRISD = ((1<<1)|(1<<2));
	movlw	low(06h)
	movwf	((c:3989)),c	;volatile
	line	46
;titan.c: 46: TRISE = (1<<3);
	movlw	low(08h)
	movwf	((c:3990)),c	;volatile
	line	47
;titan.c: 47: TRISF = (0xFF - (1<<7));
	movlw	low(07Fh)
	movwf	((c:3991)),c	;volatile
	line	48
;titan.c: 48: TRISG = 0x00;
	movlw	low(0)
	movwf	((c:3992)),c	;volatile
	line	49
	
l1475:
;titan.c: 49: ADCON0bits.ADCAL = 1;
	bsf	((c:4034)),c,7	;volatile
	line	50
;titan.c: 50: ADCON1 = 0x13;
	movlw	low(013h)
	movwf	((c:4033)),c	;volatile
	line	51
;titan.c: 51: ADCON2 = 0xBE;
	movlw	low(0BEh)
	movwf	((c:4032)),c	;volatile
	line	53
	
l1477:
;titan.c: 53: ADCON0bits.ADON = 1;
	bsf	((c:4034)),c,0	;volatile
	line	57
	
l1479:
;titan.c: 57: OSCILLATOR_Initialize();
	call	_OSCILLATOR_Initialize	;wreg free
	line	58
	
l1481:
;titan.c: 58: Timers_Initialize();
	call	_Timers_Initialize	;wreg free
	line	59
	
l1483:
;titan.c: 59: INTERRUPT_Initialize();
	call	_INTERRUPT_Initialize	;wreg free
	line	60
	
l1485:
;titan.c: 60: for (uint8_t i=0; i<8; i++) DebounceCounter[i] = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	((HardwareInit@i))&0ffh
	
l1487:; BSR set to: 0

		movlw	08h-1
	cpfsgt	((HardwareInit@i))&0ffh
	goto	u1001
	goto	u1000

u1001:
	goto	l1491
u1000:
	goto	l254
	
l1489:; BSR set to: 0

	goto	l254
	
l252:; BSR set to: 0

	
l1491:; BSR set to: 0

	movf	((HardwareInit@i))&0ffh,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	
l1493:; BSR set to: 0

	incf	((HardwareInit@i))&0ffh
	
l1495:; BSR set to: 0

		movlw	08h-1
	cpfsgt	((HardwareInit@i))&0ffh
	goto	u1011
	goto	u1010

u1011:
	goto	l1491
u1010:
	goto	l254
	
l253:; BSR set to: 0

	line	61
	
l254:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_HardwareInit
	__end_of_HardwareInit:
	signat	_HardwareInit,89
	global	_Timers_Initialize

;; *************** function _Timers_Initialize *****************
;; Defined at:
;;		line 9 in file "timers.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HardwareInit
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"timers.c"
	line	9
global __ptext3
__ptext3:
psect	text3
	file	"timers.c"
	line	9
	global	__size_of_Timers_Initialize
	__size_of_Timers_Initialize	equ	__end_of_Timers_Initialize-_Timers_Initialize
	
_Timers_Initialize:; BSR set to: 0

;incstack = 0
	opt	stack 24
	line	12
	
l1439:
;timers.c: 12: T3CON = 0x41;
	movlw	low(041h)
	movwf	((c:4017)),c	;volatile
	line	15
	
l1441:
;timers.c: 15: PIE2bits.TMR3IE = 1;
	bsf	((c:4000)),c,1	;volatile
	line	18
;timers.c: 18: CCP4CON = 0x04;
	movlw	low(04h)
	movwf	((c:3955)),c	;volatile
	line	19
	
l1443:
;timers.c: 19: PIR3bits.CCP4IF = 0;
	bcf	((c:4004)),c,1	;volatile
	line	20
	
l1445:
;timers.c: 20: PIE3bits.CCP4IE = 1;
	bsf	((c:4003)),c,1	;volatile
	line	21
	
l1447:
;timers.c: 21: ReceiverStatus = 255;
	setf	((c:_ReceiverStatus)),c	;volatile
	line	22
;timers.c: 22: TimersCCP.value = 0;
	movlw	low(0)
	movwf	((c:_TimersCCP)),c	;volatile
	line	25
;timers.c: 25: CCP5CON = 0x0A;
	movlw	low(0Ah)
	movwf	((c:3952)),c	;volatile
	line	27
	
l1449:
;timers.c: 27: PIE3bits.CCP5IE = 0;
	bcf	((c:4003)),c,2	;volatile
	line	28
	
l1451:
;timers.c: 28: PIR3bits.CCP5IF = 0;
	bcf	((c:4004)),c,2	;volatile
	line	29
	
l1453:
;timers.c: 29: T3compare.byte.lo = TMR3L;
	movff	(c:4018),(c:_T3compare)	;volatile
	line	30
	
l1455:
;timers.c: 30: T3compare.byte.hi = TMR3H;
	movff	(c:4019),0+((c:_T3compare)+01h)	;volatile
	line	31
	
l1457:
;timers.c: 31: CCPR5 = T3compare.word + ((uint16_t) (41666666.6667/4000));
	movlw	low(028B0h)
	addwf	((c:_T3compare)),c,w
	movwf	((c:3953)),c	;volatile
	movlw	high(028B0h)
	addwfc	((c:_T3compare+1)),c,w
	movwf	1+((c:3953)),c	;volatile
	line	32
	
l1459:
;timers.c: 32: PIE3bits.CCP5IE = 1;
	bsf	((c:4003)),c,2	;volatile
	line	34
	
l96:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Timers_Initialize
	__end_of_Timers_Initialize:
	signat	_Timers_Initialize,89
	global	_OSCILLATOR_Initialize

;; *************** function _OSCILLATOR_Initialize *****************
;; Defined at:
;;		line 92 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HardwareInit
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	file	"titan.c"
	line	92
global __ptext4
__ptext4:
psect	text4
	file	"titan.c"
	line	92
	global	__size_of_OSCILLATOR_Initialize
	__size_of_OSCILLATOR_Initialize	equ	__end_of_OSCILLATOR_Initialize-_OSCILLATOR_Initialize
	
_OSCILLATOR_Initialize:
;incstack = 0
	opt	stack 24
	line	94
	
l1461:
;titan.c: 94: OSCCON = 0x02;
	movlw	low(02h)
	movwf	((c:4051)),c	;volatile
	line	96
;titan.c: 96: OSCTUNE = 0x40;
	movlw	low(040h)
	movwf	((c:3995)),c	;volatile
	line	97
	
l263:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_OSCILLATOR_Initialize
	__end_of_OSCILLATOR_Initialize:
	signat	_OSCILLATOR_Initialize,89
	global	_INTERRUPT_Initialize

;; *************** function _INTERRUPT_Initialize *****************
;; Defined at:
;;		line 85 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HardwareInit
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	85
global __ptext5
__ptext5:
psect	text5
	file	"titan.c"
	line	85
	global	__size_of_INTERRUPT_Initialize
	__size_of_INTERRUPT_Initialize	equ	__end_of_INTERRUPT_Initialize-_INTERRUPT_Initialize
	
_INTERRUPT_Initialize:
;incstack = 0
	opt	stack 24
	line	87
	
l1463:
;titan.c: 87: RCONbits.IPEN = 0;
	bcf	((c:4048)),c,7	;volatile
	line	88
;titan.c: 88: (INTCONbits.GIE = 1);
	bsf	((c:4082)),c,7	;volatile
	line	89
;titan.c: 89: (INTCONbits.PEIE = 1);
	bsf	((c:4082)),c,6	;volatile
	line	90
	
l260:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_INTERRUPT_Initialize
	__end_of_INTERRUPT_Initialize:
	signat	_INTERRUPT_Initialize,89
	global	_INTERRUPT_InterruptManager

;; *************** function _INTERRUPT_InterruptManager *****************
;; Defined at:
;;		line 99 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:         18       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        18       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_CCP4_ISR
;;		_CCP5_ISR
;;		_TMR3_ISR
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
global __pintcode
__pintcode:
psect	intcode
	file	"titan.c"
	line	99
	global	__size_of_INTERRUPT_InterruptManager
	__size_of_INTERRUPT_InterruptManager	equ	__end_of_INTERRUPT_InterruptManager-_INTERRUPT_InterruptManager
	
_INTERRUPT_InterruptManager:
;incstack = 0
	opt	stack 24
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	movff	pclath+0,??_INTERRUPT_InterruptManager+0
	movff	pclath+1,??_INTERRUPT_InterruptManager+1
	movff	fsr0l+0,??_INTERRUPT_InterruptManager+2
	movff	fsr0h+0,??_INTERRUPT_InterruptManager+3
	movff	fsr1l+0,??_INTERRUPT_InterruptManager+4
	movff	fsr1h+0,??_INTERRUPT_InterruptManager+5
	movff	fsr2l+0,??_INTERRUPT_InterruptManager+6
	movff	fsr2h+0,??_INTERRUPT_InterruptManager+7
	movff	prodl+0,??_INTERRUPT_InterruptManager+8
	movff	prodh+0,??_INTERRUPT_InterruptManager+9
	movff	tblptrl+0,??_INTERRUPT_InterruptManager+10
	movff	tblptrh+0,??_INTERRUPT_InterruptManager+11
	movff	tblptru+0,??_INTERRUPT_InterruptManager+12
	movff	tablat+0,??_INTERRUPT_InterruptManager+13
	movff	btemp+0,??_INTERRUPT_InterruptManager+14
	movff	btemp+1+0,??_INTERRUPT_InterruptManager+15
	movff	btemp+2+0,??_INTERRUPT_InterruptManager+16
	movff	btemp+3+0,??_INTERRUPT_InterruptManager+17
	line	101
	
i2l1429:
;titan.c: 101: if(INTCONbits.PEIE == 1) {
	btfss	((c:4082)),c,6	;volatile
	goto	i2u96_41
	goto	i2u96_40
i2u96_41:
	goto	i2l275
i2u96_40:
	line	102
	
i2l1431:
;titan.c: 102: if (PIR3bits.CCP4IF) {
	btfss	((c:4004)),c,1	;volatile
	goto	i2u97_41
	goto	i2u97_40
i2u97_41:
	goto	i2l269
i2u97_40:
	line	103
	
i2l1433:
;titan.c: 103: CCP4_ISR();
	call	_CCP4_ISR	;wreg free
	line	104
;titan.c: 104: }
	goto	i2l275
	line	105
	
i2l269:
;titan.c: 105: else if (PIR3bits.CCP5IF) {
	btfss	((c:4004)),c,2	;volatile
	goto	i2u98_41
	goto	i2u98_40
i2u98_41:
	goto	i2l271
i2u98_40:
	line	106
	
i2l1435:
;titan.c: 106: CCP5_ISR();
	call	_CCP5_ISR	;wreg free
	line	107
;titan.c: 107: }
	goto	i2l275
	line	108
	
i2l271:
;titan.c: 108: else if (PIR2bits.TMR3IF) {
	btfss	((c:4001)),c,1	;volatile
	goto	i2u99_41
	goto	i2u99_40
i2u99_41:
	goto	i2l275
i2u99_40:
	line	109
	
i2l1437:
;titan.c: 109: TMR3_ISR();
	call	_TMR3_ISR	;wreg free
	line	110
;titan.c: 110: }
	goto	i2l275
	line	111
	
i2l273:
	goto	i2l275
	line	113
;titan.c: 111: else {
	
i2l274:
	goto	i2l275
	
i2l272:
	goto	i2l275
	
i2l270:
	goto	i2l275
	line	114
	
i2l268:
	line	115
	
i2l275:
	movff	??_INTERRUPT_InterruptManager+17,btemp+3+0
	movff	??_INTERRUPT_InterruptManager+16,btemp+2+0
	movff	??_INTERRUPT_InterruptManager+15,btemp+1+0
	movff	??_INTERRUPT_InterruptManager+14,btemp+0
	movff	??_INTERRUPT_InterruptManager+13,tablat+0
	movff	??_INTERRUPT_InterruptManager+12,tblptru+0
	movff	??_INTERRUPT_InterruptManager+11,tblptrh+0
	movff	??_INTERRUPT_InterruptManager+10,tblptrl+0
	movff	??_INTERRUPT_InterruptManager+9,prodh+0
	movff	??_INTERRUPT_InterruptManager+8,prodl+0
	movff	??_INTERRUPT_InterruptManager+7,fsr2h+0
	movff	??_INTERRUPT_InterruptManager+6,fsr2l+0
	movff	??_INTERRUPT_InterruptManager+5,fsr1h+0
	movff	??_INTERRUPT_InterruptManager+4,fsr1l+0
	movff	??_INTERRUPT_InterruptManager+3,fsr0h+0
	movff	??_INTERRUPT_InterruptManager+2,fsr0l+0
	movff	??_INTERRUPT_InterruptManager+1,pclath+1
	movff	??_INTERRUPT_InterruptManager+0,pclath+0
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	opt stack 0
GLOBAL	__end_of_INTERRUPT_InterruptManager
	__end_of_INTERRUPT_InterruptManager:
	signat	_INTERRUPT_InterruptManager,89
	global	_CCP5_ISR

;; *************** function _CCP5_ISR *****************
;; Defined at:
;;		line 125 in file "timers.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_TitanApp
;; This function is called by:
;;		_INTERRUPT_InterruptManager
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	file	"timers.c"
	line	125
global __ptext7
__ptext7:
psect	text7
	file	"timers.c"
	line	125
	global	__size_of_CCP5_ISR
	__size_of_CCP5_ISR	equ	__end_of_CCP5_ISR-_CCP5_ISR
	
_CCP5_ISR:
;incstack = 0
	opt	stack 24
	line	127
	
i2l1415:
;timers.c: 127: PIR3bits.CCP5IF = 0;
	bcf	((c:4004)),c,2	;volatile
	line	129
;timers.c: 129: T3compare.byte.lo = TMR3L;
	movff	(c:4018),(c:_T3compare)	;volatile
	line	130
;timers.c: 130: T3compare.byte.hi = TMR3H;
	movff	(c:4019),0+((c:_T3compare)+01h)	;volatile
	line	131
	
i2l1417:
;timers.c: 131: if (((uint8_t)(T3compare.byte.hi - CCPR5H)) < ((uint8_t)((((uint16_t) (41666666.6667/4000)) >> 8) - 2))){
	movf	((c:3954)),c,w	;volatile
	sublw	0
	addwf	(0+((c:_T3compare)+01h)),c,w
	movwf	(??_CCP5_ISR+0+0)&0ffh,c
		movlw	026h-0
	cpfslt	((??_CCP5_ISR+0+0)),c
	goto	i2u94_41
	goto	i2u94_40

i2u94_41:
	goto	i2l1421
i2u94_40:
	line	132
	
i2l1419:
;timers.c: 132: CCPR5 += ((uint16_t) (41666666.6667/4000));
	movlw	low(028B0h)
	addwf	((c:3953)),c	;volatile
	movlw	high(028B0h)
	addwfc	((c:3953+1)),c	;volatile
	line	133
;timers.c: 133: }
	goto	i2l128
	line	134
	
i2l127:
	line	135
	
i2l1421:
;timers.c: 134: else{
;timers.c: 135: CCPR5 = T3compare.word + ((uint16_t) (41666666.6667/4000));
	movlw	low(028B0h)
	addwf	((c:_T3compare)),c,w
	movwf	((c:3953)),c	;volatile
	movlw	high(028B0h)
	addwfc	((c:_T3compare+1)),c,w
	movwf	1+((c:3953)),c	;volatile
	line	136
	
i2l128:
	line	137
;timers.c: 136: }
;timers.c: 137: if (++Precizion1msCounter > 2) {
	incf	((c:_Precizion1msCounter)),c
		movlw	03h-1
	cpfsgt	((c:_Precizion1msCounter)),c
	goto	i2u95_41
	goto	i2u95_40

i2u95_41:
	goto	i2l1425
i2u95_40:
	line	138
	
i2l1423:
;timers.c: 138: Precizion1msCounter = 0;
	movlw	low(0)
	movwf	((c:_Precizion1msCounter)),c
	line	139
;timers.c: 139: }
	goto	i2l130
	line	140
	
i2l129:
	line	141
	
i2l1425:
;timers.c: 140: else {
;timers.c: 141: CCPR5 += 1;
	infsnz	((c:3953)),c	;volatile
	incf	((c:3953+1)),c	;volatile
	line	142
	
i2l130:
	line	144
;timers.c: 142: }
;timers.c: 144: Count_1_ms++;
	incf	((c:_Count_1_ms)),c	;volatile
	line	145
	
i2l1427:
;timers.c: 145: TitanApp();
	call	_TitanApp	;wreg free
	line	146
	
i2l131:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_CCP5_ISR
	__end_of_CCP5_ISR:
	signat	_CCP5_ISR,89
	global	_TitanApp

;; *************** function _TitanApp *****************
;; Defined at:
;;		line 264 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_BoilerLogic
;;		_GetAllSensor
;;		_StartADC
;; This function is called by:
;;		_CCP5_ISR
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	file	"titan.c"
	line	264
global __ptext8
__ptext8:
psect	text8
	file	"titan.c"
	line	264
	global	__size_of_TitanApp
	__size_of_TitanApp	equ	__end_of_TitanApp-_TitanApp
	
_TitanApp:
;incstack = 0
	opt	stack 24
	line	266
	
i2l1397:
;titan.c: 266: if ((Count_1_ms & 0x03) == 0){
	movff	(c:_Count_1_ms),??_TitanApp+0+0	;volatile
	movlw	03h
	andwf	(??_TitanApp+0+0),c
	btfss	status,2
	goto	i2u91_41
	goto	i2u91_40
i2u91_41:
	goto	i2l1401
i2u91_40:
	line	267
	
i2l1399:
;titan.c: 267: StartADC();
	call	_StartADC	;wreg free
	line	268
;titan.c: 268: }
	goto	i2l339
	line	269
	
i2l333:
	
i2l1401:
;titan.c: 269: else if ((Count_1_ms & 0x03) == 1){
	movf	((c:_Count_1_ms)),c,w	;volatile
	andlw	low(03h)
	decf	wreg
	btfss	status,2
	goto	i2u92_41
	goto	i2u92_40
i2u92_41:
	goto	i2l1407
i2u92_40:
	line	270
	
i2l1403:
;titan.c: 270: GetAllSensor();
	call	_GetAllSensor	;wreg free
	line	271
	
i2l1405:
;titan.c: 271: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	272
;titan.c: 272: }
	goto	i2l339
	line	273
	
i2l335:
	
i2l1407:
;titan.c: 273: else if ((Count_1_ms & 0x03) == 2){
	movf	((c:_Count_1_ms)),c,w	;volatile
	andlw	low(03h)
	xorlw	02h
	btfss	status,2
	goto	i2u93_41
	goto	i2u93_40
i2u93_41:
	goto	i2l1411
i2u93_40:
	goto	i2l339
	line	275
	
i2l1409:
;titan.c: 275: }
	goto	i2l339
	line	276
	
i2l337:
	line	277
	
i2l1411:
;titan.c: 276: else {
;titan.c: 277: BoilerLogic();
	call	_BoilerLogic	;wreg free
	line	278
	
i2l1413:
;titan.c: 278: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	i2l339
	line	279
	
i2l338:
	goto	i2l339
	
i2l336:
	goto	i2l339
	
i2l334:
	line	280
	
i2l339:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_TitanApp
	__end_of_TitanApp:
	signat	_TitanApp,89
	global	_StartADC

;; *************** function _StartADC *****************
;; Defined at:
;;		line 117 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TitanApp
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	117
global __ptext9
__ptext9:
psect	text9
	file	"titan.c"
	line	117
	global	__size_of_StartADC
	__size_of_StartADC	equ	__end_of_StartADC-_StartADC
	
_StartADC:
;incstack = 0
	opt	stack 25
	line	118
	
i2l1015:
;titan.c: 118: while (ADCON0bits.GO_nDONE) { }
	goto	i2l278
	
i2l279:
	
i2l278:
	btfsc	((c:4034)),c,1	;volatile
	goto	i2u12_41
	goto	i2u12_40
i2u12_41:
	goto	i2l278
i2u12_40:
	
i2l280:
	line	119
;titan.c: 119: ADCON0bits.GO = 1;
	bsf	((c:4034)),c,1	;volatile
	line	120
	
i2l281:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_StartADC
	__end_of_StartADC:
	signat	_StartADC,89
	global	_GetAllSensor

;; *************** function _GetAllSensor *****************
;; Defined at:
;;		line 123 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  NumChannel      1   13[COMRAM] struct .
;;  ChMask          1   12[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LowPassFilterADC
;;		_WriteRelayRegister
;; This function is called by:
;;		_TitanApp
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	123
global __ptext10
__ptext10:
psect	text10
	file	"titan.c"
	line	123
	global	__size_of_GetAllSensor
	__size_of_GetAllSensor	equ	__end_of_GetAllSensor-_GetAllSensor
	
_GetAllSensor:
;incstack = 0
	opt	stack 24
	line	128
	
i2l1325:
;titan.c: 124: uint8_t ChMask;
;titan.c: 125: uint8Bits_t NumChannel;
;titan.c: 128: while (ADCON0bits.GO_nDONE) { }
	goto	i2l284
	
i2l285:
	
i2l284:
	btfsc	((c:4034)),c,1	;volatile
	goto	i2u68_41
	goto	i2u68_40
i2u68_41:
	goto	i2l284
i2u68_40:
	goto	i2l1327
	
i2l286:
	line	129
	
i2l1327:
;titan.c: 129: if (AfterPOResetTimer != 0) AfterPOResetTimer--;
	movf	((c:_AfterPOResetTimer)),c,w
	btfsc	status,2
	goto	i2u69_41
	goto	i2u69_40
i2u69_41:
	goto	i2l1331
i2u69_40:
	
i2l1329:
	decf	((c:_AfterPOResetTimer)),c
	goto	i2l1331
	
i2l287:
	line	130
	
i2l1331:
;titan.c: 130: if (AfterPOResetTimer < 25) {
		movlw	019h-0
	cpfslt	((c:_AfterPOResetTimer)),c
	goto	i2u70_41
	goto	i2u70_40

i2u70_41:
	goto	i2l306
i2u70_40:
	line	132
	
i2l1333:
;titan.c: 132: NumChannel.value = ADC_Channel & 0x07;
	movf	((c:_ADC_Channel)),c,w
	andlw	low(07h)
	movwf	((c:GetAllSensor@NumChannel)),c
	line	135
;titan.c: 135: if (ADC_Channel <= 15) {
		movlw	010h-0
	cpfslt	((c:_ADC_Channel)),c
	goto	i2u71_41
	goto	i2u71_40

i2u71_41:
	goto	i2l1355
i2u71_40:
	line	136
	
i2l1335:
;titan.c: 136: ChMask = (uint8_t) (1 << NumChannel.value);
	movff	(c:GetAllSensor@NumChannel),??_GetAllSensor+0+0
	movlw	(01h)&0ffh
	movwf	(??_GetAllSensor+1+0)&0ffh,c
	incf	(??_GetAllSensor+0+0),c
	goto	i2u72_44
i2u72_45:
	bcf	status,0
	rlcf	((??_GetAllSensor+1+0)),c
i2u72_44:
	decfsz	(??_GetAllSensor+0+0),c
	goto	i2u72_45
	movf	((??_GetAllSensor+1+0)),c,w
	movwf	((c:GetAllSensor@ChMask)),c
	line	138
;titan.c: 138: if ((TitanSwitch.value & ChMask) != 0) {
	movf	((c:titan@TitanSwitch)),c,w
	andwf	((c:GetAllSensor@ChMask)),c,w
	iorlw	0
	btfsc	status,2
	goto	i2u73_41
	goto	i2u73_40
i2u73_41:
	goto	i2l290
i2u73_40:
	line	139
	
i2l1337:
;titan.c: 139: if (PORTEbits.RE3 != 0) {
	btfss	((c:3972)),c,3	;volatile
	goto	i2u74_41
	goto	i2u74_40
i2u74_41:
	goto	i2l1345
i2u74_40:
	line	140
	
i2l1339:
;titan.c: 140: if (++DebounceCounter[NumChannel.value] >= 3) {
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	incf	indf2

		movlw	03h-1
	cpfsgt	indf2
	goto	i2u75_41
	goto	i2u75_40

i2u75_41:
	goto	i2l1355
i2u75_40:
	line	141
	
i2l1341:
;titan.c: 141: TitanSwitch.value ^= ChMask;
	movf	((c:GetAllSensor@ChMask)),c,w
	xorwf	((c:titan@TitanSwitch)),c
	line	142
	
i2l1343:
;titan.c: 142: DebounceCounter[NumChannel.value] = 0;
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	goto	i2l1355
	line	143
	
i2l292:
	line	144
;titan.c: 143: }
;titan.c: 144: }
	goto	i2l1355
	line	145
	
i2l291:
	
i2l1345:
;titan.c: 145: else DebounceCounter[NumChannel.value] = 0;
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	goto	i2l1355
	
i2l293:
	line	146
;titan.c: 146: }
	goto	i2l1355
	line	147
	
i2l290:
;titan.c: 147: else if (PORTEbits.RE3 != 0) {
	btfss	((c:3972)),c,3	;volatile
	goto	i2u76_41
	goto	i2u76_40
i2u76_41:
	goto	i2l1349
i2u76_40:
	line	148
	
i2l1347:
;titan.c: 148: DebounceCounter[NumChannel.value] = 0;
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	149
;titan.c: 149: }
	goto	i2l1355
	line	150
	
i2l295:
	line	151
	
i2l1349:
;titan.c: 150: else {
;titan.c: 151: if (++DebounceCounter[NumChannel.value] >= 3) {
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	incf	indf2

		movlw	03h-1
	cpfsgt	indf2
	goto	i2u77_41
	goto	i2u77_40

i2u77_41:
	goto	i2l1355
i2u77_40:
	line	152
	
i2l1351:
;titan.c: 152: TitanSwitch.value ^= ChMask;
	movf	((c:GetAllSensor@ChMask)),c,w
	xorwf	((c:titan@TitanSwitch)),c
	line	153
	
i2l1353:
;titan.c: 153: DebounceCounter[NumChannel.value] = 0;
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low(_DebounceCounter)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_DebounceCounter)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	goto	i2l1355
	line	154
	
i2l297:
	goto	i2l1355
	line	155
	
i2l296:
	goto	i2l1355
	
i2l294:
	goto	i2l1355
	line	156
	
i2l289:
	line	158
	
i2l1355:
;titan.c: 154: }
;titan.c: 155: }
;titan.c: 156: }
;titan.c: 158: if (ADC_Channel <8) {
		movlw	08h-0
	cpfslt	((c:_ADC_Channel)),c
	goto	i2u78_41
	goto	i2u78_40

i2u78_41:
	goto	i2l1359
i2u78_40:
	line	159
	
i2l1357:
;titan.c: 159: LowPassFilterADC (&ADC_10uA, NumChannel.value);
		movlw	low(_ADC_10uA)
	movwf	((c:LowPassFilterADC@pFiltrValue)),c
	movlw	high(_ADC_10uA)
	movwf	((c:LowPassFilterADC@pFiltrValue+1)),c

	movff	(c:GetAllSensor@NumChannel),(c:LowPassFilterADC@Ch)
	call	_LowPassFilterADC	;wreg free
	line	160
;titan.c: 160: }
	goto	i2l1363
	line	161
	
i2l298:
	
i2l1359:
;titan.c: 161: else if (ADC_Channel < 16) {
		movlw	010h-0
	cpfslt	((c:_ADC_Channel)),c
	goto	i2u79_41
	goto	i2u79_40

i2u79_41:
	goto	i2l1363
i2u79_40:
	line	162
	
i2l1361:
;titan.c: 162: LowPassFilterADC (&ADC_500uA, NumChannel.value);
		movlw	low(_ADC_500uA)
	movwf	((c:LowPassFilterADC@pFiltrValue)),c
	movlw	high(_ADC_500uA)
	movwf	((c:LowPassFilterADC@pFiltrValue+1)),c

	movff	(c:GetAllSensor@NumChannel),(c:LowPassFilterADC@Ch)
	call	_LowPassFilterADC	;wreg free
	goto	i2l1363
	line	163
	
i2l300:
	goto	i2l1363
	line	165
	
i2l299:
	
i2l1363:
;titan.c: 163: }
;titan.c: 165: ADC_Channel++;
	incf	((c:_ADC_Channel)),c
	line	166
	
i2l1365:
;titan.c: 166: if (ADC_Channel > 16) ADC_Channel = 0;
		movlw	011h-1
	cpfsgt	((c:_ADC_Channel)),c
	goto	i2u80_41
	goto	i2u80_40

i2u80_41:
	goto	i2l1369
i2u80_40:
	
i2l1367:
	movlw	low(0)
	movwf	((c:_ADC_Channel)),c
	goto	i2l1369
	
i2l301:
	line	167
	
i2l1369:
;titan.c: 167: NumChannel.value = ADC_Channel & 0x07;
	movf	((c:_ADC_Channel)),c,w
	andlw	low(07h)
	movwf	((c:GetAllSensor@NumChannel)),c
	line	169
	
i2l1371:
;titan.c: 169: if (ADC_Channel < 8) {
		movlw	08h-0
	cpfslt	((c:_ADC_Channel)),c
	goto	i2u81_41
	goto	i2u81_40

i2u81_41:
	goto	i2l302
i2u81_40:
	line	170
	
i2l1373:
;titan.c: 170: RelayRegister.RelayRegBit.nSel500uA = 1;
	bsf	(0+((c:titan@RelayRegister)+01h)),c,7
	line	171
;titan.c: 171: }
	goto	i2l303
	line	172
	
i2l302:
	line	173
;titan.c: 172: else {
;titan.c: 173: RelayRegister.RelayRegBit.nSel500uA = 0;
	bcf	(0+((c:titan@RelayRegister)+01h)),c,7
	line	174
	
i2l303:
	line	176
;titan.c: 174: }
;titan.c: 176: RelayRegister.RelayRegBit.ChannelBit0 = NumChannel.Bits.Bit0;
	btfss	((c:GetAllSensor@NumChannel)),c,0
	bra	i2u82_45
	bsf	((c:titan@RelayRegister)),c,2
	bra	i2u82_47
	i2u82_45:	
	bcf	((c:titan@RelayRegister)),c,2
	i2u82_47:
	line	177
;titan.c: 177: RelayRegister.RelayRegBit.ChannelBit1 = NumChannel.Bits.Bit1;
	btfss	((c:GetAllSensor@NumChannel)),c,1
	bra	i2u83_45
	bsf	((c:titan@RelayRegister)),c,1
	bra	i2u83_47
	i2u83_45:	
	bcf	((c:titan@RelayRegister)),c,1
	i2u83_47:
	line	178
;titan.c: 178: RelayRegister.RelayRegBit.ChannelBit2 = NumChannel.Bits.Bit2;
	btfss	((c:GetAllSensor@NumChannel)),c,2
	bra	i2u84_45
	bsf	((c:titan@RelayRegister)),c,0
	bra	i2u84_47
	i2u84_45:	
	bcf	((c:titan@RelayRegister)),c,0
	i2u84_47:
	line	179
	
i2l1375:
;titan.c: 179: WriteRelayRegister();
	call	_WriteRelayRegister	;wreg free
	line	181
	
i2l1377:
;titan.c: 181: ADCON0 = (ADC_Input[NumChannel.value] << 2) + 1;
	movf	((c:GetAllSensor@NumChannel)),c,w
	mullw	01h
	movlw	low((_ADC_Input))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_ADC_Input))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd	*
	
	movff	tablat,??_GetAllSensor+0+0
	bcf	status,0
	rlcf	(??_GetAllSensor+0+0),c
	bcf	status,0
	rlcf	(??_GetAllSensor+0+0),c

	incf	(??_GetAllSensor+0+0),c,w
	movwf	((c:4034)),c	;volatile
	line	183
	
i2l1379:
;titan.c: 183: if ((ADC_Channel == 16)) {
		movlw	16
	xorwf	((c:_ADC_Channel)),c,w
	btfss	status,2
	goto	i2u85_41
	goto	i2u85_40

i2u85_41:
	goto	i2l304
i2u85_40:
	line	184
	
i2l1381:
;titan.c: 184: ADCON0bits.ADCAL = 1;
	bsf	((c:4034)),c,7	;volatile
	line	185
;titan.c: 185: }
	goto	i2l1383
	line	186
	
i2l304:
	line	187
;titan.c: 186: else {
;titan.c: 187: ADCON0bits.ADCAL = 0;
	bcf	((c:4034)),c,7	;volatile
	goto	i2l1383
	line	188
	
i2l305:
	line	189
	
i2l1383:
;titan.c: 188: }
;titan.c: 189: ADCON2 = 0x83;
	movlw	low(083h)
	movwf	((c:4032)),c	;volatile
	goto	i2l306
	line	191
	
i2l288:
	line	192
	
i2l306:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_GetAllSensor
	__end_of_GetAllSensor:
	signat	_GetAllSensor,89
	global	_WriteRelayRegister

;; *************** function _WriteRelayRegister *****************
;; Defined at:
;;		line 219 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  BitCounter      1    1[COMRAM] unsigned char 
;;  ByteToShift     1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetAllSensor
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,inline,group=0
	line	219
global __ptext11
__ptext11:
psect	text11
	file	"titan.c"
	line	219
	global	__size_of_WriteRelayRegister
	__size_of_WriteRelayRegister	equ	__end_of_WriteRelayRegister-_WriteRelayRegister
	
_WriteRelayRegister:
;incstack = 0
	opt	stack 24
	line	224
	
i2l1285:
;titan.c: 220: static uint8_t MakeIgnitionCounter;
;titan.c: 221: uint8_t ByteToShift;
;titan.c: 222: uint8_t BitCounter;
;titan.c: 224: ByteToShift = RelayRegister.RelayRegByte.Lo;
	movff	(c:titan@RelayRegister),(c:WriteRelayRegister@ByteToShift)
	line	225
	
i2l1287:
;titan.c: 225: for (BitCounter = 0; BitCounter < 8; BitCounter++){
	movlw	low(0)
	movwf	((c:WriteRelayRegister@BitCounter)),c
	
i2l1289:
		movlw	08h-1
	cpfsgt	((c:WriteRelayRegister@BitCounter)),c
	goto	i2u60_41
	goto	i2u60_40

i2u60_41:
	goto	i2l321
i2u60_40:
	goto	i2l1303
	
i2l1291:
	goto	i2l1303
	
i2l321:
	line	226
;titan.c: 226: LATEbits.LATE0 = 0;
	bcf	((c:3981)),c,0	;volatile
	line	227
;titan.c: 227: if (ByteToShift & 0x01){
	
	btfss	((c:WriteRelayRegister@ByteToShift)),c,(0)&7
	goto	i2u61_41
	goto	i2u61_40
i2u61_41:
	goto	i2l323
i2u61_40:
	line	228
	
i2l1293:
;titan.c: 228: LATEbits.LATE1 = 1;
	bsf	((c:3981)),c,1	;volatile
	line	229
;titan.c: 229: }
	goto	i2l1295
	line	230
	
i2l323:
	line	231
;titan.c: 230: else{
;titan.c: 231: LATEbits.LATE1 = 0;
	bcf	((c:3981)),c,1	;volatile
	goto	i2l1295
	line	232
	
i2l324:
	line	233
	
i2l1295:
;titan.c: 232: }
;titan.c: 233: ByteToShift = ByteToShift >> 1;
	bcf	status,0
	rrcf	((c:WriteRelayRegister@ByteToShift)),c,w
	movwf	((c:WriteRelayRegister@ByteToShift)),c
	line	234
	
i2l1297:
;titan.c: 234: LATEbits.LATE0 = 1;
	bsf	((c:3981)),c,0	;volatile
	line	225
	
i2l1299:
	incf	((c:WriteRelayRegister@BitCounter)),c
	
i2l1301:
		movlw	08h-1
	cpfsgt	((c:WriteRelayRegister@BitCounter)),c
	goto	i2u62_41
	goto	i2u62_40

i2u62_41:
	goto	i2l321
i2u62_40:
	goto	i2l1303
	
i2l322:
	line	238
	
i2l1303:
;titan.c: 235: }
;titan.c: 238: if (++MakeIgnitionCounter >= (32/4)) {
	incf	((c:WriteRelayRegister@MakeIgnitionCounter)),c
		movlw	08h-1
	cpfsgt	((c:WriteRelayRegister@MakeIgnitionCounter)),c
	goto	i2u63_41
	goto	i2u63_40

i2u63_41:
	goto	i2l1309
i2u63_40:
	line	239
	
i2l1305:
;titan.c: 239: MakeIgnitionCounter = 0;
	movlw	low(0)
	movwf	((c:WriteRelayRegister@MakeIgnitionCounter)),c
	line	240
	
i2l1307:
;titan.c: 240: PORTGbits.RG4 = TitanHwFlags.Flags.MakeIgnition;
	btfss	((c:titan@TitanHwFlags)),c,0
	bra	i2u64_45
	bsf	((c:3974)),c,4	;volatile
	bra	i2u64_47
	i2u64_45:	
	bcf	((c:3974)),c,4	;volatile
	i2u64_47:
	goto	i2l1309
	line	241
	
i2l325:
	line	244
	
i2l1309:
;titan.c: 241: }
;titan.c: 244: ByteToShift = RelayRegister.RelayRegByte.Hi;
	movff	0+((c:titan@RelayRegister)+01h),(c:WriteRelayRegister@ByteToShift)
	line	245
;titan.c: 245: for (BitCounter = 0; BitCounter < 8; BitCounter++){
	movlw	low(0)
	movwf	((c:WriteRelayRegister@BitCounter)),c
	
i2l1311:
		movlw	08h-1
	cpfsgt	((c:WriteRelayRegister@BitCounter)),c
	goto	i2u65_41
	goto	i2u65_40

i2u65_41:
	goto	i2l326
i2u65_40:
	goto	i2l327
	
i2l1313:
	goto	i2l327
	
i2l326:
	line	246
;titan.c: 246: LATEbits.LATE0 = 0;
	bcf	((c:3981)),c,0	;volatile
	line	247
;titan.c: 247: if (ByteToShift & 0x01){
	
	btfss	((c:WriteRelayRegister@ByteToShift)),c,(0)&7
	goto	i2u66_41
	goto	i2u66_40
i2u66_41:
	goto	i2l328
i2u66_40:
	line	248
	
i2l1315:
;titan.c: 248: LATEbits.LATE1 = 1;
	bsf	((c:3981)),c,1	;volatile
	line	249
;titan.c: 249: }
	goto	i2l1317
	line	250
	
i2l328:
	line	251
;titan.c: 250: else{
;titan.c: 251: LATEbits.LATE1 = 0;
	bcf	((c:3981)),c,1	;volatile
	goto	i2l1317
	line	252
	
i2l329:
	line	253
	
i2l1317:
;titan.c: 252: }
;titan.c: 253: ByteToShift = ByteToShift >> 1;
	bcf	status,0
	rrcf	((c:WriteRelayRegister@ByteToShift)),c,w
	movwf	((c:WriteRelayRegister@ByteToShift)),c
	line	254
	
i2l1319:
;titan.c: 254: LATEbits.LATE0 = 1;
	bsf	((c:3981)),c,0	;volatile
	line	245
	
i2l1321:
	incf	((c:WriteRelayRegister@BitCounter)),c
	
i2l1323:
		movlw	08h-1
	cpfsgt	((c:WriteRelayRegister@BitCounter)),c
	goto	i2u67_41
	goto	i2u67_40

i2u67_41:
	goto	i2l326
i2u67_40:
	
i2l327:
	line	257
;titan.c: 255: }
;titan.c: 257: LATFbits.LATF7 = 1;
	bsf	((c:3982)),c,7	;volatile
	line	259
;titan.c: 259: PORTGbits.RG4 = 0;
	bcf	((c:3974)),c,4	;volatile
	line	261
;titan.c: 261: LATFbits.LATF7 = 0;
	bcf	((c:3982)),c,7	;volatile
	line	262
	
i2l330:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_WriteRelayRegister
	__end_of_WriteRelayRegister:
	signat	_WriteRelayRegister,89
	global	_LowPassFilterADC

;; *************** function _LowPassFilterADC *****************
;; Defined at:
;;		line 194 in file "titan.c"
;; Parameters:    Size  Location     Type
;;  pFiltrValue     2    0[COMRAM] PTR struct .
;;		 -> ADC_500uA(16), ADC_10uA(16), 
;;  Ch              1    2[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  p               2    8[COMRAM] PTR unsigned int 
;;		 -> RAM(3935), 
;;  Val             2    6[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetAllSensor
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	194
global __ptext12
__ptext12:
psect	text12
	file	"titan.c"
	line	194
	global	__size_of_LowPassFilterADC
	__size_of_LowPassFilterADC	equ	__end_of_LowPassFilterADC-_LowPassFilterADC
	
_LowPassFilterADC:
;incstack = 0
	opt	stack 24
	line	198
	
i2l1271:
;titan.c: 195: uint16_t Val;
;titan.c: 196: uint16_t *p;
;titan.c: 198: p = ((uint16_t) pFiltrValue) + ((uint8_t)(Ch << 1));
	movf	((c:LowPassFilterADC@Ch)),c,w
	addwf	((c:LowPassFilterADC@Ch)),c,w
	movwf	(??_LowPassFilterADC+0+0)&0ffh,c
	clrf	(??_LowPassFilterADC+0+0+1)&0ffh,c

	movf	((c:LowPassFilterADC@pFiltrValue)),c,w
	addwf	(??_LowPassFilterADC+0+0),c,w
	movwf	((c:LowPassFilterADC@p)),c
	movf	((c:LowPassFilterADC@pFiltrValue+1)),c,w
	addwfc	(??_LowPassFilterADC+0+1),c,w
	movwf	1+((c:LowPassFilterADC@p)),c
	line	199
	
i2l1273:
;titan.c: 199: if (AfterPOResetTimer != 0) {
	movf	((c:_AfterPOResetTimer)),c,w
	btfsc	status,2
	goto	i2u57_41
	goto	i2u57_40
i2u57_41:
	goto	i2l1277
i2u57_40:
	line	200
	
i2l1275:
;titan.c: 200: *p = (uint16_t) ADRES;
	movff	(c:LowPassFilterADC@p),fsr2l
	movff	(c:LowPassFilterADC@p+1),fsr2h
	movff	(c:4035),postinc2	;volatile
	movff	(c:4035+1),postdec2	;volatile
	line	201
;titan.c: 201: }
	goto	i2l311
	line	202
	
i2l309:
	line	203
	
i2l1277:
;titan.c: 202: else {
;titan.c: 203: Val = *p;
	movff	(c:LowPassFilterADC@p),fsr2l
	movff	(c:LowPassFilterADC@p+1),fsr2h
	movff	postinc2,(c:LowPassFilterADC@Val)
	movff	postdec2,(c:LowPassFilterADC@Val+1)
	line	204
	
i2l1279:
;titan.c: 204: Val = Val << 6;
	movff	(c:LowPassFilterADC@Val),??_LowPassFilterADC+0+0
	movff	(c:LowPassFilterADC@Val+1),??_LowPassFilterADC+0+0+1
	movlw	06h
i2u58_45:
	bcf	status,0
	rlcf	(??_LowPassFilterADC+0+0),c
	rlcf	(??_LowPassFilterADC+0+1),c
	decfsz	wreg
	goto	i2u58_45
	movff	??_LowPassFilterADC+0+0,(c:LowPassFilterADC@Val)
	movff	??_LowPassFilterADC+0+1,(c:LowPassFilterADC@Val+1)
	line	205
;titan.c: 205: Val -= *p;
	movff	(c:LowPassFilterADC@p),fsr2l
	movff	(c:LowPassFilterADC@p+1),fsr2h
	movf	postinc2,w
	subwf	((c:LowPassFilterADC@Val)),c
	movf	postdec2,w
	subwfb	((c:LowPassFilterADC@Val+1)),c

	line	206
	
i2l1281:
;titan.c: 206: Val += (uint16_t) ADRES;
	movf	((c:4035)),c,w	;volatile
	addwf	((c:LowPassFilterADC@Val)),c
	movf	((c:4035+1)),c,w	;volatile
	addwfc	((c:LowPassFilterADC@Val+1)),c

	line	207
	
i2l1283:
;titan.c: 207: *p = Val >> 6;
	movff	(c:LowPassFilterADC@Val),??_LowPassFilterADC+0+0
	movff	(c:LowPassFilterADC@Val+1),??_LowPassFilterADC+0+0+1
	movlw	06h
	movwf	(??_LowPassFilterADC+2+0)&0ffh,c
i2u59_45:
	bcf	status,0
	rrcf	(??_LowPassFilterADC+0+1),c
	rrcf	(??_LowPassFilterADC+0+0),c
	decfsz	(??_LowPassFilterADC+2+0)&0ffh,c
	goto	i2u59_45
	movff	(c:LowPassFilterADC@p),fsr2l
	movff	(c:LowPassFilterADC@p+1),fsr2h
	movff	??_LowPassFilterADC+0+0,postinc2
	movff	??_LowPassFilterADC+0+1,postdec2

	goto	i2l311
	line	208
	
i2l310:
	line	209
	
i2l311:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_LowPassFilterADC
	__end_of_LowPassFilterADC:
	signat	_LowPassFilterADC,8313
	global	_BoilerLogic

;; *************** function _BoilerLogic *****************
;; Defined at:
;;		line 211 in file "titan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TitanApp
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	211
global __ptext13
__ptext13:
psect	text13
	file	"titan.c"
	line	211
	global	__size_of_BoilerLogic
	__size_of_BoilerLogic	equ	__end_of_BoilerLogic-_BoilerLogic
	
_BoilerLogic:
;incstack = 0
	opt	stack 25
	line	213
	
i2l1385:
;titan.c: 213: RelayRegister.RelayRegBit.RelayEV1 = TitanSwitch.Switch.Switch1;
	btfss	((c:titan@TitanSwitch)),c,1
	bra	i2u86_45
	bsf	((c:titan@RelayRegister)),c,6
	bra	i2u86_47
	i2u86_45:	
	bcf	((c:titan@RelayRegister)),c,6
	i2u86_47:
	line	214
;titan.c: 214: RelayRegister.RelayRegBit.RelayEV2 = TitanSwitch.Switch.Switch2;
	btfss	((c:titan@TitanSwitch)),c,2
	bra	i2u87_45
	bsf	((c:titan@RelayRegister)),c,5
	bra	i2u87_47
	i2u87_45:	
	bcf	((c:titan@RelayRegister)),c,5
	i2u87_47:
	line	215
	
i2l1387:
;titan.c: 215: TitanHwFlags.Flags.MakeIgnition = ((RelayRegister.RelayRegBit.RelayEV1 == 1) && (TitanSwitch.Switch.GasIgnition == 1));
	movlw	low(0)
	movwf	((c:_BoilerLogic$1187)),c
	
i2l1389:
	btfss	((c:titan@RelayRegister)),c,6
	goto	i2u88_41
	goto	i2u88_40
i2u88_41:
	goto	i2l1395
i2u88_40:
	
i2l1391:
	btfss	((c:titan@TitanSwitch)),c,0
	goto	i2u89_41
	goto	i2u89_40
i2u89_41:
	goto	i2l1395
i2u89_40:
	
i2l1393:
	movlw	low(01h)
	movwf	((c:_BoilerLogic$1187)),c
	goto	i2l1395
	
i2l315:
	
i2l1395:
	btfsc	(c:_BoilerLogic$1187),c,0
	bra	i2u90_45
	bcf	((c:titan@TitanHwFlags)),c,0
	bra	i2u90_46
	i2u90_45:
	bsf	((c:titan@TitanHwFlags)),c,0
	i2u90_46:

	line	217
	
i2l316:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_BoilerLogic
	__end_of_BoilerLogic:
	signat	_BoilerLogic,89
	global	_CCP4_ISR

;; *************** function _CCP4_ISR *****************
;; Defined at:
;;		line 36 in file "timers.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_TMR3_ISR
;; This function is called by:
;;		_INTERRUPT_InterruptManager
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	file	"timers.c"
	line	36
global __ptext14
__ptext14:
psect	text14
	file	"timers.c"
	line	36
	global	__size_of_CCP4_ISR
	__size_of_CCP4_ISR	equ	__end_of_CCP4_ISR-_CCP4_ISR
	
_CCP4_ISR:
;incstack = 0
	opt	stack 26
	line	41
	
i2l1169:
;timers.c: 38: static uint8_t ReceiverBitCounter, ByteToShift;
;timers.c: 41: PIR3bits.CCP4IF = 0;
	bcf	((c:4004)),c,1	;volatile
	line	43
;timers.c: 43: if (PIR2bits.TMR3IF) {
	btfss	((c:4001)),c,1	;volatile
	goto	i2u41_41
	goto	i2u41_40
i2u41_41:
	goto	i2l1173
i2u41_40:
	line	44
	
i2l1171:
;timers.c: 44: TMR3_ISR();
	call	_TMR3_ISR	;wreg free
	goto	i2l1173
	line	45
	
i2l103:
	line	46
	
i2l1173:
;timers.c: 45: }
;timers.c: 46: ExtendedCCP4.word.lo = (uint16_t) CCPR4;
	movff	(c:3956),(c:_ExtendedCCP4)	;volatile
	movff	(c:3956+1),(c:_ExtendedCCP4+1)	;volatile
	line	49
# 49 "timers.c"
movf _PrevExtendedCCP4,w,c ;# 
	line	50
# 50 "timers.c"
subwf _ExtendedCCP4,w,c ;# 
	line	51
# 51 "timers.c"
movwf _DataInterval,f,c ;# 
	line	52
# 52 "timers.c"
movf (_PrevExtendedCCP4 + 1),w,c ;# 
	line	53
# 53 "timers.c"
subwfb (_ExtendedCCP4 + 1),w,c ;# 
	line	54
# 54 "timers.c"
movwf (_DataInterval + 1),f,c ;# 
	line	55
# 55 "timers.c"
movf (_PrevExtendedCCP4 + 2),w,c ;# 
	line	56
# 56 "timers.c"
subwfb (_ExtendedCCP4 + 2),w,c ;# 
	line	57
# 57 "timers.c"
movwf (_DataInterval + 2),f,c ;# 
	line	58
# 58 "timers.c"
movf (_PrevExtendedCCP4 + 3),w,c ;# 
	line	59
# 59 "timers.c"
subwfb (_ExtendedCCP4 + 3),w,c ;# 
	line	60
# 60 "timers.c"
movwf (_DataInterval + 3),f,c ;# 
psect	text14
	line	63
	
i2l1175:
;timers.c: 63: PrevExtendedCCP4 = ExtendedCCP4;
	movff	(c:_ExtendedCCP4),(c:_PrevExtendedCCP4)	;volatile
	movff	(c:_ExtendedCCP4+1),(c:_PrevExtendedCCP4+1)	;volatile
	movff	(c:_ExtendedCCP4+2),(c:_PrevExtendedCCP4+2)	;volatile
	movff	(c:_ExtendedCCP4+3),(c:_PrevExtendedCCP4+3)	;volatile
	line	68
	
i2l1177:
;timers.c: 68: if (DataInterval.value > ((uint16_t) (41666666.6667/4000))) {
		movf	((c:_DataInterval+3)),c,w
	iorwf	((c:_DataInterval+2)),c,w
	bnz	i2u42_40
	movlw	177
	subwf	 ((c:_DataInterval)),c,w
	movlw	40
	subwfb	((c:_DataInterval+1)),c,w
	btfss	status,0
	goto	i2u42_41
	goto	i2u42_40

i2u42_41:
	goto	i2l104
i2u42_40:
	line	69
	
i2l1179:
;timers.c: 69: ReceiverStatus = 0;
	movlw	low(0)
	movwf	((c:_ReceiverStatus)),c	;volatile
	line	70
;timers.c: 70: }
	goto	i2l124
	line	71
	
i2l104:
	line	73
# 73 "timers.c"
rlcf (_DataInterval),c ;# 
	line	74
# 74 "timers.c"
rlcf (_DataInterval + 1),c ;# 
	line	75
# 75 "timers.c"
rlcf (_DataInterval),c ;# 
	line	76
# 76 "timers.c"
rlcf (_DataInterval + 1),c ;# 
psect	text14
	line	78
	
i2l1181:
;timers.c: 78: if (ReceiverStatus == 0) {
	movf	((c:_ReceiverStatus)),c,w	;volatile
	btfss	status,2
	goto	i2u43_41
	goto	i2u43_40
i2u43_41:
	goto	i2l1187
i2u43_40:
	line	80
	
i2l1183:
# 80 "timers.c"
movf (_DataInterval + 1),w,c ;# 
	line	81
# 81 "timers.c"
movwf _PorogInterval,c ;# 
	line	82
# 82 "timers.c"
rrcf (_DataInterval + 1),w,c ;# 
	line	83
# 83 "timers.c"
movwf _Interval_Lo,c ;# 
	line	84
# 84 "timers.c"
addwf _PorogInterval,w,c ;# 
	line	85
# 85 "timers.c"
movwf _Interval_Hi,c ;# 
psect	text14
	line	87
	
i2l1185:
;timers.c: 87: ByteToShift = 0;
	movlw	low(0)
	movwf	((c:CCP4_ISR@ByteToShift)),c
	line	88
;timers.c: 88: ReceiverBitCounter = 6;
	movlw	low(06h)
	movwf	((c:CCP4_ISR@ReceiverBitCounter)),c
	line	89
;timers.c: 89: } else if (ReceiverStatus != 255) {
	goto	i2l124
	
i2l106:
	
i2l1187:
		incf	((c:_ReceiverStatus)),c,w	;volatile
	btfsc	status,2
	goto	i2u44_41
	goto	i2u44_40

i2u44_41:
	goto	i2l124
i2u44_40:
	line	90
	
i2l1189:
;timers.c: 90: if (DataInterval.byte.b1 < Interval_Lo) {
		movf	((c:_Interval_Lo)),c,w
	subwf	(0+((c:_DataInterval)+01h)),c,w
	btfsc	status,0
	goto	i2u45_41
	goto	i2u45_40

i2u45_41:
	goto	i2l1193
i2u45_40:
	line	91
	
i2l1191:
;timers.c: 91: ReceiverStatus = 255;
	setf	((c:_ReceiverStatus)),c	;volatile
	line	92
;timers.c: 92: } else if (DataInterval.byte.b1 > Interval_Hi) {
	goto	i2l124
	
i2l109:
	
i2l1193:
		movf	(0+((c:_DataInterval)+01h)),c,w
	subwf	((c:_Interval_Hi)),c,w
	btfsc	status,0
	goto	i2u46_41
	goto	i2u46_40

i2u46_41:
	goto	i2l1197
i2u46_40:
	line	93
	
i2l1195:
;timers.c: 93: ReceiverStatus = 255;
	setf	((c:_ReceiverStatus)),c	;volatile
	line	94
;timers.c: 94: } else {
	goto	i2l124
	
i2l111:
	line	95
	
i2l1197:
;timers.c: 95: if (DataInterval.byte.b1 > PorogInterval) {
		movf	(0+((c:_DataInterval)+01h)),c,w
	subwf	((c:_PorogInterval)),c,w
	btfsc	status,0
	goto	i2u47_41
	goto	i2u47_40

i2u47_41:
	goto	i2l1201
i2u47_40:
	line	96
	
i2l1199:
;timers.c: 96: ByteToShift = 0x80 + (ByteToShift >> 1);
	bsf	status,0
	
	rrcf	((c:CCP4_ISR@ByteToShift)),c
	line	97
;timers.c: 97: } else {
	goto	i2l1203
	
i2l113:
	line	98
	
i2l1201:
;timers.c: 98: ByteToShift = 0x00 + (ByteToShift >> 1);
	bcf	status,0
	rrcf	((c:CCP4_ISR@ByteToShift)),c,w
	movwf	((c:CCP4_ISR@ByteToShift)),c
	goto	i2l1203
	line	99
	
i2l114:
	line	100
	
i2l1203:
;timers.c: 99: }
;timers.c: 100: ReceiverStatus++;
	incf	((c:_ReceiverStatus)),c	;volatile
	line	101
	
i2l1205:
;timers.c: 101: ReceiverBitCounter--;
	decf	((c:CCP4_ISR@ReceiverBitCounter)),c
	line	102
	
i2l1207:
;timers.c: 102: if (ReceiverBitCounter == 0) {
	movf	((c:CCP4_ISR@ReceiverBitCounter)),c,w
	btfss	status,2
	goto	i2u48_41
	goto	i2u48_40
i2u48_41:
	goto	i2l124
i2u48_40:
	line	103
	
i2l1209:
;timers.c: 103: ReceiverBitCounter = 8;
	movlw	low(08h)
	movwf	((c:CCP4_ISR@ReceiverBitCounter)),c
	line	104
;timers.c: 104: if (ReceiverStatus = 6) {
	movlw	low(06h)
	movwf	((c:_ReceiverStatus)),c	;volatile
	line	105
	
i2l1211:
;timers.c: 105: ReceiveBuffer.byte.b0 = ByteToShift;
	movff	(c:CCP4_ISR@ByteToShift),(c:_ReceiveBuffer)	;volatile
	line	106
	
i2l1213:
;timers.c: 106: if (ReceiveBuffer.byte.b0 & 0x02) {
	
	btfss	((c:_ReceiveBuffer)),c,(1)&7	;volatile
	goto	i2u49_41
	goto	i2u49_40
i2u49_41:
	goto	i2l124
i2u49_40:
	line	107
	
i2l1215:
;timers.c: 107: ReceiveQuantity = 6;
	movlw	low(06h)
	movwf	((c:_ReceiveQuantity)),c	;volatile
	line	108
	
i2l1217:
;timers.c: 108: TimersCCP.Flags.Receive = 1;
	bsf	((c:_TimersCCP)),c,0	;volatile
	goto	i2l124
	line	109
	
i2l117:
	line	110
;timers.c: 109: }
;timers.c: 110: } else if (ReceiverStatus = 14) {
	goto	i2l124
	
i2l116:
	
i2l1219:
	movlw	low(0Eh)
	movwf	((c:_ReceiverStatus)),c	;volatile
	line	111
	
i2l1221:
;timers.c: 111: ReceiveBuffer.byte.b1 = ByteToShift;
	movff	(c:CCP4_ISR@ByteToShift),0+((c:_ReceiveBuffer)+01h)	;volatile
	line	112
;timers.c: 112: } else if (ReceiverStatus = 22) {
	goto	i2l124
	
i2l119:
	
i2l1223:
	movlw	low(016h)
	movwf	((c:_ReceiverStatus)),c	;volatile
	line	113
	
i2l1225:
;timers.c: 113: ReceiveBuffer.byte.b2 = ByteToShift;
	movff	(c:CCP4_ISR@ByteToShift),0+((c:_ReceiveBuffer)+02h)	;volatile
	line	114
;timers.c: 114: } else if (ReceiverStatus = 30) {
	goto	i2l124
	
i2l121:
	
i2l1227:
	movlw	low(01Eh)
	movwf	((c:_ReceiverStatus)),c	;volatile
	line	115
	
i2l1229:
;timers.c: 115: ReceiveBuffer.byte.b3 = ByteToShift;
	movff	(c:CCP4_ISR@ByteToShift),0+((c:_ReceiveBuffer)+03h)	;volatile
	line	116
;timers.c: 116: ReceiveQuantity = 30;
	movlw	low(01Eh)
	movwf	((c:_ReceiveQuantity)),c	;volatile
	line	117
	
i2l1231:
;timers.c: 117: TimersCCP.Flags.Receive = 1;
	bsf	((c:_TimersCCP)),c,0	;volatile
	goto	i2l124
	line	118
	
i2l123:
	goto	i2l124
	line	119
	
i2l122:
	goto	i2l124
	
i2l120:
	goto	i2l124
	
i2l118:
	goto	i2l124
	
i2l115:
	goto	i2l124
	line	120
	
i2l112:
	goto	i2l124
	
i2l110:
	goto	i2l124
	line	121
	
i2l108:
	goto	i2l124
	line	122
	
i2l107:
	goto	i2l124
	
i2l105:
	line	123
	
i2l124:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_CCP4_ISR
	__end_of_CCP4_ISR:
	signat	_CCP4_ISR,89
	global	_TMR3_ISR

;; *************** function _TMR3_ISR *****************
;; Defined at:
;;		line 148 in file "timers.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CCP4_ISR
;;		_INTERRUPT_InterruptManager
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	148
global __ptext15
__ptext15:
psect	text15
	file	"timers.c"
	line	148
	global	__size_of_TMR3_ISR
	__size_of_TMR3_ISR	equ	__end_of_TMR3_ISR-_TMR3_ISR
	
_TMR3_ISR:
;incstack = 0
	opt	stack 27
	line	149
	
i2l1111:
;timers.c: 149: PIR2bits.TMR3IF = 0;
	bcf	((c:4001)),c,1	;volatile
	line	150
	
i2l1113:
;timers.c: 150: ExtendedCCP4.word.hi++;
	infsnz	(0+((c:_ExtendedCCP4)+02h)),c	;volatile
	incf	(1+((c:_ExtendedCCP4)+02h)),c	;volatile
	line	151
	
i2l134:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_TMR3_ISR
	__end_of_TMR3_ISR:
	signat	_TMR3_ISR,89
psect	smallconst
	db 0	; dummy byte at the end
	global	__smallconst
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	1
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
       psect   temp,common,ovrld,class=COMRAM,space=1
	global	btemp
btemp:
	ds	1
	global	int$flags
	int$flags	set btemp
	global	wtemp6
	wtemp6 set btemp+1
	end

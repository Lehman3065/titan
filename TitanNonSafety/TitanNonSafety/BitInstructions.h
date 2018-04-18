/*
 * BitInstructions.h
 *
 * Created: 21.02.2018 18:07:44
 *  Author: Алексей81
 */ 


#ifndef BITINSTRUCTIONS_H_
#define BITINSTRUCTIONS_H_

#define ClearBitInReg(port,bit) \
__asm__ __volatile__ (			\
"cbi %0, %1" "\n\t"				\
: /* no outputs */				\
: "I" (_SFR_IO_ADDR(port)),		\
"I" (bit))


#define SetBitInReg(port,bit) \
__asm__ __volatile__ (			\
"sbi %0, %1" "\n\t"				\
: /* no outputs */				\
: "I" (_SFR_IO_ADDR(port)),		\
"I" (bit))

#endif /* BITINSTRUCTIONS_H_ */
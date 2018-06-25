/* 
 * File:   timers.h
 * Author: Алексей81
 *
 * Created on 28 мая 2018 г., 15:53
 */

#ifndef TIMERS_H
#define	TIMERS_H

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

#define _XTAL_FREQ  41666666.6667
#define CTimer3_1ms_ticks ((uint16_t) (_XTAL_FREQ/4000)) // точно 0,666667 
        // получаем в обработчике прерываний с помощью Precizion1msCounter

typedef union {
    uint16_t word;
struct{
        uint8_t lo;
        uint8_t hi;
    } byte;
} u16_t;

typedef union {
//    uint32_t;
    uint32_t value;
struct{
        uint16_t lo;
        uint16_t hi;
    } word;
struct{
        uint8_t b0;
        uint8_t b1;
        uint8_t b2;
        uint8_t b3;
    } byte;
} u32_t;

typedef union {
    uint8_t value;
struct {
    unsigned Receive: 1;
    } Flags;
} TimersCCPFlags_t;

volatile uint8_t Count_1_ms;
volatile u32_t ExtendedCCP4;
volatile u32_t ReceiveBuffer;
volatile uint8_t ReceiveQuantity;
volatile uint8_t ReceiverStatus;
volatile TimersCCPFlags_t TimersCCP;

void Timers_Initialize(void);
u16_t TMR3_ReadTimer(void);
void CCP4_ISR(void);
void CCP5_ISR(void);
void TMR3_ISR(void);

#endif	/* TIMERS_H */


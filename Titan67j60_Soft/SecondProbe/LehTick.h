/* 
 * File:   LehTick.h
 * Author: Алексей
 *
 * Created on 14 февраля 2018 г., 14:26
 */

#ifndef LEHTICK_H
#define	LEHTICK_H

// All LEHTICKs are stored as 32-bit unsigned integers.
// This is deprecated since it conflicts with other TICK definitions used in 
// other Microchip software libraries and therefore poses a merge and maintence 
// problem.  Instead of using the TICK data type, just use the base DWORD data 
// type instead.
typedef __attribute__((__deprecated__)) DWORD LEHTICK;


void LehTickInit(void);
DWORD LehTickGet(void);
void LehTickUpdate(void);

#endif	/* LEHTICK_H */


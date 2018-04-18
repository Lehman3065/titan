#ifndef __TITAN_SYSTEM_H_
#define __TITAN_SYSTEM_H_


/* Microcontroller MIPs (FCY) */
#define SYS_FREQ        41666666L
#define FCY             SYS_FREQ/4



void SYSTEM_Cool_Initialize(void);

void SYSTEM_Hot_Initialize(void);

#endif /* __TITAN_SYSTEM_H_ */

/*
 * File:   main.c
 * Author: Алексей81
 *
 * Created on 24 апреля 2018 г., 17:17
 */

#include "titan.h"

static uint8_t ResetSource;

void main(void) {
    
    ResetSource = RCON; // хранит причину предыдущего сброса
    if ((ResetSource & 0x03) == 0x00)   {
        VariablesInit();
        RCONbits.POR = 1;
        RCONbits.BOR = 1;
        }
    HardwareInit();
    while (1) {
        CLRWDT();
    }
    return; // никогда не должны попасть сюда!!!
}

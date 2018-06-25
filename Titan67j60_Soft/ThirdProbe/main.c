/*
 * File:   main.c
 * Author: �������81
 *
 * Created on 24 ������ 2018 �., 17:17
 */

#include "titan.h"

static uint8_t ResetSource;

void main(void) {
    
    ResetSource = RCON; // ������ ������� ����������� ������
    if ((ResetSource & 0x03) == 0x00)   {
        VariablesInit();
        RCONbits.POR = 1;
        RCONbits.BOR = 1;
        }
    HardwareInit();
    while (1) {
        CLRWDT();
    }
    return; // ������� �� ������ ������� ����!!!
}

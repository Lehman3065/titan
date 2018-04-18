#include <p18cxxx.h>   /* C18 General Include File */

#include "titansystem.h"    /* ??? ????????? ? ?? ????????????? Hot/Cool */
#include "titanvar.h"       /* ?????????? ?????????? ? ?? ????????????? Hot/Cool */

/******************************************************************************/
/* User Global Variable Declaration                                           */
/******************************************************************************/

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

void main(void)
{
    if (RCONbits.POR == 0)
    {
        RCONbits.POR = 1;
        SYSTEM_Cool_Initialize();
        VAR_Cool_Initialize();
    }
    SYSTEM_Hot_Initialize();
    VAR_Hot_Initialize();

    while(1)
    {

    }

}


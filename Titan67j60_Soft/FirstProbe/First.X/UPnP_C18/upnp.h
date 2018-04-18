/*********************************************************************
 *
 *	UPNP Client
 *  Module for Microchip TCP/IP Stack
 * http://www.microchip.com/forums/m529284.aspx
 *
 *********************************************************************
 * FileName:        upnp.h
 * Dependencies:    UDP
 * Processor:       PIC18, PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.05 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.30 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 *                  Microchip XC16 v1.24 or higher
 ********************************************************************/

#ifndef _UPNP_H_
#define _UPNP_H_


//----- DEFINES -----
#define SSDP_PORT   (1900)
#define UPNP_PORT   (8080)

//----- PROTOTYPES -----
void SSDPAnnounce(void);
void SSDPDiscoveryTask(void);
void UPNPServer(void);

#endif //_UPNP_H_

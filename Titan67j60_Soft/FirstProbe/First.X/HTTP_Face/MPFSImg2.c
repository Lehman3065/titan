/***************************************************************
 * FileName:    MPFSImg2.c
 * Description: Defines an MPFS2 image to be stored in program memory.
 * Processor:   PIC18,PIC32
 * Compiler:    Microchip C18, C32
 *
 * NOT FOR HAND MODIFICATION
 * This file is automatically generated by the MPFS2 Utility
 * ALL MODIFICATIONS WILL BE OVERWRITTEN BY THE MPFS2 GENERATOR
 * Generated �� ��� 18 2018 04:11:18 
 *
 * Software License Agreement
 *
 * Copyright (C) 2012 Microchip Technology Inc.  All rights
 * reserved.
 *
 * Microchip licenses to you the right to use, modify, copy, and 
  * distribute: 
 * (i)  the Software when embedded on a Microchip microcontroller or 
 *      digital signal controller product ("Device") which is 
 *      integrated into Licensee's product; or 
 * (ii) ONLY the Software driver source files ENC28J60.c, ENC28J60.h,
 *		ENCX24J600.c and ENCX24J600.h ported to a non-Microchip device
 *		used in conjunction with a Microchip ethernet controller for
 *		the sole purpose of interfacing with the ethernet controller.
 *
 * You should refer to the license agreement accompanying this 
 * Software for additional information regarding your rights and 
 * obligations.
 *
 * THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT
 * WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
 * LIMITATION, ANY WARRANTY OF MERCHANTABILITY, FITNESS FOR A 
 * PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL
 * MICROCHIP BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF
 * PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
 * BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE 
 * THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER 
 * SIMILAR COSTS, WHETHER ASSERTED ON THE BASIS OF CONTRACT, TORT
 * (INCLUDING NEGLIGENCE), BREACH OF WARRANTY, OR OTHERWISE.
 *
 ***************************************************************/

#define __MPFSIMG2_C

#include "TCPIPConfig.h"
#if !defined(MPFS_USE_EEPROM) && !defined(MPFS_USE_SPI_FLASH)

#include "TCPIP Stack/TCPIP.h"
#if defined(STACK_USE_MPFS2)


/**************************************
 * MPFS2 Image Data
 **************************************/
#define DATACHUNK000000 \
	0x4d,0x50,0x46,0x53,0x02,0x01,0x04,0x00,0xec,0x46,0xff,0xff,0x92,0x79,0x4a,0x5b, /* MPFS.....F...yJ[ */ \
	0x68,0x00,0x00,0x00,0x8d,0x00,0x00,0x00,0x62,0x04,0x00,0x00,0x40,0x22,0x5f,0x5a, /* h.......b...@"_Z */ \
	0x00,0x00,0x00,0x00,0x02,0x00,0x73,0x00,0x00,0x00,0xef,0x04,0x00,0x00,0x38,0x00, /* ......s.......8. */ \
	0x00,0x00,0x40,0x22,0x5f,0x5a,0x00,0x00,0x00,0x00,0x00,0x00,0x74,0x00,0x00,0x00, /* ..@"_Z......t... */ \
	0x27,0x05,0x00,0x00,0x7d,0x03,0x00,0x00,0x9e,0x83,0x54,0x5a,0x00,0x00,0x00,0x00, /* '...}.....TZ.... */ \
	0x01,0x00,0x7e,0x00,0x00,0x00,0xa4,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0xd0,0x5e, /* ..~............^ */ \
	0x42,0x5a,0x00,0x00,0x00,0x00,0x00,0x00,0x69,0x6e,0x64,0x65,0x78,0x2e,0x68,0x74, /* BZ......index.ht */ \
	0x6d,0x6c,0x00,0x00,0x54,0x69,0x74,0x61,0x6e,0x2e,0x69,0x63,0x6f,0x00,0x63,0x73, /* ml..Titan.ico.cs */ \
	0x73,0x2f,0x73,0x74,0x79,0x6c,0x65,0x73,0x2e,0x63,0x73,0x73,0x00,0x3c,0x21,0x44, /* s/styles.css.<!D */ \
	0x4f,0x43,0x54,0x59,0x50,0x45,0x20,0x68,0x74,0x6d,0x6c,0x3e,0x0d,0x0a,0x3c,0x68, /* OCTYPE html>..<h */ \
	0x74,0x6d,0x6c,0x3e,0x0d,0x0a,0x7e,0x69,0x6e,0x63,0x3a,0x68,0x65,0x61,0x64,0x65, /* tml>..~inc:heade */ \
	0x72,0x2e,0x69,0x6e,0x63,0x7e,0x0d,0x0a,0x09,0x3c,0x68,0x65,0x61,0x64,0x3e,0x0d, /* r.inc~...<head>. */ \
	0x0a,0x09,0x3c,0x74,0x69,0x74,0x6c,0x65,0x3e,0x09,0xca,0xee,0xf2,0xb8,0xeb,0x20, /* ..<title>......  */ \
	0xd2,0xe8,0xf2,0xe0,0xed,0x20,0x3c,0x2f,0x74,0x69,0x74,0x6c,0x65,0x3e,0x0d,0x0a, /* ..... </title>.. */ \
	0x09,0x3c,0x6c,0x69,0x6e,0x6b,0x20,0x72,0x65,0x6c,0x3d,0x22,0x73,0x68,0x6f,0x72, /* .<link rel="shor */ \
	0x74,0x63,0x75,0x74,0x20,0x69,0x63,0x6f,0x6e,0x22,0x20,0x68,0x72,0x65,0x66,0x3d, /* tcut icon" href= */ \
	0x22,0x54,0x69,0x74,0x61,0x6e,0x2e,0x69,0x63,0x6f,0x22,0x2f,0x3e,0x20,0x0d,0x0a, /* "Titan.ico"/> .. */ \
	0x09,0x3c,0x2f,0x68,0x65,0x61,0x64,0x3e,0x0d,0x0a,0x3c,0x62,0x6f,0x64,0x79,0x3e, /* .</head>..<body> */ \
	0x0d,0x0a,0x3c,0x66,0x6f,0x72,0x6d,0x20,0x61,0x63,0x74,0x69,0x6f,0x6e,0x3d,0x22, /* ..<form action=" */ \
	0x68,0x74,0x74,0x70,0x3a,0x2f,0x2f,0x65,0x78,0x61,0x6d,0x70,0x6c,0x65,0x2e,0x63, /* http://example.c */ \
	0x6f,0x6d,0x2f,0x61,0x70,0x70,0x2f,0x70,0x72,0x6f,0x66,0x69,0x6c,0x65,0x2e,0x70, /* om/app/profile.p */ \
	0x68,0x70,0x22,0x20,0x6d,0x65,0x74,0x68,0x6f,0x64,0x3d,0x22,0x70,0x6f,0x73,0x74, /* hp" method="post */ \
	0x22,0x3e,0x0d,0x0a,0x3c,0x70,0x3e,0x0d,0x0a,0x09,0x3c,0x6c,0x61,0x62,0x65,0x6c, /* ">..<p>...<label */ \
	0x20,0x66,0x6f,0x72,0x3d,0x22,0x42,0x6f,0x69,0x6c,0x65,0x72,0x4e,0x61,0x6d,0x65, /*  for="BoilerName */ \
	0x22,0x3e,0x20,0xca,0xee,0xf2,0xb8,0xeb,0x3a,0x20,0x0d,0x0a,0x09,0x3c,0x2f,0x6c, /* "> .....: ...</l */ \
	0x61,0x62,0x65,0x6c,0x3e,0x3c,0x69,0x6e,0x70,0x75,0x74,0x20,0x74,0x79,0x70,0x65, /* abel><input type */ \
	0x3d,0x22,0x74,0x65,0x78,0x74,0x22,0x20,0x6e,0x61,0x6d,0x65,0x3d,0x22,0x42,0x6f, /* ="text" name="Bo */ \
	0x69,0x6c,0x65,0x72,0x4e,0x61,0x6d,0x65,0x22,0x20,0x73,0x69,0x7a,0x65,0x3d,0x22, /* ilerName" size=" */ \
	0x35,0x30,0x22,0x20,0x6d,0x61,0x78,0x6c,0x65,0x6e,0x67,0x74,0x68,0x3d,0x22,0x35, /* 50" maxlength="5 */ \
	0x30,0x22,0x20,0x76,0x61,0x6c,0x75,0x65,0x3d,0x7e,0x42,0x6c,0x72,0x4e,0x61,0x6d, /* 0" value=~BlrNam */ \
	0x65,0x7e,0x20,0x2f,0x3e,0x0d,0x0a,0x09,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x3c,0x62, /* e~ />...<br /><b */ \
	0x72,0x20,0x2f,0x3e,0x0d,0x0a,0x09,0x3c,0x6c,0x61,0x62,0x65,0x6c,0x20,0x66,0x6f, /* r />...<label fo */ \
	0x72,0x3d,0x22,0x41,0x64,0x6d,0x69,0x6e,0x22,0x3e,0x20,0xc0,0xe4,0xec,0xe8,0xed, /* r="Admin"> ..... */ \
	0xe8,0xf1,0xf2,0xf0,0xe0,0xf2,0xee,0xf0,0x20,0xea,0xee,0xf2,0xeb,0xe0,0x3a,0x20, /* ........ .....:  */ \
	0x0d,0x0a,0x09,0x3c,0x2f,0x6c,0x61,0x62,0x65,0x6c,0x3e,0x3c,0x69,0x6e,0x70,0x75, /* ...</label><inpu */ \
	0x74,0x20,0x74,0x79,0x70,0x65,0x3d,0x22,0x74,0x65,0x78,0x74,0x22,0x20,0x6e,0x61, /* t type="text" na */ \
	0x6d,0x65,0x3d,0x22,0x41,0x64,0x6d,0x69,0x6e,0x22,0x20,0x76,0x61,0x6c,0x75,0x65, /* me="Admin" value */ \
	0x3d,0x7e,0x41,0x64,0x6d,0x4e,0x61,0x6d,0x65,0x7e,0x20,0x2f,0x3e,0x0d,0x0a,0x09, /* =~AdmName~ />... */ \
	0x3c,0x62,0x72,0x20,0x2f,0x3e,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x0d,0x0a,0x09,0x3c, /* <br /><br />...< */ \
	0x6c,0x61,0x62,0x65,0x6c,0x20,0x66,0x6f,0x72,0x3d,0x22,0x53,0x65,0x72,0x76,0x65, /* label for="Serve */ \
	0x72,0x22,0x3e,0x20,0xc0,0xe4,0xf0,0xe5,0xf1,0x20,0xf1,0xe5,0xf0,0xe2,0xe5,0xf0, /* r"> ..... ...... */ \
	0xe0,0x20,0xf3,0xef,0xf0,0xe0,0xe2,0xeb,0xe5,0xed,0xe8,0xff,0x3a,0x20,0x0d,0x0a, /* . ..........: .. */ \
	0x09,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x0d,0x0a,0x09,0x3c,0x2f,0x6c,0x61,0x62,0x65, /* .<br />...</labe */ \
	0x6c,0x3e,0x3c,0x69,0x6e,0x70,0x75,0x74,0x20,0x74,0x79,0x70,0x65,0x3d,0x22,0x74, /* l><input type="t */ \
	0x65,0x78,0x74,0x22,0x20,0x6e,0x61,0x6d,0x65,0x3d,0x22,0x53,0x65,0x72,0x76,0x65, /* ext" name="Serve */ \
	0x72,0x22,0x20,0x73,0x69,0x7a,0x65,0x3d,0x22,0x35,0x30,0x22,0x20,0x6d,0x61,0x78, /* r" size="50" max */ \
	0x6c,0x65,0x6e,0x67,0x74,0x68,0x3d,0x22,0x35,0x30,0x22,0x20,0x76,0x61,0x6c,0x75, /* length="50" valu */ \
	0x65,0x3d,0x7e,0x53,0x65,0x72,0x76,0x55,0x52,0x4c,0x7e,0x20,0x2f,0x3e,0x0d,0x0a, /* e=~ServURL~ />.. */ \
	0x09,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x0d,0x0a,0x09, /* .<br /><br />... */ \
	0x3c,0x6c,0x61,0x62,0x65,0x6c,0x20,0x66,0x6f,0x72,0x3d,0x22,0x54,0x6d,0x70,0x54, /* <label for="TmpT */ \
	0x79,0x70,0x65,0x22,0x3e,0x20,0xd3,0xf1,0xf2,0xe0,0xed,0xe0,0xe2,0xeb,0xe8,0xe2, /* ype"> .......... */ \
	0xe0,0xf2,0xfc,0x20,0xf2,0xe5,0xec,0xef,0xe5,0xf0,0xe0,0xf2,0xf3,0xf0,0xf3,0x3a, /* ... ...........: */ \
	0x20,0x0d,0x0a,0x09,0x3c,0x73,0x65,0x6c,0x65,0x63,0x74,0x20,0x6e,0x61,0x6d,0x65, /*  ...<select name */ \
	0x3d,0x22,0x54,0x6d,0x70,0x54,0x79,0x70,0x65,0x22,0x20,0x73,0x69,0x7a,0x65,0x3d, /* ="TmpType" size= */ \
	0x22,0x31,0x22,0x3e,0x0d,0x0a,0x09,0x3c,0x6f,0x70,0x74,0x69,0x6f,0x6e,0x20,0x7e, /* "1">...<option ~ */ \
	0x54,0x6d,0x70,0x52,0x6f,0x6f,0x6d,0x53,0x7e,0x20,0x76,0x61,0x6c,0x75,0x65,0x3d, /* TmpRoomS~ value= */ \
	0x22,0x54,0x6d,0x70,0x52,0x6f,0x6f,0x6d,0x22,0x3e,0xe2,0x20,0xea,0xee,0xec,0xed, /* "TmpRoom">. .... */ \
	0xe0,0xf2,0xe5,0x3c,0x2f,0x6f,0x70,0x74,0x69,0x6f,0x6e,0x3e,0x0d,0x0a,0x09,0x3c, /* ...</option>...< */ \
	0x6f,0x70,0x74,0x69,0x6f,0x6e,0x20,0x7e,0x54,0x6d,0x70,0x57,0x61,0x74,0x65,0x72, /* option ~TmpWater */ \
	0x53,0x7e,0x20,0x76,0x61,0x6c,0x75,0x65,0x3d,0x22,0x54,0x6d,0x70,0x57,0x61,0x74, /* S~ value="TmpWat */ \
	0x65,0x72,0x22,0x3e,0xe2,0x20,0xed,0xe0,0xea,0xee,0xef,0xe8,0xf2,0xe5,0xeb,0xe5, /* er">. .......... */ \
	0x20,0xe3,0xee,0xf0,0xff,0xf7,0xe5,0xe9,0x20,0xe2,0xee,0xe4,0xfb,0x3c,0x2f,0x6f, /*  ....... ....</o */ \
	0x70,0x74,0x69,0x6f,0x6e,0x3e,0x0d,0x0a,0x09,0x3c,0x2f,0x73,0x65,0x6c,0x65,0x63, /* ption>...</selec */ \
	0x74,0x3e,0x0d,0x0a,0x09,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x3c,0x62,0x72,0x20,0x2f  /* t>...<br /><br / */
#define DATACHUNK000001 \
	0x3e,0x0d,0x0a,0x09,0x3c,0x6c,0x61,0x62,0x65,0x6c,0x20,0x66,0x6f,0x72,0x3d,0x22, /* >...<label for=" */ \
	0x54,0x65,0x6d,0x70,0x72,0x22,0x3e,0x20,0xd2,0xf0,0xe5,0xe1,0xf3,0xe5,0xec,0xe0, /* Tempr"> ........ */ \
	0xff,0x20,0xf2,0xe5,0xec,0xef,0xe5,0xf0,0xe0,0xf2,0xf3,0xf0,0xe0,0x3a,0x20,0x0d, /* . ...........: . */ \
	0x0a,0x09,0x3c,0x2f,0x6c,0x61,0x62,0x65,0x6c,0x3e,0x0d,0x0a,0x09,0x3c,0x69,0x6e, /* ..</label>...<in */ \
	0x70,0x75,0x74,0x20,0x74,0x79,0x70,0x65,0x3d,0x22,0x74,0x65,0x78,0x74,0x22,0x20, /* put type="text"  */ \
	0x6e,0x61,0x6d,0x65,0x3d,0x22,0x54,0x65,0x6d,0x70,0x72,0x22,0x20,0x73,0x69,0x7a, /* name="Tempr" siz */ \
	0x65,0x3d,0x22,0x34,0x22,0x20,0x6d,0x61,0x78,0x6c,0x65,0x6e,0x67,0x74,0x68,0x3d, /* e="4" maxlength= */ \
	0x22,0x34,0x22,0x20,0x76,0x61,0x6c,0x75,0x65,0x3d,0x7e,0x54,0x61,0x67,0x54,0x6d, /* "4" value=~TagTm */ \
	0x70,0x7e,0x20,0x2f,0x3e,0x20,0xd1,0x3c,0x73,0x75,0x70,0x3e,0xee,0x3c,0x2f,0x73, /* p~ /> .<sup>.</s */ \
	0x75,0x70,0x3e,0x0d,0x0a,0x09,0x3c,0x62,0x72,0x20,0x2f,0x3e,0x3c,0x62,0x72,0x20, /* up>...<br /><br  */ \
	0x2f,0x3e,0x0d,0x0a,0x09,0x3c,0x69,0x6e,0x70,0x75,0x74,0x20,0x74,0x79,0x70,0x65, /* />...<input type */ \
	0x3d,0x22,0x73,0x75,0x62,0x6d,0x69,0x74,0x22,0x20,0x76,0x61,0x6c,0x75,0x65,0x3d, /* ="submit" value= */ \
	0x22,0xd1,0xee,0xf5,0xf0,0xe0,0xed,0xe8,0xf2,0xfc,0x22,0x3e,0x0d,0x0a,0x3c,0x2f, /* ".........">..</ */ \
	0x70,0x3e,0x0d,0x0a,0x3c,0x2f,0x66,0x6f,0x72,0x6d,0x3e,0x0d,0x0a,0x3c,0x2f,0x62, /* p>..</form>..</b */ \
	0x6f,0x64,0x79,0x3e,0x0d,0x0a,0x3c,0x2f,0x68,0x74,0x6d,0x6c,0x3e,0x0d,0x0a,0x19, /* ody>..</html>... */ \
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x4c,0x01,0x00,0x00,0x01,0x00,0x00,0x00,0xc4, /* .......L........ */ \
	0x01,0x00,0x00,0x02,0x00,0x00,0x00,0x65,0x02,0x00,0x00,0x03,0x00,0x00,0x00,0xe2, /* .......e........ */ \
	0x02,0x00,0x00,0x04,0x00,0x00,0x00,0x1a,0x03,0x00,0x00,0x05,0x00,0x00,0x00,0xed, /* ................ */ \
	0x03,0x00,0x00,0x06,0x00,0x00,0x00,0x1f,0x8b,0x08,0x00,0x00,0x00,0x00,0x00,0x00, /* ................ */ \
	0x00,0xa5,0x92,0x6d,0x50,0xd4,0x55,0x14,0x87,0xf7,0xfd,0x4d,0x16,0x96,0x75,0x65, /* ...mP.U....M..ue */ \
	0x6a,0x46,0x1a,0x86,0x34,0x9a,0x26,0x31,0x4b,0x1b,0x4b,0x62,0x70,0x8c,0xa9,0x6f, /* jF..4.&1K.Kbp..o */ \
	0x3a,0x4d,0x33,0x7d,0xb2,0xfc,0xe0,0x10,0x25,0x4e,0x0d,0x62,0x99,0x28,0x0e,0x04, /* :M3}....%N.b.(.. */ \
	0x4c,0x84,0x08,0xca,0x8a,0x48,0x20,0x6e,0x11,0x2f,0x06,0xbb,0x14,0xa1,0x2d,0xa2, /* L....H n./....-. */ \
	0x08,0x02,0xee,0xf6,0x06,0x04,0xb2,0x94,0xe2,0x4b,0xc0,0x32,0x58,0xe0,0x60,0x9b, /* .........K.2X.`. */ \
	0x23,0xc4,0xf8,0x74,0xf7,0xae,0x32,0xd3,0xe7,0xee,0x7f,0xce,0xff,0xde,0x39,0xf7, /* #..t..2.......9. */ \
	0x3e,0xbf,0x73,0xee,0x39,0x57,0xa1,0x50,0x8a,0xcf,0x62,0x51,0x88,0x7f,0x8c,0x22, /* >.s.9W.P..bQ..." */ \
	0x55,0xa3,0x50,0x44,0x29,0x14,0x8a,0x27,0x85,0x09,0x97,0xf0,0x84,0xfc,0x72,0x88, /* U.PD)..'......r. */ \
	0xbd,0x0c,0x6b,0xc8,0x1e,0x8e,0x97,0xd7,0x3e,0x4b,0x65,0x69,0x29,0xcf,0xc5,0xaf, /* ..k.....>Kei)... */ \
	0x26,0x79,0xcb,0x76,0x72,0x2a,0xba,0xc8,0x29,0x77,0xb3,0xff,0x48,0x13,0x7b,0x0e, /* &y.vr...)w..H.{. */ \
	0xd5,0xb1,0xd7,0xfe,0x2d,0x05,0x5f,0x5e,0x66,0x62,0x2a,0x00,0x0b,0x73,0xa4,0x6d, /* ....-._^fb...s.m */ \
	0x7f,0x07,0x81,0x61,0xd0,0x1b,0x50,0xab,0xd4,0xa8,0x4d,0xe1,0xbc,0x97,0x9a,0x42, /* ...a..P...M....B */ \
	0x7e,0xd6,0x01,0xd6,0xae,0x4b,0xe4,0xed,0x7d,0x9f,0x91,0xb6,0xcf,0x4e,0xe9,0x17, /* ~....K..}....N.. */ \
	0x9d,0x14,0x9f,0x68,0x67,0x6f,0x51,0x0d,0xe9,0x85,0xf5,0x38,0xcf,0x0e,0x48,0xfe, /* ...hgoQ....8..H. */ \
	0x8c,0xab,0x05,0xa5,0x42,0x85,0x4e,0xab,0x93,0x7c,0x50,0xeb,0xf5,0xd7,0x36,0xf3, /* ....B.N..|P...6. */ \
	0xa7,0xdf,0x4f,0xc2,0xfa,0x44,0xb6,0x6c,0x4d,0x27,0xeb,0x50,0x03,0xad,0xbd,0x77, /* ..O..D.lM'.P...w */ \
	0x70,0x9c,0xbe,0x25,0x62,0xfb,0x28,0x6e,0xf0,0x92,0x51,0xd4,0xc8,0xd1,0x13,0xdf, /* p..%b.(n..Q..... */ \
	0x31,0x79,0xfd,0x06,0x8f,0x3f,0x16,0x2b,0x39,0x8d,0x5a,0x23,0xe7,0xe4,0x8d,0x89, /* 1y...?.+9.Z#.... */ \
	0x70,0x7f,0x9e,0xae,0xf3,0x5d,0xa4,0x64,0x14,0x52,0xf0,0xf9,0x25,0x4a,0xea,0x26, /* p....].d.R..%J.& */ \
	0xc8,0x2f,0xf0,0xb1,0x27,0xdb,0xcb,0x51,0xd7,0x08,0x45,0x0d,0x43,0x6c,0xfd,0xb0, /* ./..'..Q..E.Cl.. */ \
	0x86,0xc9,0xf1,0x5b,0xa4,0xbc,0xb9,0x4d,0x72,0x5a,0x8d,0x16,0x83,0xc1,0x24,0xd7, /* ...[...MrZ....$. */ \
	0x1d,0xee,0x16,0xc6,0x6e,0xfa,0x79,0x3f,0xd7,0x81,0xdd,0x35,0xc8,0xa7,0x55,0x23, /* ....n.y?...5..U# */ \
	0x64,0x67,0x0f,0x90,0x77,0xf0,0x47,0x2a,0x9d,0xa3,0xd4,0x77,0x04,0xd8,0x55,0xe2, /* dg..w.G....w..U. */ \
	0x65,0x60,0xf8,0x77,0xdc,0x4e,0xa7,0x64,0xd4,0x22,0xbe,0xd9,0x1c,0x2e,0xd7,0xaf, /* e`.w.N.d."...... */ \
	0x6c,0xda,0x48,0xe0,0xf6,0x34,0x85,0x55,0x6d,0x1c,0x3e,0x35,0x44,0xed,0x59,0x3f, /* l.H..4.Um.>5D.Y? */ \
	0x25,0xd5,0xc3,0x1c,0x76,0x0c,0x53,0x56,0x7b,0x8d,0x93,0x67,0x66,0xc8,0xa9,0xbe, /* %...v.SV{..gf... */ \
	0x42,0x4f,0xdf,0x38,0xa3,0x83,0x7d,0xd8,0x22,0x6c,0x82,0x53,0x62,0x89,0xb4,0xa2, /* BO.8..}."l.Sb... */ \
	0x11,0x79,0x04,0x35,0x3c,0x9d,0x6d,0x0c,0xf8,0xfc,0xe2,0xce,0xbf,0xe2,0xec,0x9d, /* .y.5<.m......... */ \
	0xa7,0xc2,0x39,0x41,0x9e,0x7d,0x98,0xcc,0x83,0x3f,0x93,0x7f,0xdc,0xc3,0xce,0x5c, /* ..9A.}...?.....\ */ \
	0x37,0xee,0xde,0x51,0xa6,0xc7,0xae,0xb1,0xe6,0xe9,0x67,0x24,0x13,0x8c,0xff,0xb0, /* 7..Q......g$.... */ \
	0x0e,0x1f,0x67,0x7d,0xc4,0xc2,0xbd,0xbb,0x54,0xb7,0x8e,0x51,0xf6,0xcd,0x1f,0xd8, /* ..g}....T..Q.... */ \
	0xbf,0xba,0xc1,0xae,0x82,0x1e,0x3e,0x28,0xfe,0x81,0xbc,0x72,0x0f,0xd9,0xc7,0xbc, /* ......>(...r.... */ \
	0x34,0xb7,0xf5,0xe3,0x1f,0xf5,0x11,0x17,0x1b,0x27,0x99,0xa8,0xa8,0xa8,0xc5,0x3b, /* 4........'.....; */ \
	0x24,0x25,0xbc,0xc8,0xec,0xd4,0x4d,0xae,0x8e,0x05,0xc8,0xa9,0xba,0x4c,0x66,0x51, /* $%....M......LfQ */ \
	0x3b,0x25,0xb5,0x23,0x9c,0xbe,0x34,0x8b,0xeb,0xdc,0x0c,0xb9,0xc7,0xfb,0x38,0xd7, /* ;%.#..4.......8. */ \
	0x3b,0xc2,0xa0,0xb7,0x07,0x6b,0xf8,0x52,0xc9,0x2c,0x8f,0x5e,0x4e,0xec,0x8a,0x95, /* ;....k.R.,.^N... */ \
	0x28,0x95,0x4a,0x54,0x4a,0x15,0x95,0x65,0x47,0x10,0x8d,0xa6,0xdd,0x33,0x4e,0xfe, /* (.JTJ..eG....3N. */ \
	0xc9,0x41,0xaa,0xbe,0xbe,0x4e,0xcb,0x45,0x91,0x93,0xc8,0x67,0xf7,0x27,0x17,0xf9, /* .A...N.E...g.'.. */ \
	0xa9,0xff,0x0a,0x8e,0xf2,0x63,0x8b,0xfd,0x0b,0xc6,0x0e,0x33,0x47,0xa0,0x52,0xa9, /* .....c.....3G.R. */ \
	0x42,0x7a,0x8f,0x3e,0xc2,0xf7,0xdd,0x1d,0x42,0xe3,0x3e,0x75,0xcd,0x5e,0x76,0xec, /* Bz.>....B.>u.^v. */ \
	0x6f,0x22,0xb7,0xf4,0x02,0xef,0xee,0xae,0x64,0xcd,0xfa,0xcd,0xf4,0x76,0xba,0x49, /* o"......d....v.I */ \
	0x4b,0x4d,0x95,0x67,0x75,0x5a,0x3d,0x26,0x93,0x49,0xb0,0xea,0xff,0xbc,0x87,0x98, /* KM.guZ=&.I...... */ \
	0xe8,0x68,0x5a,0x5d,0x4d,0xdc,0xbb,0x33,0x4d,0x45,0x59,0x05,0x09,0x1b,0x36,0x11, /* .hZ]M..3MEY...6. */ \
	0x1d,0xf3,0x04,0xdb,0xde,0x7a,0x83,0xc0,0xec,0x14,0xcd,0x8d,0x2e,0xc9,0x1a,0x0c, /* .....z.......... */ \
	0x46,0x61,0x06,0xa9,0xa1,0xd1,0x6a,0x64,0x0e,0xda,0x07,0xbd,0x78,0x2a,0x6e,0x05  /* Fa....jd....x.n. */
#define DATACHUNK000002 \
	0x13,0xa2,0xce,0x77,0x03,0xb3,0xf8,0x86,0xfa,0xc9,0x3f,0x90,0xc9,0xd5,0xdf,0x7e, /* ...w......?....~ */ \
	0xe1,0xaf,0xd9,0x19,0xbc,0x3d,0x1e,0x22,0x2d,0xcb,0x30,0x2d,0x31,0x49,0xde,0x6c, /* .....=."-.0-1I.l */ \
	0x0e,0xc3,0x68,0x14,0x73,0x78,0x18,0x91,0x91,0x16,0xc9,0x27,0x6c,0x78,0x9e,0xbf, /* ..h.sx.....'lx.. */ \
	0x03,0xb7,0x99,0x9c,0xf4,0xf3,0xcf,0xdc,0x1c,0xaf,0x26,0x25,0x8b,0xb8,0xf5,0xf2, /* ..........&%.... */ \
	0x5e,0xb5,0x8e,0x86,0x07,0xf9,0xaa,0x05,0x67,0x94,0x16,0xd4,0xd1,0xeb,0xf5,0x2c, /* ^.......g......, */ \
	0x11,0x9a,0x3a,0x9d,0x8e,0x08,0xb3,0x99,0xee,0x0b,0xe7,0x59,0x98,0x0f,0xd0,0xdd, /* ..:........Y.... */ \
	0xd1,0xcd,0x52,0x8b,0x8d,0x65,0x36,0x1b,0x3b,0x77,0xa4,0x13,0xbf,0x6a,0xdd,0xe2, /* ..R..e6.;w...j.. */ \
	0xfb,0x33,0x9a,0x42,0x7c,0x90,0x0d,0x72,0x41,0xd3,0x1b,0xf4,0x72,0x7f,0xf5,0xaa, /* .3.B|..rA...r... */ \
	0x78,0xea,0x6a,0x1a,0x79,0xe9,0x85,0x24,0xac,0x56,0x0b,0x36,0x5b,0xa8,0x67,0x1a, /* x.j.y..$.V.6[.g. */ \
	0x8d,0x46,0xc4,0xd6,0x8a,0x9e,0xc9,0x9a,0xff,0xaf,0xf1,0x2f,0x63,0xa8,0x7d,0x65, /* .F........./c.}e */ \
	0x7e,0x04,0x00,0x00                                                              /* ~...             */


/**************************************
 * MPFS2 C linkable symbols
 **************************************/
// For C18, these are split into seperate arrays because it speeds up compilation a lot.  
// For other compilers, the entire data array must be defined as a single variable to 
// ensure that the linker does not reorder the data chunks in Flash when compiler 
// optimizations are turned on.
#if defined(__18CXX)
	ROM BYTE MPFS_Start[] = {DATACHUNK000000};
	ROM BYTE MPFS_000001[] = {DATACHUNK000001};
	ROM BYTE MPFS_000002[] = {DATACHUNK000002};
#else
	ROM BYTE MPFS_Start[] = {DATACHUNK000000, DATACHUNK000001, DATACHUNK000002};
#endif


/**************************************************************
 * End of MPFS
 **************************************************************/
#endif // #if defined(STACK_USE_MPFS2)
#endif // #if !defined(MPFS_USE_EEPROM) && !defined(MPFS_USE_SPI_FLASH)

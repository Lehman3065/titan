#ifndef _MAINTITAN_H
#define _MAINTITAN_H
// Здесь структуры данных проекта (исключая стек))
// Железо описываем в "Configs/HWP Titan_ETH67.h"


#define BAUD_RATE       (19200)		// bps - скорость UART для связи с WIFI/GSM модулем

extern APP_CONFIG AppConfig;

void SaveAppConfig(const APP_CONFIG *AppConfig);

// Define a header structure for validating the AppConfig data structure in EEPROM/Flash
typedef struct
{
	unsigned short wConfigurationLength;	// Number of bytes saved in EEPROM/Flash (sizeof(APP_CONFIG))
	unsigned short wOriginalChecksum;		// Checksum of the original AppConfig defaults as loaded from ROM (to detect when to wipe the EEPROM/Flash record of AppConfig due to a stack change, such as when switching from Ethernet to Wi-Fi)
	unsigned short wCurrentChecksum;		// Checksum of the current EEPROM/Flash data.  This protects against using corrupt values if power failure occurs while writing them and helps detect coding errors in which some other task writes to the EEPROM in the AppConfig area.
} NVM_VALIDATION_STRUCT;


#endif // _MAINTITAN_H

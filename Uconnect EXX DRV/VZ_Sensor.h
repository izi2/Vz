#include "Types.h"

char Init_VZ_Sensor(uint_8 bist);
void VzSensor_ReadFWVer(void);
char  OpticDataOnSPI_ON(void);
char OpticDataCheckIfReady(void);
void OpticDataGetFrame_AllData(void);
void Vz_SetBist(char mode);
void OpticDataGetFrame_AllData(void);
void OpticDataGetFrame_VelocityOnly(void);
void OpticDataGetFrame_DistanceOnly(void);
void VzSensor_SpiWriteAddr(char target, unsigned int addr,char *TxBuffer,char TxBufferLength);
void VzSensor_SpiReadAddr(char target, unsigned int addr,char *RxBuffer,char RxBufferLength);
void OpticDataGetCleanBuffer(void);


enum VZ_Sensor_Names {Normal=0,Saw,Sinus};
#define Velocity_Print    0x01
#define Distance_Print    0x02
#define Mask_Print        0x04

#define VZ_Sensor_Reset       RST_MIKROBUS_MRXSTX5_Lat
#define VZ_Sensor_CS          CS_MIKROBUS_PWM7_Lat


//------------------------------------------------
// SPI
//------------------------------------------------
#define VZ_SPI_WRITE        0x1A // � write message
#define VZ_SPI_READ     0x1B // � read message

#define VZ_SPI_TARGET_INTERNAL        0x01 // � Internal chip register.
#define VZ_SPI_TARGET_PARAMETER        0x02 // � FW parameter.
#define VZ_SPI_TARGET_COMMAND         0x03 // �  FW command.
#define SPI_CHUNK        32
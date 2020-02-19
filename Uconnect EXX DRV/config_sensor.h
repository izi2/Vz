//
// Created by itziks on 16/02/2020.
//

#ifndef CONFIG_SENSOR_H
#define CONFIG_SENSOR_H

#define START_MEM  40
#define LENGTH_PARAMS_IN  15
#define LENGTH_NAME_NET  30
#define LENGTH_PASSWORD_NET  30
#define LENGTH_PORT_NET  8
#define LENGTH_SERVER_IP  20


#include "Types.h"
//#include "config_file.h"



typedef enum
{
    C_CHAR,
    C_UCHAR,
    C_16INT,
    C_U16INT,

}TypeMem;



typedef struct
{
    Mem_AddressType  address;
    Mem_AddressType  endAddress;
    TypeMem typeMem;


}propertySensor;


typedef struct
{
    propertySensor idS;
    propertySensor pointerLeaser;
    propertySensor transmitedToGatway;
    propertySensor sensorBist;
    propertySensor algoSelected;
    propertySensor paramsIn;
    propertySensor networkName;
    propertySensor networkPassword;
    propertySensor networkPort;
    propertySensor networkServerIp;

}ConfigSensor;

//typedef struct
//{
//    uint_8 idS;
//    uint_8 pointerLeaser;
//    uint_8 transmitedToGatway;
//    uint_8 sensorBist;
//    uint_8 algoSelected;
//    int_16 paramsOut[LENGTH_PARAMS_IN];
//    char networkName[LENGTH_NAME_NET];
//    char networkPassword[LENGTH_PASSWORD_NET];
//    char networkPort[LENGTH_PORT_NET];
//    char networkServerIp[LENGTH_SERVER_IP];
//
//}ConfigSensorValues;



void initConfigSensor(ConfigSensor * confSensor);
void saveDefultConfig(ConfigSensor * confSensor);
void saveInEEpromPropertyConfig(propertySensor* propertySens, void* value);
void readFromMemProperty(propertySensor* propertySens,void* dest);
//void readAllConfig(ConfigSensorValues)
char isFirstProgrammin();
char setFirstProgmmanigToFalse();
void initConfig();


#endif  /*CONFIG_SENSOR_H*/
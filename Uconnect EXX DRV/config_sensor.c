//
// Created by itziks on 16/02/2020.
//

#include "config_sensor.h"
#include "config_file.h"
#include "PIC_DRV_Uconnect.h"
#include "MCP23S17_DRV.h"
#include "ESP_12F_DRV.h"
#include "VZ_Sensor.h"

int_16 paramsDefult[LENGTH_PARAMS_IN] = {4000, 2000, 10, 10, 200};
int_16 ParamsIn[LENGTH_PARAMS_IN];
extern char CWJAP_String[];
extern char CIPSTART_String[];
extern char volatile EndUnitID;
extern char volatile AlgorithmTypeParametr;
extern char volatile PointerLeaser_Enable;
extern char volatile RawDataTX_Enable;
extern char volatile PlcDataTX_Enable;
extern char volatile SensorBist;

char NET_NAME_DEFULT[30] =   "Ravtech-Public\0"            ;
char NET_PASS_DEFULT[20] =  "@ravTech!\0"       ;
char NET_PORT_DEFULT[6] =  "9875\0"  ;
char NET_SERVER_IP_DEFULT[30] = "192.168.16.118\0"         ;


Mem_AddressType setAddressPropertyC(propertySensor *propertySens, Mem_AddressType address, uint_8 sizePerItem,
                                    uint_8 endPropertyAddress)
{
    uint_8 endAddress;
    propertySens->address = address;
    propertySens->typeMem = sizePerItem;
    endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
    propertySens->endAddress = address + endAddress;
    return propertySens->endAddress;
}

void initConfigSensor(ConfigSensor *confSensor)
{

    Mem_AddressType i;
    i = setAddressPropertyC(&confSensor->idS, START_MEM, C_UCHAR, 0);

    i = setAddressPropertyC(&confSensor->algoSelected, i, C_UCHAR, 0);

    i = setAddressPropertyC(&confSensor->pointerLeaser, i, C_UCHAR, 0);

    i = setAddressPropertyC(&confSensor->transmitedToGatway, i, C_UCHAR, 0);

    i = setAddressPropertyC(&confSensor->transmitRowData, i, C_UCHAR, 0);

    i = setAddressPropertyC(&confSensor->sensorBist, i, C_UCHAR, 0);

    i = setAddressPropertyC(&confSensor->paramsIn, i, C_16INT, LENGTH_PARAMS_IN * 2);

    i = setAddressPropertyC(&confSensor->networkName, i, C_UCHAR, LENGTH_NAME_NET);

    i = setAddressPropertyC(&confSensor->networkPassword, i, C_UCHAR, LENGTH_PASSWORD_NET);

    i = setAddressPropertyC(&confSensor->networkPort, i, C_UCHAR, LENGTH_PORT_NET);

    i = setAddressPropertyC(&confSensor->networkServerIp, i, C_UCHAR, LENGTH_SERVER_IP);

}

void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index)
{
    uint_8 i =0;

    for (i = propertySens->address; i < propertySens->endAddress;i++)
    {

        dest[index++] = GetProperty(i);
//        ++index;
    }
    PrintOut(PrintHandler, "\rdest %s, ", dest);


}


void saveInEEpromPropertyConfig(propertySensor *propertySens, void *value)
{
    Mem_AddressType i;

    uint_8 *tmp = (uint_8 *) value;
    for (i = propertySens->address; i < propertySens->endAddress; i++)
    {
        MemWrt(i, *tmp);
        ++tmp;
    }

}

void saveDefultConfig(ConfigSensor *confSensor)
{

    saveInEEpromPropertyConfig(&confSensor->idS, &EndUnitID);
    saveInEEpromPropertyConfig(&confSensor->algoSelected, &AlgorithmTypeParametr);
    saveInEEpromPropertyConfig(&confSensor->pointerLeaser, &PointerLeaser_Enable);
    saveInEEpromPropertyConfig(&confSensor->transmitRowData, &RawDataTX_Enable);
    saveInEEpromPropertyConfig(&confSensor->transmitedToGatway, &PlcDataTX_Enable);
    saveInEEpromPropertyConfig(&confSensor->sensorBist, &SensorBist);
    saveInEEpromPropertyConfig(&confSensor->paramsIn, paramsDefult);
    saveInEEpromPropertyConfig(&confSensor->networkName, &NET_NAME_DEFULT);
    saveInEEpromPropertyConfig(&confSensor->networkPassword, &NET_PASS_DEFULT);
    saveInEEpromPropertyConfig(&confSensor->networkPort, &NET_PORT_DEFULT);
    saveInEEpromPropertyConfig(&confSensor->networkServerIp,&NET_SERVER_IP_DEFULT );

}



char isFirstProgrammin()
{
    return GetProperty(0);
}

char setFirstProgmmanigToFalse()
{
    MemWrt(0, 0);
}

void Enable_VZ_Pointer(char mode)
{
    Read_Write_MCP23S17_IO(EN_LASER, mode);
}


void readFromMemProperty(propertySensor *propertySens, void *dest)
{
    Mem_AddressType i;

    uint_8 *tmp = (uint_8 *) dest;
    int_16 *tmpI = (int_16 *) dest;

    for (i = propertySens->address; i < propertySens->endAddress;)
    {
        if (propertySens->typeMem == C_16INT)
        {
            *tmpI = GetSignedIntProperty(i);
            i += 2;
            ++tmpI;
        }
        if (propertySens->typeMem == C_UCHAR)
        {
            *tmp = GetProperty(i);
            ++tmp;
            ++i;
        }
    }


}

void BildStringWifi(char *name, char *pass, char *ip, char *port)
{

    PrintOut(PrintHandler, "\rname %s, pass %s, ip %s, port %s;\n", name, pass, ip, port);
    strcpy(CWJAP_String, "AT+CWJAP=\"");
    strcat(CWJAP_String, name);
    strcat(CWJAP_String, "\",\"");
    strcat(CWJAP_String, pass);
    strcat(CWJAP_String, "\"\r\n");
    strcpy(CIPSTART_String, "AT+CIPSTART=\"TCP\",\"");
    strcat(CIPSTART_String, ip);
    strcat(CIPSTART_String, "\",");
    strcat(CIPSTART_String, port);
    strcat(CIPSTART_String, "\r\n");
    PrintOut(PrintHandler, "NET %s %s ", CWJAP_String, CIPSTART_String);
}

void LoadALLSchem(ConfigSensor *cS)
{
    LoadUnitId(cs);
    LoadAlgoSelected(cs);
    LoadPointerLeaser(cs);
    LoadParamsIn(cs);
    LoadWifi(cs);
    LoadTransmitedToGatway(cs);
    LoadSensorBist(cS);

}

void initConfig()
{
    uint_8 firstProgramm = 0;
    ConfigSensor cS;


    initConfigSensor(&cS);


    firstProgramm = isFirstProgrammin();
    firstProgramm = 1;

    if (firstProgramm)
    {
        saveDefultConfig(&cS);
        setFirstProgmmanigToFalse();
    }
    LoadALLSchem(&cS);


}

void LoadUnitId(ConfigSensor *cS)
{
    readFromMemProperty(&cS->idS, &EndUnitID);
}

void LoadAlgoSelected(ConfigSensor *cS)
{
    readFromMemProperty(&cS->algoSelected, &AlgorithmTypeParametr);

}

void LoadPointerLeaser(ConfigSensor *cS)
{
    readFromMemProperty(&cS->pointerLeaser, &PointerLeaser_Enable);
    Enable_VZ_Pointer(PointerLeaser_Enable);
}

void LoadParamsIn(ConfigSensor *cS)
{
    uint_8 i = 0;
    readFromMemProperty(&cS->paramsIn, &ParamsIn);
}

void LoadWifi(ConfigSensor *cS)
{
    char name_net[LENGTH_NAME_NET];
    char password_net[LENGTH_PASSWORD_NET];
    char port_net[LENGTH_PORT_NET];
    char server_ip_net[LENGTH_SERVER_IP];

    readFromMemProperty(&cS->networkName, &name_net);
    readFromMemProperty(&cS->networkPassword, &password_net);
    readFromMemProperty(&cS->networkPort, &port_net);
    readFromMemProperty(&cS->networkServerIp, &server_ip_net);
    BildStringWifi(name_net, password_net, server_ip_net, port_net);
    ConnectingToWifiNet();


}



void LoadTransmitedToGatway(ConfigSensor *cS)
{
    readFromMemProperty(&cS->transmitedToGatway, &PlcDataTX_Enable);
}

void LoadSensorBist(ConfigSensor *cS)
{
    readFromMemProperty(&cS->sensorBist, &SensorBist);
    Init_VZ_Sensor(SensorBist);
    PrintOut(PrintHandler, "\rSensorBist %d",SensorBist);
}
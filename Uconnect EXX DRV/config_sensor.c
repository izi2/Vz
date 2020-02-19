//
// Created by itziks on 16/02/2020.
//

#include "config_sensor.h"
#include "config_file.h"
#include "PIC_DRV_Uconnect.h"

int_16 paramsDefult[LENGTH_PARAMS_IN] = {4000,2000,10,10,200};
int_16 ParamsIn[LENGTH_PARAMS_IN];
int_16 ParamsOut[LENGTH_PARAMS_IN];
uint_8 ID_SENSOR;
uint_8 ALGO_SELECTED;
uint_8 POINTER_LEASER;

//char networkNameAnd_password[LENGTH_NAME_AND_PASSWORD] = "ryrtytytg fduftgugtutgf\0";

Mem_AddressType setAddressPropertyC(propertySensor* propertySens,Mem_AddressType address,uint_8 sizePerItem,uint_8 endPropertyAddress)
{
    uint_8 endAddress;
    propertySens->address = address;
    propertySens->typeMem = sizePerItem;
    endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
    propertySens->endAddress = address + endAddress;
    return propertySens->endAddress;
}


void initConfigSensor(ConfigSensor * confSensor)
{

    Mem_AddressType i;
    i = setAddressPropertyC(&confSensor->idS,START_MEM,C_UCHAR,0);

    i = setAddressPropertyC(&confSensor->algoSelected,i,C_UCHAR,0);

    i = setAddressPropertyC(&confSensor->pointerLeaser,i,C_UCHAR,0);

    i = setAddressPropertyC(&confSensor->sensorBist,i,C_UCHAR,0);

    i = setAddressPropertyC(&confSensor->paramsIn,i,C_16INT,LENGTH_PARAMS_IN*2);

    i = setAddressPropertyC(&confSensor->networkName,i,C_UCHAR,LENGTH_NAME_NET);

    i = setAddressPropertyC(&confSensor->networkPassword,i,C_UCHAR,LENGTH_PASSWORD_NET);

    i = setAddressPropertyC(&confSensor->networkPort,i,C_UCHAR,LENGTH_PORT_NET);

    i = setAddressPropertyC(&confSensor->networkServerIp,i,C_UCHAR,LENGTH_SERVER_IP);

}


void saveInEEpromPropertyConfig(propertySensor* propertySens, void* value)
{
    Mem_AddressType i;
    char * tmp = (char *) value;
    for(i=propertySens->address; i < propertySens->endAddress; i++)
    {
        MemWrt(i,*tmp);
        ++tmp;
    }

}

void saveDefultConfig(ConfigSensor * confSensor)
{
    saveInEEpromPropertyConfig(&confSensor->idS,0);
    saveInEEpromPropertyConfig(&confSensor->algoSelected,Algorithm_2);
    saveInEEpromPropertyConfig(&confSensor->pointerLeaser,1);
    saveInEEpromPropertyConfig(&confSensor->sensorBist,1);
    saveInEEpromPropertyConfig(&confSensor->paramsIn,paramsDefult);
    saveInEEpromPropertyConfig(&confSensor->networkName,"Ravtech-Public\0");
    saveInEEpromPropertyConfig(&confSensor->networkPassword,"@ravTech!\0");
    saveInEEpromPropertyConfig(&confSensor->networkPort,"9875\0");
    saveInEEpromPropertyConfig(&confSensor->networkServerIp,"192.168.1.25\0");

}

char isFirstProgrammin()
{
    return  GetProperty(0);
}

char setFirstProgmmanigToFalse()
{
    MemWrt(0,0);
}


void readFromMemProperty(propertySensor* propertySens,void* dest)
{
    Mem_AddressType i;

    uint_8 * tmp = (uint_8 *) dest;
    int_16 * tmpI = (int_16 *) dest;

    for(i=propertySens->address; i< propertySens->endAddress;)
    {
        if(propertySens->typeMem == C_16INT)
        {
            *tmpI = GetSignedIntProperty(i);
            i += 2;
            ++tmpI;
        }
        if(propertySens->typeMem == C_UCHAR)
        {
            *tmp = GetProperty(i);
            ++tmp;
            ++i;

        }

    }
}

void conectionToServer(char* name, char* pass, char* ip, char* port)
{
    PrintOut(PrintHandler,"\rname %s, pass %s, ip %s, port %s;\n",name,pass,ip,port);
}

void initConfig()
{
    uint_8 firstProgramm = 0;
    ConfigSensor cS;
    char name_net[LENGTH_NAME_NET];
    char password_net[LENGTH_PASSWORD_NET];
    char port_net[LENGTH_PORT_NET];
    char server_ip_net[LENGTH_SERVER_IP];
    
    initConfigSensor(&cS);

    
    firstProgramm = isFirstProgrammin();

    if(firstProgramm)
    {
        saveDefultConfig(&cS);
        setFirstProgmmanigToFalse();
    }
    readFromMemProperty(&cS.idS,&ID_SENSOR);
    readFromMemProperty(&cS.algoSelected,&ALGO_SELECTED);
    readFromMemProperty(&cS.pointerLeaser,&POINTER_LEASER);
    readFromMemProperty(&cS.paramsIn,&ParamsIn);
    readFromMemProperty(&cS.networkName,&name_net);
    readFromMemProperty(&cS.networkPassword,&password_net);
    readFromMemProperty(&cS.networkPort,&port_net);
    readFromMemProperty(&cS.networkServerIp,&server_ip_net);
    for(;firstProgramm < 8;firstProgramm++){
        PrintOut(PrintHandler,"\rParamsIn %d;\n",ParamsIn[firstProgramm]);
    }
    conectionToServer(name_net,password_net,server_ip_net,port_net);

}


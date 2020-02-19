//
// Created by itziks on 17/02/2020.
//

#include "Process_data.h"
#include "config_sensor.h"
#include "Bitset.h"
#include "PIC_DRV_Uconnect.h"




extern int_16 volatile paramsDefult[];
extern int_16 volatile ParamsIn[];
extern int_16 volatile ParamsOut[];
extern uint_8 volatile ID_SENSOR;
extern uint_8 volatile ALGO_SELECTED;
extern uint_8 volatile POINTER_LEASER;

uint_16 setHeaders(char* header, char* buffer, uint_16 index)
{
    header[H_TYPE_DATA] = (uint_8) buffer[index];
    header[H_LENGTH_DATA] = (uint_8) buffer[index+1];

    return index + LENGTH_HEADERS_CMD ;
}

uint_16 setData(char* datap, char* header, char* buffer, uint_16 index)
{
    uint_16 i = 0;
    for(;i < header[H_LENGTH_DATA];i++)
    {
        datap[i] = buffer[index];
        index++;
    }
    datap[i] = '\0';
    return index;
}

void insertParamsToParamsIn(char* datap,uint_8 len)
{
    uint_8 i = 0;
    int_16 value;
    for(;i < len;i += 2)
    {
        value = CombineSignedHighLow((uint_8) datap[i],(uint_8) datap[i+1]);

        if(value != -1)
        {
            ParamsIn[i/2] = value;
        }
    }
}
void parssData(char* buffer,int bufferLength)
{
    uint_8 HEADERS[LENGTH_HEADERS_CMD];
    char DATA[LENGTH_DATA_CMD];
    uint_16 i = 0;
    uint_8 t = 0;
    ConfigSensor cS;
    initConfigSensor(&cS);

    while(i < bufferLength)
    {
        i = setHeaders(HEADERS,buffer,i);
        i = setData(DATA,HEADERS,buffer,i);
        switch (HEADERS[H_TYPE_DATA])
        {
            case P_ID_SENSOR:
                ID_SENSOR = (uint_8) DATA[0];
                saveInEEpromPropertyConfig(&cS.idS,(uint_8)DATA[0]);
                break;
            case P_ALGO_SELECTED:
                ALGO_SELECTED = (uint_8) DATA[0];
                saveInEEpromPropertyConfig(&cS.algoSelected,(uint_8)DATA[0]);
                break;
            case P_NET_NAME:
                saveInEEpromPropertyConfig(&cS.networkName,(uint_8)DATA);
                break;
            case P_NET_PASS:
                saveInEEpromPropertyConfig(&cS.networkPassword,(uint_8)DATA);
                break;
            case P_NET_PORT:
                saveInEEpromPropertyConfig(&cS.networkPort,(uint_8)DATA);
                break;
            case P_NET_IP:
                saveInEEpromPropertyConfig(&cS.networkServerIp,(uint_8)DATA);
                break;
            case P_PARAMS:
                insertParamsToParamsIn(DATA,HEADERS[H_LENGTH_DATA]);
                saveInEEpromPropertyConfig(&cS.paramsIn,ParamsIn);
                break;

        }

    }
}
//
// Created by itziks on 17/02/2020.
//

#include "Process_data.h"
#include "config_sensor.h"
#include "Bitset.h"
#include "PIC_DRV_Uconnect.h"
#include "ESP_12F_DRV.h"


extern int_16 volatile ParamsIn[];
extern char volatile EndUnitID;

void sendStatus();

uint_16 setHeaders(char *header, char *buffer, uint_16 index)
{
    header[H_TYPE_DATA] = (uint_8) buffer[index];
    header[H_LENGTH_DATA] = (uint_8) buffer[index + 1];



    return index + LENGTH_HEADERS_CMD;
}

uint_16 setData(char *datap, char *header, char *buffer, uint_16 index)
{
    uint_16 i = 0;
    for (; i < header[H_LENGTH_DATA]; i++)
    {
        datap[i] = buffer[index];
        index++;
    }
    datap[i] = '\0';
    return index;
}

void insertParamsToParamsIn(char *datap, uint_8 len)
{
    uint_8 i = 0;
    int_16 value;
    for (; i < len; i += 2)
    {
        value = CombineSignedHighLow((uint_8) datap[i], (uint_8) datap[i + 1]);

        if (value != -1)
        {
            ParamsIn[i / 2] = value;
        }
    }
}

char* AddHeaders(uint_8 type,propertySensor* proper, char* dataS,uint_8 index)
{
    uint_8 len = proper->endAddress - proper->address;
    dataS[index++] = EndUnitID;
    dataS[index++] = 0;
    dataS[index++] = len;
    dataS[index++] = type;

    return index;

}


void parssData(char *buffer, int bufferLength)
{
    uint_8 HEADERS[LENGTH_HEADERS_CMD];
    char DATA[LENGTH_DATA_CMD];
    uint_8 changesInNet = 0;
    uint_16 i = 0;
    ConfigSensor cS;
    initConfigSensor(&cS);
    while (i < bufferLength)
    {
        i = setHeaders(HEADERS, buffer, i);
        i = setData(DATA, HEADERS, buffer, i);

        PrintOut(PrintHandler, "\rlen %d, type %d", HEADERS[H_LENGTH_DATA], HEADERS[H_TYPE_DATA]);
        switch (HEADERS[H_TYPE_DATA])
        {
            case P_ID_SENSOR:
                saveInEEpromPropertyConfig(&cS.idS, &DATA[0]);
                LoadUnitId(&cS);
                break;
            case P_ALGO_SELECTED:
                saveInEEpromPropertyConfig(&cS.algoSelected, &DATA[0]);
                LoadAlgoSelected(&cS) ;
                break;

            case P_TRANSMITED_TO_GATWAY:
                saveInEEpromPropertyConfig(&cS.transmitedToGatway, &DATA[0]);
                LoadTransmitedToGatway(&cS);
                break;
            case P_POINTER_LEASER:
                saveInEEpromPropertyConfig(&cS.pointerLeaser, &DATA[0]);
                LoadPointerLeaser(&cS)  ;
                break;

            case P_NET_NAME:
                saveInEEpromPropertyConfig(&cS.networkName, DATA);
                changesInNet = 1;
                break;

            case P_NET_PASS:
                saveInEEpromPropertyConfig(&cS.networkPassword, DATA);
                changesInNet = 1;
                break;
            case P_NET_PORT:
                saveInEEpromPropertyConfig(&cS.networkPort, DATA);
                changesInNet = 1;
                break;
            case P_NET_IP:
                saveInEEpromPropertyConfig(&cS.networkServerIp, DATA);
                changesInNet = 1;
                break;
            case P_PARAMS:
                insertParamsToParamsIn(DATA, HEADERS[H_LENGTH_DATA]);
                saveInEEpromPropertyConfig(&cS.paramsIn, ParamsIn);
                break;
            case P_STATUS:
                sendStatus();
                break;

        }
        if (changesInNet)
        {
            LoadWifi(&cS);
        }

    }


}

void sendStatus()
{
    ConfigSensor cS;
    char dataSend[LENGTH_STATUS_DATA_SEND];
    uint_8 index = dataSend;

    readEEpromRawData(&cS.idS, dataSend,index);
    index = AddHeaders(P_ID_SENSOR,&cS.idS,dataSend,index);

    readEEpromRawData(&cS.pointerLeaser, dataSend,index);
    index = AddHeaders(P_POINTER_LEASER,&cS.pointerLeaser,dataSend,index);

    readEEpromRawData(&cS.transmitedToGatway, dataSend,index);
    index = AddHeaders(P_TRANSMITED_TO_GATWAY,&cS.transmitedToGatway,dataSend,index);
    readEEpromRawData(&cS.transmitRowData, dataSend,index);
    index = AddHeaders(P_TRANSMITED_TO_GATWAY,&cS.transmitRowData,dataSend,index);
    readEEpromRawData(&cS.paramsIn, dataSend,index);
    index = AddHeaders(P_PARAMS,&cS.paramsIn,dataSend,index);
    readEEpromRawData(&cS.networkName, dataSend,index);
    index = AddHeaders(P_NET_NAME,&cS.networkName,dataSend,index);
    readEEpromRawData(&cS.networkPassword, dataSend,index);
    index = AddHeaders(P_NET_PASS,&cS.networkPassword,dataSend,index);

    readEEpromRawData(&cS.networkPort, dataSend,index);
    index = AddHeaders(P_NET_PORT,&cS.networkPort,dataSend,index);

    readEEpromRawData(&cS.networkServerIp, dataSend,index);
    index = AddHeaders(P_NET_IP,&cS.networkServerIp,dataSend,index);
    PrintOut(PrintHandler, "\ri %d, ", index);
    WIFI_Send_One_Array_Not_Wait_To_OK(dataSend,index);



}
//
// Created by itziks on 17/02/2020.
//

#include "Process_data.h"
#include "config_sensor.h"
#include "Bitset.h"
#include "PIC_DRV_Uconnect.h"
#include "ESP_12F_DRV.h"
#include "Vz_Algorithm.h"


extern int_16 volatile ParamsIn[];
extern char volatile EndUnitID;
//int_16 ParamsIn[LENGTH_PARAMS_IN];
extern char CWJAP_String[];
extern char CIPSTART_String[];
extern char volatile AlgorithmTypeParametr;
extern char volatile PointerLeaser_Enable;
extern char volatile RawDataTX_Enable;
extern char volatile PlcDataTX_Enable;
extern char volatile SensorBist;
extern char volatile SendMeRawData;

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

char* AddHeaders(uint_8 type,uint_8 length, char* dataS,uint_8 index)
{
//    uint_8 len = proper->endAddress - proper->address;
    dataS[index++] = EndUnitID;
    dataS[index++] = 0;
    dataS[index++] = length;
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

            case P_TRANSMITED_ROW_DATA:
                saveInEEpromPropertyConfig(&cS.transmitRowData, &DATA[0]);
                LoadTransmitedToGatway(&cS);
                break;

            case P_POINTER_LEASER:
                saveInEEpromPropertyConfig(&cS.pointerLeaser, &DATA[0]);
                LoadPointerLeaser(&cS)  ;
                break;


            case P_SENSOR_BIST:
                saveInEEpromPropertyConfig(&cS.sensorBist, &DATA[0]);
                LoadSensorBist(&cS);
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

            case P_GET_RAW_DATA:
                SendMeRawData = DATA[0];
                PrintOut(PrintHandler, "\rSendMeRawData %d",SendMeRawData);
                break;

        }
        if (changesInNet)
        {
            LoadWifi(&cS);
        }

    }


}

uint_8 lenParams()
{
    switch (AlgorithmTypeParametr)
    {
        case Algo_2:
            return algo2_params_in_size;

        case Algo_3_4:
            return  algo_3_4_params_in_size;
        case Algo_5:
            return algo5_params_in_size;
        case No_Algo:
            return 0;
    }
}

uint_8 addStringData(propertySensor* propertyRead,uint_8 typeData, char* dataSend,uint_8 index)
{
    char tempData[50];
    uint_8 lenData = 0;
    uint_8 i = 0;
    readEEpromRawData(propertyRead, tempData,0);
    lenData = strlen(tempData);
    index = AddHeaders(typeData,lenData,dataSend,index);

    for(i=0;i<lenData;i++)
    {
        dataSend[index++] = tempData[i];
    }

    return index;
}

void sendStatus()
{
    ConfigSensor cS;
    uint_8 i = 0;
    char dataSend[LENGTH_STATUS_DATA_SEND];
    uint_8 index = 0;
    uint_8 lenData = 0;
    char tempData[30];

    initConfigSensor(&cS);

    index = AddHeaders(P_ID_SENSOR,1,dataSend,index);
    dataSend[index++] = EndUnitID;

    index = AddHeaders(P_POINTER_LEASER,1,dataSend,index);
    dataSend[index++] = PointerLeaser_Enable;


    index = AddHeaders(P_TRANSMITED_TO_GATWAY,1,dataSend,index);
    dataSend[index++] = PlcDataTX_Enable;

    index = AddHeaders(P_TRANSMITED_ROW_DATA,1,dataSend,index);
    dataSend[index++] = RawDataTX_Enable;

    index = AddHeaders(P_ALGO_SELECTED,1,dataSend,index);
    dataSend[index++] = AlgorithmTypeParametr - 2;

    index = AddHeaders(P_SENSOR_BIST,1,dataSend,index);
    dataSend[index++] = SensorBist;


    lenData = lenParams();
    if(lenData)
    {
        index = AddHeaders(P_PARAMS,lenData*2,dataSend,index);
        for(;i< lenData;i++)
        {
            index =  Int2Array(ParamsIn[i], dataSend,  index);
        }
    }

    index = addStringData(&cS.networkName,P_NET_NAME,dataSend,index);
    index = addStringData(&cS.networkPassword,P_NET_PASS,dataSend,index);
    index = addStringData(&cS.networkPort,P_NET_PORT,dataSend,index);
    index = addStringData(&cS.networkServerIp,P_NET_IP,dataSend,index);

    WIFI_Send_One_Array_Not_Wait_To_OK(dataSend,index);



}
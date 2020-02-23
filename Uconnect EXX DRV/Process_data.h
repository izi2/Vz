//
// Created by itziks on 17/02/2020.
//

#ifndef UCONNECT_EXX_DRV_3_PROCESS_DATA_H
#define UCONNECT_EXX_DRV_3_PROCESS_DATA_H


#include "config_sensor.h"

#define LENGTH_HEADERS_CMD  2
#define LENGTH_DATA_CMD  40

#define LENGTH_STATUS_DATA_SEND  300

typedef enum
{
    H_TYPE_DATA,
    H_LENGTH_DATA
}type_headers;


typedef enum
{
    P_POINTER_LEASER = 6,
    P_TRANSMITED_TO_GATWAY,
    P_SENSOR_BIST,
    P_RTC_UPDATE,
    P_ALGO_SELECTED,
    P_PARAMS,
    P_NET_NAME,
    P_NET_PASS,
    P_NET_PORT,
    P_NET_IP,
    P_ID_SENSOR,
    P_TRANSMITED_ROW_DATA,
    P_STATUS,
    P_BYTES_FROM_SENS,
    P_GET_RAW_DATA,


}type_data;

void parssData(char* buffer,int bufferLength);
void BildStringWifi(char* name, char* pass, char* ip, char* port);

#endif //UCONNECT_EXX_DRV_3_PROCESS_DATA_H

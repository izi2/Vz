//
// Created by itziks on 17/02/2020.
//

#ifndef UCONNECT_EXX_DRV_3_PROCESS_DATA_H
#define UCONNECT_EXX_DRV_3_PROCESS_DATA_H

#define LENGTH_HEADERS_CMD  2
#define LENGTH_DATA_CMD  40

typedef enum
{
    H_TYPE_DATA,
    H_LENGTH_DATA
}type_headers;


typedef enum
{
    P_POINTER_LEASER = 3,
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
    P_BYTES_FROM_SENS,


}type_data;

void parssData(char* buffer,int bufferLength);

#endif //UCONNECT_EXX_DRV_3_PROCESS_DATA_H

#define    WifiConnectionLimit       400   //*10 = sec
#include "Types.h"

char Init_ESP(void);
char CheckWifiConnection(void);
char WifiConnectionProcess(void);
void SendAtCommandToEsp(char *buff);
char WIFI_Send_One_Array(char *m_data,  unsigned int len);
char ConnectToServer(void);
char CheckGettingIP(void);
void Fifo_Head_Update(void);
void Fifo_Tail_Update(void);
void Wifi_Transmit_State_Machine(char *VzSensorArray);
void SendLongArrayToSC16IS740(char *m_data,unsigned int len);
void Convertvector(char *BuffIn,char *BuffOut);

#define State_Machine_Start               0
#define Fifo_Matrix_Num_Of_Row            14
#define Fifo_Matrix_Num_Of_Column         120
#define Fifo_Half_Length                  7

#define Packet_Vz_Sensor_Data_Length      Fifo_Matrix_Num_Of_Column*Fifo_Half_Length


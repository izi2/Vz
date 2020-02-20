#define    WifiConnectionLimit       600   //*10 = sec
#include "Types.h"
int GetWifiRssi(void);
void ESP_Testing_Func(void);
char Init_ESP(void);
char CheckWifiConnection(void);
char ConnectingToWifiNet(void);
void SendAtCommandToEsp(char *buff);
char WIFI_Send_One_Array(char *m_data,  unsigned int len);
char WIFI_Send_One_Array_Not_Wait_To_OK(char *m_data,  unsigned int len);
char ConnectToServer(void);
char CheckGettingIP(void);
void ESP_Testing_Vz_Demo(void);
char *PullDataFromIDP(int *length,char *Buff);
char GetEspData(unsigned long TimeOut_uSec_Start);
char CheckDataFromGateway(void);
char ReConnectToServer(void);
void RunAlgorithmAndBuiledTxParametersPacket(void);
void AddRawDataToWifiBuffer(void);

#define ESP_RX_Buffer_Length            600
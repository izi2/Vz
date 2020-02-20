#include <string.h>
#include <stdio.h>
#include "PIC_DRV_Uconnect.h"
#include "SC16IS740_DRV.h"
#include "ESP_12F_DRV.h"
#include "MCP23S17_DRV.h"
#include "Types.h"
#include "Bitset.h"
#include "VZ_Sensor.h"
#include "Vz_Algorithm.h"

//#define debug
//#define SSID_String "AT+CWJAP=\"UC-timurim\",\"0544916811\"\r\n"
//#define SSID_String "AT+CWJAP=\"Dror\",\"0544916811\"\r\n"
//#define SSID_String "AT+CWJAP=\"Ravtech-Public\",\"@ravTech!\"\r\n"
//#define Server_IP_String  "AT+CIPSTART=\"TCP\",\"192.168.16.118\",9875\r\n"
//#define Server_IP_String  "AT+CIPSTART=\"TCP\",\"192.168.43.249\",9875\r\n"
char volatile Wifi_TX_Buffer[1000];
char volatile ESP_RX_Buffer[ESP_RX_Buffer_Length];
char volatile ESP_GateWay_Buffer[ESP_RX_Buffer_Length];
unsigned int  Gateway_Buffer_Length;
char volatile Data_From_Gateway_Flag=FALSE;
unsigned int volatile  WifiBufferLength=0;
char CWJAP_String[150];
char CIPSTART_String[150];
char EndUnitID=0;
extern char volatile AlgorithmTypeParametr;
extern char volatile Algo_Parametrs_Out_Buffer[];
extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];


//*****************************************************************************************************
char Init_ESP(void)
{
    PrintOut(PrintHandler, "\rInit ESP(WIFI)...");
    Read_Write_MCP23S17_IO(ESP_EN_PIN, OFF);
    Read_Write_MCP23S17_IO(ESP_FLASH, ON);
    Delay_ms(300);
    Read_Write_MCP23S17_IO(ESP_EN_PIN, ON);
    Read_Write_MCP23S17_IO(ESP_RESET, OFF);
    Delay_ms(200);
    Read_Write_MCP23S17_IO(ESP_RESET, ON);
    Delay_ms(2000);
    Pseudo_Uart1_Enable(ON);
    Pseudo_Uart1_Write_Text("ATE0\r\n");
    Delay_ms(5);
    Pseudo_Uart1_Write_Text("ATE0\r\n");
    Delay_ms(5);
    Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
    Delay_ms(5);
    Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
    Delay_ms(5);
    Pseudo_Uart1_Enable(OFF);
    SendAtCommandToEsp("ATE0\r\n");
    GetEspData(1000);
    SendAtCommandToEsp("AT+CIPDINFO=0\r\n");
    GetEspData(1000);
    SendAtCommandToEsp("ATE0\r\n");
    GetEspData(1000);
    if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
    SendAtCommandToEsp("ATE0\r\n");
    GetEspData(1000);
    if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
    SendAtCommandToEsp("ATE0\r\n");
    GetEspData(1000);
    if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
    PrintOut(PrintHandler, "\rFailed To Init ESP!!!");
    return 0;
    
    EspInit_OK:
    PrintOut(PrintHandler, "\rESP successfully initialized");
    return 1;
}
//*****************************************************************************************************
char ConnectToServer(void)
{
   SendAtCommandToEsp(CIPSTART_String);
   GetEspData(5000000);
   if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
   #ifdef debug
   PrintOut(PrintHandler, "\rFailed To Connect To Server ; Trying Again");
   #endif
   SendAtCommandToEsp(CIPSTART_String);
   GetEspData(5000000);
   if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
   #ifdef debug
   PrintOut(PrintHandler, "\rFailed To Connect To Server!!!");
   #endif
   return 0;
}
//*****************************************************************************************************
char CheckGettingIP(void)
{
     PrintOut(PrintHandler, ".");
     SendAtCommandToEsp("AT+CIPSTATUS\r\n");
     GetEspData(1000);
     if(strstr(ESP_RX_Buffer,"S:2")) return 1;
     else return 0;
}
//*****************************************************************************************************
char CheckWifiConnection(void)
{
   //run time = 1msec
   SendAtCommandToEsp("AT+CIPSTATUS\r\n");
   if(GetEspData(1000)==2) return 1;
   if(strstr(ESP_RX_Buffer,"S:3")) return 1;
   else return 0;
}
//*****************************************************************************************************
char ConnectingToWifiNet(void)
{
    int i=0;
    char cTemp;
    const char LoopLimit=10;
    unsigned long ulTemp=0;
    asm clrwdt;
    PrintOut(PrintHandler, "\rWifi Connection Process...");
    SendAtCommandToEsp("AT+CWMODE=1\r\n");
    GetEspData(1000);
    SendAtCommandToEsp("AT+CIPMUX=0\r\n");
    GetEspData(1000);
    PrintOut(PrintHandler, "\rWaiting For IP...");
    SendAtCommandToEsp(CWJAP_String);
    while(ulTemp++<8000)
    {
        GetEspData(1000);
        if(strstr(ESP_RX_Buffer,"GOT IP")) break;
    }
    if(ulTemp>=8000) {PrintOut(PrintHandler, "\rFailed To Get IP"); return 0;}
    PrintOut(PrintHandler, "\rGeting IP Address Successfully");
    delay_ms(2000);
    if(i=GetWifiRssi()) PrintOut(PrintHandler, "\rRSSI: %ddbm",i);
    else PrintOut(PrintHandler, "\rFailed To Get RSSI");
    PrintOut(PrintHandler, "\rConnecting To Server...");
    if(!ConnectToServer())
    {
        if(!ConnectToServer())
        {
            PrintOut(PrintHandler, "\rFailed To Connect To Server!!!");
            return 0;
        }
    }
    PrintOut(PrintHandler, "\rConnected To Server Successfully");
    LED_Activation(LED_RED,LED_ON);
    return 1;
}
//*****************************************************************************************************
int GetWifiRssi(void)
{
    //+CWJAP:"Dror","40:d3:ae:cc:6a:6e",6,-50
    //OK
    char *p,i=0,str[10];
    SendAtCommandToEsp("AT+CWJAP?\r\n");
    GetEspData(1000);
    if(!(p=strstr(ESP_RX_Buffer,"-"))) return 0;
    while((p[i]!='\r')&&(i<5)) str[i]=p[i++];
    if(i>=5) return 0;
    str[i]=0;
    return atoi(str);
}
//*****************************************************************************************************
void SendAtCommandToEsp(char *buff)
{
    unsigned int i=0;
    #ifdef debug
         PrintOut(PrintHandler,"\rMCU:%s",buff);
    #endif
    while(buff[i]!=0)
    {
      Uart1_Write(buff[i]);
      i++;
    }
}
//*****************************************************************************************************
char WIFI_Send_One_Array(char *m_data,  unsigned int len)
{
    char cmd[100],cTemp=0;
    unsigned int i;
    SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
    GetEspData(1000);
    sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
    SendAtCommandToEsp(cmd);
    GetEspData(1000);
    if(!strstr(ESP_RX_Buffer,">")) return 0;
    for(i=0;i<len;i++) Uart1_Write(m_data[i]);
    SCL_Lat=1;
    while(cTemp++<10)
    {
       GetEspData(10000);
       if(strstr(ESP_RX_Buffer,"OK")) break;
    }
    if(cTemp>=10) return 0;
    SCL_Lat=0;
    return 1;

}
//*****************************************************************************************************
char WIFI_Send_One_Array_Not_Wait_To_OK(char *m_data,  unsigned int len)
{
    // run time for 400 bytes=3.8msec ; 300bytes=3.3msec  ; 780Bytes=5.6msec  ; 840Bytes=6msec
    char cmd[100];
    unsigned int i;
    SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
    GetEspData(1000);
    sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
    SendAtCommandToEsp(cmd);
    GetEspData(1000);
    if(!strstr(ESP_RX_Buffer,">")) return 0;
    for(i=0;i<len;i++) Uart1_Write(m_data[i]);
    return 1;
}
//*****************************************************************************************************
void ESP_Testing_Func(void)
{

   unsigned int BufferLength=140,i,NumOfTx=5;
   char buffer[2048];
   PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
   for(i=0;i<BufferLength;i++) buffer[i]=0xAA;
   for(i=0;i<NumOfTx;i++)
   {
     SCL_Lat=1;
               //WIFI_Send_One_Array_Not_Wait_To_OK(Buffer,BufferLength);
               WIFI_Send_One_Array(Buffer,BufferLength);
     SCL_Lat=0;
     //Delay_ms(200);
   }
   PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,BufferLength,(unsigned long)((unsigned long)NumOfTx*(unsigned long)BufferLength));

}
//***********************************************************
void ESP_Testing_Vz_Demo(void)
{

   unsigned int vz[60],i,j,k,NumOfTx=0,uiTemp,WifiCounter=0,LedOut=0,LedCount,NumOfCycle=30;
   char Wifi_Buffer[2048],cTemp;
   char SamplingCounter=0;
   PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
   for(i=0;i<60;i++) vz[i]=300+i;
   for(k=0;k<NumOfCycle;k++)
   {
     asm clrwdt;
     //OpticDataCheckIfReady();OpticDataGetCleanBuffer();
     if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);} //run time 30uSec
     if(SamplingCounter==0)
     {
          j=0;
          Wifi_Buffer[j++]=1;//ID
          Wifi_Buffer[j++]=0;//Length MSB
          Wifi_Buffer[j++]=120;//Length LSB
          Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
          for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
          Wifi_Buffer[j++]=1;//ID
          Wifi_Buffer[j++]=0;//Length MSB  PLC
          Wifi_Buffer[j++]=20;//Length LSB
          Wifi_Buffer[j++]=0x04;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
          for(i=0;i<20;i++) Wifi_Buffer[j++];
          SamplingCounter++;
     }
     else
     {
               Wifi_Buffer[j++]=1;//ID
               Wifi_Buffer[j++]=0;//Length MSB
               Wifi_Buffer[j++]=120;//Length LSB
               Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
               for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
               SamplingCounter++;
               if(SamplingCounter==5)
               {
                 uiTemp=j;
                 NumOfTx++;
                 //cTemp=ESP_RX_Int_En;
                 //ESP_RX_Int_En=0;
                 WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_Buffer,j);
                 //if(cTemp) {ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;}
                 SamplingCounter=0;
               }
     }
     Delay_ms(10);
     //CheckRxDataFromInterruptESP();
     if(WifiCounter++>WifiConnectionLimit)
      {
            WifiCounter=0;
            if(CheckWifiConnection()==0)
            {
                SendAtCommandToEsp("+++");
                PrintOut(PrintHandler, "\rWIFI Connection Not OK!");
                //cTemp=ESP_RX_Int_En;
                //ESP_RX_Int_En=0;
                if(!ConnectToServer())
                if(!ConnectToServer()) ConnectToServer();
                if(!CheckWifiConnection())
                    if(!CheckWifiConnection())
                      if(!CheckWifiConnection())
                      {
                         if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);}
                         ConnectingToWifiNet();
                      }
                //if(cTemp) {ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;}
            }
      }
   }
   Read_Write_MCP23S17_IO(USER_LED,ON);
   PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,uiTemp,(unsigned long)((unsigned long)NumOfTx*(unsigned long)uiTemp));
}

//***********************************************************
char *PullDataFromIDP(int *length,char *Buff)
{
   //ex - if(p1=PullDataFromIDP(&i,Buff)) PrintOut(PrintHandler, "\rLength:%d\rData:%s",i,p1);
   char i,*p1,*p2,text[10];
   if(strstr(Buff,"+IPD"))
   {
       //+IPD,4:dror
          p1=strstr(Buff,"+IPD,");
          p2=strstr(p1,":");
          if((p1)&&(p2))
          {
             i=5;
             while(p1[i]!=':')
             {
                text[i-5]=p1[i++];
             }
             text[i-5]=0;
             *length=atoi(text);
             p2++;
             return p2;
          }
          else return 0;
    }
}
//*****************************************************************************************************
char CheckDataFromGateway(void)
{
      char *p;
      int i;
      if((ESP_RX_Int_Flag)&&(strstr(ESP_RX_Buffer,"+IPD")))
      {
             if(!(p=PullDataFromIDP(&Gateway_Buffer_Length,ESP_RX_Buffer))) {Data_From_Gateway_Flag=FALSE;return 0;}
             Data_From_Gateway_Flag=TRUE;
             for(i=0;i<Gateway_Buffer_Length;i++) ESP_GateWay_Buffer[i]=p[i];
             #ifdef debug
                 PrintOut(PrintHandler, "\rGateway Buffer-Length:%d\rData:",Gateway_Buffer_Length);
                 for(i=0;i<Gateway_Buffer_Length;i++) Uart2_Write(ESP_GateWay_Buffer[i]);
             #endif
             U1STAbits.OERR=0;
             ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
             return 1;
      }
      else return 0;
}
//*****************************************************************************************************
char GetEspData(unsigned long TimeOut_uSec_Start)
{
         unsigned long ulTemp=0;
         //run time for ATE0\r\n Command=380usec
         if(CheckDataFromGateway()) return 2;
         else {ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;}
         while((ulTemp++<TimeOut_uSec_Start)&&(ESP_RX_Int_Flag==0)) {asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;} //For correct TIME OUT
         U1STAbits.OERR=0;
         if(ESP_RX_Int_Flag)
         {
            if(CheckDataFromGateway()) return 2;
            #ifdef debug
             PrintOut(PrintHandler,"\rESP:%s",ESP_RX_Buffer);
            #endif
            ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
            return 1;
         }
         ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
         return 0;
}
//*****************************************************************************************************
char ReConnectToServer(void)
{
    {
        LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);
        SendAtCommandToEsp("+++");
        if(!ConnectToServer())
            if(!ConnectToServer())
                if(!ConnectToServer()) ConnectToServer();
        if(!CheckWifiConnection())
            if(!CheckWifiConnection())
                if(!CheckWifiConnection())
                {
                    return ConnectingToWifiNet();
                }
        LED_Activation(LED_RED,LED_ON);LED_Activation(LED_GREEN,LED_ON);
        return 1;
    }
}
//*****************************************************************************************************
void RunAlgorithmAndBuiledTxParametersPacket(void)
{
    unsigned int i;
    switch (AlgorithmTypeParametr)
    {
        case No_Algo:
             OpticDataGetCleanBuffer();
             return;
            break;
        case Algo_2:
            Vz_Algorithm_2();
            if(Algo_Parametrs_Out_Buffer[0])
            {
                WifiBufferLength++;
                Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
                Wifi_TX_Buffer[WifiBufferLength++]=0;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_2_Buffer_Length;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_2;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[1];
                Wifi_TX_Buffer[WifiBufferLength]=Algo_Parametrs_Out_Buffer[2];
            }
            break;
        case Algo_3_4:
            Vz_Algorithm_3_4();
            if(Algo_Parametrs_Out_Buffer[0])
            {
                Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
                Wifi_TX_Buffer[WifiBufferLength++]=0;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_3_4_Buffer_Length;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_3_4;
                for(i=1;i<=Algo_3_4_Buffer_Length;i++) Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[i];
            }
            break;
        case Algo_5:
            Vz_Algorithm_5();
            if(Algo_Parametrs_Out_Buffer[0])
            {
                Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
                Wifi_TX_Buffer[WifiBufferLength++]=0;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_5_Buffer_Length;
                Wifi_TX_Buffer[WifiBufferLength++]=Algo_5;
                for(i=1;i<=Algo_5_Buffer_Length;i++) Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[i];
            }
            break;
    }
}
//*****************************************************************************************************
void AddRawDataToWifiBuffer(void)
{
      char i;
      if(AlgorithmTypeParametr==No_Algo)
      {
                   OpticDataGetFrame_AllData(void);
                   Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
                   Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
                   Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
                   Wifi_TX_Buffer[WifiBufferLength++]=0;// Velocity=0(bit 0)/Distance=1(bit 1)
                   for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
                   Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
                   Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
                   Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
                   Wifi_TX_Buffer[WifiBufferLength++]=1;// Velocity=0(bit 0)/Distance=1(bit 1)
                   for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Distance_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
                   return;

      }
      else if(AlgorithmTypeParametr==Algo_5)
      {
                  Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
                  Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
                  Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
                  Wifi_TX_Buffer[WifiBufferLength++]=1;// Velocity=0(bit 0)/Distance=1(bit 1)
                  for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Distance_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
                  return;
      }
      else
      {          Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
                 Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
                 Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
                 Wifi_TX_Buffer[WifiBufferLength++]=0;// Velocity=0(bit 0)/Distance=1(bit 1)
                 for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
                 return;
      }
}
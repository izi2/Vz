#include "PIC_DRV_Uconnect.h"
#include "VZ_Sensor.h"
#include "Debug_Drv.h"
#include "Vz_Algorithm.h"
#include "SC16IS740_DRV.h"
#include "MCP23S17_DRV.h"
#include "SRAM_IS62WVS5128GBLL_DRV.h"
#include "ESP_12F_DRV.h"
//#include "Types.h"
//#include "Bitset.h"
#include "config_sensor.h"
#include "Config_File.h"
#include "Process_data.h"
extern char volatile Wifi_TX_Buffer[];
extern unsigned int volatile  WifiBufferLength;
extern char volatile UART2_RX_Interrupt_Buffer[];
extern char volatile ESP_GateWay_Buffer[];
extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];
extern char volatile ESP_RX_Buffer[];
extern char volatile Data_From_Gateway_Flag;
extern unsigned int  Gateway_Buffer_Length;
void Init_uClick_VZ(void);
//void Enable_VZ_Pointer(char mode);
char volatile VZ_ON_Flag;
char volatile Wifi_Buffer[1000];
char volatile wifi_state=0;
char RawDataTX_Enable=FALSE;
char PlcDataTX_Enable=TRUE;
char PointerLeaser_Enable=FALSE;
extern char CWJAP_String[];
extern char CIPSTART_String[];
extern char volatile AlgorithmTypeParametr;

//*****************************************************************************************************
void main()
{
   char LedCount=0,LedOut=0,OpticDataFlag;
   unsigned int WifiCounter=0,VZCounter=0,i,SamplingCounter=0,k;
   ////////////////////////////////////////////////////////////////////////////////////
   BoardInit();
   ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
   LED_Activation(LED_GREEN,LED_ON);
   Init_uClick_VZ();
    ////////////    First Time Programming  ////////
   ConfigFileInit(ExtEeprom_WriteByte,ExtEeprom_ReadByte);
   initConfig();

   //if(!(VZ_ON_Flag=Init_VZ_Sensor())){Read_Write_MCP23S17_IO(USER_LED,OFF);}
   //VzSensor_ReadFWVer();

    if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);wifi_state=0;}
    else wifi_state=ConnectingToWifiNet();

   PrintOut(PrintHandler, "\r***** S T A R T - M a i n *******");
   while(TRUE)
   {
       asm clrwdt;
       /****************************************************************************************************************************************/
       /// Getting Data From Sensor evrey 10msec
       if(VZ_ON_Flag)
       {
           while((!(OpticDataFlag=OpticDataCheckIfReady()))&&(VZCounter++<15000)) {asm clrwdt;Delay_us(1);}
           if(OpticDataFlag)
           {
               SCL_Lat^=1;
               if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);} //run time 30uSec
               /////////////////////////////////////////////////////////////////////
               //running algo
               if((AlgorithmTypeParametr!=No_Algo)||((AlgorithmTypeParametr==No_Algo)&&(RawDataTX_Enable==FALSE))) RunAlgorithmAndBuiledTxParametersPacket();
               if(RawDataTX_Enable==TRUE) AddRawDataToWifiBuffer();



               if(WifiBufferLength)
               {
                   WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_TX_Buffer,WifiBufferLength);
                   WifiBufferLength=0;
               }
               /////////////////////////////////////////////////////////////////////
           }
           else OpticDataGetCleanBuffer();
       }
       else Delay_ms(10);
       VZCounter=0;
       /****************************************************************************************************************************************/
       //checking receiving data from gateway
       if(Data_From_Gateway_Flag)
       {
//           PrintOut(PrintHandler, "\rGateway Buffer-Length:%d\rData:",Gateway_Buffer_Length);
//          for(i=0;i<Gateway_Buffer_Length;i++) PrintOut(PrintHandler,"char %d",(uint_8)ESP_GateWay_Buffer[i]);
           parssData(ESP_GateWay_Buffer, Gateway_Buffer_Length);
           /////////////////////////////////////

           /////////////////////////////////////
           Data_From_Gateway_Flag=FALSE;
       }
       /****************************************************************************************************************************************/
       /// Checking WIFI Connection
       if(WifiCounter++>WifiConnectionLimit)
       {
           WifiCounter=0;
           if(CheckWifiConnection()==0) wifi_state= ReConnectToServer();
       }
       /****************************************************************************************************************************************/
       //battery switching
       CheckAndSwitchToBattery();
   }
}
//******************************************************************
//void Enable_VZ_Pointer(char mode)
//{
//     Read_Write_MCP23S17_IO(EN_LASER,mode);
//}
//***********************************************************
void Init_uClick_VZ(void)
{
    Mikrobus_PowerOut_Enable(ON,100);
    CheckAndSwitchToBattery();
    SPI1_Init();
    SPI1_Initialize_MCP();
    Delay_ms(10);
    INT_MIKROBUS_Tris=INPUT;
    CS_SRAM_Tris=OUTPUT;
    CS_SRAM_Lat=ON;
    CS_MCP23S17_Lat=ON;
    CS_MCP23S17_Buff=DIGITAL;
    CS_MCP23S17_Tris=OUTPUT;
    CS_SC16IS740_Tris=OUTPUT;
    CS_SC16IS740_Lat=ON;
    VZ_Sensor_CS=ON;
    Init_MCP23S17();
    Init_SC16IS740();
    Read_Write_MCP23S17_IO(EN_1_8V,ON);
    Read_Write_MCP23S17_IO(USER_LED,ON);
    Init_SRAM();
    Init_ExtEeprom();
   }
//***********************************************************
//***********************************************************
//***********************************************************
//************** **** I N T E R R U P T S *******************
//***********************************************************
//***********************************************************
void UART2_Interrupt() iv IVT_ADDR_U2RXINTERRUPT
{
   unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=(UART2_RX_Buffer_Length-1);
   U2STAbits.OERR=0;
   Uart2_RX_Int_En=0;
   Uart2_Rx_Int_Flag=1;
   i=0;
   while(1)
   {
           while((!Uart2_Data_Ready()) && (time_counter < TimeLimit))
           {
               Delay_us(100);
               time_counter++;
           }
           if (time_counter<TimeLimit)
           {
             time_counter=0;
             if (i<uiTemp) UART2_RX_Interrupt_Buffer[i++]=Uart2_Read();
             else Uart2_Read();
           }
           else
           {
             UART2_RX_Interrupt_Buffer[i]=0;
             U2STAbits.OERR=0;
             return;
           }
   }
}
//************** **** I N T E R R U P T S*******************
void UART1_Interrupt() iv IVT_ADDR_U1RXINTERRUPT
{
   unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=(UART2_RX_Buffer_Length-1);
   U1STAbits.OERR=0;
   ESP_RX_Int_En=0;
   ESP_RX_Int_Flag=1;
   i=0;
   while(1)
   {
           time_counter=0;
           while((!Uart1_Data_Ready()) && (time_counter < TimeLimit))
           {
               Delay_us(1);
               time_counter++;
           }
           if (time_counter<TimeLimit)
           {
             if (i<uiTemp) ESP_RX_Buffer[i++]=Uart1_Read();
             else Uart1_Read();
           }
           else
           {
             ESP_RX_Buffer[i]=0;
             U1STAbits.OERR=0;
             return;
           }
   }
}
//***********************************************************
void RTCC_Alarm() iv IVT_ADDR_RTCCINTERRUPT
{
    RTCCON1H.ALRMEN=OFF;
    RTCC_INT_EN=OFF;
    WakeUpFromSleepMode();
    PrintOut(PrintHandler, "\r*****RTCC INTERRUPT*******");
    return;
}
/*////////////////////////////////////////////////////////////////////////////////////
   BoardInit();
   LED_Activation(LED_GREEN,LED_ON);
   Init_uClick_VZ();
   PrintOut(PrintHandler, "\r***** S T A R T - M a i n *******");
   ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
   //Uart2_Rx_Int_Flag=0;Uart2_RX_Int_En=1;
   //ESP_Testing_Vz_Demo();
    while(1)
    {
      asm clrwdt
      if(!CheckWifiConnection()) {PrintOut(PrintHandler, "\rNot Connecting To Server");ReConnectToServer();}
      Delay_ms(2000);
   }*/
//***********************************************************
/*void main()
{
   BoardInit();
   Init_uClick_VZ();
   LED_Activation(LED_GREEN,LED_ON);
   PrintOut(PrintHandler, "\r***** S T A R T *******");
   PrintOut(PrintHandler, "\rBattery Voltag: %.2fV",GetBatteryVoltage());
   while(1)
   {
      asm clrwdt;
      Delay_ms(2000);
   }
}*/
//***********************************************************
/*void main()
{
  BoardInit();
  LED_Activation(LED_GREEN,LED_ON);
  InitUartForRxData();
  while(1)
  {
    asm clrwdt;
    Get60SamplesFromUart();
    nSEL=1;
    //Vz_Algorithm_2();
    //Vz_Algorithm_3_4();
    Vz_Algorithm_5();
    nSEL=0;
  }
}*/
//***********************************************************
/*
  BoardInit();
  LED_Activation(LED_GREEN,LED_ON);
  Mikrobus_PowerOut_Enable(ON,0);
  SPI1_Init();
  SPI1_Initialize_MCP();
  Init_VZ_Sensor();
  VzSensor_ReadFWVer();
  //Vz_SetBist(Normal);
  Vz_SetBist(Sinus);
  //Vz_SetBist(Saw);
  PrintRealTime(10);
  while(1) asm clrwdt;

  while(1)
  {
      asm clrwdt;
      LED_Activation(LED_GREEN,LED_NOT);
      if(OpticDataCheckIfReady())
      {
         nSEL=1;
         OpticDataGetFrame_VelocityOnly();
         //OpticDataGetFrame_DistanceOnly();
         //OpticDataGetFrame_AllData();
         nSEL=0;
         //PrintOpticDataToUart(Velocity_Print);
      }
      Delay_ms(1000);
  }
  */

  /*











void main()
{
  char txt[40];
  //int DToBelt=6000,alpha=500,UIpoint;
  float DToBelt=6000.0,alpha=500.0,UIpoint;
  BoardInit();
  LED_Activation(LED_GREEN,LED_ON);
  InitUartForRxData();
  while(1)
  {
    asm clrwdt;
    UIpoint=(float)GetSampleFromUart();
    DToBelt=((10000.0-alpha)*DToBelt+alpha*UIpoint)/10000.0;
    sprintf(txt,"\r%f,%f",UIpoint,DToBelt);
    UIpoint=GetSampleFromUart();
    DToBelt=(int)((float)(((float)((10000.0-(float)alpha)*(float)DToBelt)+(float)((float)alpha*(float)UIpoint))/10000.0));
    sprintf(txt,"\r%d,%d",UIpoint,DToBelt);
    Pseudo_Uart2_Write_Text(txt);
  }
}
*/

/*void main()
{
   char buff[SC16IS740_Buffer_Length],i;
   BoardInit();
   Init_uClick_VZ();
   LED_Activation(LED_GREEN,LED_ON);
   PrintOut(PrintHandler, "\r***** S T A R T *******");
   SC16IS740_WriteBufferToUart("AT+CWMODE=1\r\n",13);
   if(CheckSC16IS740UartDataReady(20))
   {
         SC16IS740_ReadBufferFromUart(buff);
   }
   Write_To_SC16IS740_Internal_Register(0x02,0x0);
   SC16IS740_WriteBufferToUart("AT+CWLAP\r\n",10);
   while(1)
   {
      asm clrwdt;
          if((Read_From_SC16IS740_Internal_Register(0x02)&0x04))
          {
            CS_SC16IS740_Lat=OFF;
            SPIPut_SC16IS740(0x80);
            Uart2_Write(SPIGet_SC16IS740(0x00));
            CS_SC16IS740_Lat=ON;
          }
   }
}*/

/*
void main()
{
  BoardInit();
  Init_uClick_VZ();
  SHD_Tris=INPUT;
  SHD_Buff=ANALOG;
  LED_Activation(LED_GREEN,LED_ON);
  Vz_SetBist(Saw);
  //CheckAndSwitchToBattery();
  PrintRealTime(120);
  while(1)
  {
      asm clrwdt;
      LED_Activation(LED_GREEN,LED_NOT);
      Delay_ms(1000);
  }
}
*/

 /*for(i=0;i<60;i++) Vz_Sensor_Velocity_Buffer_int[i]=i+0x30;

   j=0;
   Wifi_Buffer[j++]=1;//ID
   Wifi_Buffer[j++]=0;//PLC 0
   for (i=0; i < 60; i++) j=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_Buffer,j);
   Wifi_Buffer[j]=++j;//Length

   while(1)
   {
       asm clrwdt;
       SCL_Lat=1;
       WIFI_Send_One_Array(Wifi_Buffer,j);
       SCL_Lat=0;
       Delay_ms(1000);


   }*/
   
   
   //Wifi_Buffer[j++]=Vel/DIS DATA 1 MSB;
              //Wifi_Buffer[j++]=Vel/DIS DATA 1 LSB;
              //Wifi_Buffer[j++]=Vel/DIS DATA 2 MSB;
              //Wifi_Buffer[j++]=Vel/DIS DATA 2 LSB;
              //Wifi_Buffer[j++]=Vel/DIS DATA 120 MSB;
              //Wifi_Buffer[j++]=Vel/DIS DATA 120 LSB;
              //Wifi_Buffer[j++]=1;//ID
              //Wifi_Buffer[j++]=0;//Length MSB  PLC
              //Wifi_Buffer[j++]=3;//Length LSB
              //Wifi_Buffer[j++]=0;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
              //Wifi_Buffer[j++]=PLC P1;
              //Wifi_Buffer[j++]=PLC P2;
              //Wifi_Buffer[j++]=PLC P2;
              
              
              
   /*
   if(SamplingCounter==0)
            {
              j=0;
              Wifi_Buffer[j++]=1;//ID
              Wifi_Buffer[j++]=0;//Length MSB
              Wifi_Buffer[j++]=120;//Length LSB
              Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
              for (i=0; i < 60; i++) j=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_Buffer,j);
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
               for (i=0; i < 60; i++) j=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_Buffer,j);
               SamplingCounter++;
               if(SamplingCounter==5)
               {
                 if(wifi_state)WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_Buffer,j);
                 SamplingCounter=0;
               }
            }
            */
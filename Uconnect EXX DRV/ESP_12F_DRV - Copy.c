#include <string.h>
#include <stdio.h>
#include "PIC_DRV_Uconnect.h"
#include "SC16IS740_DRV.h"
#include "ESP_12F_DRV.h"
#include "MCP23S17_DRV.h"
#include "Types.h"
#include "Bitset.h"

//#define    SC16IS740_Buffer_Print
#define debug

char volatile Fifo_Sampels_Matrix[Fifo_Matrix_Num_Of_Row][Fifo_Matrix_Num_Of_Column];
char volatile Header_Array[Fifo_Matrix_Num_Of_Column];
char volatile Fifo_Head_Value;
char volatile Fifo_Tail_Value;
char volatile State_Machine_Value=0;
char volatile Packet_Header_Length=0;
#ifdef debug
unsigned int volatile TxByteCounter;
#endif
//*****************************************************************************************************
void Wifi_Transmit_State_Machine(char *VzSensorArray)
{
     char cmd[50],buff[64];
     const int time_out = 10;
     unsigned int len,i,j=0;
     static char Fifo_Packets_Counter=0;
     #ifdef debug
     PrintOut(PrintHandler,"\rState: %d\rHead: %d\rTail: %d",(int)State_Machine_Value,(int)Fifo_Head_Value,(int)Fifo_Tail_Value);
     #endif
     switch (State_Machine_Value)
     {
          case    State_Machine_Start:
                  Convertvector(VzSensorArray,&Fifo_Sampels_Matrix[Fifo_Tail_Value][0]);
                  if(Fifo_Tail_Value==0) State_Machine_Value=1;
                  else State_Machine_Value=State_Machine_Start;
          break;
          case    1:
                  #ifdef debug
                    TxByteCounter=0;
                  #endif
                  Header_Array[0]=1;//ID
                  Header_Array[1]=0;//PLC 0
                  Header_Array[2]=(len&0xFF00)>>8;
                  Header_Array[3]=(len&0x00FF);
                  Packet_Header_Length=4;
                  
                  len=Packet_Vz_Sensor_Data_Length+Packet_Header_Length;
                  sprintf(cmd,"AT+CIPSEND=%u\r\n",len);
                  #ifdef debug
                  PrintOut(PrintHandler,"\rcmd: %s",cmd);
                  #endif
                  SendAtCommandToEsp(cmd);
                  if(!CheckSC16IS740UartDataReady(time_out, buff))
                  {
                      SendAtCommandToEsp("+++");
                      State_Machine_Value=State_Machine_Start;
                  }
                  CheckSC16IS740UartDataReady(time_out, buff);
                  #ifdef debug
                  PrintOut(PrintHandler,"\rBuff: %s",buff);
                  #endif
                  if (!strstr(buff, ">"))
                  {
                      SendAtCommandToEsp("+++");
                      State_Machine_Value=State_Machine_Start;
                  }
                  //header data and parameter
                  SendLongArrayToSC16IS740(Header_Array,Packet_Header_Length);
                  
                  SendLongArrayToSC16IS740(&Fifo_Sampels_Matrix[Fifo_Head_Value][0],Fifo_Matrix_Num_Of_Column);
                  Fifo_Head_Update();
                  
                  Convertvector(VzSensorArray,&Fifo_Sampels_Matrix[Fifo_Tail_Value][0]);
                  
                  State_Machine_Value=2;
          break;
          case    2:
                  SendLongArrayToSC16IS740(&Fifo_Sampels_Matrix[Fifo_Head_Value][0],Fifo_Matrix_Num_Of_Column);
                  Fifo_Head_Update();
                  
                  Convertvector(VzSensorArray,&Fifo_Sampels_Matrix[Fifo_Tail_Value][0]);
          
                  if(Fifo_Head_Value==Fifo_Half_Length) State_Machine_Value=3;
                  else if(Fifo_Tail_Value==0) State_Machine_Value=4;
          break;
          case    3:
                   Convertvector(VzSensorArray,&Fifo_Sampels_Matrix[Fifo_Tail_Value][0]);
                   if(Fifo_Tail_Value==0) State_Machine_Value=1;
          break;
          case    4:
                   Convertvector(VzSensorArray,&Fifo_Sampels_Matrix[Fifo_Tail_Value][0]);
                   if(Fifo_Tail_Value==Fifo_Half_Length) State_Machine_Value=1;
          break;
     }
}
//*****************************************************************************************************
void SendLongArrayToSC16IS740(char *m_data,unsigned int len)
{
    unsigned int i=0;
    while(len/SC16IS740_Buffer_Length!=0)
    {
      SC16IS740_WriteBufferToUart(&m_data[i],SC16IS740_Buffer_Length);
      delay_us(600);//64bytes in 921600bps=~555usec
      len-=SC16IS740_Buffer_Length;
      i+=SC16IS740_Buffer_Length;
      #ifdef debug
          TxByteCounter+=SC16IS740_Buffer_Length;
       #endif
    }
    len%=SC16IS740_Buffer_Length;
    if(len) 
    {
       #ifdef debug
          TxByteCounter+=len;
       #endif
       SC16IS740_WriteBufferToUart(&m_data[i],len);
       delay_us(600);//64bytes in 921600bps=~555usec
    }
    #ifdef debug
     PrintOut(PrintHandler,"\rCounter: %u",TxByteCounter);
    #endif
}
//*****************************************************************************************************
void Convertvector(char *BuffIn,char *BuffOut)
{
     unsigned int j,i;
     j=0;
     for (i=0; i < 60; i++) j=SInt2Array(BuffIn[i],BuffOut,j);
     Fifo_Tail_Update();
}
//*****************************************************************************************************
void Fifo_Head_Update(void)
{
     Fifo_Head_Value++;
     Fifo_Head_Value%=Fifo_Matrix_Num_Of_Row;
}
//*****************************************************************************************************
void Fifo_Tail_Update(void)
{
     Fifo_Tail_Value++;
     Fifo_Tail_Value%=Fifo_Matrix_Num_Of_Row;
}



//*****************************************************************************************************
char Init_ESP(void)
{
    char buff[SC16IS740_Buffer_Length], BpsStr[30];
    int len;
    PrintOut(PrintHandler, "\rInit ESP(WIFI)...");
    Read_Write_MCP23S17_IO(ESP_EN_PIN, OFF);
    Delay_ms(300);
    Read_Write_MCP23S17_IO(ESP_EN_PIN, ON);
    Read_Write_MCP23S17_IO(ESP_FLASH, ON);
    Read_Write_MCP23S17_IO(ESP_RESET, OFF);
    Delay_ms(200);
    Read_Write_MCP23S17_IO(ESP_RESET, ON);
    Delay_ms(1000);

    SendAtCommandToEsp("ATE0\r\n");
    Delay_ms(5);
    SC16IS740_ReadBufferFromUart(buff);
    SendAtCommandToEsp("ATE0\r\n");
    Delay_ms(5);
    SC16IS740_ReadBufferFromUart(buff);

    strcpy(BpsStr, "AT+UART=921600,8,1,0,0\r\n");
    SendAtCommandToEsp(BpsStr);
    Delay_ms(5);
    CheckSC16IS740UartDataReady(20, buff);
    SendAtCommandToEsp(BpsStr);
    Delay_ms(5);
    CheckSC16IS740UartDataReady(20, buff);

    Read_Write_MCP23S17_IO(RESET_ADP, OFF);
    Delay_ms(10);
    Read_Write_MCP23S17_IO(RESET_ADP, ON);
    Delay_ms(10);
    Write_To_SC16IS740_Internal_Register(0x03, 0x83);  //LCR - LCR[7] =1;
    Write_To_SC16IS740_Internal_Register(0x00, 0x01);  // BPS = 921600 - LSB   XTAL= 14.7456Mhz
    Write_To_SC16IS740_Internal_Register(0x01, 0x00);  // BPS = 921600- MSB
    Write_To_SC16IS740_Internal_Register(0x03, 0x03);  //LCR - LCR[7] =0;
    Write_To_SC16IS740_Internal_Register(0x02, 0x07);  //FCR FIFO enable;Word length 8 bit
    Write_To_SC16IS740_Internal_Register(0x01,
                                         0x03);  //IER[0]=1 enable the RHR interrupt;IER[1] enable the THR interrupt

    SendAtCommandToEsp("ATE0\r\n");
    Delay_ms(5);
    if (CheckSC16IS740UartDataReady(30, buff))
    {
        if (strstr(buff, "OK"))
        {
            PrintOut(PrintHandler, "\rESP successfully initialized");
            return 1;
        }
    }
    SendAtCommandToEsp("ATE0\r\n");
    Delay_ms(5);
    if (CheckSC16IS740UartDataReady(30, buff))
    {
        if (strstr(buff, "OK"))
        {
            PrintOut(PrintHandler, "\rESP successfully initialized");
            return 1;
        } else
        {
            PrintOut(PrintHandler, "\rFailed To Init ESP!!!");
            return 0;
        }
    } else
    {
        PrintOut(PrintHandler, "\rFailed To Init ESP!!!");
        return 0;
    }
}

//*****************************************************************************************************
char CheckWifiConnection(void)
{
    //run time= 2.5msec
    char buff[100];
    CheckSC16IS740UartDataReady(0,buff);
    #ifdef debug
        PrintOut(PrintHandler,"\rBefore Connect: %s",buff);
    #endif
    Write_To_SC16IS740_Internal_Register(0x02,0x05); //clears the contents of the tx FIFO
    CS_SC16IS740_Lat=OFF;
    SPIPut_SC16IS740(0x00);
    SPIPut_SC16IS740('A');SPIPut_SC16IS740('T');SPIPut_SC16IS740('+');SPIPut_SC16IS740('C');SPIPut_SC16IS740('I');
    SPIPut_SC16IS740('P');SPIPut_SC16IS740('S');SPIPut_SC16IS740('T');SPIPut_SC16IS740('A');SPIPut_SC16IS740('T');
    SPIPut_SC16IS740('U');SPIPut_SC16IS740('S');SPIPut_SC16IS740('\r');SPIPut_SC16IS740('\n');
    CS_SC16IS740_Lat=ON;
    if(CheckSC16IS740UartDataReady(10,buff))
    {
        #ifdef debug
        PrintOut(PrintHandler,"\rConnect: %s",buff);
        #endif
        if(strstr(buff,"S:3")) {return 1;}
        else return 0;
    }
    else return 0;
}
//*****************************************************************************************************
char CheckGettingIP(void)
{
    //run time= 200usec if connection  is ok,  260usec if not
    char buff[100];
    Write_To_SC16IS740_Internal_Register(0x02,0x05); //clears the contents of the Transmit FIFO
    CS_SC16IS740_Lat=OFF;
    SPIPut_SC16IS740(0x00);
    SPIPut_SC16IS740('A');SPIPut_SC16IS740('T');SPIPut_SC16IS740('+');SPIPut_SC16IS740('C');SPIPut_SC16IS740('I');
    SPIPut_SC16IS740('P');SPIPut_SC16IS740('S');SPIPut_SC16IS740('T');SPIPut_SC16IS740('A');SPIPut_SC16IS740('T');
    SPIPut_SC16IS740('U');SPIPut_SC16IS740('S');SPIPut_SC16IS740('\r');SPIPut_SC16IS740('\n');
    CS_SC16IS740_Lat=ON;
    if(CheckSC16IS740UartDataReady(10,buff))
    {
        if(strstr(buff,"S:2")) return 1;
        else return 0;
    }
    else return 0;
}

//*****************************************************************************************************
char WifiConnectionProcess(void)
{
    char buff[100],buff2[100], i = 0, cTemp;
    PrintOut(PrintHandler, "\rWifi Connection Process...");

    SendAtCommandToEsp("AT+CWMODE=1\r\n");
    if (CheckSC16IS740UartDataReady(10, buff)) if (!strstr(buff, "OK")) goto NotOK;

    SendAtCommandToEsp("AT+CIPMUX=0\r\n");
    if (CheckSC16IS740UartDataReady(10, buff)) if (!strstr(buff, "OK")) goto NotOK;

    PrintOut(PrintHandler, "\rWIFI Connection initialized successfully");
    PrintOut(PrintHandler, "\rChecking IP Getting...");

    //SendAtCommandToEsp("AT+CWJAP=\"Ravtech-Public\",\"@ravTech!\"\r\n");
    SendAtCommandToEsp("AT+CWJAP=\"UC-timurim\",\"0544916811\"\r\n");
    if (CheckSC16IS740UartDataReady(10, buff))
        if (!(strstr(buff, "OK") || strstr(buff, "WIFI CONNECTED")))
            goto NotOK;

    
    while((i++<30)&&(!(cTemp=CheckGettingIP())))
    {
        delay_ms(1000);
        asm clrwdt;
    }

    if (!cTemp)
    {
        PrintOut(PrintHandler, "\rFailed To Get IP!!!");
        goto NotOK;
    }
    CheckSC16IS740UartDataReady(10, buff);
    PrintOut(PrintHandler, "\rGeting IP Address Successfully");

    i = 0;
    while (i++ < 10 && !ConnectToServer());

    if (i >= 10)
        return FALSE;

    PrintOut(PrintHandler, "\rConnection to server success");
    CheckSC16IS740UartDataReady(10, buff);
    return 1;

    NotOK:
    PrintOut(PrintHandler, "\rFailed To Init Wifi Connection error:%s", buff);
    return 0;

}
//*****************************************************************************************************
char ConnectToServer(void)
{
    char buff[64];
    char *const cmd = "AT+CIPSTART=\"TCP\",\"192.168.1.25\",9875\r\n";
    //char *const cmd = "AT+CIPSTART=\"TCP\",\"192.168.16.111\",9875\r\n";
    SendAtCommandToEsp(cmd);
    if (CheckSC16IS740UartDataReady(6000, buff))
    {
        if (!strstr(buff, "OK"))
        {
            PrintOut(PrintHandler, "\rConnection to server failed;%s", buff);
            return 0;
        } else
        {
            PrintOut(PrintHandler, "\rConnection response", buff);
        }
    } else
    {
        PrintOut(PrintHandler, "\rTry Connection to server with no response");
        return 0;
    }
    return 1;
}

//*****************************************************************************************************
void SendAtCommandToEsp(char *buff)
{
    char cTemp;
    unsigned int i = 0, len;
    len = strlen(buff);
    Write_To_SC16IS740_Internal_Register(0x02, 0x05); //clears the contents of the Transmit FIFO
    CS_SC16IS740_Lat = OFF;
    SPIPut_SC16IS740(0x00);
    while (i < 64 && (i < len))
    {
        SPIPut_SC16IS740(buff[i]);
        i++;
    }
    CS_SC16IS740_Lat = ON;
    #ifdef SC16IS740_Buffer_Print
        PrintOut(PrintHandler, "\rSC16IS740: %s",buff);
    #endif
}
//*****************************************************************************************************
// Send data (AT+CIPSEND)
/**
 * Send data over a connection.
 *
 * This sends the AT+CIPSEND command to the ESP module.
 *
 * @param m_data The data to send
 *
 * @return true iff the data was sent correctly.
 */
char WIFI_Send_One_Array(char *m_data,  unsigned int len)
{
    // run time (128bytes) = 4.4sec
    char cmd[20];
    char buff[64],buff2[64];
    int i=0;
    const int time_out = 10;
    Write_To_SC16IS740_Internal_Register(0x02,0x07); //clears the contents of the Transmit FIFO
    sprintf(cmd,"AT+CIPSEND=%u\r\n",len);
    SendAtCommandToEsp(cmd);
    CheckSC16IS740UartDataReady(time_out, buff);
    #ifdef debug
    PrintOut(PrintHandler,"\rcmd: %s",cmd);
    PrintOut(PrintHandler,"\r>Buff: %s",buff);
    #endif
    if (!strstr(buff, ">"))
    {
        SendAtCommandToEsp("+++");
        return FALSE;
    }
    while(len/SC16IS740_Buffer_Length!=0)
    {
      SC16IS740_WriteBufferToUart(&m_data[i],SC16IS740_Buffer_Length);
      delay_us(600);//64bytes in 921600bps=~555usec
      len-=SC16IS740_Buffer_Length;
      i+=SC16IS740_Buffer_Length;
    }
    len%=SC16IS740_Buffer_Length;
    if(len) 
    {
       SC16IS740_WriteBufferToUart(&m_data[i],len);
       delay_us(600);//64bytes in 921600bps=~555usec
    }
    CheckSC16IS740UartDataReady(time_out, buff);
    CheckSC16IS740UartDataReady(60, buff2);
    #ifdef debug
    PrintOut(PrintHandler,"\rBuff1: %s",buff);
    PrintOut(PrintHandler,"\rBuff2: %s",buff2);
    #endif
    if ((!strstr(buff, "OK"))&&(!strstr(buff, "Recv"))&&(!strstr(buff2, "OK"))&&(!strstr(buff2, "Recv")))
    {
        SendAtCommandToEsp("+++");
        return FALSE;
    }
    return TRUE;
}






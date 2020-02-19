#include "PIC_DRV_Uconnect.h"
#include "VZ_Sensor.h"
#include "Debug_Drv.h"

//#define  Velocity
#define  Distance

extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
void Get60SamplesFromUart(void)
{
    char i;
    #ifdef Velocity
      for(i=0;i<60;i++) Vz_Sensor_Velocity_Buffer_int[i]=GetSampleFromUart();
    #endif
    #ifdef Distance
      for(i=0;i<60;i++) Vz_Sensor_Distance_Buffer_int[i]=GetSampleFromUart();
    #endif
}
//*****************************************************************************************************
void InitUartForRxData(void)
{
   MRXSTX2_Tris=INPUT;
   UART2_Read();UART2_Read();
}
//*****************************************************************************************************
int GetSampleFromUart(void)
{
       char txt[10]={0},cTemp=0,i=0;
       txt[0]=0x30;
       while(cTemp!='\n')
       {
           asm clrwdt;
           if(UART2_Data_Ready()) {cTemp=txt[i++]=UART2_Read();U2STAbits.OERR = 0;}
       }
       txt[i-1]=0;
       return atoi(txt);
}
//*****************************************************************************************************
void PrintRealTime(unsigned int TimeInSec)
{
     unsigned long MainLoopLimit;
     unsigned int index,i;
     char txt[7];
     Pseudo_Uart2_Enable(1);
     MainLoopLimit= (unsigned long)TimeInSec*1000/10;
     for(index=0;index<MainLoopLimit;index++)
     {
         SCL_Lat^=1;
         while(!OpticDataCheckIfReady());
         #ifdef Velocity
           OpticDataGetFrame_VelocityOnly();
         #endif
          #ifdef  Distance
           OpticDataGetFrame_DistanceOnly();
         #endif
         for(i=0;i<60;i++)
         {
             #ifdef Velocity
             IntToStr(Vz_Sensor_Velocity_Buffer_int[i], txt);
             #endif
             #ifdef Distance
             IntToStr(Vz_Sensor_Distance_Buffer_int[i], txt);
             #endif
             Pseudo_Uart2_Write_Text(txt);
             Pseudo_Uart2_Write_Text("\r");
         }
     }
     Pseudo_Uart2_Enable(0);
}
//*****************************************************************************************************
void Pseudo_Uart2_Write_Byte(char din)
{
  ////   1190476 BPS
  char i;
  unsigned int k;
  MTXSRX2_Lat=0;       //Start Bit
  for(k=0;k<0;k++);
  for(i=0;i<8;i++) //run time
  {
     MTXSRX2_Lat=din&0x01; //
     din>>=1;
  }
  MTXSRX2_Lat=1;       //Stop Bit
  Delay_us(1);
}
//*****************************************************************************************************
void Pseudo_Uart2_Write_Text(unsigned char *p)
{
      int i=0;
      Pseudo_Uart2_Enable(ON);
      while(p[i]!=0) Pseudo_Uart2_Write_Byte(p[i++]);
      Pseudo_Uart2_Enable(OFF);
}
//*****************************************************************************************************
void Pseudo_Uart2_Enable(char mode)
{
   switch (mode)
   {
          case 1  :
                MTXSRX2_Lat=1;
                U2MODEbits.UARTEN = 0;
                U2STAbits.UTXEN = 0;
          break;
          case 0  :
                U2MODEbits.UARTEN = 1;
                U2STAbits.UTXEN = 1;
                U2RXREG=0;
                U2STAbits.URXDA=0;
                U2STAbits.OERR = 0;
                Uart2_Rx_Int_Flag=0;
          break;
   }
}
//******************************************************************
void PrintOpticDataToUart(char mode)
{
   unsigned int BufferIndex=0,i,LoopIndex;
   if(mode&Velocity_Print)
   {
      PrintOut(PrintHandler,"\rVelocity: units - mm/sec \r");
      for(i=0;i<60;i++)  PrintOut(PrintHandler,"%.2f,",(float)Vz_Sensor_Velocity_Buffer_int[i]/256.0);
   }
   if(mode&Distance_Print)
   {
     PrintOut(PrintHandler,"\rDistance: units - mm\r");
     for(i=0;i<60;i++)  PrintOut(PrintHandler,"%.2f,",(float)(Vz_Sensor_Distance_Buffer_int[i]&0x3FFF)/1024);
   }
   if(mode&Mask_Print)
   {
      PrintOut(PrintHandler,"\rMask:\r");
      for(i=0;i<60;i++)  PrintOut(PrintHandler,"%d,",(int)((Vz_Sensor_Distance_Buffer_int[i]&0xC000)>>14));
   }
}
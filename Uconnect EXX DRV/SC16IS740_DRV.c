#include "PIC_DRV_Uconnect.h"
#include "SC16IS740_DRV.h"
#include "MCP23S17_DRV.h"

//#define    SC16IS740_Buffer_Print

void Init_SC16IS740(void)
{
  CS_SC16IS740_Tris=OUTPUT;
  CS_SC16IS740_Lat=ON;
  Read_Write_MCP23S17_IO(RESET_ADP,OFF);
  Delay_ms(10);
  Read_Write_MCP23S17_IO(RESET_ADP,ON);
  Delay_ms(10);
  Write_To_SC16IS740_Internal_Register(0x03,0x83);  //LCR - LCR[7] =1;
  Write_To_SC16IS740_Internal_Register(0x00,0x08);  // BPS = 115200 - LSB   XTAL= 14.7456Mhz
  Write_To_SC16IS740_Internal_Register(0x01,0x00);  // BPS = 115200- MSB
  Write_To_SC16IS740_Internal_Register(0x03,0x03);  //LCR - LCR[7] =0;
  Write_To_SC16IS740_Internal_Register(0x02,0x07);  //FCR FIFO enable;Word length 8 bit
  Write_To_SC16IS740_Internal_Register(0x01,0x03);  //IER[0]=1 enable the RHR interrupt;IER[1] enable the THR interrupt
}
//*****************************************************************************************************
void Write_To_SC16IS740_Internal_Register(char Register_ADD,char Register_Data)
{
   Register_ADD<<=3;
   Register_ADD&=0x7F;
   CS_SC16IS740_Lat=OFF;
   SPIPut_SC16IS740(Register_ADD);
   SPIPut_SC16IS740(Register_Data);
   CS_SC16IS740_Lat=ON;
}
//*****************************************************************************************************
char Read_From_SC16IS740_Internal_Register(char Register_ADD)
{
         char cTemp;
         Register_ADD<<=3;
         Register_ADD|=0x80;
         CS_SC16IS740_Lat=OFF;
         SPIPut_SC16IS740(Register_ADD);
         cTemp=SPIGet_SC16IS740(0x00);
         CS_SC16IS740_Lat=ON;
         return cTemp;
}
//*****************************************************************************************************
void SC16IS740_WriteBufferToUart(char *buff,char length) ///// max 64
{
     //run time=280usec
     char cTemp;
     unsigned int i;
     if(length >SC16IS740_Buffer_Length) length=SC16IS740_Buffer_Length;
     Write_To_SC16IS740_Internal_Register(0x02,0x07); //clears the contents of the Tx and Rx FIFO
     CS_SC16IS740_Lat=OFF;
     SPIPut_SC16IS740(0x00);
     for(i=0;i<length;i++)
     {
       SPIPut_SC16IS740(buff[i]);
     }
     CS_SC16IS740_Lat=ON;
     
     /*cTemp=Read_From_SC16IS740_Internal_Register(0x02);
     i=0;
     while(((cTemp&0x02)!=0x2)&&((cTemp&0x0C)!=0x0C)&&(i++<50000))
     {
        cTemp=Read_From_SC16IS740_Internal_Register(0x02);
     }*/
 }
//*****************************************************************************************************
char SC16IS740_ReadBufferFromUart(char *buff)
{
    char i,len;
    len=Read_From_SC16IS740_Internal_Register(0x09);
    CS_SC16IS740_Lat=OFF;
    SPIPut_SC16IS740(0x80);
    for(i=0;i<len;i++)
    {
      buff[i]=SPIGet_SC16IS740(0x00);
    }
    CS_SC16IS740_Lat=ON;
    buff[len]=0;
    Write_To_SC16IS740_Internal_Register(0x02,0x03); //clears the contents of the receive FIFO
    #ifdef SC16IS740_Buffer_Print
        PrintOut(PrintHandler, "\rSC16IS740: ");
        for(i=0;i<len;i++) Uart2_Write(buff[i]);
    #endif
    return len;
}
//*****************************************************************************************************
char CheckSC16IS740UartDataReady(unsigned int  TimeOut,char *buff)
{
    //run time= 15usec
    int i=0;
    if(TimeOut==0)
    {
       if((Read_From_SC16IS740_Internal_Register(0x02)&0x0C)==0x0C) return SC16IS740_ReadBufferFromUart(buff);
       else return 0;
    }
    while(i++<TimeOut)
    {
       if((Read_From_SC16IS740_Internal_Register(0x02)&0x0C)==0x0C) return SC16IS740_ReadBufferFromUart(buff);
       Delay_us(900);
    }
    return 0;
}
//*****************************************************************************************************
char SPIGet_SC16IS740(char din)
{
   return SPI1_Read(din);
}
//*****************************************************************************************************
void SPIPut_SC16IS740(char din)
{
   SPI1_Write(din);
}
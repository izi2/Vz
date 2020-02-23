#include "VZ_Sensor.h"
#include "PIC_DRV_Uconnect.h"
#include "MCP23S17_DRV.h"


int volatile Vz_Sensor_Velocity_Buffer_int[60];
int volatile Vz_Sensor_Distance_Buffer_int[60];
//******************************************************************
void OpticDataGetFrame_VelocityOnly(void)
{
    ///  SPI CLOCK 4MHZ ; RUN TIME 1.68mSec
    unsigned int BufferIndex=0,i,LoopIndex;
    char RxBuffer[4];
    VZ_Sensor_CS=OFF;
    SPI1_Write(VZ_SPI_READ);
    SPI1_Write(VZ_SPI_TARGET_COMMAND);
    SPI1_Write(0x10);
    SPI1_Write(0x01);
    VZ_Sensor_CS=ON;
    Delay_us(200);
    for(LoopIndex=0;LoopIndex<8;LoopIndex++)
    {
        VZ_Sensor_CS=OFF;
        for(i=0;i<8;i++)
        {
           if((LoopIndex<7)||(i<4))  Vz_Sensor_Velocity_Buffer_int[BufferIndex++]=(int)(((unsigned int)SPI1_Read(0x00))|((unsigned int)(SPI1_Read(0x00)<<8)));
           else {SPI1_Read(0x00);SPI1_Read(0x00);}
           SPI1_Read(0x00);SPI1_Read(0x00);
        }
        VZ_Sensor_CS=ON;
        Delay_us(70);
    }
}
//******************************************************************
void OpticDataGetFrame_DistanceOnly(void)
{
    ///  SPI CLOCK 4MHZ ; RUN TIME 1.68mSec
    unsigned int BufferIndex=0,i,LoopIndex;
    char RxBuffer[4];
    VZ_Sensor_CS=OFF;
    SPI1_Write(VZ_SPI_READ);
    SPI1_Write(VZ_SPI_TARGET_COMMAND);
    SPI1_Write(0x10);
    SPI1_Write(0x01);
    VZ_Sensor_CS=ON;
    Delay_us(200);
    for(LoopIndex=0;LoopIndex<8;LoopIndex++)
    {
        VZ_Sensor_CS=OFF;
        for(i=0;i<8;i++)
        {
           SPI1_Read(0x00);SPI1_Read(0x00);
           if((LoopIndex<7)||(i<4))  
           {
             Vz_Sensor_Distance_Buffer_int[BufferIndex++]=(((unsigned int)SPI1_Read(0x00))|((unsigned int)((SPI1_Read(0x00)&0x3F)<<8)));
           }
           else {SPI1_Read(0x00);SPI1_Read(0x00);}
        }
        VZ_Sensor_CS=ON;
        Delay_us(70);
    }
}
//******************************************************************
void OpticDataGetFrame_AllData(void)
{
  ///  SPI CLOCK 4MHZ ; RUN TIME 1.72mSec
    unsigned int BufferIndex=0,i,LoopIndex;
    char RxBuffer[4];
    VZ_Sensor_CS=OFF;
    SPI1_Write(VZ_SPI_READ);
    SPI1_Write(VZ_SPI_TARGET_COMMAND);
    SPI1_Write(0x10);
    SPI1_Write(0x01);
    VZ_Sensor_CS=ON;
    Delay_us(200);
    for(LoopIndex=0;LoopIndex<8;LoopIndex++)
    {
        VZ_Sensor_CS=OFF;
        for(i=0;i<8;i++)
        {
           if((LoopIndex<7)||(i<4))  
           {
             Vz_Sensor_Velocity_Buffer_int[BufferIndex]=(int)(((unsigned int)SPI1_Read(0x00))|((unsigned int)(SPI1_Read(0x00)<<8)));
             Vz_Sensor_Distance_Buffer_int[BufferIndex++]=(((unsigned int)SPI1_Read(0x00))|((unsigned int)(SPI1_Read(0x00)<<8)));
           }
           else {SPI1_Read(0x00);SPI1_Read(0x00);SPI1_Read(0x00);SPI1_Read(0x00);}
        }
        VZ_Sensor_CS=ON;
        Delay_us(70);
    }
}
//******************************************************************
void OpticDataGetCleanBuffer(void)
{
    unsigned int BufferIndex=0,i,LoopIndex;
    char RxBuffer[4];
    VZ_Sensor_CS=OFF;
    SPI1_Write(VZ_SPI_READ);
    SPI1_Write(VZ_SPI_TARGET_COMMAND);
    SPI1_Write(0x10);
    SPI1_Write(0x01);
    VZ_Sensor_CS=ON;
    Delay_us(200);
    for(LoopIndex=0;LoopIndex<8;LoopIndex++)
    {
        VZ_Sensor_CS=OFF;
        for(i=0;i<8;i++)
        {
           SPI1_Read(0x00);SPI1_Read(0x00);
           SPI1_Read(0x00);SPI1_Read(0x00);
        }
        VZ_Sensor_CS=ON;
        Delay_us(70);
    }
    OpticDataCheckIfReady();
}
//******************************************************************
void Vz_SetBist(char mode)
{
     char Buff[8]={0x01,0x00,0x04,0x00,0x00,0x00,0x00,0x00};
     char i;
     switch (mode)
     {
            case Saw:
                    Buff[4]=0x03;
            break;
            case Sinus:
                    Buff[4]=0x04;
            break;
     }
     VzSensor_SpiWriteAddr(VZ_SPI_TARGET_COMMAND,0x010d,Buff,8);
     Delay_ms(100);
}
//******************************************************************
char OpticDataCheckIfReady(void)
{
       char Buff[4] = {0x00};
       VzSensor_SpiReadAddr(VZ_SPI_TARGET_COMMAND,0x0111,Buff,4);
       //PrintOut(PrintHandler,"\rData Ready Buffer: %X,%X,%X,%X", (unsigned int)Buff[0], (unsigned int)Buff[1], (unsigned int)Buff[2], (unsigned int)Buff[3]);
       if(Buff[0]==1) return 1;
       else return 0;
}
//******************************************************************
char  OpticDataOnSPI_ON(void)
{
        char Buff[4] = {0x00};
        Buff[0] =1;
        VzSensor_SpiWriteAddr(VZ_SPI_TARGET_PARAMETER,0x006f,Buff,4);
        VzSensor_SpiReadAddr(VZ_SPI_TARGET_PARAMETER,0x006f,Buff,4);
        if (Buff[0] == 1)
        {
                PrintOut(PrintHandler,"\rOpticDataOnSPI ON");
                return 1;
        }
        else
        {
                PrintOut(PrintHandler,"\rOpticDataOnSPI OFF !!!");
                return 0;
        }
}
//******************************************************************
void VzSensor_ReadFWVer(void)
{

         char VersBuff[4];
        //Ex 0x1,0x1,0x15,0x56 -> 1.1.21.86
        VzSensor_SpiReadAddr(VZ_SPI_TARGET_PARAMETER, 0x0001,VersBuff,4);
        PrintOut(PrintHandler,"\rVZ Sensor SW_Verson %d.%d.%d.%d", (unsigned int)VersBuff[0], (unsigned int)VersBuff[1], (unsigned int)VersBuff[2], (unsigned int)VersBuff[3]);
}
//******************************************************************
void VzSensor_SpiWriteAddr(char target, unsigned int addr,char *TxBuffer,char TxBufferLength)
{
    char i;
    VZ_Sensor_CS=OFF;
    SPI1_Write(VZ_SPI_WRITE);
    SPI1_Write(target);
    SPI1_Write(addr&0x00FF);
    SPI1_Write(((addr&0xFF00)>>8));
    VZ_Sensor_CS=ON;
    Delay_us(200);
    VZ_Sensor_CS=OFF;
         for(i=0;i<TxBufferLength;i++) SPI1_Write(TxBuffer[i]);
    VZ_Sensor_CS=ON;
}
//******************************************************************
void VzSensor_SpiReadAddr(char target, unsigned int addr,char *RxBuffer,char RxBufferLength)
{
    char i;
    VZ_Sensor_CS=OFF;
    SPI1_Write(VZ_SPI_READ);
    SPI1_Write(target);
    SPI1_Write((addr&0x00FF));
    SPI1_Write(((addr&0xFF00)>>8));
    VZ_Sensor_CS=ON;
    Delay_us(200);
    VZ_Sensor_CS=OFF;
        for(i=0;i<RxBufferLength;i++) RxBuffer[i]=SPI1_Read(0x00);
    VZ_Sensor_CS=ON;
}
//******************************************************************
char Init_VZ_Sensor(uint_8 bist)
{
     unsigned int i=0;
     char RtFlag;
     PrintOut(PrintHandler,"\rInit Vz Sensor...");
     //Read_Write_MCP23S17_IO(EN_1_8V,ON);
     Read_Write_MCP23S17_IO(RESET_VZ,OFF);
     Delay_ms(100);
     Read_Write_MCP23S17_IO(RESET_VZ,ON);
     Delay_ms(2000);
     //Vz_SetBist(Normal);
     Vz_SetBist(bist);
     while((i++<15)&&(!(RtFlag=OpticDataOnSPI_ON()))) {asm clrwdt;Delay_ms(100);}
     return RtFlag;
}
#include "PIC_DRV_Uconnect.h"
#include "SRAM_IS62WVS5128GBLL_DRV.h"
#include "MCP23S17_DRV.h"



//*****************************************************************************************************
void Init_SRAM(void)
{
   CS_SRAM_Tris=OUTPUT;
   CS_SRAM_Lat=ON;
   Read_Write_MCP23S17_IO(HOLD_SRAM,ON);
   Set_SRAM_Operation_Mode(SRAM_Operation_Mode_Byte);
}
//*****************************************************************************************************
void Set_SRAM_Operation_Mode(char mode)
{
   CS_SRAM_Lat=OFF;
   SPIPut_SRAM(Instruction_Read_Mode_Register);
   SPIPut_SRAM(mode);
   CS_SRAM_Lat=ON;
}
//*****************************************************************************************************
void Read_Sequential_Bytes_From_SRAM_Memory(unsigned long Register_ADD,char *RxBuffer,unsigned int BufferLength)
{
   unsigned int i;
   CS_SRAM_Lat=OFF;
   SPIPut_SRAM(Instruction_Write_To_Memory);
   SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
   SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
   SPIPut_SRAM(Register_ADD&0x000000FF);
   for(i=0;i<BufferLength;i++) RxBuffer[i]=SPIGet_SRAM(0x00);
   CS_SRAM_Lat=ON;
}
//*****************************************************************************************************
void Write_Sequential_Bytes_To_SRAM_Memory(unsigned long Register_ADD,char *TxBuffer,unsigned int BufferLength)
{
   unsigned int i;
   CS_SRAM_Lat=OFF;
   SPIPut_SRAM(Instruction_Write_To_Memory);
   SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
   SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
   SPIPut_SRAM(Register_ADD&0x000000FF);
   for(i=0;i<BufferLength;i++) SPIPut_SRAM(TxBuffer[i]);
   CS_SRAM_Lat=ON;
}
//*****************************************************************************************************
void Write_Byte_To_SRAM_Memory(unsigned long Register_ADD,char Register_Data)
{
   CS_SRAM_Lat=OFF;
   SPIPut_SRAM(Instruction_Write_To_Memory);
   SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
   SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
   SPIPut_SRAM(Register_ADD&0x000000FF);
   SPIPut_SRAM(Register_Data);
   CS_SRAM_Lat=ON;
}
//*****************************************************************************************************
char Read_Byte_From_SRAM_Memory(unsigned long Register_ADD)
{
   char Din;
   CS_SRAM_Lat=OFF;
   SPIPut_SRAM(Instruction_Read_From_Memory);
   SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
   SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
   SPIPut_SRAM(Register_ADD&0x000000FF);
   Din=SPIGet_SRAM(0x00);
   CS_SRAM_Lat=ON;
   return Din;
}
//*****************************************************************************************************
void SPIPut_SRAM(char din)
{
    SPI1_Write(din);
}
//*****************************************************************************************************
char SPIGet_SRAM(char din)
{
     return SPI1_Read(din);
}
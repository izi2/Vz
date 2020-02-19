#include "PIC_DRV_Uconnect.h"
#include "MCP23S17_DRV.h"




//*****************************************************************************************************
void Init_MCP23S17(void)
{
     CS_MCP23S17_Lat=ON;
     CS_MCP23S17_Buff=DIGITAL;
     CS_MCP23S17_Tris=OUTPUT;
     Write_To_MCP23S17_Internal_Register(0x00,0x28); //PORT A  IN/OUT
     Write_To_MCP23S17_Internal_Register(0x01,0x10); //PORT B  IN/OUT
     Write_To_MCP23S17_Internal_Register(0x13,0xFE); //LATB B
     Write_To_MCP23S17_Internal_Register(0x12,0x17); //LATB B

}
//*****************************************************************************************************
char Read_Write_MCP23S17_IO(char PinName,char mode)
{
    ///RTS =out  CTS=in
    char din;
    switch (PinName)
    {
          case EN_1_8V:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x01; else   din&=0xFE;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case CS_FLASH:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x02; else   din&=0xFD;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case RESET_ADP:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x04; else   din&=0xFB;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case USER_LED:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x08; else   din&=0xF7;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case HOLD_SRAM:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x20; else   din&=0xDF;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case WP_FLASH:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x40; else   din&=0xBF;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case RESET_VZ:
               din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
               if(mode) din|=0x80; else   din&=0x7F;
               Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
          break;
          case ESP_FLASH:
               din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
               if(mode) din|=0x02; else   din&=0xFD;
               Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
          break;
          case ESP_RESET:
               din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
               if(mode) din|=0x04; else   din&=0xFB;
               Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
          break;
          case ESP_EN_PIN:
               din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
               if(mode) din|=0x10; else   din&=0xEF;
               Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
          break;
          case ESP_CTS:
               din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
               if(din&0x20) return 1;else return 0;
          break;
          case ESP_RTS:
               din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
               if(mode) din|=0x40; else   din&=0xBF;
               Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
          break;
          case EN_LASER:
               din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
               if(mode) din|=0x80; else   din&=0x7F;
               Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
          break;
    }

}
//*****************************************************************************************************
void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data)
{
    CS_MCP23S17_Lat=OFF;
    SPIPut_MCP23S17(0x40);
    SPIPut_MCP23S17(Register_ADD);
    SPIPut_MCP23S17(Register_Data);
    CS_MCP23S17_Lat=ON;
}
//*****************************************************************************************************
char Read_From_MCP23S17_Internal_Register(char Register_ADD)
{
    char DataOut;
    CS_MCP23S17_Lat=OFF;
    SPIPut_MCP23S17(0x41);
    SPIPut_MCP23S17(Register_ADD);
    DataOut=SPIGet_MCP23S17(0x00);
    CS_MCP23S17_Lat=ON;
    return DataOut;
}
//*****************************************************************************************************
void SPIPut_MCP23S17(char din)
{
    SPI1_Write(din);
}
//*****************************************************************************************************
char SPIGet_MCP23S17(char din)
{
     return SPI1_Read(din);
}
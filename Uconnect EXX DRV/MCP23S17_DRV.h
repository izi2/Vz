void SPIPut_MCP23S17(char din);
char SPIGet_MCP23S17(char din);
void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_MCP23S17_Internal_Register(char Register_ADD);
void Init_MCP23S17(void);
char Read_Write_MCP23S17_IO(char PinName,char mode);


enum MCP23S17_IO_Names {EN_1_8V=0,CS_FLASH,RESET_ADP,USER_LED,HOLD_SRAM,WP_FLASH,RESET_VZ,EN_LASER,ESP_RTS,ESP_CTS,ESP_EN_PIN,ESP_RESET,ESP_FLASH};



#define   CS_MCP23S17_Lat                      AN_MIKROBUS_MTXSRX5_Lat
#define   CS_MCP23S17_Buff                     AN_MIKROBUS_MTXSRX5_Buff
#define   CS_MCP23S17_Tris                     AN_MIKROBUS_MTXSRX5_Tris
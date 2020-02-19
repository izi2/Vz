void Init_SRAM(void);
void SPIPut_SRAM(char din);
char SPIGet_SRAM(char din);
void Set_SRAM_Operation_Mode(char mode);
void Write_Byte_To_SRAM_Memory(unsigned long Register_ADD,char Register_Data);
char Read_Byte_From_SRAM_Memory(unsigned long Register_ADD);
void Write_Sequential_Bytes_To_SRAM_Memory(unsigned long Register_ADD,char *TxBuffer,unsigned int BufferLength);
void Read_Sequential_Bytes_From_SRAM_Memory(unsigned long Register_ADD,char *RxBuffer,unsigned int BufferLength);

#define        CS_SRAM_Lat                                               PWM_MIKROBUS_Lat
#define        CS_SRAM_Tris                                              PWM_MIKROBUS_Tris


#define        Instruction_Read_Mode_Register                            0x01
#define        Instruction_Write_Mode_Register                           0x05
#define        Instruction_Read_From_Memory                              0x03
#define        Instruction_Write_To_Memory                               0x02


#define        SRAM_Operation_Mode_Byte                                  0x00
#define        SRAM_Operation_Mode_Page                                  0x02
#define        SRAM_Operation_Mode_Sequential                            0x01







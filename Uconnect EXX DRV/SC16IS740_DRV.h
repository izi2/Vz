void Init_SC16IS740(void);
void Write_To_SC16IS740_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_SC16IS740_Internal_Register(char Register_ADD);
void SC16IS740_WriteBufferToUart(char *buff,char length);
char SC16IS740_ReadBufferFromUart(char *buff);
char CheckSC16IS740UartDataReady(unsigned int  TimeOut,char *buff);
void SPIPut_SC16IS740(char din);
char SPIGet_SC16IS740(char din);



#define    SC16IS740_Buffer_Length       64

#define    CS_SC16IS740_Lat             RST_MIKROBUS_MRXSTX5_Lat
#define    CS_SC16IS740_Tris            RST_MIKROBUS_MRXSTX5_Tris
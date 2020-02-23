#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stdio.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/pic_drv_uconnect.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/timelib.h"
#line 27 "c:/users/itziks/documents/vz/uconnect exx drv/timelib.h"
typedef struct
 {
 unsigned char ss ;
 unsigned char mn ;
 unsigned char hh ;
 unsigned char md ;
 unsigned char wd ;
 unsigned char mo ;
 unsigned int yy ;
 } TimeStruct ;
#line 41 "c:/users/itziks/documents/vz/uconnect exx drv/timelib.h"
extern long Time_jd1970 ;
#line 46 "c:/users/itziks/documents/vz/uconnect exx drv/timelib.h"
long Time_dateToEpoch(TimeStruct *ts) ;
void Time_epochToDate(long e, TimeStruct *ts) ;
void TurnOnRTC_Timer0(void);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/config_file.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/limits.h"
#line 71 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
typedef unsigned char uint_8;





typedef unsigned int uint_16;

typedef unsigned long uint_32;

typedef signed char int_8;

typedef signed int int_16;

typedef signed long int_32;
#line 106 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
typedef uint_16 Mem_AddressType;

typedef uint_32 TimestampType;

typedef struct BitByte
{
 uint_8 bit1:1;
 uint_8 bit2:1;
 uint_8 bit3:1;
 uint_8 bit4:1;
 uint_8 bit5:1;
 uint_8 bit6:1;
 uint_8 bit7:1;
 uint_8 bit8:1;
}BitByte;

typedef union BitAndByte
{
 BitByte bits;
 uint_8 byte;
}BitAndByte;

enum ACK_MODES { NACK = 0, ACK};

typedef enum
{
 UNDEFINED_T,
 SHORT_T,
 USHORT_T,
 INT_T,
 UINT_T,
 LONG_T,
 ULONG_T,
 FLOAT_T,
 STRING_T
} Itype;

typedef union
{
 int_8 i8;
 uint_8 ui8;
 int_16 i16;
 uint_16 ui16;
 int_32 i32;
 uint_32 ui32;
 char s[100];
 float f;
} Global;

typedef union Bytes
{
 void *value;
 uint_8 to_bytes[ sizeof(uint_32) ];
} Bytes;

typedef struct
{
 Itype type;
 Global value;
} Object;

typedef struct Segment
{
 uint_16 start;
 uint_16 end;
} Segment;

typedef enum
{
 U_NONE,
 U_TIME,
 U_TEMP_DEGREE,
 U_PERCENT
} Unit;

typedef enum
{
 NONE_SYMBOL = 0,
 TIME = 'T',
 PERCENT = '%',
 TEMP_DEGREE = 'D',
 TEMP_CELS = 'C',
 TEMP_FAHR = 'F',
 VALUE_START = '(',
 VALUE_END = ')'
} Symbol;

typedef enum Bool
{
 _FALSE1 = 0,
 _TRUE1 = 1
} Bool;


typedef enum
{
 SEND,
 RECEIVE
} TransmissionSide;

typedef enum Switch
{
 OFF1 = 0,
 ON1 = 1
} Switch;

typedef enum Counter_Clock_Edge
{
 RAISING_EDGE = 0, FALLING_EDGE
} CounterEdge;

typedef enum
{
 SPC2,
 Yv_th2,
 minStartN2,
 minStopN2,
 minResult2,
 algo2_params_in_size,

}Algo2ParametersIn;

typedef enum
{

 Result2,
 algo2_params_out_size,


}Algo2ParametersOut;

typedef enum
{
 SPC3_4,
 Yv_thUp3_4,
 Yv_thDn3_4,
 SwitchN3_4,
 MaxNBeforeSmPeak3_4,
 alpha3_4,
 FilterLength3_4,
 AveResultTIn3_4,
 algo_3_4_params_in_size,

}Algo3_4ParametersIn;

typedef enum
{
 AveResultT3_4,
 ResultT3_4,
 NoSmallPeak3_4,
 U1Ipoint3_4,
 U2Ipoint3_4,
 DIpoint3_4,
 AveU1Ipoint3_4,
 AveU2Ipoint3_4,
 AveDIpoint3_4,
 ST3_4,
 a3_4,
 algo_3_4_params_out_size,

}Algo3_4ParametersOut;

typedef enum
{
 SPC5,
 Yv_th5,
 FilterLength5,
 FilterLengthShort5,
 SwitchN5,
 alpha5,
 DToBelt5,
 Error2_th5,
 Error2_N5,
 algo5_params_in_size,

}Algo5ParametersIn;

typedef enum
{
 ST5,
 a5,
 ErorCode5,
 DeltaT5,
 ChBHight5,
 algo5_params_out_size,

}Algo5ParametersOut;

typedef enum
{
 Algorithm_2,
 Algorithm_3_4,
 Algorithm_5,

}Algo_select;

typedef enum
{
 BIST_SINUS,

}Sensor_BIST;




typedef struct Sampling
{
 Bool is_update;
 Bool upload_event;
 float sample;
} Sampling;

typedef Sampling *(*GetGeneralInput)(void);
typedef void (*ActiveMethod)(Switch);
#line 8 "c:/users/itziks/documents/vz/uconnect exx drv/config_file.h"
typedef unsigned char (*Reader)(unsigned int Address);

typedef void (*Writer)(unsigned int Address ,char DataByte);

typedef struct
{
 uint_8 num;
 Mem_AddressType address;

}EepromControl;

void MemWrt(Mem_AddressType address,char _data);

unsigned char MemRd(Mem_AddressType address);

void ConfigFileInit(Writer writer,Reader reader);

void SetAddressProperty(Mem_AddressType address, Mem_AddressType value);

Mem_AddressType GetAddressProperty(Mem_AddressType address);

uint_16 GetIntProperty(Mem_AddressType address);

uint_32 GetLongProperty(Mem_AddressType address);

int_32 GetSignedLongProperty(Mem_AddressType address);

uint_32 GetLong3Property(Mem_AddressType address);

int_16 GetSignedIntProperty(Mem_AddressType start_address);

float GetFloatProperty(Mem_AddressType address);

unsigned char GetProperty(Mem_AddressType address);

Mem_AddressType SetProperty(Mem_AddressType address,uint_8 value);

Mem_AddressType SetIntProperty(Mem_AddressType address, uint_16 value);

Mem_AddressType SetLongProperty(Mem_AddressType address, uint_32 value);

void SetLong3Property(Mem_AddressType address, uint_32 value);

void SetSignedLongProperty(Mem_AddressType start_address, int_32 value);
#line 68 "c:/users/itziks/documents/vz/uconnect exx drv/config_file.h"
Mem_AddressType SetFloatProperty(Mem_AddressType address,float property);
#line 3 "c:/users/itziks/documents/vz/uconnect exx drv/pic_drv_uconnect.h"
void Pseudo_Uart1_Write_Byte(char din);
void Pseudo_Uart1_Write_Text(unsigned char *p);
void Pseudo_Uart1_Enable(char mode);
void CheckAndSwitchToBattery(void);
float GetBatteryVoltage(void);
void Battery_Power_Boost_Activation(char mode);
void SPI1_Initialize_MCP (void);
void Mikrobus_PowerOut_Enable(char mode,unsigned int delay_ms_value);
void BoardInit (void);
void PrintHandler(char c);
char Read_SHD_PIN(void);
void LED_Activation(char color,char mode);
float Get12VInputVoltage(void);
void Init_ExtEeprom(void);
char CheckIfExtEepromIsReady(void);
void ExtEeprom_WriteByte(Mem_AddressType Address,char DataByte);
char ExtEeprom_ReadByte(unsigned int Address);
void Delete_ExtEeprom(void);
float Get4To20IoCurrent(char IO_Num);
float GetIoInputVoltage (char IO_Num);
void Terminal_PowerOut_Enable(char mode,unsigned int delay_ms_value);
void Get_RTCC_TimeStruct(TimeStruct *time_struct);
void Set_RTCC_Time(TimeStruct *time_struct);
void Print_Time_RTCC(void);
void RTCC_Initialize(void);
void RTCC_WRLOCK_BIT_SET(void);
void RTCC_WRLOCK_BIT_CLEAR(void);
void Stop_RTCC(void);
void GetDayOfWeekString(char DayNum,char *str);
void Set_RTCC_Alarm_Time(TimeStruct *time_struct);
void Set_RTCC_Alarm_In_Second(long Second_Value);
void SendAtCommand(unsigned char *p);
void GoToSleepMode(void);
void WakeUpFromSleepMode(void);
void Uart1_Init_MCP(void);
void Uart2_Init_MCP(void);
void CheckRxDataFromInterruptUart2(void);

enum LED_MODE {LED_ON= 0,LED_OFF,LED_NOT,LED_RED,LED_GREEN};
enum SPI1_TRANSFER_MODE {SPI1_TRANSFER_MODE_8BIT= 0,SPI1_TRANSFER_MODE_16BIT,SPI1_TRANSFER_MODE_32BIT};
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/sc16is740_drv.h"
void Init_SC16IS740(void);
void Write_To_SC16IS740_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_SC16IS740_Internal_Register(char Register_ADD);
void SC16IS740_WriteBufferToUart(char *buff,char length);
char SC16IS740_ReadBufferFromUart(char *buff);
char CheckSC16IS740UartDataReady(unsigned int TimeOut,char *buff);
void SPIPut_SC16IS740(char din);
char SPIGet_SC16IS740(char din);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/esp_12f_drv.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
#line 3 "c:/users/itziks/documents/vz/uconnect exx drv/esp_12f_drv.h"
int GetWifiRssi(void);
void ESP_Testing_Func(void);
char Init_ESP(void);
char CheckWifiConnection(void);
char ConnectingToWifiNet(void);
void SendAtCommandToEsp(char *buff);
char WIFI_Send_One_Array(char *m_data, unsigned int len);
char WIFI_Send_One_Array_Not_Wait_To_OK(char *m_data, unsigned int len);
char ConnectToServer(void);
char CheckGettingIP(void);
void ESP_Testing_Vz_Demo(void);
char *PullDataFromIDP(int *length,char *Buff);
char GetEspData(unsigned long TimeOut_uSec_Start);
char CheckDataFromGateway(void);
char ReConnectToServer(void);
void RunAlgorithmAndBuiledTxParametersPacket(void);
void AddRawDataToWifiBuffer(void);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/mcp23s17_drv.h"
void SPIPut_MCP23S17(char din);
char SPIGet_MCP23S17(char din);
void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_MCP23S17_Internal_Register(char Register_ADD);
void Init_MCP23S17(void);
char Read_Write_MCP23S17_IO(char PinName,char mode);


enum MCP23S17_IO_Names {EN_1_8V=0,CS_FLASH,RESET_ADP,USER_LED,HOLD_SRAM,WP_FLASH,RESET_VZ,EN_LASER,ESP_RTS,ESP_CTS,ESP_EN_PIN,ESP_RESET,ESP_FLASH};
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/bitset.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
#line 39 "c:/users/itziks/documents/vz/uconnect exx drv/bitset.h"
typedef struct IntToByte
{

 short high;

 short low;

} IntToBytes;

typedef struct LongToByte
{

 IntToBytes high;

 IntToBytes low;

} LongToBytes;

Mem_AddressType Long2Array(uint_32 along, uint_8 *array, Mem_AddressType array_index);

uint_32 SLong2Array(int_32 along, uint_8 *array, uint_32 array_index);

uint_16 Array2Long(uint_8 *array, uint_32 *to_convert, uint_16 array_index);

uint_16 Array2SLong(uint_8 *array, int_32 *aLong, uint_16 array_index);

Mem_AddressType SInt2Array(int_16 int16, uint_8 *array, uint_32 array_index);

Mem_AddressType Array2SInt(uint_8 *array, int_16 *int16, uint_32 array_index);

uint_16 Array2Float(uint_8 *array, float *afloat, uint_16 array_index);

Mem_AddressType TinyFloat2Array(float aFloat, uint_8 *array, uint_32 array_index);

Mem_AddressType Array2TinyFloat(uint_8 *array, float *aFloat, uint_32 array_index);

Mem_AddressType Float2Array(float afloat, uint_8 *array, uint_16 array_index);

uint_32 Int2Array(uint_16 _int, uint_8 *array, uint_32 array_index);

uint_32 Array2Int(uint_8 *array, uint_16 *_int, uint_32 array_index);

Mem_AddressType Array2AddressType(uint_8 *array, Mem_AddressType *value, uint_32 array_index);

IntToBytes BreakInt(int value);

LongToBytes BreakLong(uint_32 value);

char GetHigh(int value);

char GetLow(uint_16 value);

uint_8 GetLowHalfByte(char value);

uint_8 GetHighHalfByte(char value);

char GetMaxHigh(uint_32 value);

char GetMiddleHigh(uint_32 value);

char GetMinHigh(uint_32 value);

char GetLongLow(uint_32 value);

uint_16 CombineHighLow(uint_8 high, uint_8 low);

int_16 CombineSignedHighLow(uint_8 high, uint_8 low);

uint_32 CombineLongHighLow(uint_8 max_high, uint_8 middle_high, uint_8 min_high, uint_8 low);

uint_32 CombineLong3HighLow(uint_8 high, uint_8 middle, uint_8 low);

int_32 CombineSignedLongHighLow(int_8 max_high, int_8 middle_high, int_8 min_high, int_8 low);

int_8 GetOnBitPosition(uint_32 bits, uint_8 size_bits);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/vz_sensor.h"
char Init_VZ_Sensor(void);
void VzSensor_ReadFWVer(void);
char OpticDataOnSPI_ON(void);
char OpticDataCheckIfReady(void);
void OpticDataGetFrame_AllData(void);
void Vz_SetBist(char mode);
void OpticDataGetFrame_AllData(void);
void OpticDataGetFrame_VelocityOnly(void);
void OpticDataGetFrame_DistanceOnly(void);
void VzSensor_SpiWriteAddr(char target, unsigned int addr,char *TxBuffer,char TxBufferLength);
void VzSensor_SpiReadAddr(char target, unsigned int addr,char *RxBuffer,char RxBufferLength);
void OpticDataGetCleanBuffer(void);


enum VZ_Sensor_Names {Normal=0,Saw,Sinus};
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/vz_algorithm.h"










void Vz_Algorithm_2(void);
void Vz_Algorithm_3_4(void);
void Vz_Algorithm_5(void);
void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint);
void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode);
void void Vz_Algoritem_by_algo_select();
void ResetAlgoParametrsOutBuffer(void);


enum Algo_Types_Names {Algo_2=2,Algo_3_4,Algo_5,No_Algo};
#line 18 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
char volatile Wifi_TX_Buffer[1000];
char volatile ESP_RX_Buffer[ 600 ];
char volatile ESP_GateWay_Buffer[ 600 ];
unsigned int Gateway_Buffer_Length;
char volatile Data_From_Gateway_Flag= 0 ;
unsigned int volatile WifiBufferLength=0;
char CWJAP_String[150];
char CIPSTART_String[150];
char EndUnitID=0;
extern char volatile AlgorithmTypeParametr;
extern char volatile Algo_Parametrs_Out_Buffer[];
extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];



char Init_ESP(void)
{
 PrintOut(PrintHandler, "\rInit ESP(WIFI)...");
 Read_Write_MCP23S17_IO(ESP_EN_PIN,  0 );
 Read_Write_MCP23S17_IO(ESP_FLASH,  1 );
 Delay_ms(300);
 Read_Write_MCP23S17_IO(ESP_EN_PIN,  1 );
 Read_Write_MCP23S17_IO(ESP_RESET,  0 );
 Delay_ms(200);
 Read_Write_MCP23S17_IO(ESP_RESET,  1 );
 Delay_ms(2000);
 Pseudo_Uart1_Enable( 1 );
 Pseudo_Uart1_Write_Text("ATE0\r\n");
 Delay_ms(5);
 Pseudo_Uart1_Write_Text("ATE0\r\n");
 Delay_ms(5);
 Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
 Delay_ms(5);
 Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
 Delay_ms(5);
 Pseudo_Uart1_Enable( 0 );
 SendAtCommandToEsp("ATE0\r\n");
 GetEspData(1000);
 SendAtCommandToEsp("AT+CIPDINFO=0\r\n");
 GetEspData(1000);
 SendAtCommandToEsp("ATE0\r\n");
 GetEspData(1000);
 if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
 SendAtCommandToEsp("ATE0\r\n");
 GetEspData(1000);
 if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
 SendAtCommandToEsp("ATE0\r\n");
 GetEspData(1000);
 if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
 PrintOut(PrintHandler, "\rFailed To Init ESP!!!");
 return 0;

 EspInit_OK:
 PrintOut(PrintHandler, "\rESP successfully initialized");
 return 1;
}

char ConnectToServer(void)
{
 SendAtCommandToEsp(CIPSTART_String);
 GetEspData(5000000);
 if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
#line 84 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
 SendAtCommandToEsp(CIPSTART_String);
 GetEspData(5000000);
 if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
#line 90 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
 return 0;
}

char CheckGettingIP(void)
{
 PrintOut(PrintHandler, ".");
 SendAtCommandToEsp("AT+CIPSTATUS\r\n");
 GetEspData(1000);
 if(strstr(ESP_RX_Buffer,"S:2")) return 1;
 else return 0;
}

char CheckWifiConnection(void)
{

 SendAtCommandToEsp("AT+CIPSTATUS\r\n");
 if(GetEspData(1000)==2) return 1;
 if(strstr(ESP_RX_Buffer,"S:3")) return 1;
 else return 0;
}

char ConnectingToWifiNet(void)
{
 int i=0;
 char cTemp;
 const char LoopLimit=10;
 unsigned long ulTemp=0;
 asm clrwdt;
 PrintOut(PrintHandler, "\rWifi Connection Process...");
 SendAtCommandToEsp("AT+CWMODE=1\r\n");
 GetEspData(1000);
 SendAtCommandToEsp("AT+CIPMUX=0\r\n");
 GetEspData(1000);
 PrintOut(PrintHandler, "\rWaiting For IP...");
 SendAtCommandToEsp(CWJAP_String);
 while(ulTemp++<8000)
 {
 GetEspData(1000);
 if(strstr(ESP_RX_Buffer,"GOT IP")) break;
 }
 if(ulTemp>=8000) {PrintOut(PrintHandler, "\rFailed To Get IP"); return 0;}
 PrintOut(PrintHandler, "\rGeting IP Address Successfully");
 delay_ms(2000);
 if(i=GetWifiRssi()) PrintOut(PrintHandler, "\rRSSI: %ddbm",i);
 else PrintOut(PrintHandler, "\rFailed To Get RSSI");
 PrintOut(PrintHandler, "\rConnecting To Server...");
 if(!ConnectToServer())
 {
 if(!ConnectToServer())
 {
 PrintOut(PrintHandler, "\rFailed To Connect To Server!!!");
 return 0;
 }
 }
 PrintOut(PrintHandler, "\rConnected To Server Successfully");
 LED_Activation(LED_RED,LED_ON);
 return 1;
}

int GetWifiRssi(void)
{


 char *p,i=0,str[10];
 SendAtCommandToEsp("AT+CWJAP?\r\n");
 GetEspData(1000);
 if(!(p=strstr(ESP_RX_Buffer,"-"))) return 0;
 while((p[i]!='\r')&&(i<5)) str[i]=p[i++];
 if(i>=5) return 0;
 str[i]=0;
 return atoi(str);
}

void SendAtCommandToEsp(char *buff)
{
 unsigned int i=0;
#line 169 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
 while(buff[i]!=0)
 {
 Uart1_Write(buff[i]);
 i++;
 }
}

char WIFI_Send_One_Array(char *m_data, unsigned int len)
{
 char cmd[100],cTemp=0;
 unsigned int i;
 SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
 GetEspData(1000);
 sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
 SendAtCommandToEsp(cmd);
 GetEspData(1000);
 if(!strstr(ESP_RX_Buffer,">")) return 0;
 for(i=0;i<len;i++) Uart1_Write(m_data[i]);
  LATG.RG2 =1;
 while(cTemp++<10)
 {
 GetEspData(10000);
 if(strstr(ESP_RX_Buffer,"OK")) break;
 }
 if(cTemp>=10) return 0;
  LATG.RG2 =0;
 return 1;

}

char WIFI_Send_One_Array_Not_Wait_To_OK(char *m_data, unsigned int len)
{

 char cmd[100];
 unsigned int i;
 SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
 GetEspData(1000);
 sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
 SendAtCommandToEsp(cmd);
 GetEspData(1000);
 if(!strstr(ESP_RX_Buffer,">")) return 0;
 for(i=0;i<len;i++) Uart1_Write(m_data[i]);
 return 1;
}

void ESP_Testing_Func(void)
{

 unsigned int BufferLength=140,i,NumOfTx=5;
 char buffer[2048];
 PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
 for(i=0;i<BufferLength;i++) buffer[i]=0xAA;
 for(i=0;i<NumOfTx;i++)
 {
  LATG.RG2 =1;

 WIFI_Send_One_Array(Buffer,BufferLength);
  LATG.RG2 =0;

 }
 PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,BufferLength,(unsigned long)((unsigned long)NumOfTx*(unsigned long)BufferLength));

}

void ESP_Testing_Vz_Demo(void)
{

 unsigned int vz[60],i,j,k,NumOfTx=0,uiTemp,WifiCounter=0,LedOut=0,LedCount,NumOfCycle=30;
 char Wifi_Buffer[2048],cTemp;
 char SamplingCounter=0;
 PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
 for(i=0;i<60;i++) vz[i]=300+i;
 for(k=0;k<NumOfCycle;k++)
 {
 asm clrwdt;

 if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);}
 if(SamplingCounter==0)
 {
 j=0;
 Wifi_Buffer[j++]=1;
 Wifi_Buffer[j++]=0;
 Wifi_Buffer[j++]=120;
 Wifi_Buffer[j++]=0x01;
 for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
 Wifi_Buffer[j++]=1;
 Wifi_Buffer[j++]=0;
 Wifi_Buffer[j++]=20;
 Wifi_Buffer[j++]=0x04;
 for(i=0;i<20;i++) Wifi_Buffer[j++];
 SamplingCounter++;
 }
 else
 {
 Wifi_Buffer[j++]=1;
 Wifi_Buffer[j++]=0;
 Wifi_Buffer[j++]=120;
 Wifi_Buffer[j++]=0x01;
 for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
 SamplingCounter++;
 if(SamplingCounter==5)
 {
 uiTemp=j;
 NumOfTx++;


 WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_Buffer,j);

 SamplingCounter=0;
 }
 }
 Delay_ms(10);

 if(WifiCounter++> 600 )
 {
 WifiCounter=0;
 if(CheckWifiConnection()==0)
 {
 SendAtCommandToEsp("+++");
 PrintOut(PrintHandler, "\rWIFI Connection Not OK!");


 if(!ConnectToServer())
 if(!ConnectToServer()) ConnectToServer();
 if(!CheckWifiConnection())
 if(!CheckWifiConnection())
 if(!CheckWifiConnection())
 {
 if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);}
 ConnectingToWifiNet();
 }

 }
 }
 }
 Read_Write_MCP23S17_IO(USER_LED, 1 );
 PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,uiTemp,(unsigned long)((unsigned long)NumOfTx*(unsigned long)uiTemp));
}


char *PullDataFromIDP(int *length,char *Buff)
{

 char i,*p1,*p2,text[10];
 if(strstr(Buff,"+IPD"))
 {

 p1=strstr(Buff,"+IPD,");
 p2=strstr(p1,":");
 if((p1)&&(p2))
 {
 i=5;
 while(p1[i]!=':')
 {
 text[i-5]=p1[i++];
 }
 text[i-5]=0;
 *length=atoi(text);
 p2++;
 return p2;
 }
 else return 0;
 }
}

char CheckDataFromGateway(void)
{
 char *p;
 int i;
 if(( IFS0bits.U1RXIF )&&(strstr(ESP_RX_Buffer,"+IPD")))
 {
 if(!(p=PullDataFromIDP(&Gateway_Buffer_Length,ESP_RX_Buffer))) {Data_From_Gateway_Flag= 0 ;return 0;}
 Data_From_Gateway_Flag= 1 ;
 for(i=0;i<Gateway_Buffer_Length;i++) ESP_GateWay_Buffer[i]=p[i];
#line 347 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
 U1STAbits.OERR=0;
  IFS0bits.U1RXIF =0; IEC0bits.U1RXIE =1;
 return 1;
 }
 else return 0;
}

char GetEspData(unsigned long TimeOut_uSec_Start)
{
 unsigned long ulTemp=0;

 if(CheckDataFromGateway()) return 2;
 else { IFS0bits.U1RXIF =0; IEC0bits.U1RXIE =1;}
 while((ulTemp++<TimeOut_uSec_Start)&&( IFS0bits.U1RXIF ==0)) {asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;}
 U1STAbits.OERR=0;
 if( IFS0bits.U1RXIF )
 {
 if(CheckDataFromGateway()) return 2;
#line 368 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/ESP_12F_DRV.c"
  IFS0bits.U1RXIF =0; IEC0bits.U1RXIE =1;
 return 1;
 }
  IFS0bits.U1RXIF =0; IEC0bits.U1RXIE =1;
 return 0;
}

char ReConnectToServer(void)
{
 {
 LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);
 SendAtCommandToEsp("+++");
 if(!ConnectToServer())
 if(!ConnectToServer())
 if(!ConnectToServer()) ConnectToServer();
 if(!CheckWifiConnection())
 if(!CheckWifiConnection())
 if(!CheckWifiConnection())
 {
 return ConnectingToWifiNet();
 }
 LED_Activation(LED_RED,LED_ON);LED_Activation(LED_GREEN,LED_ON);
 return 1;
 }
}

void RunAlgorithmAndBuiledTxParametersPacket(void)
{
 unsigned int i;
 switch (AlgorithmTypeParametr)
 {
 case No_Algo:
 OpticDataGetCleanBuffer();
 return;
 break;
 case Algo_2:
 Vz_Algorithm_2();
 if(Algo_Parametrs_Out_Buffer[0])
 {
 WifiBufferLength++;
 Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]= 2 ;
 Wifi_TX_Buffer[WifiBufferLength++]=Algo_2;
 Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[1];
 Wifi_TX_Buffer[WifiBufferLength]=Algo_Parametrs_Out_Buffer[2];
 }
 break;
 case Algo_3_4:
 Vz_Algorithm_3_4();
 if(Algo_Parametrs_Out_Buffer[0])
 {
 Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]= 22 ;
 Wifi_TX_Buffer[WifiBufferLength++]=Algo_3_4;
 for(i=1;i<= 22 ;i++) Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[i];
 }
 break;
 case Algo_5:
 Vz_Algorithm_5();
 if(Algo_Parametrs_Out_Buffer[0])
 {
 Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]= 10 ;
 Wifi_TX_Buffer[WifiBufferLength++]=Algo_5;
 for(i=1;i<= 10 ;i++) Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[i];
 }
 break;
 }
}

void AddRawDataToWifiBuffer(void)
{
 char i;
 if(AlgorithmTypeParametr==No_Algo)
 {
 OpticDataGetFrame_AllData(void);
 Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]=120;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
 Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]=120;
 Wifi_TX_Buffer[WifiBufferLength++]=1;
 for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Distance_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
 return;

 }
 else if(AlgorithmTypeParametr==Algo_5)
 {
 Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]=120;
 Wifi_TX_Buffer[WifiBufferLength++]=1;
 for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Distance_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
 return;
 }
 else
 { Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 Wifi_TX_Buffer[WifiBufferLength++]=120;
 Wifi_TX_Buffer[WifiBufferLength++]=0;
 for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
 return;
 }
}

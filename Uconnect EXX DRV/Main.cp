#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Main.c"
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
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/debug_drv.h"
void PrintRealTime(unsigned int TimeInSec);
void Pseudo_Uart2_Write_Byte(char din);
void Pseudo_Uart2_Write_Text(unsigned char *p);
void Pseudo_Uart2_Enable(char mode);
int GetSampleFromUart(void);
void InitUartForRxData(void);
void Get60SamplesFromUart(void);
void PrintOpticDataToUart(char mode);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/vz_algorithm.h"










void Vz_Algorithm_2(void);
void Vz_Algorithm_3_4(void);
void Vz_Algorithm_5(void);
void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint);
void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode);
void void Vz_Algoritem_by_algo_select();
void ResetAlgoParametrsOutBuffer(void);


enum Algo_Types_Names {Algo_2=2,Algo_3_4,Algo_5,No_Algo};
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/sc16is740_drv.h"
void Init_SC16IS740(void);
void Write_To_SC16IS740_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_SC16IS740_Internal_Register(char Register_ADD);
void SC16IS740_WriteBufferToUart(char *buff,char length);
char SC16IS740_ReadBufferFromUart(char *buff);
char CheckSC16IS740UartDataReady(unsigned int TimeOut,char *buff);
void SPIPut_SC16IS740(char din);
char SPIGet_SC16IS740(char din);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/mcp23s17_drv.h"
void SPIPut_MCP23S17(char din);
char SPIGet_MCP23S17(char din);
void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_MCP23S17_Internal_Register(char Register_ADD);
void Init_MCP23S17(void);
char Read_Write_MCP23S17_IO(char PinName,char mode);


enum MCP23S17_IO_Names {EN_1_8V=0,CS_FLASH,RESET_ADP,USER_LED,HOLD_SRAM,WP_FLASH,RESET_VZ,EN_LASER,ESP_RTS,ESP_CTS,ESP_EN_PIN,ESP_RESET,ESP_FLASH};
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/sram_is62wvs5128gbll_drv.h"
void Init_SRAM(void);
void SPIPut_SRAM(char din);
char SPIGet_SRAM(char din);
void Set_SRAM_Operation_Mode(char mode);
void Write_Byte_To_SRAM_Memory(unsigned long Register_ADD,char Register_Data);
char Read_Byte_From_SRAM_Memory(unsigned long Register_ADD);
void Write_Sequential_Bytes_To_SRAM_Memory(unsigned long Register_ADD,char *TxBuffer,unsigned int BufferLength);
void Read_Sequential_Bytes_From_SRAM_Memory(unsigned long Register_ADD,char *RxBuffer,unsigned int BufferLength);
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
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
#line 22 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
typedef enum
{
 C_CHAR,
 C_UCHAR,
 C_16INT,
 C_U16INT,

}TypeMem;



typedef struct
{
 Mem_AddressType address;
 Mem_AddressType endAddress;
 TypeMem typeMem;


}propertySensor;


typedef struct
{
 propertySensor idS;
 propertySensor pointerLeaser;
 propertySensor transmitedToGatway;
 propertySensor sensorBist;
 propertySensor algoSelected;
 propertySensor paramsIn;
 propertySensor networkName;
 propertySensor networkPassword;
 propertySensor networkPort;
 propertySensor networkServerIp;
 propertySensor transmitRowData;

}ConfigSensor;
#line 76 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
void initConfigSensor(ConfigSensor * confSensor);
void saveDefultConfig(ConfigSensor * confSensor);
void saveInEEpromPropertyConfig(propertySensor* propertySens, void* value);
void readFromMemProperty(propertySensor* propertySens,void* dest);

char isFirstProgrammin();
char setFirstProgmmanigToFalse();
void initConfig();
void LoadUnitId(ConfigSensor* cS);
void LoadAlgoSelected(ConfigSensor* cS);
void LoadPointerLeaser(ConfigSensor* cS);
void LoadParamsIn(ConfigSensor* cS);
void LoadWifi(ConfigSensor* cS);
void LoadTransmitedToGatway(ConfigSensor* cS);
void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/config_file.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/process_data.h"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
#line 16 "c:/users/itziks/documents/vz/uconnect exx drv/process_data.h"
typedef enum
{
 H_TYPE_DATA,
 H_LENGTH_DATA
}type_headers;


typedef enum
{
 P_POINTER_LEASER = 5,
 P_TRANSMITED_TO_GATWAY,
 P_SENSOR_BIST,
 P_RTC_UPDATE,
 P_ALGO_SELECTED,
 P_PARAMS,
 P_NET_NAME,
 P_NET_PASS,
 P_NET_PORT,
 P_NET_IP,
 P_ID_SENSOR,
 P_TRANSMITED_ROW_DATA,
 P_STATUS,
 P_BYTES_FROM_SENS,


}type_data;

void parssData(char* buffer,int bufferLength);
void BildStringWifi(char* name, char* pass, char* ip, char* port);
#line 14 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Main.c"
extern char volatile Wifi_TX_Buffer[];
extern unsigned int volatile WifiBufferLength;
extern char volatile UART2_RX_Interrupt_Buffer[];
extern char volatile ESP_GateWay_Buffer[];
extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];
extern char volatile ESP_RX_Buffer[];
extern char volatile Data_From_Gateway_Flag;
extern unsigned int Gateway_Buffer_Length;
void Init_uClick_VZ(void);

char volatile VZ_ON_Flag;
char volatile Wifi_Buffer[1000];
char volatile wifi_state=0;
char RawDataTX_Enable= 0 ;
char PlcDataTX_Enable= 1 ;
char PointerLeaser_Enable= 0 ;
extern char CWJAP_String[];
extern char CIPSTART_String[];
extern char volatile AlgorithmTypeParametr;


void main()
{
 char LedCount=0,LedOut=0,OpticDataFlag;
 unsigned int WifiCounter=0,VZCounter=0,i,SamplingCounter=0,k;

 BoardInit();
  IFS0bits.U1RXIF =0; IEC0bits.U1RXIE =1;
 LED_Activation(LED_GREEN,LED_ON);
 Init_uClick_VZ();

 ConfigFileInit(ExtEeprom_WriteByte,ExtEeprom_ReadByte);
 initConfig();




 if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);wifi_state=0;}
 else wifi_state=ConnectingToWifiNet();

 PrintOut(PrintHandler, "\r***** S T A R T - M a i n *******");
 while( 1 )
 {
 asm clrwdt;


 if(VZ_ON_Flag)
 {
 while((!(OpticDataFlag=OpticDataCheckIfReady()))&&(VZCounter++<15000)) {asm clrwdt;Delay_us(1);}
 if(OpticDataFlag)
 {
  LATG.RG2 ^=1;
 if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);}


 if((AlgorithmTypeParametr!=No_Algo)||((AlgorithmTypeParametr==No_Algo)&&(RawDataTX_Enable== 0 ))) RunAlgorithmAndBuiledTxParametersPacket();
 if(RawDataTX_Enable== 1 ) AddRawDataToWifiBuffer();



 if(WifiBufferLength)
 {
 WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_TX_Buffer,WifiBufferLength);
 WifiBufferLength=0;
 }

 }
 else OpticDataGetCleanBuffer();
 }
 else Delay_ms(10);
 VZCounter=0;


 if(Data_From_Gateway_Flag)
 {


 parssData(ESP_GateWay_Buffer, Gateway_Buffer_Length);



 Data_From_Gateway_Flag= 0 ;
 }


 if(WifiCounter++> 600 )
 {
 WifiCounter=0;
 if(CheckWifiConnection()==0) wifi_state= ReConnectToServer();
 }


 CheckAndSwitchToBattery();
 }
}






void Init_uClick_VZ(void)
{
 Mikrobus_PowerOut_Enable( 1 ,100);
 CheckAndSwitchToBattery();
 SPI1_Init();
 SPI1_Initialize_MCP();
 Delay_ms(10);
  TRISF.RF6 = 1 ;
  TRISD.RD9 = 0 ;
  LATD.RD9 = 1 ;
  LATB.RB5 = 1 ;
  ANSB.RB5 = 0 ;
  TRISB.RB5 = 0 ;
  TRISE.RE5 = 0 ;
  LATE.RE5 = 1 ;
  LATF.RF4 = 1 ;
 Init_MCP23S17();
 Init_SC16IS740();
 Read_Write_MCP23S17_IO(EN_1_8V, 1 );
 Read_Write_MCP23S17_IO(USER_LED, 1 );
 Init_SRAM();
 Init_ExtEeprom();
 }






void UART2_Interrupt() iv IVT_ADDR_U2RXINTERRUPT
{
 unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=( 200 -1);
 U2STAbits.OERR=0;
  IEC1bits.U2RXIE =0;
  IFS1bits.U2RXIF =1;
 i=0;
 while(1)
 {
 while((!Uart2_Data_Ready()) && (time_counter < TimeLimit))
 {
 Delay_us(100);
 time_counter++;
 }
 if (time_counter<TimeLimit)
 {
 time_counter=0;
 if (i<uiTemp) UART2_RX_Interrupt_Buffer[i++]=Uart2_Read();
 else Uart2_Read();
 }
 else
 {
 UART2_RX_Interrupt_Buffer[i]=0;
 U2STAbits.OERR=0;
 return;
 }
 }
}

void UART1_Interrupt() iv IVT_ADDR_U1RXINTERRUPT
{
 unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=( 200 -1);
 U1STAbits.OERR=0;
  IEC0bits.U1RXIE =0;
  IFS0bits.U1RXIF =1;
 i=0;
 while(1)
 {
 time_counter=0;
 while((!Uart1_Data_Ready()) && (time_counter < TimeLimit))
 {
 Delay_us(1);
 time_counter++;
 }
 if (time_counter<TimeLimit)
 {
 if (i<uiTemp) ESP_RX_Buffer[i++]=Uart1_Read();
 else Uart1_Read();
 }
 else
 {
 ESP_RX_Buffer[i]=0;
 U1STAbits.OERR=0;
 return;
 }
 }
}

void RTCC_Alarm() iv IVT_ADDR_RTCCINTERRUPT
{
 RTCCON1H.ALRMEN= 0 ;
  IEC3.RTCIE = 0 ;
 WakeUpFromSleepMode();
 PrintOut(PrintHandler, "\r*****RTCC INTERRUPT*******");
 return;
}

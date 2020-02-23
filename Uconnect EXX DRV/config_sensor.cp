#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/config_sensor.c"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
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
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/types.h"
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
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/mcp23s17_drv.h"
void SPIPut_MCP23S17(char din);
char SPIGet_MCP23S17(char din);
void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_MCP23S17_Internal_Register(char Register_ADD);
void Init_MCP23S17(void);
char Read_Write_MCP23S17_IO(char PinName,char mode);


enum MCP23S17_IO_Names {EN_1_8V=0,CS_FLASH,RESET_ADP,USER_LED,HOLD_SRAM,WP_FLASH,RESET_VZ,EN_LASER,ESP_RTS,ESP_CTS,ESP_EN_PIN,ESP_RESET,ESP_FLASH};
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
#line 11 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/config_sensor.c"
int_16 paramsDefult[ 15 ] = {4000, 2000, 10, 10, 200};
int_16 ParamsIn[ 15 ];
extern char CWJAP_String[];
extern char CIPSTART_String[];
extern char volatile EndUnitID;
extern char volatile AlgorithmTypeParametr;
extern char volatile PointerLeaser_Enable;
extern char volatile RawDataTX_Enable;
extern char volatile PlcDataTX_Enable;


Mem_AddressType setAddressPropertyC(propertySensor *propertySens, Mem_AddressType address, uint_8 sizePerItem,
 uint_8 endPropertyAddress)
{
 uint_8 endAddress;
 propertySens->address = address;
 propertySens->typeMem = sizePerItem;
 endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
 propertySens->endAddress = address + endAddress;
 return propertySens->endAddress;
}


void initConfigSensor(ConfigSensor *confSensor)
{

 Mem_AddressType i;
 i = setAddressPropertyC(&confSensor->idS,  40 , C_UCHAR, 0);

 i = setAddressPropertyC(&confSensor->algoSelected, i, C_UCHAR, 0);

 i = setAddressPropertyC(&confSensor->pointerLeaser, i, C_UCHAR, 0);

 i = setAddressPropertyC(&confSensor->transmitedToGatway, i, C_UCHAR, 0);

 i = setAddressPropertyC(&confSensor->transmitRowData, i, C_UCHAR, 0);

 i = setAddressPropertyC(&confSensor->sensorBist, i, C_UCHAR, 0);

 i = setAddressPropertyC(&confSensor->paramsIn, i, C_16INT,  15  * 2);

 i = setAddressPropertyC(&confSensor->networkName, i, C_UCHAR,  30 );

 i = setAddressPropertyC(&confSensor->networkPassword, i, C_UCHAR,  30 );

 i = setAddressPropertyC(&confSensor->networkPort, i, C_UCHAR,  8 );

 i = setAddressPropertyC(&confSensor->networkServerIp, i, C_UCHAR,  20 );

}

void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index)
{
 uint_8 i =0;

 for (i = propertySens->address; i < propertySens->endAddress;i++)
 {

 dest[index++] = GetProperty(i);

 }
 PrintOut(PrintHandler, "\rdest %s, ", dest);


}


void saveInEEpromPropertyConfig(propertySensor *propertySens, void *value)
{
 Mem_AddressType i;

 uint_8 *tmp = (uint_8 *) value;
 for (i = propertySens->address; i < propertySens->endAddress; i++)
 {
 MemWrt(i, *tmp);
 ++tmp;
 }

}

void saveDefultConfig(ConfigSensor *confSensor)
{

 saveInEEpromPropertyConfig(&confSensor->idS, &EndUnitID);
 saveInEEpromPropertyConfig(&confSensor->algoSelected, &AlgorithmTypeParametr);
 saveInEEpromPropertyConfig(&confSensor->pointerLeaser, &PointerLeaser_Enable);
 saveInEEpromPropertyConfig(&confSensor->transmitRowData, &RawDataTX_Enable);
 saveInEEpromPropertyConfig(&confSensor->transmitedToGatway, &PlcDataTX_Enable);
 saveInEEpromPropertyConfig(&confSensor->paramsIn, paramsDefult);
 saveInEEpromPropertyConfig(&confSensor->networkName, "Ravtech-Public\0");
 saveInEEpromPropertyConfig(&confSensor->networkPassword, "@ravTech!\0");
 saveInEEpromPropertyConfig(&confSensor->networkPort, "9875\0");
 saveInEEpromPropertyConfig(&confSensor->networkServerIp, "192.168.16.118\0");

}



char isFirstProgrammin()
{
 return GetProperty(0);
}

char setFirstProgmmanigToFalse()
{
 MemWrt(0, 0);
}

void Enable_VZ_Pointer(char mode)
{
 Read_Write_MCP23S17_IO(EN_LASER, mode);
}


void readFromMemProperty(propertySensor *propertySens, void *dest)
{
 Mem_AddressType i;

 uint_8 *tmp = (uint_8 *) dest;
 int_16 *tmpI = (int_16 *) dest;

 for (i = propertySens->address; i < propertySens->endAddress;)
 {
 if (propertySens->typeMem == C_16INT)
 {
 *tmpI = GetSignedIntProperty(i);
 i += 2;
 ++tmpI;
 }
 if (propertySens->typeMem == C_UCHAR)
 {
 *tmp = GetProperty(i);
 ++tmp;
 ++i;
 }
 }


}

void BildStringWifi(char *name, char *pass, char *ip, char *port)
{

 PrintOut(PrintHandler, "\rname %s, pass %s, ip %s, port %s;\n", name, pass, ip, port);
 strcpy(CWJAP_String, "AT+CWJAP=\"");
 strcat(CWJAP_String, name);
 strcat(CWJAP_String, "\",\"");
 strcat(CWJAP_String, pass);
 strcat(CWJAP_String, "\"\r\n");
 strcpy(CIPSTART_String, "AT+CIPSTART=\"TCP\",\"");
 strcat(CIPSTART_String, ip);
 strcat(CIPSTART_String, "\",");
 strcat(CIPSTART_String, port);
 strcat(CIPSTART_String, "\r\n");
 PrintOut(PrintHandler, "NET %s %s ", CWJAP_String, CIPSTART_String);
}

void LoadALLSchem(ConfigSensor *cS)
{
 LoadUnitId(cs);
 LoadAlgoSelected(cs);
 LoadPointerLeaser(cs);
 LoadParamsIn(cs);
 LoadWifi(cs);
 LoadTransmitedToGatway(cs);

}

void initConfig()
{
 uint_8 firstProgramm = 0;
 ConfigSensor cS;


 initConfigSensor(&cS);


 firstProgramm = isFirstProgrammin();
 firstProgramm = 1;

 if (firstProgramm)
 {
 saveDefultConfig(&cS);
 setFirstProgmmanigToFalse();
 }
 LoadALLSchem(&cS);


}

void LoadUnitId(ConfigSensor *cS)
{
 readFromMemProperty(&cS->idS, &EndUnitID);
}

void LoadAlgoSelected(ConfigSensor *cS)
{
 readFromMemProperty(&cS->algoSelected, &AlgorithmTypeParametr);

}

void LoadPointerLeaser(ConfigSensor *cS)
{
 readFromMemProperty(&cS->pointerLeaser, &PointerLeaser_Enable);
 Enable_VZ_Pointer(PointerLeaser_Enable);
}

void LoadParamsIn(ConfigSensor *cS)
{
 uint_8 i = 0;
 readFromMemProperty(&cS->paramsIn, &ParamsIn);
}

void LoadWifi(ConfigSensor *cS)
{
 char name_net[ 30 ];
 char password_net[ 30 ];
 char port_net[ 8 ];
 char server_ip_net[ 20 ];

 readFromMemProperty(&cS->networkName, &name_net);
 readFromMemProperty(&cS->networkPassword, &password_net);
 readFromMemProperty(&cS->networkPort, &port_net);
 readFromMemProperty(&cS->networkServerIp, &server_ip_net);
 BildStringWifi(name_net, password_net, server_ip_net, port_net);
 ConnectingToWifiNet();


}



void LoadTransmitedToGatway(ConfigSensor *cS)
{
 readFromMemProperty(&cS->transmitedToGatway, &RawDataTX_Enable);
}

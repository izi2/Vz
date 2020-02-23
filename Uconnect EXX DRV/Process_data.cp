#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Process_data.c"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/process_data.h"
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
 BIST_0,
 BIST_1,
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
#line 25 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
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
#line 79 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
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
void LoadSensorBist(ConfigSensor* cS);
void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index);
#line 16 "c:/users/itziks/documents/vz/uconnect exx drv/process_data.h"
typedef enum
{
 H_TYPE_DATA,
 H_LENGTH_DATA
}type_headers;


typedef enum
{
 P_POINTER_LEASER = 6,
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
 P_GET_RAW_DATA,


}type_data;

void parssData(char* buffer,int bufferLength);
void BildStringWifi(char* name, char* pass, char* ip, char* port);
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/config_sensor.h"
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
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/vz_algorithm.h"










void Vz_Algorithm_2(void);
void Vz_Algorithm_3_4(void);
void Vz_Algorithm_5(void);
void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint);
void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode);
void void Vz_Algoritem_by_algo_select();
void ResetAlgoParametrsOutBuffer(void);


enum Algo_Types_Names {Algo_2=2,Algo_3_4,Algo_5,No_Algo};
#line 13 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Process_data.c"
extern int_16 volatile ParamsIn[];
extern char volatile EndUnitID;

extern char CWJAP_String[];
extern char CIPSTART_String[];
extern char volatile AlgorithmTypeParametr;
extern char volatile PointerLeaser_Enable;
extern char volatile RawDataTX_Enable;
extern char volatile PlcDataTX_Enable;
extern char volatile SensorBist;
extern char volatile SendMeRawData;

void sendStatus();

uint_16 setHeaders(char *header, char *buffer, uint_16 index)
{
 header[H_TYPE_DATA] = (uint_8) buffer[index];
 header[H_LENGTH_DATA] = (uint_8) buffer[index + 1];



 return index +  2 ;
}

uint_16 setData(char *datap, char *header, char *buffer, uint_16 index)
{
 uint_16 i = 0;
 for (; i < header[H_LENGTH_DATA]; i++)
 {
 datap[i] = buffer[index];
 index++;
 }
 datap[i] = '\0';
 return index;
}

void insertParamsToParamsIn(char *datap, uint_8 len)
{
 uint_8 i = 0;
 int_16 value;
 for (; i < len; i += 2)
 {
 value = CombineSignedHighLow((uint_8) datap[i], (uint_8) datap[i + 1]);

 if (value != -1)
 {
 ParamsIn[i / 2] = value;
 }
 }
}

char* AddHeaders(uint_8 type,uint_8 length, char* dataS,uint_8 index)
{

 dataS[index++] = EndUnitID;
 dataS[index++] = 0;
 dataS[index++] = length;
 dataS[index++] = type;

 return index;

}


void parssData(char *buffer, int bufferLength)
{
 uint_8 HEADERS[ 2 ];
 char DATA[ 40 ];
 uint_8 changesInNet = 0;
 uint_16 i = 0;
 ConfigSensor cS;
 initConfigSensor(&cS);
 while (i < bufferLength)
 {
 i = setHeaders(HEADERS, buffer, i);
 i = setData(DATA, HEADERS, buffer, i);

 PrintOut(PrintHandler, "\rlen %d, type %d", HEADERS[H_LENGTH_DATA], HEADERS[H_TYPE_DATA]);
 switch (HEADERS[H_TYPE_DATA])
 {
 case P_ID_SENSOR:
 saveInEEpromPropertyConfig(&cS.idS, &DATA[0]);
 LoadUnitId(&cS);
 break;
 case P_ALGO_SELECTED:
 saveInEEpromPropertyConfig(&cS.algoSelected, &DATA[0]);
 LoadAlgoSelected(&cS) ;
 break;

 case P_TRANSMITED_TO_GATWAY:
 saveInEEpromPropertyConfig(&cS.transmitedToGatway, &DATA[0]);
 LoadTransmitedToGatway(&cS);
 break;

 case P_TRANSMITED_ROW_DATA:
 saveInEEpromPropertyConfig(&cS.transmitRowData, &DATA[0]);
 LoadTransmitedToGatway(&cS);
 break;

 case P_POINTER_LEASER:
 saveInEEpromPropertyConfig(&cS.pointerLeaser, &DATA[0]);
 LoadPointerLeaser(&cS) ;
 break;


 case P_SENSOR_BIST:
 saveInEEpromPropertyConfig(&cS.sensorBist, &DATA[0]);
 LoadSensorBist(&cS);
 break;

 case P_NET_NAME:
 saveInEEpromPropertyConfig(&cS.networkName, DATA);
 changesInNet = 1;
 break;


 case P_NET_PASS:
 saveInEEpromPropertyConfig(&cS.networkPassword, DATA);
 changesInNet = 1;
 break;
 case P_NET_PORT:
 saveInEEpromPropertyConfig(&cS.networkPort, DATA);
 changesInNet = 1;
 break;
 case P_NET_IP:
 saveInEEpromPropertyConfig(&cS.networkServerIp, DATA);
 changesInNet = 1;
 break;
 case P_PARAMS:
 insertParamsToParamsIn(DATA, HEADERS[H_LENGTH_DATA]);
 saveInEEpromPropertyConfig(&cS.paramsIn, ParamsIn);
 break;
 case P_STATUS:
 sendStatus();
 break;

 case P_GET_RAW_DATA:
 SendMeRawData = DATA[0];
 PrintOut(PrintHandler, "\rSendMeRawData %d",SendMeRawData);
 break;

 }
 if (changesInNet)
 {
 LoadWifi(&cS);
 }

 }


}

uint_8 lenParams()
{
 switch (AlgorithmTypeParametr)
 {
 case Algo_2:
 return algo2_params_in_size;

 case Algo_3_4:
 return algo_3_4_params_in_size;
 case Algo_5:
 return algo5_params_in_size;
 case No_Algo:
 return 0;
 }
}

uint_8 addStringData(propertySensor* propertyRead,uint_8 typeData, char* dataSend,uint_8 index)
{
 char tempData[50];
 uint_8 lenData = 0;
 uint_8 i = 0;
 readEEpromRawData(propertyRead, tempData,0);
 lenData = strlen(tempData);
 index = AddHeaders(typeData,lenData,dataSend,index);

 for(i=0;i<lenData;i++)
 {
 dataSend[index++] = tempData[i];
 }

 return index;
}

void sendStatus()
{
 ConfigSensor cS;
 uint_8 i = 0;
 char dataSend[ 300 ];
 uint_8 index = 0;
 uint_8 lenData = 0;
 char tempData[30];

 initConfigSensor(&cS);

 index = AddHeaders(P_ID_SENSOR,1,dataSend,index);
 dataSend[index++] = EndUnitID;

 index = AddHeaders(P_POINTER_LEASER,1,dataSend,index);
 dataSend[index++] = PointerLeaser_Enable;


 index = AddHeaders(P_TRANSMITED_TO_GATWAY,1,dataSend,index);
 dataSend[index++] = PlcDataTX_Enable;

 index = AddHeaders(P_TRANSMITED_ROW_DATA,1,dataSend,index);
 dataSend[index++] = RawDataTX_Enable;

 index = AddHeaders(P_ALGO_SELECTED,1,dataSend,index);
 dataSend[index++] = AlgorithmTypeParametr - 2;

 index = AddHeaders(P_SENSOR_BIST,1,dataSend,index);
 dataSend[index++] = SensorBist;


 lenData = lenParams();
 if(lenData)
 {
 index = AddHeaders(P_PARAMS,lenData*2,dataSend,index);
 for(;i< lenData;i++)
 {
 index = Int2Array(ParamsIn[i], dataSend, index);
 }
 }

 index = addStringData(&cS.networkName,P_NET_NAME,dataSend,index);
 index = addStringData(&cS.networkPassword,P_NET_PASS,dataSend,index);
 index = addStringData(&cS.networkPort,P_NET_PORT,dataSend,index);
 index = addStringData(&cS.networkServerIp,P_NET_IP,dataSend,index);

 WIFI_Send_One_Array_Not_Wait_To_OK(dataSend,index);



}

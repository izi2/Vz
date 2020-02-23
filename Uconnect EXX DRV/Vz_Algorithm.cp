#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
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
void LoadSensorBist(ConfigSensor* cS);
void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index);
#line 10 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];
extern int_16 volatile ParamsIn[];

char volatile Algo_Parametrs_Out_Buffer[ 23 ];
char AlgorithmTypeParametr=No_Algo;



void Vz_Algorithm_5(void)
{
#line 25 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 int SPC = ParamsIn[SPC5];
 int Yv_th = ParamsIn[Yv_th5] ;
 int FilterLength = ParamsIn[FilterLength5];
 int FilterLengthShort = ParamsIn[FilterLengthShort5];
 int SwitchN = ParamsIn[SwitchN5] ;
 int alpha = ParamsIn[alpha5] ;
 static int DToBelt = ParamsIn[DToBelt5] ;
 int Error2_th = ParamsIn[Error2_th5] ;
 int Error2_N = ParamsIn[Error2_N5] ;
#line 52 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 static int DeltaT=0;
 static int ChBHight=0;

 static int DXpoint=0;
 static int DXpointLast=0;
 static int UIpoint=0;
 static int DIpoint=0;
 static int UXpoint=0;
 static int UXpointLast=0;

 static int dC=0;
 static int C0=0;
 static int C1=0;
 static int C2=0;
 static int ST=2;

 int FilterDelta;
 int SPCC;
 static int FilterBuffer[ 200 ]={0},PointerIndex=0;
 int Y,k,j,Yf,Yfs;
 ResetAlgoParametrsOutBuffer();
 OpticDataGetFrame_DistanceOnly();

 SPCC=SPC/60;
 FilterDelta=FilterLength-FilterLengthShort-1;
 if(SwitchN==0) SwitchN=(FilterDelta+1)/2;
 if(DIpoint==0) DIpoint=DToBelt;

 Y=0;
 for(k=0;k<60;k++) Y+=Vz_Sensor_Distance_Buffer_int[k]/60;
 FilterBuffer[PointerIndex]=Y;
 k=0;Yf=0;Yfs=0;
 for(j=0;j<FilterLength;j++)
 {
 if((PointerIndex+j)>(FilterLength-1)) k=PointerIndex+j-FilterLength;
 else k=PointerIndex+j;
 Yf+=FilterBuffer[k]/FilterLength;
 if(j>FilterDelta) Yfs+=FilterBuffer[k]/FilterLengthShort;
 }
 PointerIndex++;
 if(PointerIndex>=FilterLength) PointerIndex=0;
 dC++;
 switch (ST)
 {
 case 2:
 if(Yfs<(DToBelt-Yv_th))
 {
 C0++;C1=0;
 if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
 }
 else if(Yfs>(Error2_th*(DToBelt/10)))
 {
 C2++;
 if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
 }
 else
 {
 C1++;C0=0;
 if(C1>SwitchN)
 {
 ST=1;C2=0;UIpoint=0;dC=0;
 }
 }
 break;
 case 0:
 if(Yfs<(DToBelt-Yv_th))
 {
 C0++;C1=0;
 if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
 if((DToBelt-Yf)>(DToBelt-DIpoint))
 {
 DIpoint=Yf;DXpoint=dC;
 }
 }
 else if(Yfs>(Error2_th*(DToBelt/10)))
 {
 C2++;
 if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
 }
 else
 {
 C1++;C0=0;
 if(C1>SwitchN)
 {
 ST=1;
 C2=0;

 DeltaT=DXpoint+DXpointLast;
 DXpointLast=dC-DXpoint;
 ChBHight=DToBelt-DIpoint;
 DToBelt=(int)((float)(((float)((10000.0-(float)alpha)*(float)DToBelt)+(float)((float)alpha*(float)UIpoint))/10000.0));
#line 147 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 Algo_Parametrs_Out_Buffer[0]= 1 ;
 Algo_Parametrs_Out_Buffer[1]=(DeltaT&0xFF00)>>8;Algo_Parametrs_Out_Buffer[2]=(DeltaT&0x00FF);
 Algo_Parametrs_Out_Buffer[3]=(ChBHight&0xFF00)>>8;Algo_Parametrs_Out_Buffer[4]=(ChBHight&0x00FF);
 Algo_Parametrs_Out_Buffer[9]=(DToBelt&0xFF00)>>8;Algo_Parametrs_Out_Buffer[10]=(DToBelt&0x00FF);
 dC=0;UIpoint=0;DIpoint=DToBelt;

 }
 }
 break;
 case 1:
 if(Yfs<(DToBelt-Yv_th))
 {
 C0++;C1=0;
 if(C0>SwitchN)
 {
 ST=0;C2=0;
 }

 }
 else if(Yfs>(Error2_th*(DToBelt/10)))
 {
 C2++;
 if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
 }
 else
 {
 C1++;C0=0;
 if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,2);
 if(Yf>UIpoint) {UIpoint=Yf;UXpoint=dC;}
 }
 break;
 }
}

void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode)
{
#line 190 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 Algo_Parametrs_Out_Buffer[0]= 1 ;
 Algo_Parametrs_Out_Buffer[5]=0;Algo_Parametrs_Out_Buffer[6]=ST;
 Algo_Parametrs_Out_Buffer[7]=0;Algo_Parametrs_Out_Buffer[8]=ErorCode;
 *ST=2;*dC=0;*C0=0;*C1=0;
}

void Vz_Algorithm_3_4(void)
{
#line 204 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 int SPC = ParamsIn[SPC3_4];
 int Yv_thUp = ParamsIn[Yv_thUp3_4];
 int Yv_thDn = ParamsIn[Yv_thDn3_4] ;
 int SwitchN = ParamsIn[SwitchN3_4] ;
 int MaxNBeforeSmPeak = ParamsIn[MaxNBeforeSmPeak3_4] ;
 int alpha = ParamsIn[alpha3_4] ;
 int FilterLength = ParamsIn[FilterLength3_4] ;
 static int AveResultT = ParamsIn[AveResultTIn3_4] ;
#line 230 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 int ResultT;

 char NoSmallPeak=0;
 static int U1Ipoint=1;
 static int U2Ipoint;
 static int DIpoint;
 static int AveU1Ipoint;
 static int AveU2Ipoint;
 static int AveDIpoint;


 static int volatile PeakBuffer[ 1000 ],PeakBufferTag;
 int MaxNBeforeStop;
 static int tC=0;
 static int dC=0;
 static int C0=0;
 static int C1=0;
 static int C2=0;
 static int U1Xpoint=1;
 static int U2Xpoint;
 static int DXpoint;
 static char ST=0;

 int Y,j;
 char k,a,i;
 ResetAlgoParametrsOutBuffer();
 OpticDataGetFrame_VelocityOnly();

 MaxNBeforeStop=SPC/10;

 for(k=0;k<60;k++)
 {
 Y=(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140);
 if(Y<Yv_thDn)
 {
 a=0;
 C0++;
 }
 else if(Y>Yv_thUp)
 {
 a=2;
 C2++;
 }
 else
 {
 a=1;
 C1++;
 }
 dC++;
 switch (ST)
 {
 case 0:
 if(a==0)
 {
 C2=2;
 if(C0>(SwitchN+10)) {ST=2;tC=0;dC=1;C0=0;C1=0;}
 }
 else if(a==2)
 {
 C0=0;
 if(C2>(SwitchN+SPC)) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
 }

 break;

 case 1:
 if(a==0)
 {
 C2=2;
 if(C0>SwitchN) {ST=2;tC=0;dC=1;C0=0;C1=0;}
 }
 else if(a==2)
 {
 C0=0;
 if(C2>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
 }
 break;
 case 2:

 if(tC< 1000 )
 {
 PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
 if(tC>FilterLength)
 {
 PeakBufferTag=0;
 for(i=0;i<FilterLength;i++)
 {
 PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
 }
 if(PeakBufferTag>DIpoint)
 {
 DIpoint=PeakBufferTag;
 DXpoint=tC-(FilterLength/2);
 }
 }
 }
 else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}

 tC++;
 if(a==1)
 {
 C2=2;
 if(C1>SwitchN)
 {
 ST=3;tC=0;C0=0;C1=0;
 }
 }
 else if(a==2)
 {
 C1=1;
 if(C2>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
 }
 break;
 case 3:
 tC++;
 if((a==1)&&(tC>MaxNBeforeSmPeak))
 {
 NoSmallPeak=1;
#line 352 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 Algo_Parametrs_Out_Buffer[0]= 1 ;
 Algo_Parametrs_Out_Buffer[5]=0;Algo_Parametrs_Out_Buffer[6]=NoSmallPeak;
 ST=5;tC=0;C1=0;C2=0;
 }
 if(a==2)
 {
 C0=0;
 if(C2>SwitchN) {ST=4;tC=0;C0=0;C2=0;NoSmallPeak=0;}
 }
 else if(a==0)
 {
 C2=0;
 if(C0>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
 }
 break;
 case 4:

 if(tC< 1000 )
 {
 PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
 if(tC>FilterLength)
 {
 PeakBufferTag=0;
 for(i=0;i<FilterLength;i++)
 {
 PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
 }
 if(PeakBufferTag>U1Ipoint)
 {
 U1Ipoint=PeakBufferTag;
 U1Xpoint=tC-(FilterLength/2);
 }
 }
 }
 else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}

 tC++;
 if(a==1)
 {
 C0=0;
 if(C1>SwitchN) {ST=5;tC=0;C1=0;C2=0;}
 }
 else if(a==0)
 {
 C1=0;
 if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
 }
 break;
 case 5:
 if(a==2)
 {
 C0=0;
 if(C2>SwitchN) {ST=6;tC=0;C1=0;C2=0;}
 }
 else if(a==0)
 {
 C2=0;
 if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
 }
 break;
 case 6:

 if(tC< 1000 )
 {
 PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
 if(tC>FilterLength)
 {
 PeakBufferTag=0;
 for(i=0;i<FilterLength;i++)
 {
 PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
 }
 if(PeakBufferTag>U2Ipoint)
 {
 U2Ipoint=PeakBufferTag;
 U2Xpoint=tC-(FilterLength/2);
 }
 }
 }
 else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}

 tC++;
 if(a==1)
 {
 C0=0;
 if(C1>SwitchN)
 {

 ResultT=dC-tC+U2Xpoint-DXpoint;
 AveResultT=(int)((float)(((float)((10000.0-(float)alpha)*(float)AveResultT)+(float)((float)alpha*(float)ResultT))/10000.0));
#line 446 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 Algo_Parametrs_Out_Buffer[0]= 1 ;
 Algo_Parametrs_Out_Buffer[3]=(ResultT&0xFF00)>>8;Algo_Parametrs_Out_Buffer[4]=(ResultT&0x00FF);
 Algo_Parametrs_Out_Buffer[1]=(AveResultT&0xFF00)>>8;Algo_Parametrs_Out_Buffer[2]=(AveResultT&0x00FF);
 Algo_Parametrs_Out_Buffer[7]=(U1Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[8]=(U1Ipoint&0x00FF);
 Algo_Parametrs_Out_Buffer[9]=(U2Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[10]=(U2Ipoint&0x00FF);
 Algo_Parametrs_Out_Buffer[11]=(DIpoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[12]=(DIpoint&0x00FF);
 Algo_Parametrs_Out_Buffer[13]=(AveU1Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[15]=(AveU1Ipoint&0x00FF);
 Algo_Parametrs_Out_Buffer[15]=(AveU2Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[16]=(AveU2Ipoint&0x00FF);
 Algo_Parametrs_Out_Buffer[17]=(AveDIpoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[18]=(AveDIpoint&0x00FF);

 U1Ipoint=0;DIpoint=0;U2Ipoint=0;ST=1;tC=0;C1=0;C2=0;
 }
 }
 else if(a==0)
 {
 C1=0;
 if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
 }
 break;
 }
 }
}

void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint)
{
 char txt[50];
#line 476 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 Algo_Parametrs_Out_Buffer[0]= 1 ;
 Algo_Parametrs_Out_Buffer[19]=0; Algo_Parametrs_Out_Buffer[20]=ST;
 Algo_Parametrs_Out_Buffer[21]=a;Algo_Parametrs_Out_Buffer[22]=a;
 *ST=0;*tC=0;*dC=0;*C0=0;*C1=0;*C2=0;*U1Ipoint=0;*U2Ipoint=0;*DIpoint=0;
}

void Vz_Algorithm_2(void)
{
#line 488 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 int SPC = ParamsIn[SPC2] ;
 int Yv_th = ParamsIn[Yv_th2];
 int minStartN = ParamsIn[minStartN2];
 int minStopN = ParamsIn[minStopN2] ;
 int minResult = ParamsIn[minResult2] ;






 int MaxNBeforeStop;
 static int cCounter=0;
 static int upCounter=0;
 static int dnCounter=0;
 static char ST=0;
 int Y;
 int Result;
 int Res;
 static unsigned int i=1;
 char k;
 ResetAlgoParametrsOutBuffer();
 OpticDataGetFrame_VelocityOnly();
 MaxNBeforeStop=SPC/4;
 for(k=0;k<60;k++)
 {
 Y=(Vz_Sensor_Velocity_Buffer_int[k]/256)*(Vz_Sensor_Velocity_Buffer_int[k]/256);
 switch (ST)
 {
 case 1:
 cCounter++;
 if(Y>Yv_th)
 {
 upCounter++;
 if(upCounter>minStopN) dnCounter=0;
 }
 else
 {
 if(dnCounter>MaxNBeforeStop)
 {
 ST=0;
 Res=cCounter-dnCounter;
 if(Res>minResult)
 {
 Result=Res;
#line 537 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Vz_Algorithm.c"
 Algo_Parametrs_Out_Buffer[0]= 1 ;
 Algo_Parametrs_Out_Buffer[1]=(Result&0xFF00)>>8;Algo_Parametrs_Out_Buffer[2]=(Result&0x00FF);
 }
 cCounter=0;
 }
 dnCounter++;
 upCounter=0;
 }
 break;

 case 0:
 if(Y>Yv_th)
 {
 if(upCounter>minStartN) ST=1;
 upCounter++;
 dnCounter=0;
 }
 else
 {
 dnCounter++;
 upCounter=0;
 }
 break;
 }
 }
}

void ResetAlgoParametrsOutBuffer(void)
{

 char i;
 Algo_Parametrs_Out_Buffer[0]= 0 ;
 for(i=1;i< 23 ;i++) Algo_Parametrs_Out_Buffer[i]=0xFF;
}

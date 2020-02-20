#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Bitset.c"
#line 1 "c:/users/itziks/documents/vz/uconnect exx drv/bitset.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/built_in.h"
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
#line 6 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/Bitset.c"
Mem_AddressType Long2Array(uint_32 to_convert, uint_8 *array, Mem_AddressType array_index)
{
 array[array_index] =  ((char *)&to_convert)[3] ;
 array_index++;

 array[array_index] =  ((char *)&to_convert)[2] ;
 array_index++;

 array[array_index] =  ((char *)&to_convert)[1] ;
 array_index++;

 array[array_index] =  ((char *)&to_convert)[0] ;
 array_index++;

 return array_index;
}

uint_16 Array2Float(uint_8 *array, float *aFloat, uint_16 array_index)
{
 int_32 aLong;

 array_index = Array2SLong(array, &aLong, array_index);

 *aFloat = (float) aLong / (float)  1000 ;

 return array_index;
}

Mem_AddressType Float2Array(float aFloat, uint_8 *array, uint_16 array_index)
{
 int_32 float_Long = (int_32) (aFloat * (float)  1000 );
 return (Mem_AddressType) SLong2Array(float_Long, array, array_index);
}

Mem_AddressType TinyFloat2Array(float aFloat, uint_8 *array, uint_32 array_index)
{
 int_16 float_int = (int_16) (aFloat * (float)  100 );
 return (Mem_AddressType) Int2Array(float_int, array, array_index);
}

Mem_AddressType Array2TinyFloat(uint_8 *array, float *aFloat, uint_32 array_index)
{
 uint_16 aInt;

 array_index = Array2Int(array, &aInt, array_index);

 *aFloat = (float) aInt / (float)  100 ;

 return (Mem_AddressType) array_index;
}


uint_32 SLong2Array(int_32 aLong, uint_8 *array, uint_32 array_index)
{
 array[array_index] =  ((char *)&aLong)[3] ;
 array_index++;

 array[array_index] =  ((char *)&aLong)[2] ;
 array_index++;

 array[array_index] =  ((char *)&aLong)[1] ;
 array_index++;

 array[array_index] =  ((char *)&aLong)[0] ;
 array_index++;

 return array_index;
}

Mem_AddressType SInt2Array(int_16 int16, uint_8 *array, uint_32 array_index)
{

 array[array_index] =  ((char *)&int16)[1] ;
 array_index++;

 array[array_index] =  ((char *)&int16)[0] ;
 array_index++;

 return array_index;
}


Mem_AddressType Array2SInt(uint_8 *array, int_16 *int16, uint_32 array_index)
{
  ((char *)&*int16)[1]  = array[array_index];
 array_index++;

  ((char *)&*int16)[0]  = array[array_index];
 array_index++;

 return array_index;
}

Mem_AddressType Array2AddressType(uint_8 *array, Mem_AddressType *value, uint_32 array_index)
{
 if (sizeof(Mem_AddressType) == 2)
 return (Mem_AddressType) Array2Int(array, value, array_index);
 else if (sizeof(Mem_AddressType) == 4)
 return (Mem_AddressType) Array2Long(array, value, array_index);

 return  0 ;
}

uint_16 Array2Long(uint_8 *array, uint_32 *to_convert, uint_16 array_index)
{
  ((char *)&*to_convert)[3]  = array[array_index];
 array_index++;

  ((char *)&*to_convert)[2]  = array[array_index];
 array_index++;

  ((char *)&*to_convert)[1]  = array[array_index];
 array_index++;

  ((char *)&*to_convert)[0]  = array[array_index];
 array_index++;

 return array_index;
}

uint_16 Array2SLong(uint_8 *array, int_32 *aLong, uint_16 array_index)
{
  ((char *)&*aLong)[3]  = array[array_index];
 array_index++;

  ((char *)&*aLong)[2]  = array[array_index];
 array_index++;

  ((char *)&*aLong)[1]  = array[array_index];
 array_index++;

  ((char *)&*aLong)[0]  = array[array_index];
 array_index++;

 return array_index;
}

uint_32 Int2Array(uint_16 anInt, uint_8 *array, uint_32 array_index)
{
 array[array_index] =  ((char *)&anInt)[1] ;
 array_index++;

 array[array_index] =  ((char *)&anInt)[0] ;
 array_index++;

 return array_index;
}

uint_32 Array2Int(uint_8 *array, uint_16 *anInt, uint_32 array_index)
{
  ((char *)&*anInt)[1]  = array[array_index];
 array_index++;

  ((char *)&*anInt)[0]  = array[array_index];
 array_index++;

 return array_index;
}

uint_8 GetLowHalfByte(char value)
{
 return value & 0x0F;
}

uint_8 GetHighHalfByte(char value)
{
 return value & 0xF0;
}

char GetHigh(int value)
{
 return  ((char *)&value)[1] ;
}

char GetMaxHigh(uint_32 value)
{
 return  ((char *)&value)[3] ;
}

char GetMiddleHigh(uint_32 value)
{
 return  ((char *)&value)[2] ;
}

char GetMinHigh(uint_32 value)
{
 return  ((char *)&value)[1] ;
}

char GetLongLow(uint_32 value)
{
 return  ((char *)&value)[0] ;
}

char GetLow(uint_16 value)
{
 return  ((char *)&value)[0] ;
}

int_16 CombineSignedHighLow(uint_8 high, uint_8 low)
{
 uint_16 t = high << 8 | low ;
 return (int_16) t;
}

uint_16 CombineHighLow(uint_8 high, uint_8 low)
{
 return (uint_16) (high << 8 | low);
}

uint_32 CombineLongHighLow(uint_8 max_high, uint_8 middle_high, uint_8 min_high, uint_8 low)
{
 return (uint_32) ((uint_32) max_high << 24 | (uint_32) middle_high << 16 | (uint_32) min_high << 8 | low);
}

uint_32 CombineLong3HighLow(uint_8 high, uint_8 middle, uint_8 low)
{
 return (int_32) ((int_32) high << 16 | (int_32) middle << 8 | low);
}





int_8 GetOnBitPosition(uint_32 bits, uint_8 size_bits)
{
 uint_8 i;
 for (i = 0; i < size_bits; ++i)
 {
 if (bits & (uint_32) (1UL << i))
 return i;
 }

 return  -1 ;
}

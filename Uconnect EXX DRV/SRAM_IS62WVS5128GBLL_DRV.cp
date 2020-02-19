#line 1 "C:/Users/itziks/Documents/Uconnect EXX DRV (3)/Uconnect EXX DRV/SRAM_IS62WVS5128GBLL_DRV.c"
#line 1 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/pic_drv_uconnect.h"
#line 1 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/timelib.h"
#line 27 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/timelib.h"
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
#line 41 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/timelib.h"
extern long Time_jd1970 ;
#line 46 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/timelib.h"
long Time_dateToEpoch(TimeStruct *ts) ;
void Time_epochToDate(long e, TimeStruct *ts) ;
void TurnOnRTC_Timer0(void);
#line 1 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/config_file.h"
#line 1 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/limits.h"
#line 71 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/types.h"
typedef unsigned char uint_8;





typedef unsigned int uint_16;

typedef unsigned long uint_32;

typedef signed char int_8;

typedef signed int int_16;

typedef signed long int_32;
#line 106 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/types.h"
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
#line 8 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/config_file.h"
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
#line 68 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/config_file.h"
Mem_AddressType SetFloatProperty(Mem_AddressType address,float property);
#line 3 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/pic_drv_uconnect.h"
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
#line 1 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/sram_is62wvs5128gbll_drv.h"
void Init_SRAM(void);
void SPIPut_SRAM(char din);
char SPIGet_SRAM(char din);
void Set_SRAM_Operation_Mode(char mode);
void Write_Byte_To_SRAM_Memory(unsigned long Register_ADD,char Register_Data);
char Read_Byte_From_SRAM_Memory(unsigned long Register_ADD);
void Write_Sequential_Bytes_To_SRAM_Memory(unsigned long Register_ADD,char *TxBuffer,unsigned int BufferLength);
void Read_Sequential_Bytes_From_SRAM_Memory(unsigned long Register_ADD,char *RxBuffer,unsigned int BufferLength);
#line 1 "c:/users/itziks/documents/uconnect exx drv (3)/uconnect exx drv/mcp23s17_drv.h"
void SPIPut_MCP23S17(char din);
char SPIGet_MCP23S17(char din);
void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data);
char Read_From_MCP23S17_Internal_Register(char Register_ADD);
void Init_MCP23S17(void);
char Read_Write_MCP23S17_IO(char PinName,char mode);


enum MCP23S17_IO_Names {EN_1_8V=0,CS_FLASH,RESET_ADP,USER_LED,HOLD_SRAM,WP_FLASH,RESET_VZ,EN_LASER,ESP_RTS,ESP_CTS,ESP_EN_PIN,ESP_RESET,ESP_FLASH};
#line 8 "C:/Users/itziks/Documents/Uconnect EXX DRV (3)/Uconnect EXX DRV/SRAM_IS62WVS5128GBLL_DRV.c"
void Init_SRAM(void)
{
  TRISD.RD9 = 0 ;
  LATD.RD9 = 1 ;
 Read_Write_MCP23S17_IO(HOLD_SRAM, 1 );
 Set_SRAM_Operation_Mode( 0x00 );
}

void Set_SRAM_Operation_Mode(char mode)
{
  LATD.RD9 = 0 ;
 SPIPut_SRAM( 0x01 );
 SPIPut_SRAM(mode);
  LATD.RD9 = 1 ;
}

void Read_Sequential_Bytes_From_SRAM_Memory(unsigned long Register_ADD,char *RxBuffer,unsigned int BufferLength)
{
 unsigned int i;
  LATD.RD9 = 0 ;
 SPIPut_SRAM( 0x02 );
 SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
 SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
 SPIPut_SRAM(Register_ADD&0x000000FF);
 for(i=0;i<BufferLength;i++) RxBuffer[i]=SPIGet_SRAM(0x00);
  LATD.RD9 = 1 ;
}

void Write_Sequential_Bytes_To_SRAM_Memory(unsigned long Register_ADD,char *TxBuffer,unsigned int BufferLength)
{
 unsigned int i;
  LATD.RD9 = 0 ;
 SPIPut_SRAM( 0x02 );
 SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
 SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
 SPIPut_SRAM(Register_ADD&0x000000FF);
 for(i=0;i<BufferLength;i++) SPIPut_SRAM(TxBuffer[i]);
  LATD.RD9 = 1 ;
}

void Write_Byte_To_SRAM_Memory(unsigned long Register_ADD,char Register_Data)
{
  LATD.RD9 = 0 ;
 SPIPut_SRAM( 0x02 );
 SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
 SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
 SPIPut_SRAM(Register_ADD&0x000000FF);
 SPIPut_SRAM(Register_Data);
  LATD.RD9 = 1 ;
}

char Read_Byte_From_SRAM_Memory(unsigned long Register_ADD)
{
 char Din;
  LATD.RD9 = 0 ;
 SPIPut_SRAM( 0x03 );
 SPIPut_SRAM((Register_ADD&0x00FF0000)>>16);
 SPIPut_SRAM((Register_ADD&0x0000FF00)>>8);
 SPIPut_SRAM(Register_ADD&0x000000FF);
 Din=SPIGet_SRAM(0x00);
  LATD.RD9 = 1 ;
 return Din;
}

void SPIPut_SRAM(char din)
{
 SPI1_Write(din);
}

char SPIGet_SRAM(char din)
{
 return SPI1_Read(din);
}

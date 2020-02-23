#line 1 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
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
#line 5 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
char volatile UART2_RX_Interrupt_Buffer[ 200 ];

void BoardInit (void)
{
 OSCCON=0x3300;
 CLKDIV = 0x3120;


 OSCTUN = 0x0000;
 REFOCONL = 0x0000;
 REFOCONH = 0x0000;
 REFOTRIML = 0x0000;
 DCOTUN = 0x0000;
 DCOCON = 0x0700;
 OSCDIV = 0x0000;
 OSCFDIV = 0x0000;
 RCON = 0x0000;
#line 25 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
 IOCPDB = 0x0000;
 IOCPDC = 0x0000;
 IOCPDD = 0x0000;
 IOCPDE = 0x0000;
 IOCPDF = 0x0000;
 IOCPDG = 0x0000;
 IOCPUB = 0x0000;
 IOCPUC = 0x0000;
 IOCPUD = 0x0000;
 IOCPUE = 0x0000;
 IOCPUF = 0x0000;
 IOCPUG = 0x0000;
#line 40 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
 ODCB = 0x0000;
 ODCC = 0x0000;
 ODCD = 0x0000;
 ODCE = 0x0000;
 ODCF = 0x0000;
 ODCG = 0x0000;
#line 49 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
 PMD1=0xFF80;
 PMD2=0xFFFF;
 PMD3=0xFDFF;
 PMD4=0xFFFF;
 PMD5=0xFFFF;
 PMD6=0xFFFF;
 PMD7=0xFFFF;
 PMD8=0xFFFF;
#line 60 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
 OSCCONL=OSCCONL&0xbf;

 RPOR12bits.RP25R = 0x0003;
 RPINR18bits.U1RXR = 0x0014;
 RPOR8bits.RP17R = 0x0008;
 RPOR15bits.RP30R = 0x0007;
 RPINR20bits.SDI1R = 0x0010;
 RPINR19bits.U2RXR = 0x000C;
 RPOR1bits.RP3R = 0x0005;

 OSCCONL=OSCCONL|0x40;

  LATE.RE5 =0;
  TRISE.RE5 = 0 ;

  LATE.RE6 =0;
  TRISE.RE6 = 0 ;

  LATE.RE7 =0;
  TRISE.RE7 = 0 ;

  LATG.RG6 =0;
  ANSG.RG6 = 0 ;
  TRISG.RG6 = 0 ;

  LATG.RG7 =0;
  PORTG.RG7 =0;
  ANSG.RG7 = 0 ;
  TRISG.RG7 = 0 ;

  LATG.RG8 =0;
  ANSG.RG8 = 0 ;
  TRISG.RG8 = 0 ;

  LATG.RG9 =0;
  ANSG.RG9 = 0 ;
  TRISG.RG9  = 0 ;

  LATB.RB5 =0;
  ANSB.RB5 = 0 ;
  TRISB.RB5 = 0 ;
  PORTB.RB5 =0;

  LATB.RB4 =0;
  ANSB.RB4 = 0 ;
  TRISB.RB4 = 0 ;

  LATB.RB3 =0;
  ANSB.RB3 = 0 ;
  TRISB.RB3 = 0 ;


  LATB.RB2 =0;
  ANSB.RB2 = 0 ;
  TRISB.RB2 = 0 ;

  LATB.RB1 =0;
  ANSB.RB1 = 0 ;
  PORTB.RB1 =0;
  TRISB.RB1 = 0 ;
#line 126 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
  LATB.RB0 =0;
  ANSB.RB0 = 0 ;
  TRISB.RB0 = 0 ;

  LATB.RB6 =0;
  ANSB.RB6 = 0 ;
  TRISB.RB6 = 0 ;

  LATB.RB7 =0;
  ANSB.RB7 = 0 ;
  TRISB.RB7 = 0 ;

  LATB.RB8 =0;
  ANSB.RB8 = 0 ;
  TRISB.RB8 = 0 ;

  LATB.RB9 =0;
  ANSB.RB9 = 0 ;
  TRISB.RB9 = 0 ;

  LATB.RB10 =0;
  ANSB.RB10 = 0 ;
  TRISB.RB10 = 0 ;

  LATB.RB11 =0;
  ANSB.RB11 = 0 ;
  TRISB.RB11 = 0 ;

  LATB.RB12 =0;
  ANSB.RB12 = 0 ;
  TRISB.RB12 = 0 ;

  LATB.RB13 =0;
  ANSB.RB13 = 0 ;
  TRISB.RB13 = 0 ;

  LATB.RB14 = 1 ;
  ANSB.RB14 = 0 ;
  TRISB.RB14 = 0 ;

  LATB.RB15 = 1 ;
  ANSB.RB15 = 0 ;
  TRISB.RB15 = 0 ;

  LATF.RF4 =0;
  TRISF.RF4 = 0 ;

  LATF.RF5 =0;
  TRISF.RF5 = 0 ;
  LATF.RF5 =0;

  PORTF.RF3 =0;
  TRISF.RF3 = 1 ;

  LATF.RF2 =0;
  TRISF.RF2 = 0 ;
  LATF.RF2 =0;

  LATF.RF6 =0;
  PORTF.RF6 =0;
  TRISF.RF6 = 0 ;

  LATG.RG3 =0;
  PORTG.RG3 =0;
  TRISG.RG3 = 0 ;

  LATG.RG2 =0;
  TRISG.RG2 = 0 ;

  PORTD.RD8 =0;
  TRISD.RD8 = 0 ;

  LATD.RD9 =0;
  PORTD.RD9 =0;
  TRISD.RD9 = 0 ;

  LATD.RD10 =0;
  TRISD.RD10 = 0 ;

  LATD.RD11 =0;
  TRISD.RD11 = 1 ;

  LATD.RD0 =0;
  TRISD.RD0 = 0 ;

  LATD.RD1 =0;
  TRISD.RD1 = 0 ;

  LATD.RD2 =0;
  TRISD.RD2 = 0 ;

  LATD.RD3 =0;
  TRISD.RD3 = 0 ;

  LATD.RD4 =0;
  TRISD.RD4 = 0 ;

  LATD.RD5 =0;
  TRISD.RD5 = 1 ;

  LATD.RD6 =0;
  ANSD.RD6 = 0 ;
  TRISD.RD6 = 0 ;

  LATD.RD7 =1;
  ANSD.RD7 = 0 ;
  TRISD.RD7 = 0 ;

  LATF.RF0 =0;
  TRISF.RF0 = 0 ;

  LATF.RF1 =0;
  TRISF.RF1 = 0 ;

  LATE.RE0 =0;
  TRISE.RE0 = 0 ;

  LATE.RE1 =0;
  TRISE.RE1 = 0 ;

  LATE.RE2 =0;
  TRISE.RE2 = 0 ;

  LATE.RE3 =0;
  TRISE.RE3 = 0 ;

  LATE.RE4 =0;
  ANSE.RE4 = 0 ;
  TRISE.RE4 = 0 ;

  LATC.RC13 =0;
  ANSC.RC13 = 0 ;
  TRISC.RC13 = 0 ;

  LATC.RC14 =0;
  ANSC.RC14 = 0 ;
  TRISC.RC14 = 0 ;
 RCON.SWDTEN= 1 ;
 ADC1_Init_Advanced(_ADC_12bit, _ADC_EXTERNAL_VREFH | _ADC_INTERNAL_VREFL);
 AD1CON3=0x0503;
 UART2_Init(57600);
 UART1_Init(2000000);
 Delay_ms(100);
 PrintOut(PrintHandler,"\rBoard Initialization...");
  IEC1bits.U2RXIE =0;
  IEC0bits.U1RXIE =0;
}


void Terminal_PowerOut_Enable(char mode,unsigned int delay_ms_value)
{
 unsigned int i;
 switch ( mode)
 {
 case  1 :
  LATB.RB8 = 1 ;
 for(i=0;i<delay_ms_value;i++) Delay_ms(1);
 break;
 case  0 :
  LATB.RB8 = 0 ;
 break;
 }
}

void Mikrobus_PowerOut_Enable(char mode,unsigned int delay_ms_value)
{
 unsigned int i;
 switch ( mode)
 {
 case  1 :
  LATE.RE7 = 1 ;
 for(i=0;i<delay_ms_value;i++) Delay_ms(1);
 break;
 case  0 :
  LATE.RE7 = 0 ;
 break;
 }
}

void PrintHandler(char c)
{
 UART2_Write(c);
}

char Read_SHD_PIN(void)
{
 char cTemp=0;
 float ADC_Sampling,VIN;
  ANSB.RB0 = 1 ;
  TRISB.RB0 = 1 ;
  LATD.RD3 = 1 ;
  TRISB.RB3 = 1 ;
  ANSB.RB3 = 1 ;
 Delay_us(1000);
 ADC_Sampling=((float)ADC1_Get_Sample(3)+(float)ADC1_Get_Sample(3))/2;
 VIN=((ADC_Sampling* 2.048 )/4095);
  LATD.RD3 = 0 ;
  ANSB.RB0 = 0 ;
  TRISB.RB0 = 0 ;
  TRISB.RB3 = 0 ;
  ANSB.RB3 = 0 ;
 if(VIN>1) return 1;
 else return 0;
}

void LED_Activation(char color,char mode)
{
 switch ( mode)
 {
 case LED_ON:
 if(color==LED_RED)  LATB.RB14 =0;
 else  LATB.RB15 =0;
 break;
 case LED_OFF:
 if(color==LED_RED)  LATB.RB14 =1;
 else  LATB.RB15 =1;
 break;
 case LED_NOT:
 if(color==LED_RED)  LATB.RB14 ^=1;
 else  LATB.RB15 ^=1;
 break;
 }
}

float GetBatteryVoltage(void)
{

 float ADC_Sampling,VIN;
  ANSB.RB0 = 1 ;
  TRISB.RB0 = 1 ;
  LATD.RD3 = 1 ;
  ANSB.RB4 = 1 ;
  TRISB.RB4 = 1 ;
  LATF.RF0 = 1 ;
 Delay_us(350);
 ADC1_Get_Sample(4);
 ADC_Sampling=((float)ADC1_Get_Sample(4)+(float)ADC1_Get_Sample(4))/2;
 VIN=((ADC_Sampling* 2.048 )/4095)* 1.499 ;
  LATD.RD3 = 0 ;
  ANSB.RB0 = 0 ;
  TRISB.RB0 = 0 ;
  LATF.RF0 = 0 ;
  ANSB.RB4 = 0 ;
  TRISB.RB4 = 0 ;
  LATB.RB4 = 0 ;
 return VIN;
}

float Get12VInputVoltage(void)
{

 float ADC_Sampling,VIN;
  ANSB.RB0 = 1 ;
  TRISB.RB0 = 1 ;
  LATD.RD3 = 1 ;
  ANSB.RB13 = 1 ;
  TRISB.RB13 = 1 ;
  LATD.RD6 = 1 ;
 Delay_us(350);
 ADC1_Get_Sample(13);
 ADC_Sampling=((float)ADC1_Get_Sample(13)+(float)ADC1_Get_Sample(13))/2;
 VIN=((ADC_Sampling* 2.048 )/4095)* 16.03012048 ;
  LATD.RD3 = 0 ;
  ANSB.RB0 = 0 ;
  TRISB.RB0 = 0 ;
  LATD.RD6 = 0 ;
  ANSB.RB13 = 0 ;
  TRISB.RB13 = 0 ;
  LATB.RB13 = 0 ;
 return VIN;
}

float Get4To20IoCurrent(char IO_Num)
{
 return GetIoInputVoltage(IO_Num)/ 100 ;
}

float GetIoInputVoltage (char IO_Num)
{
 float ADC_Sampling,VIN;
  ANSB.RB0 = 1 ;
  TRISB.RB0 = 1 ;
  LATD.RD3 = 1 ;
 Delay_us(350);
 if(IO_Num==1)
 {
  ANSB.RB1 = 1 ;
  TRISB.RB1 = 1 ;
 ADC1_Get_Sample(1);
 ADC_Sampling=((float)ADC1_Get_Sample(1)+(float)ADC1_Get_Sample(1))/2;
  LATD.RD3 = 0 ;
  ANSB.RB0 = 0 ;
  TRISB.RB0 = 0 ;
  ANSB.RB1 = 0 ;
  TRISB.RB1 = 0 ;
  LATB.RB1 = 0 ;
 }
 else if(IO_Num==2)
 {
#line 435 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
 }
 VIN=((ADC_Sampling* 2.048 )/4095);
 return VIN;
}


void SendAtCommand(unsigned char *p)
{
 int i=0;
 while(p[i]!=0)
 {
 Uart1_Write(p[i]);
 i++;
 }
}








void Get_RTCC_TimeStruct(TimeStruct *time_struct)
{
 unsigned int dec;
 dec = Bcd2Dec16(TIMEH);
 time_struct->hh = dec / 100;
 time_struct->mn = dec % 100;
 dec = Bcd2Dec16(TIMEL);
 time_struct->ss = dec / 100;
 dec = Bcd2Dec16(DATEL);
 time_struct->md = dec / 100;
 time_struct->wd = dec % 100;
 dec = Bcd2Dec16(DATEH);
 time_struct->yy = dec / 100;
 time_struct->mo = dec % 100;
}


void Set_RTCC_Time(TimeStruct *time_struct)
{
#line 490 "C:/Users/itziks/Documents/Vz/Uconnect EXX DRV/PIC_DRV_Uconnect.c"
 RTCCON1Lbits.RTCEN = 0;
 RTCC_WRLOCK_BIT_CLEAR();
 TIMEH = ((time_struct->hh / 10) << 12) | ((time_struct->hh % 10) << 8) | ((time_struct->mn / 10) << 4) | (time_struct->mn % 10);
 TIMEL = ((time_struct->ss / 10) << 12) | ((time_struct->ss % 10) << 8);
 DATEL = ((time_struct->md / 10) << 12) | ((time_struct->md % 10) << 8) | ((time_struct->wd / 10) << 4) | (time_struct->wd % 10);
 DATEH = ((time_struct->yy / 10) << 12) | ((time_struct->yy % 10) << 8) | ((time_struct->mo / 10) << 4) | (time_struct->mo % 10);
 RTCCON1Lbits.RTCEN = 1;
 RTCC_WRLOCK_BIT_SET();
}


void Print_Time_RTCC(void)
{
 char volatile p[4];
 TimeStruct time_struct;
 Get_RTCC_TimeStruct(&time_struct);
 GetDayOfWeekString(time_struct.wd, p);
 PrintOut(PrintHandler, "\r%.2d/%.2d/%.2d %.2d:%.2d:%.2d %s",(int) time_struct.md, (int) time_struct.mo, (int) time_struct.yy, (int) time_struct.hh, (int) time_struct.mn, (int) time_struct.ss, p);
}

void RTCC_Initialize(void)
{
 RTCCON1L.RTCEN = 0;
 RTCC_WRLOCK_BIT_CLEAR();

 RTCCON1H = 0x8900;
 RTCCON2L = 0x0001;
 RTCCON2H = 0x3C8B;
 RTCCON3L = 0x0000;
 RTCCON1L = 0x0000;

 RTCCON1H.ALRMEN= 0 ;
 RTCC_WRLOCK_BIT_SET();
  IEC3.RTCIE = 1 ;
  IFS3.RTCIF =0;
 RTCCON1L.RTCEN = 1;
}

void RTCC_WRLOCK_BIT_SET(void)
{
 asm {
 DISI #5
 MOV #0x55, W2
 MOV W2, NVMKEY
 MOV #0xAA, W3
 MOV W3, NVMKEY
 BSET RTCCON1L, #WRLOCK
 }
}

void RTCC_WRLOCK_BIT_CLEAR(void)
{
 asm {
 DISI #5
 MOV #0x55, W2
 MOV W2, NVMKEY
 MOV #0xAA, W3
 MOV W3, NVMKEY
 BCLR RTCCON1L, #WRLOCK
 }
}

void Stop_RTCC(void)
{
 RTCCON1L.RTCEN = 0;
}

void GetDayOfWeekString(char DayNum,char *str)
{
 switch (DayNum)
 {
 case 0 :
 strcpy(str,"SUN");
 break;
 case 1 :
 strcpy(str,"MON");
 break;
 case 2 :
 strcpy(str,"TUE");
 break;
 case 3 :
 strcpy(str,"WED");
 break;
 case 4 :
 strcpy(str,"THU");
 break;
 case 5 :
 strcpy(str,"FRI");
 break;
 case 6 :
 strcpy(str,"SAT");
 break;
 }
}

void Set_RTCC_Alarm_Time(TimeStruct *time_struct)
{
 RTCCON1L.RTCEN = 0;
 RTCC_WRLOCK_BIT_CLEAR();
 RTCCON1H.ALRMEN= 0 ;
  IEC3.RTCIE = 0 ;
  IFS3.RTCIF =0;
 ALMTIMEH = ((time_struct->hh / 10) << 12) | ((time_struct->hh % 10) << 8) | ((time_struct->mn / 10) << 4) | (time_struct->mn % 10);
 ALMTIMEL = ((time_struct->ss / 10) << 12) | ((time_struct->ss % 10) << 8);
 ALMDATEL = ((time_struct->md / 10) << 12) | ((time_struct->md % 10) << 8) | ((time_struct->wd / 10) << 4) | (time_struct->wd % 10);
 ALMDATEH = ((time_struct->yy / 10) << 12) | ((time_struct->yy % 10) << 8) | ((time_struct->mo / 10) << 4) | (time_struct->mo % 10);
 RTCCON1L.RTCEN = 1;
 RTCC_WRLOCK_BIT_SET();
 RTCCON1H.ALRMEN= 1 ;
  IEC3.RTCIE = 1 ;
}

void Set_RTCC_Alarm_In_Second(long Second_Value)
{
 long lTemp;
 TimeStruct time_struct;
 Get_RTCC_TimeStruct(&time_struct);
 time_struct.yy+=2000;
 lTemp = Time_dateToEpoch(&time_struct)+Second_Value;
 Time_epochToDate(lTemp,&time_struct);
 time_struct.yy-=2000;
 Set_RTCC_Alarm_Time(&time_struct);
}






void Init_ExtEeprom(void)
{
  LATD.RD7 = 1 ;
 Delay_ms(10);
  LATD.RD7 = 0 ;
 SPI1_Write(0x06);
  LATD.RD7 = 1 ;
 while(!CheckIfExtEepromIsReady());
  LATD.RD7 = 0 ;
 SPI1_Write(0x01);
 SPI1_Write(0x02);
  LATD.RD7 = 1 ;
}

char CheckIfExtEepromIsReady(void)
{
 char cTemp;
  LATD.RD7 = 0 ;
 SPI1_Write(0x05);
 cTemp=SPI1_Read(0x00);
  LATD.RD7 = 1 ;
 if(!(cTemp&0x01)) return 1;
 else return 0;
}

void ExtEeprom_WriteByte(unsigned int Address,char DataByte)
{
 while(!CheckIfExtEepromIsReady());
  LATD.RD7 = 0 ;
 SPI1_Write(0x06);
  LATD.RD7 = 1 ;
 while(!CheckIfExtEepromIsReady());
  LATD.RD7 = 0 ;
 SPI1_Write(0x02);
 SPI1_Write((Address&0xFF00)>>8);
 SPI1_Write(Address&0x00FF);
 SPI1_Write(DataByte);
  LATD.RD7 = 1 ;
 Delay_ms(5);
}

char ExtEeprom_ReadByte(unsigned int Address)
{
 char cTemp;
 while(!CheckIfExtEepromIsReady());
  LATD.RD7 = 0 ;
 SPI1_Write(0x03);
 SPI1_Write((Address&0xFF00)>>8);
 SPI1_Write(Address&0x00FF);
 cTemp=SPI1_Read(0x00);
  LATD.RD7 = 1 ;
 return cTemp;
}

void Delete_ExtEeprom(void)
{
 char i,PageLength=128;
 unsigned long k=0,EepromSize=65536;

 k=0;
 while(k<EepromSize)
 {
 while(!CheckIfExtEepromIsReady());
  LATD.RD7 = 0 ;
 SPI1_Write(0x06);
  LATD.RD7 = 1 ;
 while(!CheckIfExtEepromIsReady());
  LATD.RD7 = 0 ;
 SPI1_Write(0x02);
 SPI1_Write((k&0x0000FF00)>>8);
 SPI1_Write(k&0x000000FF);
 for(i=0;i<PageLength;i++) SPI1_Write(0x00);
  LATD.RD7 = 1 ;
 k+=PageLength;
 }
}








void GoToSleepMode(void)
{

 U2MD_bit=1;
 SPI1MD_bit=1;
 AD1MD_bit=1;
  TRISD.RD4 = 0 ;
  LATD.RD4 = 0 ;
  TRISD.RD5 = 0 ;
  LATD.RD5 = 0 ;
  TRISD.RD10 = 0 ;
  LATD.RD10 = 0 ;
  TRISD.RD11 = 0 ;
  LATD.RD11 = 0 ;
  TRISF.RF5 = 0 ;
  TRISF.RF3 = 0 ;
  TRISF.RF2 = 0 ;
  LATF.RF5 =0;
  LATF.RF3 =0;
  LATF.RF2 =0;
 IOCPDB=0xFFFF;
 IOCPDC=0xFFFF;
 IOCPDD=0xFFFF;
 IOCPDE=0xFFFF;
 IOCPDF=0xFFFF;
 IOCPDG=0xFFFF;
 RCON.SWDTEN= 0 ;
 OSCCON=0x5500;
 asm { PWRSAV #0 }
}


void WakeUpFromSleepMode(void)
{
 OSCCON=0x3300;
 IOCPDB=0x0000;
 IOCPDC=0x0000;
 IOCPDD=0x0000;
 IOCPDE=0x0000;
 IOCPDF=0x0000;
 IOCPDG=0x0000;
 RCON.SWDTEN= 1 ;
  TRISD.RD10 = 0 ;
  TRISD.RD11 = 1 ;
 U2MD_bit=0;
 Uart2_Init(57600);
 SPI1MD_bit=0;
  LATF.RF5 =0;
  TRISF.RF5 = 0 ;
  LATF.RF5 =0;
  PORTF.RF3 =0;
  TRISF.RF3 = 1 ;
  LATF.RF2 =0;
  TRISF.RF2 = 0 ;
  LATF.RF2 =0;
 SPI1_Init();
 AD1MD_bit=0;
 ADC1_Init_Advanced(_ADC_12bit, _ADC_EXTERNAL_VREFH | _ADC_INTERNAL_VREFL);
 AD1CON3=0x0503;
 Delay_ms(1);
}

void SPI1_Initialize_MCP (void)
{
 SPI1CON1H = 0x0000;
 SPI1CON2L = 0x0000;
 SPI1STATL = 0x0000;
 SPI1BRGL = 0x0001;


 SPI1IMSKL = 0x0000;
 SPI1IMSKH = 0x0000;
 SPI1URDTL = 0x0000;
 SPI1URDTH = 0x0000;
 SPI1CON1L = 0x8121;
}

void Battery_Power_Boost_Activation(char mode)
{
 if(mode)  LATB.RB12 = 1 ;
 else  LATB.RB12 = 0 ;
}

void CheckAndSwitchToBattery(void)
{

 float ADC_Sampling,VIN;
  ANSB.RB0 = 1 ;
  TRISB.RB0 = 1 ;
  LATD.RD3 = 1 ;
  ANSB.RB13 = 1 ;
  TRISB.RB13 = 1 ;
  LATD.RD6 = 1 ;
 ADC1_Get_Sample(13);
 ADC_Sampling=((float)ADC1_Get_Sample(13)+(float)ADC1_Get_Sample(13))/2;
 VIN=((ADC_Sampling* 2.048 )/4095)* 16.03012048 ;
 if((VIN<=4.5)&&( PORTB.RB12 == 0 )){Battery_Power_Boost_Activation( 1 );}
 else if ((VIN>4.5)&&( PORTB.RB12 == 1 )) {Battery_Power_Boost_Activation( 0 );}
}


void Pseudo_Uart1_Write_Byte(char din)
{

 char i;
  LATD.RD4 =0;
 Delay_us(8);
 for(i=0;i<8;i++)
 {
  LATD.RD4 =din&0x01;
 din>>=1;
 Delay_us(8);
 }
  LATD.RD4 =1;
 Delay_us(8);
}

void Pseudo_Uart1_Write_Text(unsigned char *p)
{
 int i=0;
 while(p[i]!=0) Pseudo_Uart1_Write_Byte(p[i++]);
}

void Pseudo_Uart1_Enable(char mode)
{
  LATD.RD4 =0;
  TRISD.RD4 = 0 ;

  LATD.RD5 =0;
  TRISD.RD5 = 1 ;
 switch (mode)
 {
 case 1 :
 U1MD_bit=1;
 Delay_ms(10);
 break;
 case 0 :
 U1MD_bit=0;
 Uart1_Init(2000000);
 Delay_ms(100);
 break;

 }
}

void CheckRxDataFromInterruptUart2(void)
{
 int i=0;
 if( IFS1bits.U2RXIF )
 {
 PrintOut(PrintHandler,"\rUart2 Intterupt Buffer:%s",UART2_RX_Interrupt_Buffer);
 U2STAbits.OERR=0;
  IFS1bits.U2RXIF =0;
  IEC1bits.U2RXIE =1;
 }
}

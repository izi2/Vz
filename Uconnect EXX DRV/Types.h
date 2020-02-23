#ifndef TYPES_H
#define TYPES_H

#include <limits.h>

#define TIMESTAMP_2019          1559131886
#define NO_TIMESTAMP            0

#define FLOAT_FACTORY           1000 //num after point
#define TINY_FLOAT_FACTORY      100 //num after point

#define DELAY_WATER_FLOW        10 //take the counter after delay to avoid reading continually flow
#define MAX_PULSE_SEC           500
#define MAX_TIME_COUNTER        65535 /MAX_PULSE_SEC//max uint16/max pulse sec - counter max has 16 bit

#define Eeprom_Size             64 * 1024//64 kb

#define BreakLine           "\r\n"

#ifndef NULL
#define NULL                0
#endif

#define NAN                 0.0

#define NONE                0

#define STR_TERMINATED      '\0'

#define SUCCESS              0
#define FAILURE             -1
#define NOT_FOUND           -1

#define INPUT                1
#define OUTPUT               0
#define ANALOG               1
#define DIGITAL              0
#define HIGH                 1
#define LOW                  0

#define CIRCLE_DEGREE        360

#define Sensor4To20_Start    4

#define ENUM_SIZE            2//2 bytes

#define PERC2DEC(perc, from)((float)perc/(float)100 * (float)from)

#define USEC_PER_SEC         1000000

#define SEC2USEC(sec)(sec * USEC_PER_SEC)

#define MSEC2USEC(msec)(msec * 1000)

#define MSEC2SEC(sec)(sec / 1000)

#define USEC2SEC(usec)(usec / USEC_PER_SEC)

#define MAX_ULONG    4294967295

#define MAX_UINT    65535

#define MAX_INT    32767

#define MIN_INT    -32768

#define MAX_DATA_TYPE    sizeof(uint_32)//bytes

#ifndef WIN_32

typedef unsigned char uint_8;

//#ifndef _SIZE_T
//typedef uint_16 size_t;
//#endif

typedef unsigned int uint_16;

typedef unsigned long uint_32;

typedef signed char int_8;

typedef signed int int_16;

typedef signed long int_32;

#else

typedef unsigned char uint_8;

//typedef uint_8 size_t;
//typedef uint_8 size_t;

typedef unsigned short uint_16;

typedef unsigned int uint_32;

typedef char int_8;

typedef short int_16;

typedef int int_32;

#endif /*COMPILE_UNIT_TESTS*/

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
    uint_8 to_bytes[MAX_DATA_TYPE];
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

#endif /*TYPES_H*/
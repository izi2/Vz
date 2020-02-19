#ifndef BITSET_H
#define BITSET_H

#include "Types.h"

#define BIT1      (uint_32)(1UL)
#define BIT2      (uint_32)(1UL << 1)
#define BIT3      (uint_32)(1UL << 2)
#define BIT4      (uint_32)(1UL << 3)
#define BIT5      (uint_32)(1UL << 4)
#define BIT6      (uint_32)(1UL << 5)
#define BIT7      (uint_32)(1UL << 6)
#define BIT8      (uint_32)(1UL << 7)
#define BIT9      (uint_32)(1UL << 8)
#define BIT10     (uint_32)(1UL << 9)
#define BIT11     (uint_32)(1UL << 10)
#define BIT12     (uint_32)(1UL << 11)
#define BIT13     (uint_32)(1UL << 12)
#define BIT14     (uint_32)(1UL << 13)
#define BIT15     (uint_32)(1UL << 14)
#define BIT16     (uint_32)(1UL << 15)
#define BIT17     (uint_32)(1UL << 16)
#define BIT18     (uint_32)(1UL << 17)
#define BIT19     (uint_32)(1UL << 18)
#define BIT20     (uint_32)(1UL << 19)
#define BIT21     (uint_32)(1UL << 20)
#define BIT22     (uint_32)(1UL << 21)
#define BIT23     (uint_32)(1UL << 22)
#define BIT24     (uint_32)(1UL << 23)
#define BIT25     (uint_32)(1UL << 24)
#define BIT26     (uint_32)(1UL << 25)
#define BIT27     (uint_32)(1UL << 26)
#define BIT28     (uint_32)(1UL << 27)
#define BIT29     (uint_32)(1UL << 28)
#define BIT30     (uint_32)(1UL << 29)
#define BIT31     (uint_32)(1UL << 30)
#define BIT32     (uint_32)(1UL << 31)

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

#endif /*BITSET_H*/
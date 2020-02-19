#include "Bitset.h"
#include "built_in.h"
#include "PIC_DRV_Uconnect.h"


Mem_AddressType Long2Array(uint_32 to_convert, uint_8 *array, Mem_AddressType array_index)
{
    array[array_index] = Highest(to_convert);
    array_index++;

    array[array_index] = Higher(to_convert);
    array_index++;

    array[array_index] = Hi(to_convert);
    array_index++;

    array[array_index] = Lo(to_convert);
    array_index++;

    return array_index;
}

uint_16 Array2Float(uint_8 *array, float *aFloat, uint_16 array_index)
{
    int_32 aLong;

    array_index = Array2SLong(array, &aLong, array_index);

    *aFloat = (float) aLong / (float) FLOAT_FACTORY;

    return  array_index;
}

Mem_AddressType Float2Array(float aFloat, uint_8 *array, uint_16 array_index)
{
    int_32 float_Long = (int_32) (aFloat * (float) FLOAT_FACTORY);
    return (Mem_AddressType) SLong2Array(float_Long, array, array_index);
}

Mem_AddressType TinyFloat2Array(float aFloat, uint_8 *array, uint_32 array_index)
{
    int_16 float_int = (int_16) (aFloat * (float) TINY_FLOAT_FACTORY);
    return (Mem_AddressType) Int2Array(float_int, array, array_index);
}

Mem_AddressType Array2TinyFloat(uint_8 *array, float *aFloat, uint_32 array_index)
{
    uint_16 aInt;

    array_index = Array2Int(array, &aInt, array_index);

    *aFloat = (float) aInt / (float) TINY_FLOAT_FACTORY;

    return (Mem_AddressType) array_index;
}


uint_32 SLong2Array(int_32 aLong, uint_8 *array, uint_32 array_index)
{
    array[array_index] = Highest(aLong);
    array_index++;

    array[array_index] = Higher(aLong);
    array_index++;

    array[array_index] = Hi(aLong);
    array_index++;

    array[array_index] = Lo(aLong);
    array_index++;

    return array_index;
}

Mem_AddressType SInt2Array(int_16 int16, uint_8 *array, uint_32 array_index)
{
    //for 60 bytes int (120bytes char) -> run time=165usec
    array[array_index] = Hi(int16);
    array_index++;

    array[array_index] = Lo(int16);
    array_index++;

    return array_index;
}


Mem_AddressType Array2SInt(uint_8 *array, int_16 *int16, uint_32 array_index)
{
    Hi(*int16) = array[array_index];
    array_index++;

    Lo(*int16) = array[array_index];
    array_index++;

    return array_index;
}

Mem_AddressType Array2AddressType(uint_8 *array, Mem_AddressType *value, uint_32 array_index)
{
    if (sizeof(Mem_AddressType) == 2)
        return (Mem_AddressType) Array2Int(array, value, array_index);
    else  if (sizeof(Mem_AddressType) == 4)
        return (Mem_AddressType) Array2Long(array, value, array_index);

    return NONE;
}

uint_16 Array2Long(uint_8 *array, uint_32 *to_convert, uint_16 array_index)
{
    Highest(*to_convert) = array[array_index];
    array_index++;

    Higher(*to_convert) = array[array_index];
    array_index++;

    Hi(*to_convert) = array[array_index];
    array_index++;

    Lo(*to_convert) = array[array_index];
    array_index++;

    return array_index;
}

uint_16 Array2SLong(uint_8 *array, int_32 *aLong, uint_16 array_index)
{
    Highest(*aLong) = array[array_index];
    array_index++;

    Higher(*aLong) = array[array_index];
    array_index++;

    Hi(*aLong) = array[array_index];
    array_index++;

    Lo(*aLong) = array[array_index];
    array_index++;

    return array_index;
}

uint_32 Int2Array(uint_16 anInt, uint_8 *array, uint_32 array_index)
{
    array[array_index] = Hi(anInt);
    array_index++;

    array[array_index] = Lo(anInt);
    array_index++;

    return array_index;
}

uint_32 Array2Int(uint_8 *array, uint_16 *anInt, uint_32 array_index)
{
    Hi(*anInt) = array[array_index];
    array_index++;

    Lo(*anInt) = array[array_index];
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
    return Hi(value);
}

char GetMaxHigh(uint_32 value)
{
    return Highest(value);
}

char GetMiddleHigh(uint_32 value)
{
    return Higher(value);
}

char GetMinHigh(uint_32 value)
{
    return Hi(value);
}

char GetLongLow(uint_32 value)
{
    return Lo(value);
}

char GetLow(uint_16 value)
{
    return Lo(value);
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

///return index of first '1' bit in bits
/// \param bits to search
/// \param size_bits size of  bits (typical sizeof(bits) * 8)
/// \return index of first '1' bit in bits of NOT_FOUND if all is '0'
int_8 GetOnBitPosition(uint_32 bits, uint_8 size_bits)
{
    uint_8 i;
    for (i = 0; i < size_bits; ++i)
    {
        if (bits & (uint_32) (1UL << i))
            return i;
    }

    return NOT_FOUND;
}
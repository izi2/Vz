#ifndef CONFIG_FILE_H
#define CONFIG_FILE_H



#include "Types.h"

typedef unsigned char (*Reader)(unsigned int Address);

typedef  void (*Writer)(unsigned int Address ,char DataByte);

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


//Mem_AddressType SetKeyValueProperty(UShortEntry property);

//Mem_AddressType SetIntKeyValueProperty(UIntEntry property);

//void SetSignedIntKeyValueProperty(IntEntry property);

//void SetSignedLongKeyValueProperty(LongEntry property);

//Mem_AddressType SetLongKeyValueProperty(ULongEntry property);

//void SetLong3KeyValueProperty(ULongEntry property);

//Mem_AddressType SetFloatKeyValueProperty(UFloatEntry property);

Mem_AddressType SetFloatProperty(Mem_AddressType address,float property);

#endif  /*CONFIG_FILE_H*/
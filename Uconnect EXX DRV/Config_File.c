#include "Config_File.h"
#include "Types.h"
#include "Bitset.h"
#include "built_in.h"
#include "PIC_DRV_Uconnect.h"


Reader m_reader;
Writer m_writer;

void GetEepromControl(Mem_AddressType address, EepromControl *control)
{//to rm Eeprom_Size
    if (address < Eeprom_Size)
    {
        control->num = 1;
        control->address = address;
    } else
    {
        control->num = 2;
        control->address = (Mem_AddressType) (address - Eeprom_Size);
    }
}

void MemWrt(Mem_AddressType address,char m_data)
{

    m_writer(address, m_data);//MEM[address] = _data;//

}

unsigned char MemRd(Mem_AddressType address)
{

    return m_reader(address);//MEM[address];//
}

//void SetKeyValueAddressProperty(Address_Entry address_entry)
//{
//    SetAddressProperty(address_entry.address,address_entry.value);
//}
//
//Mem_AddressType GetKeyValueAddressProperty(Address_Entry address_entry)
//{
//    return GetAddressProperty(address_entry.address);
//}

void SetAddressProperty(Mem_AddressType address, Mem_AddressType value)
{
    if(sizeof(Mem_AddressType) == 2)
        SetIntProperty(address,value);
    else  if(sizeof(Mem_AddressType) == 4)
        SetLongProperty(address,value);
}

Mem_AddressType GetAddressProperty(Mem_AddressType address)
{
    if(sizeof(Mem_AddressType) == sizeof(uint_16))
        return GetIntProperty(address);
    else  if(sizeof(Mem_AddressType) == sizeof(uint_32))
        return GetLongProperty(address);

    return NONE;
}
/**
 * \brief retrieve property saved in eeprom
 * \param address the  address in eeprom from the given value
 * \return value the value from eeprom if exist
 */
unsigned char GetProperty(Mem_AddressType address)
{
    return MemRd(address);;
}

/**
 * \brief save propery to eeprom by the given address
 * \param address the  address in eeprom to save value
 * \param value the char to save 
 */
Mem_AddressType SetProperty(Mem_AddressType address, uint_8 value)
{
    MemWrt(address, value);
    return (Mem_AddressType) (address + 1);
}

/*uint_16 get_value(Bool signed_value, short high)
{
        return signed_value ? (int_16)high : (uint_16)high;
}*/

/**
* \brief save int (16 bit) propery to eeprom by the given address
* \param start_address the  address in eeprom to save value
* \param value the char to save
*/
Mem_AddressType SetIntProperty(Mem_AddressType start_address, uint_16 value)
{
    uint_8 high = Hi(value);

    uint_8 low = Lo(value);

    MemWrt(start_address, high);

    MemWrt(start_address + 1, low);

    return (Mem_AddressType) (start_address + 2);
}

/**
* \brief save long (32 bit) propery to eeprom by the given address
* \param start_address the  address in eeprom to save value
* \param value the char to save
*/
Mem_AddressType SetLongProperty(Mem_AddressType start_address, uint_32 value)
{
    uint_8 max_high = Highest(value);

    uint_8 middle_high = Higher(value);

    uint_8 min_high = Hi(value);

    uint_8 low = Lo(value);

    MemWrt(start_address, max_high);

    MemWrt(start_address + 1, middle_high);

    MemWrt(start_address + 2, min_high);

    MemWrt(start_address + 3, low);

    return (Mem_AddressType) (start_address + 4);
}

void SetLong3Property(Mem_AddressType start_address, uint_32 value)
{
    uint_8 high = Higher(value);

    uint_8 middle = Hi(value);

    uint_8 low = Lo(value);

    MemWrt(start_address, high);

    MemWrt(start_address + 1, middle);

    MemWrt(start_address + 2, low);
}


/**
* \brief retrive int(16 bit) property saved in eeprom
* \param start_address the  address in eeprom from the given value
* \return value the value from eeprom if exist
*/
uint_16 GetIntProperty(Mem_AddressType start_address)
{
    uint_8 high = MemRd(start_address);

    uint_8 low = MemRd(start_address + 1);

    uint_16 value = CombineHighLow(high, low);

    return value;
}

/**
* \brief retrive signed int(16 bit) property saved in eeprom
* Note : if the int is signed the mikroc saves the signed bit as is even with logic gates
* \param start_address the  address in eeprom from the given value
* \return value the value from eeprom if exist
*/
int_16 GetSignedIntProperty(Mem_AddressType start_address)
{
    uint_8 low = MemRd(start_address);

    uint_8 high = MemRd(start_address + 1);

    return CombineSignedHighLow(high,low);
}

/**
* \brief retrieve signed long(32 bit) property saved in eeprom
* Note : if the long is signed the mikroc saves the signed bit as is even with logic gates
* \param address the  address in eeprom from the given value
* \return value the value from eeprom if exist
*/
int_32 GetSignedLongProperty(Mem_AddressType address)
{
    int_8 max_high = MemRd(address);

    int_8 middle_h = MemRd(address + 1);

    int_8 min_h = MemRd(address + 2);

    int_8 low = MemRd(address + 3);

    return CombineLongHighLow(max_high, middle_h, min_h, low);
}

/**
* \brief retrieve long (32 bit) property saved in eeprom
* \param address the  address in eeprom from the given value
* \return value the value from eeprom if exist
*/
uint_32 GetLongProperty(Mem_AddressType address)
{
    uint_8 max_high = MemRd(address);

    uint_8 middle_h = MemRd((Mem_AddressType) (address + 1));

    uint_8 min_h = MemRd((Mem_AddressType) (address + 2));

    uint_8 low = MemRd((Mem_AddressType) (address + 3));

    return CombineLongHighLow(max_high, middle_h, min_h, low);
}

uint_32 GetLong3Property(Mem_AddressType address)
{
    uint_8 high = MemRd(address);

    uint_8 middle = MemRd((Mem_AddressType) (address + 1));

    uint_8 low = MemRd((Mem_AddressType) (address + 2));

    return CombineLong3HighLow(high, middle, low);
}


/**
 * \brief take key value pair struct (Entry) and insert them into eeprom
 * \param property one of Entry types
 */
//Mem_AddressType SetKeyValueProperty(UShortEntry property)
//{
//    SetProperty(property.address, property.value);
//    return (Mem_AddressType) (property.address + 1);
//}

/**
 * \brief take key value pair struct (Entry) and insert them into eeprom
 * \param property one of Entry types
 */
//Mem_AddressType SetCharKeyValueProperty(CharEntry property)
//{
//    //Not implemented  Get for all KeyValue func
//    SetProperty(property.address, property.value);
//    return (Mem_AddressType) (property.address + 1);
//}


/**
 * \see SetKeyValueProperty(ShortEntry property)
 * 
 */
//Mem_AddressType SetIntKeyValueProperty(UIntEntry property)
//{
//    SetIntProperty(property.address, property.value);
//    return (Mem_AddressType) (property.address + 2);
//}

/**
 * \see SetKeyValueProperty(ShortEntry property)
 *
 */
//void SetSignedIntKeyValueProperty(IntEntry property)
//{
//    SetIntProperty(property.address, property.value);
//}

/**
 * \see SetKeyValueProperty(ShortEntry property)
 * 
 */
//Mem_AddressType SetLongKeyValueProperty(ULongEntry property)
//{
//    SetLongProperty(property.address, property.value);
//    return (Mem_AddressType) (property.address + 4);
//}

/**
* \see SetKeyValueProperty(ShortEntry property)
*
*/
//void SetSignedLongKeyValueProperty(LongEntry property)
//{
//    SetLongProperty(property.address, property.value);
//}

Mem_AddressType SetFloatProperty(Mem_AddressType address,float property)
{
    int_32 value = (int_32) (property * (float)FLOAT_FACTORY);

    SetSignedLongProperty(address, value);
    return (Mem_AddressType) (address + 4);
}

//Mem_AddressType SetFloatKeyValueProperty(UFloatEntry property)
//{
//    SetFloatProperty(property.address, property.value);
//    return (Mem_AddressType) (property.address + 4);
//}

float GetFloatProperty(const Mem_AddressType address)
{
    int_32 property = GetSignedLongProperty(address);

    return (float) property / (float)FLOAT_FACTORY;
}

void SetSignedLongProperty(Mem_AddressType start_address,int_32 value)
{
    int_8 max_high = Highest(value);

    int_8 middle_high = Higher(value);

    int_8 min_high = Hi(value);

    int_8 low = Lo(value);

    MemWrt(start_address, max_high);

    MemWrt(start_address + 1, middle_high);

    MemWrt(start_address + 2, min_high);

    MemWrt(start_address + 3, low);
}
/**
 * \see SetKeyValueProperty(ShortEntry property)
 * 
 */
//void SetLong3KeyValueProperty(ULongEntry property)
//{
//    SetLong3Property(property.address, property.value);
//}

void ConfigFileInit(Writer writer, Reader reader)
{
  m_writer = writer;
  m_reader = reader;
}
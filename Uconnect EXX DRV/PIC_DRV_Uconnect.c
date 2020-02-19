#include "PIC_DRV_Uconnect.h"



char volatile UART2_RX_Interrupt_Buffer[UART2_RX_Buffer_Length];
//***********************************************************
void BoardInit (void)
{
    OSCCON=0x3300;    //32MHZ
    CLKDIV = 0x3120;  //32MHZ
    //OSCCON=0x2200;    //4MHZ
    //CLKDIV = 0x0200;  //4MHZ
    OSCTUN = 0x0000;
    REFOCONL = 0x0000;
    REFOCONH = 0x0000;
    REFOTRIML = 0x0000;
    DCOTUN = 0x0000;
    DCOCON = 0x0700;
    OSCDIV = 0x0000;
    OSCFDIV = 0x0000;
    RCON = 0x0000;
    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
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
    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
     ODCB = 0x0000;
     ODCC = 0x0000;
     ODCD = 0x0000;
     ODCE = 0x0000;
     ODCF = 0x0000;
     ODCG = 0x0000;
      /****************************************************************************
     * PMD
     ***************************************************************************/
      PMD1=0xFF80; //Uart1/2,SPI
      PMD2=0xFFFF;
      PMD3=0xFDFF;//RTC is enabled
      PMD4=0xFFFF;
      PMD5=0xFFFF;
      PMD6=0xFFFF;
      PMD7=0xFFFF;
      PMD8=0xFFFF;
    /****************************************************************************
     * Set the PPS
     ***************************************************************************/
    OSCCONL=OSCCONL&0xbf; // unlock PPS

    RPOR12bits.RP25R = 0x0003;   //RD4->UART1:U1TX;
    RPINR18bits.U1RXR = 0x0014;   //RD5->UART1:U1RX;
    RPOR8bits.RP17R = 0x0008;   //RF5->SPI1:SCK1OUT;
    RPOR15bits.RP30R = 0x0007;   //RF2->SPI1:SDO1;
    RPINR20bits.SDI1R = 0x0010;   //RF3->SPI1:SDI1;
    RPINR19bits.U2RXR = 0x000C;   //RD11->UART2:U2RX;
    RPOR1bits.RP3R = 0x0005;   //RD10->UART2:U2TX;

    OSCCONL=OSCCONL|0x40; // lock   PPS

    RST_MIKROBUS_MRXSTX5_Lat=0;
    RST_MIKROBUS_MRXSTX5_Tris=OUTPUT;

    SW_LIGHT_SENSOR_Lat=0;
    SW_LIGHT_SENSOR_Tris=OUTPUT;

    SW_PRE_STEP_UP_MIKROBUS_Lat=0;
    SW_PRE_STEP_UP_MIKROBUS_Tris=OUTPUT;

    EN_STEP_UP_MIKROEBUS_Lat=0;
    EN_STEP_UP_MIKROEBUS_Buff=DIGITAL;
    EN_STEP_UP_MIKROEBUS_Tris=OUTPUT;

    RTC_INT_Lat=0;
    RTC_INT_Port=0;
    RTC_INT_Buff=DIGITAL;
    RTC_INT_Tris=OUTPUT;

    RG8_Lat=0;
    RG8_Buff=DIGITAL;
    RG8_Tris=OUTPUT;

    EN_STEP_UP_TERMINAL_Lat=0;
    EN_STEP_UP_TERMINAL_Buff=DIGITAL;
    EN_STEP_UP_TERMINAL_Tris =OUTPUT;

    AN_MIKROBUS_MTXSRX5_Lat=0;
    AN_MIKROBUS_MTXSRX5_Buff=DIGITAL;
    AN_MIKROBUS_MTXSRX5_Tris=OUTPUT;
    AN_MIKROBUS_MTXSRX5_Port=0;

    CR123_VOLTAGE_SAMPLE_Lat=0;
    CR123_VOLTAGE_SAMPLE_Buff=DIGITAL;
    CR123_VOLTAGE_SAMPLE_Tris=OUTPUT;

    SHD_Lat=0;
    SHD_Buff=DIGITAL;
    SHD_Tris=OUTPUT;


    LIGHT_SENSOR_SAMPLE_Lat=0;
    LIGHT_SENSOR_SAMPLE_Buff=DIGITAL;
    LIGHT_SENSOR_SAMPLE_Tris=OUTPUT;

    TMR3_IO1_MRXSTX3_EXT0_Lat=0;
    TMR3_IO1_MRXSTX3_EXT0_Buff=DIGITAL;
    TMR3_IO1_MRXSTX3_EXT0_Port=0;
    TMR3_IO1_MRXSTX3_EXT0_Tris=OUTPUT;

    /*TMR4_IO2_MTXSRX3_EXT1_Lat=0;
    TMR4_IO2_MTXSRX3_EXT1_Buff=DIGITAL;
    TMR4_IO2_MTXSRX3_EXT1_Tris=OUTPUT;
    TMR4_IO2_MTXSRX3_EXT1_Port=0;*/

    VREFF_Lat=0;
    VREFF_Buff=DIGITAL;
    VREFF_Tris=OUTPUT;

    PGC_Lat=0;
    PGC_Buff=DIGITAL;
    PGC_Tris=OUTPUT;

    PGD_Lat=0;
    PGD_Buff=DIGITAL;
    PGD_Tris=OUTPUT;

    SW_PRE_STEP_UP_TERMINAL_Lat=0;
    SW_PRE_STEP_UP_TERMINAL_Buff=DIGITAL;
    SW_PRE_STEP_UP_TERMINAL_Tris=OUTPUT;

    TEMP_AN_SAMPLE_Lat=0;
    TEMP_AN_SAMPLE_Buff=DIGITAL;
    TEMP_AN_SAMPLE_Tris=OUTPUT;

    SW_URF_POWER_Lat=0;
    SW_URF_POWER_Buff=DIGITAL;
    SW_URF_POWER_Tris=OUTPUT;

    USB_VOLTAGE_SAMPLE_Lat=0;
    USB_VOLTAGE_SAMPLE_Buff=DIGITAL;
    USB_VOLTAGE_SAMPLE_Tris=OUTPUT;

    EN_BATTERY_BYPASS_Lat=0;
    EN_BATTERY_BYPASS_Buff=DIGITAL;
    EN_BATTERY_BYPASS_Tris=OUTPUT;

    PIN_12V_VOLTAGE_SAMPLE_Lat=0;
    PIN_12V_VOLTAGE_SAMPLE_Buff=DIGITAL;
    PIN_12V_VOLTAGE_SAMPLE_Tris=OUTPUT;

    LED_RED_Lat=ON;
    LED_RED_Buff=DIGITAL;
    LED_RED_Tris=OUTPUT;

    LED_GREEN_Lat=ON;
    LED_GREEN_Buff=DIGITAL;
    LED_GREEN_Tris=OUTPUT;

    CS_MIKROBUS_PWM7_Lat=0;
    CS_MIKROBUS_PWM7_Tris=OUTPUT;

    PHY_SCK=0;
    PHY_SCK_Tris=OUTPUT;
    PHY_SCK_PIN=0;

    PHY_SDI=0;
    PHY_SDI_Tris=INPUT;

    PHY_SDO=0;
    PHY_SDO_Tris=OUTPUT;
    PHY_SDO_PIN=0;

    INT_MIKROBUS_Lat=0;
    INT_MIKROBUS_Port=0;
    INT_MIKROBUS_Tris=OUTPUT;

    SDA_Lat=0;
    SDA_Port=0;
    SDA_Tris=OUTPUT;

    SCL_Lat=0;
    SCL_Tris=OUTPUT;

    nIRQ_PIN=0;
    nIRQ_Tris=OUTPUT;

    PWM_MIKROBUS_Lat=0;
    PWM_MIKROBUS_Port=0;
    PWM_MIKROBUS_Tris=OUTPUT;

    MTXSRX2_Lat=0;
    MTXSRX2_Tris=OUTPUT;

    MRXSTX2_Lat=0;
    MRXSTX2_Tris=INPUT;

    RD0_Lat=0;
    RDO_Tris=OUTPUT;

    POWER_TEMP_AN_Lat=0;
    POWER_TEMP_AN_Tris=OUTPUT;

    SW_USB_VOLTAGE_Lat=0;
    SW_USB_VOLTAGE_Tris=OUTPUT;

    SW_VREFF_Lat=0;
    SW_VREFF_Tris=OUTPUT;

    MTXSRX1_Lat=0;
    MTXSRX1_Tris=OUTPUT;

    MRXSTX1_Lat=0;
    MRXSTX1_Tris=INPUT;

    SW_12V_VOLTAGE_Lat=0;
    SW_12V_VOLTAGE_Buff=DIGITAL;
    SW_12V_VOLTAGE_Tris=OUTPUT;

    CS_EEPROM_Lat=1;
    CS_EEPROM_Buff=DIGITAL;
    CS_EEPROM_Tris=OUTPUT;

    SW_CR123_VOLTAGE_Lat=0;
    SW_CR123_VOLTAGE_Tris=OUTPUT;

    nSDN=0;
    nSDN_Tris=OUTPUT;

    SW_VOC_Lat=0;
    SW_VOC_Tris=OUTPUT;

    nSEL=0;
    nSEL_Tris=OUTPUT;

    RE2_Lat=0;
    RE2_Tris=OUTPUT;

    RE3_Lat=0;
    RE3_Tris=OUTPUT;

    RE4_Lat=0;
    RE4_Buff=DIGITAL;
    RE4_Tris=OUTPUT;

    RC13_Lat=0;
    RC13_Buff=DIGITAL;
    RC13_Tris=OUTPUT;

    RC14_Lat=0;
    RC14_Buff=DIGITAL;
    RC14_Tris=OUTPUT;
    RCON.SWDTEN=ON;
    ADC1_Init_Advanced(_ADC_12bit, _ADC_EXTERNAL_VREFH | _ADC_INTERNAL_VREFL);
    AD1CON3=0x0503;
    UART2_Init(57600);
    UART1_Init(2000000);
    Delay_ms(100);
    PrintOut(PrintHandler,"\rBoard Initialization...");
    Uart2_RX_Int_En=0;
    ESP_RX_Int_En=0;
}

//***********************************************************
void Terminal_PowerOut_Enable(char mode,unsigned int delay_ms_value)
{
     unsigned int i;
     switch ( mode)
     {
              case    ON:
                      SW_PRE_STEP_UP_TERMINAL_Lat=ON;
                      for(i=0;i<delay_ms_value;i++) Delay_ms(1);
                      break;
              case    OFF:
                      SW_PRE_STEP_UP_TERMINAL_Lat=OFF;
                      break;
    }
}
//***********************************************************
void Mikrobus_PowerOut_Enable(char mode,unsigned int delay_ms_value)
{
     unsigned int i;
     switch ( mode)
     {
              case    ON:
                      SW_PRE_STEP_UP_MIKROBUS_Lat=ON;
                      for(i=0;i<delay_ms_value;i++) Delay_ms(1);
                      break;
              case    OFF:
                      SW_PRE_STEP_UP_MIKROBUS_Lat=OFF;
                      break;
    }
}
//***********************************************************
void PrintHandler(char c)
{
   UART2_Write(c);
}
//***********************************************************
char Read_SHD_PIN(void)
{
    char cTemp=0;
    float ADC_Sampling,VIN;
    VREFF_Buff=ANALOG;
    VREFF_Tris=INPUT;
    SW_VREFF_Lat=ON;
    SHD_Tris=INPUT;
    SHD_Buff=ANALOG;
    Delay_us(1000);
    ADC_Sampling=((float)ADC1_Get_Sample(3)+(float)ADC1_Get_Sample(3))/2;
    VIN=((ADC_Sampling*Vref)/4095);
    SW_VREFF_Lat=OFF;
    VREFF_Buff=DIGITAL;
    VREFF_Tris=OUTPUT;
    SHD_Tris=OUTPUT;
    SHD_Buff=DIGITAL;
    if(VIN>1) return 1;
    else return 0;
}
//***********************************************************
void LED_Activation(char color,char mode)
{
    switch ( mode)
    {
            case    LED_ON:
                    if(color==LED_RED) LED_RED_Lat=0;
                    else LED_GREEN_Lat=0;
                                        break;
            case    LED_OFF:
                    if(color==LED_RED) LED_RED_Lat=1;
                    else LED_GREEN_Lat=1;
                    break;
            case    LED_NOT:
                    if(color==LED_RED) LED_RED_Lat^=1;
                    else LED_GREEN_Lat^=1;
                    break;
    }
}
//***********************************************************
float GetBatteryVoltage(void)
{
    // run time=460uSec
    float ADC_Sampling,VIN;
    VREFF_Buff=ANALOG;
    VREFF_Tris=INPUT;
    SW_VREFF_Lat=ON;
    CR123_VOLTAGE_SAMPLE_Buff=ANALOG;
    CR123_VOLTAGE_SAMPLE_Tris=INPUT;
    SW_CR123_VOLTAGE_Lat=ON;
    Delay_us(350);
    ADC1_Get_Sample(4);// must to do
    ADC_Sampling=((float)ADC1_Get_Sample(4)+(float)ADC1_Get_Sample(4))/2;
    VIN=((ADC_Sampling*Vref)/4095)*Vbatt_ResistorsFactor;
    SW_VREFF_Lat=OFF;
    VREFF_Buff=DIGITAL;
    VREFF_Tris=OUTPUT;
    SW_CR123_VOLTAGE_Lat=OFF;
    CR123_VOLTAGE_SAMPLE_Buff=DIGITAL;
    CR123_VOLTAGE_SAMPLE_Tris=OUTPUT;
    CR123_VOLTAGE_SAMPLE_Lat=OFF;
    return VIN;
}
//***********************************************************
float Get12VInputVoltage(void)
{
    // run time=460uSec
    float ADC_Sampling,VIN;
    VREFF_Buff=ANALOG;
    VREFF_Tris=INPUT;
    SW_VREFF_Lat=ON;
    PIN_12V_VOLTAGE_SAMPLE_Buff=ANALOG;
    PIN_12V_VOLTAGE_SAMPLE_Tris=INPUT;
    SW_12V_VOLTAGE_Lat=ON;
    Delay_us(350);
    ADC1_Get_Sample(13);// must to do
    ADC_Sampling=((float)ADC1_Get_Sample(13)+(float)ADC1_Get_Sample(13))/2;
    VIN=((ADC_Sampling*Vref)/4095)*VIN_ResistorsFactor;
    SW_VREFF_Lat=OFF;
    VREFF_Buff=DIGITAL;
    VREFF_Tris=OUTPUT;
    SW_12V_VOLTAGE_Lat=OFF;
    PIN_12V_VOLTAGE_SAMPLE_Buff=DIGITAL;
    PIN_12V_VOLTAGE_SAMPLE_Tris=OUTPUT;
    PIN_12V_VOLTAGE_SAMPLE_Lat=OFF;
    return VIN;
}
//***********************************************************
float Get4To20IoCurrent(char IO_Num)
{
   return GetIoInputVoltage(IO_Num)/ResistorsShunt_4To20mA;
}
//***********************************************************
float GetIoInputVoltage (char IO_Num)
{
   float ADC_Sampling,VIN;
   VREFF_Buff=ANALOG;
   VREFF_Tris=INPUT;
   SW_VREFF_Lat=ON;
   Delay_us(350);
   if(IO_Num==1) 
   {
      TMR3_IO1_MRXSTX3_EXT0_Buff=ANALOG;
      TMR3_IO1_MRXSTX3_EXT0_Tris=INPUT;
      ADC1_Get_Sample(1);// must to do
      ADC_Sampling=((float)ADC1_Get_Sample(1)+(float)ADC1_Get_Sample(1))/2;
      SW_VREFF_Lat=OFF;
      VREFF_Buff=DIGITAL;
      VREFF_Tris=OUTPUT;
      TMR3_IO1_MRXSTX3_EXT0_Buff=DIGITAL;
      TMR3_IO1_MRXSTX3_EXT0_Tris=OUTPUT;
      TMR3_IO1_MRXSTX3_EXT0_Lat=OFF;
   }
   else if(IO_Num==2) 
   {
      /*TMR4_IO2_MTXSRX3_EXT1_Buff=ANALOG;
      TMR4_IO2_MTXSRX3_EXT1_Tris=INPUT;
      ADC1_Get_Sample(0);// must to do
      ADC_Sampling=((float)ADC1_Get_Sample(0)+(float)ADC1_Get_Sample(0))/2;
      SW_VREFF_Lat=OFF;
      VREFF_Buff=DIGITAL;
      VREFF_Tris=OUTPUT;
      TMR4_IO2_MTXSRX3_EXT1_Buff=DIGITAL;
      TMR4_IO2_MTXSRX3_EXT1_Tris=OUTPUT;
      TMR4_IO2_MTXSRX3_EXT1_Lat=OFF;*/
   }
   VIN=((ADC_Sampling*Vref)/4095);
   return VIN;
}

//***********************************************************
void SendAtCommand(unsigned char *p)
{
      int i=0;
      while(p[i]!=0)
      {
        Uart1_Write(p[i]);
        i++;
      }
}//SendAtCommand
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
//***********************************            R T C C                 ******************************
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************

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

//*****************************************************************************************************
void Set_RTCC_Time(TimeStruct *time_struct)
{
    //exp
    /*time_struct.hh=23;
    time_struct.mn=59;
    time_struct.ss=50;

    time_struct.md=7;
    time_struct.mo=5;
    time_struct.yy=19;
    time_struct.wd=2;

    07/05/19 23:59:50 TUE*/


    RTCCON1Lbits.RTCEN = 0;
    RTCC_WRLOCK_BIT_CLEAR();
    TIMEH = ((time_struct->hh / 10) << 12) | ((time_struct->hh % 10) << 8) | ((time_struct->mn / 10) << 4) | (time_struct->mn % 10);
    TIMEL = ((time_struct->ss / 10) << 12) | ((time_struct->ss % 10) << 8);
    DATEL = ((time_struct->md / 10) << 12) | ((time_struct->md % 10) << 8) | ((time_struct->wd / 10) << 4) | (time_struct->wd % 10);
    DATEH = ((time_struct->yy / 10) << 12) | ((time_struct->yy % 10) << 8) | ((time_struct->mo / 10) << 4) | (time_struct->mo % 10);
    RTCCON1Lbits.RTCEN = 1;
    RTCC_WRLOCK_BIT_SET();
}

//*****************************************************************************************************
void Print_Time_RTCC(void)
{
    char volatile p[4];
    TimeStruct time_struct;
    Get_RTCC_TimeStruct(&time_struct);
    GetDayOfWeekString(time_struct.wd, p);
    PrintOut(PrintHandler, "\r%.2d/%.2d/%.2d %.2d:%.2d:%.2d %s",(int) time_struct.md, (int) time_struct.mo, (int) time_struct.yy, (int) time_struct.hh, (int) time_struct.mn, (int) time_struct.ss, p);
}
//*****************************************************************************************************
void RTCC_Initialize(void)
{
     RTCCON1L.RTCEN = 0;
     RTCC_WRLOCK_BIT_CLEAR();
     
     RTCCON1H = 0x8900;
     RTCCON2L = 0x0001;
     RTCCON2H = 0x3C8B;
     RTCCON3L = 0x0000;
     RTCCON1L = 0x0000;

     RTCCON1H.ALRMEN=OFF;
     RTCC_WRLOCK_BIT_SET();
     RTCC_INT_EN=ON;
     RTCC_INT_FLAG=0;
     RTCCON1L.RTCEN = 1;
}
//*****************************************************************************************************
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
//*****************************************************************************************************
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
//*****************************************************************************************************
void Stop_RTCC(void)
{
   RTCCON1L.RTCEN = 0;
}
//*****************************************************************************************************
void GetDayOfWeekString(char DayNum,char *str)
{
   switch (DayNum)
   {
          case 0  :
                     strcpy(str,"SUN");
          break;
          case 1  :
                     strcpy(str,"MON");
          break;
          case 2  :
                     strcpy(str,"TUE");
          break;
          case 3  :
                     strcpy(str,"WED");
          break;
          case 4  :
                     strcpy(str,"THU");
          break;
          case 5  :
                     strcpy(str,"FRI");
          break;
          case 6  :
                     strcpy(str,"SAT");
          break;
   }
}
//*****************************************************************************************************
void Set_RTCC_Alarm_Time(TimeStruct *time_struct)
{
    RTCCON1L.RTCEN = 0;
    RTCC_WRLOCK_BIT_CLEAR();
    RTCCON1H.ALRMEN=OFF;
    RTCC_INT_EN=OFF;
    RTCC_INT_FLAG=0;
    ALMTIMEH = ((time_struct->hh / 10) << 12) | ((time_struct->hh % 10) << 8) | ((time_struct->mn / 10) << 4) | (time_struct->mn % 10);
    ALMTIMEL = ((time_struct->ss / 10) << 12) | ((time_struct->ss % 10) << 8);
    ALMDATEL = ((time_struct->md / 10) << 12) | ((time_struct->md % 10) << 8) | ((time_struct->wd / 10) << 4) | (time_struct->wd % 10);
    ALMDATEH = ((time_struct->yy / 10) << 12) | ((time_struct->yy % 10) << 8) | ((time_struct->mo / 10) << 4) | (time_struct->mo % 10);
    RTCCON1L.RTCEN = 1;
    RTCC_WRLOCK_BIT_SET();
    RTCCON1H.ALRMEN=ON;
    RTCC_INT_EN=ON;
}
//*****************************************************************************************************
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
//*****************************************************************************************************
 //*****************************************************************************************************
 //************************************* E E P R O M***************************************
 //*****************************************************************************************************
 //*****************************************************************************************************
//***********************************************************
void Init_ExtEeprom(void)
{
   CS_EEPROM_Lat=ON;
   Delay_ms(10);
   CS_EEPROM_Lat=OFF;
   SPI1_Write(0x06);        //opcode write eneble
   CS_EEPROM_Lat=ON;
   while(!CheckIfExtEepromIsReady());
   CS_EEPROM_Lat=OFF;
   SPI1_Write(0x01);        //opcode Write Status Register "WRSR"
   SPI1_Write(0x02);    //WPEN=0;IPL=0;LIP=0;BP1=0;BP0=0;WEL=1;
   CS_EEPROM_Lat=ON;
}
//***********************************************************
char CheckIfExtEepromIsReady(void)
{
   char cTemp;
   CS_EEPROM_Lat=OFF;
   SPI1_Write(0x05);        //opcode Read Status Register "RDSR"
   cTemp=SPI1_Read(0x00);
   CS_EEPROM_Lat=ON;
   if(!(cTemp&0x01)) return 1;
   else return 0;
}
//***********************************************************
void ExtEeprom_WriteByte(unsigned int Address,char DataByte)
{
      while(!CheckIfExtEepromIsReady());
      CS_EEPROM_Lat=OFF;
      SPI1_Write(0x06);        //opcode write eneble
      CS_EEPROM_Lat=ON;
      while(!CheckIfExtEepromIsReady());
      CS_EEPROM_Lat=OFF;
      SPI1_Write(0x02);        //opcode write
      SPI1_Write((Address&0xFF00)>>8);
      SPI1_Write(Address&0x00FF);
      SPI1_Write(DataByte);
      CS_EEPROM_Lat=ON;
      Delay_ms(5);
}
//***********************************************************
char ExtEeprom_ReadByte(unsigned int Address)
{
          char cTemp;
          while(!CheckIfExtEepromIsReady());
          CS_EEPROM_Lat=OFF;
          SPI1_Write(0x03);        //opcode read
          SPI1_Write((Address&0xFF00)>>8);
          SPI1_Write(Address&0x00FF);
          cTemp=SPI1_Read(0x00);
          CS_EEPROM_Lat=ON;
          return cTemp;
}
//***********************************************************
void Delete_ExtEeprom(void)
{
   char i,PageLength=128;
   unsigned long k=0,EepromSize=65536;
   // 64k : PageLength=128   EepromSize=65536
   k=0;
   while(k<EepromSize)
   {
     while(!CheckIfExtEepromIsReady());
     CS_EEPROM_Lat=OFF;
     SPI1_Write(0x06);        //opcode write eneble
     CS_EEPROM_Lat=ON;
     while(!CheckIfExtEepromIsReady());
     CS_EEPROM_Lat=OFF;
     SPI1_Write(0x02);        //opcode write
     SPI1_Write((k&0x0000FF00)>>8);
     SPI1_Write(k&0x000000FF);
     for(i=0;i<PageLength;i++) SPI1_Write(0x00);
     CS_EEPROM_Lat=ON;
     k+=PageLength;
   }
}
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
//***********************************           S L E E P                ******************************
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
//*****************************************************************************************************
void GoToSleepMode(void)
{

    U2MD_bit=1;  //UART2 Module Disable bit
    SPI1MD_bit=1;//SPI1 Module  Disable bit
    AD1MD_bit=1;//A/D Converter Module Disable bit
    MTXSRX1_Tris=OUTPUT;
    MTXSRX1_Lat=OFF;
    MRXSTX1_Tris=OUTPUT;
    MRXSTX1_Lat=OFF;
    MTXSRX2_Tris=OUTPUT;
    MTXSRX2_Lat=OFF;
    MRXSTX2_Tris=OUTPUT;
    MRXSTX2_Lat=OFF;
    PHY_SCK_Tris=OUTPUT;
    PHY_SDI_Tris=OUTPUT;
    PHY_SDO_Tris=OUTPUT;
    PHY_SCK=0;
    PHY_SDI_Lat=0;
    PHY_SDO=0;
    IOCPDB=0xFFFF;
    IOCPDC=0xFFFF;
    IOCPDD=0xFFFF;
    IOCPDE=0xFFFF;
    IOCPDF=0xFFFF;
    IOCPDG=0xFFFF;
    RCON.SWDTEN=OFF;
    OSCCON=0x5500;
    asm { PWRSAV #0 }
}

//*****************************************************************************************************
void WakeUpFromSleepMode(void)
{
    OSCCON=0x3300;
    IOCPDB=0x0000;
    IOCPDC=0x0000;
    IOCPDD=0x0000;
    IOCPDE=0x0000;
    IOCPDF=0x0000;
    IOCPDG=0x0000;
    RCON.SWDTEN=ON;
    MTXSRX2_Tris=OUTPUT;
    MRXSTX2_Tris=INPUT;
    U2MD_bit=0;  //UART2 Module Disable bit
    Uart2_Init(57600);
    SPI1MD_bit=0;//SPI1 Module  Disable bit
    PHY_SCK=0;
    PHY_SCK_Tris=OUTPUT;
    PHY_SCK_PIN=0;
    PHY_SDI=0;
    PHY_SDI_Tris=INPUT;
    PHY_SDO=0;
    PHY_SDO_Tris=OUTPUT;
    PHY_SDO_PIN=0;
    SPI1_Init();
    AD1MD_bit=0;//A/D Converter Module Disable bit
    ADC1_Init_Advanced(_ADC_12bit, _ADC_EXTERNAL_VREFH | _ADC_INTERNAL_VREFL);
    AD1CON3=0x0503;
    Delay_ms(1);
}
//*****************************************************************************************************
void SPI1_Initialize_MCP (void)
{
   SPI1CON1H = 0x0000;
   SPI1CON2L = 0x0000;
   SPI1STATL = 0x0000;
   SPI1BRGL = 0x0001;  //4 MHz
   //SPI1BRGL = 0x0002;  //2.66666667 MHz
   //SPI1BRGL = 0x0003;  //2Mhz
   SPI1IMSKL = 0x0000;
   SPI1IMSKH = 0x0000;
   SPI1URDTL = 0x0000;
   SPI1URDTH = 0x0000;
   SPI1CON1L = 0x8121;   //mode 0 8 bit
}
//*****************************************************************************************************
void Battery_Power_Boost_Activation(char mode)
{
   if(mode) EN_BATTERY_BYPASS_Lat=ON;
   else EN_BATTERY_BYPASS_Lat=OFF;
}
//*****************************************************************************************************
void CheckAndSwitchToBattery(void)
{
   //run time=120usec
    float ADC_Sampling,VIN;
    VREFF_Buff=ANALOG;
    VREFF_Tris=INPUT;
    SW_VREFF_Lat=ON;
    PIN_12V_VOLTAGE_SAMPLE_Buff=ANALOG;
    PIN_12V_VOLTAGE_SAMPLE_Tris=INPUT;
    SW_12V_VOLTAGE_Lat=ON;
    ADC1_Get_Sample(13);// must to do
    ADC_Sampling=((float)ADC1_Get_Sample(13)+(float)ADC1_Get_Sample(13))/2;
    VIN=((ADC_Sampling*Vref)/4095)*VIN_ResistorsFactor;
    if((VIN<=4.5)&&(EN_BATTERY_BYPASS_Port==OFF)){Battery_Power_Boost_Activation(ON);}
    else if ((VIN>4.5)&&(EN_BATTERY_BYPASS_Port==ON)) {Battery_Power_Boost_Activation(OFF);}
}
//*****************************************************************************************************
//*****************************************************************************************************
void Pseudo_Uart1_Write_Byte(char din)
{
  // bps 115200;  system clock 32Mhz
  char i;
  MTXSRX1_Lat=0;       //Start Bit
  Delay_us(8);
  for(i=0;i<8;i++)
  {
     MTXSRX1_Lat=din&0x01; //   this take 17us (all the loop) Approx
     din>>=1;
     Delay_us(8);
  }
  MTXSRX1_Lat=1;       //Stop Bit
  Delay_us(8);
}
//*****************************************************************************************************
void Pseudo_Uart1_Write_Text(unsigned char *p)
{
      int i=0;
      while(p[i]!=0) Pseudo_Uart1_Write_Byte(p[i++]);
}
//*****************************************************************************************************
void Pseudo_Uart1_Enable(char mode)
{
   MTXSRX1_Lat=0;
   MTXSRX1_Tris=OUTPUT;

   MRXSTX1_Lat=0;
   MRXSTX1_Tris=INPUT;
   switch (mode)
   {
          case 1  :
                U1MD_bit=1;   //Disable
                Delay_ms(10);
          break;
          case 0  :
                U1MD_bit=0;  //Enable
                Uart1_Init(2000000);
                Delay_ms(100);
          break;

   }
}
//*****************************************************************************************************
void CheckRxDataFromInterruptUart2(void)
{
      int i=0;
      if(Uart2_Rx_Int_Flag)
      {
         PrintOut(PrintHandler,"\rUart2 Intterupt Buffer:%s",UART2_RX_Interrupt_Buffer);
         U2STAbits.OERR=0;
         Uart2_Rx_Int_Flag=0;
         Uart2_RX_Int_En=1;
      }
}
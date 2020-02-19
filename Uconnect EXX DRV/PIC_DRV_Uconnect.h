#include "timelib.h"
#include "Config_File.h"
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
#define     UART2_RX_Buffer_Length              200

#define     Uart2_Rx_Int_Flag                   IFS1bits.U2RXIF
#define     Uart2_RX_Int_En                     IEC1bits.U2RXIE


#define     ESP_RX_Int_Flag                     IFS0bits.U1RXIF
#define     ESP_RX_Int_En                       IEC0bits.U1RXIE

#define RTCC_INT_FLAG                           IFS3.RTCIF
#define RTCC_INT_EN                             IEC3.RTCIE

#define SC16IS740_INT_FLAG                      IFS0.INT0IF
#define SC16IS740_INT_EN                        IEC0.INT0IE


#define NULL   0
#define OFF    0
#define ON     1
#define TRUE   1
#define FALSE  0
#define INPUT   1
#define OUTPUT  0
#define ANALOG   1
#define DIGITAL  0
#define HIGH    1
#define LOW     0

#define   Vref                                                           2.048
#define   Vbatt_ResistorsFactor                                          1.499       //R1=49.9K;R2=100K
#define   VUSB_ResistorsFactor                                           5.99        //R1=49.9K;R2=10K
#define   VIN_ResistorsFactor                                            16.03012048 //R1=49.9K;R2=3.32K

#define   ResistorsShunt_4To20mA                                         100

// PIN 1
#define RST_MIKROBUS_MRXSTX5_Lat                     LATE.RE5
#define RST_MIKROBUS_MRXSTX5_Tris                    TRISE.RE5
// PIN 2
#define SW_LIGHT_SENSOR_Lat                          LATE.RE6
#define SW_LIGHT_SENSOR_Tris                         TRISE.RE6
// PIN 3
#define SW_PRE_STEP_UP_MIKROBUS_Lat                  LATE.RE7
#define SW_PRE_STEP_UP_MIKROBUS_Tris                 TRISE.RE7
// PIN 4
#define EN_STEP_UP_MIKROEBUS_Lat                     LATG.RG6
#define EN_STEP_UP_MIKROEBUS_Buff                    ANSG.RG6
#define EN_STEP_UP_MIKROEBUS_Tris                    TRISG.RG6
// PIN 5
#define RTC_INT_Lat                                  LATG.RG7
#define RTC_INT_Port                                 PORTG.RG7
#define RTC_INT_Buff                                 ANSG.RG7
#define RTC_INT_Tris                                 TRISG.RG7
// PIN 6
#define RG8_Lat                                      LATG.RG8
#define RG8_Buff                                     ANSG.RG8
#define RG8_Tris                                     TRISG.RG8
// PIN 7 - MCLR
// PIN 8
#define EN_STEP_UP_TERMINAL_Lat                      LATG.RG9
#define EN_STEP_UP_TERMINAL_Buff                     ANSG.RG9
#define EN_STEP_UP_TERMINAL_Tris                     TRISG.RG9
// PIN 9 - VSS
// PIN 10 - VDD
// PIN 11
#define AN_MIKROBUS_MTXSRX5_Lat                      LATB.RB5
#define AN_MIKROBUS_MTXSRX5_Buff                     ANSB.RB5
#define AN_MIKROBUS_MTXSRX5_Tris                     TRISB.RB5
#define AN_MIKROBUS_MTXSRX5_Port                     PORTB.RB5
// PIN 12
#define CR123_VOLTAGE_SAMPLE_Lat                     LATB.RB4
#define CR123_VOLTAGE_SAMPLE_Buff                    ANSB.RB4
#define CR123_VOLTAGE_SAMPLE_Tris                    TRISB.RB4
// PIN 13
#define SHD_Lat                                      LATB.RB3
#define SHD_Buff                                     ANSB.RB3
#define SHD_Tris                                     TRISB.RB3
#define SHD_Port                                     PORTB.RB3
// PIN 14
#define LIGHT_SENSOR_SAMPLE_Lat                      LATB.RB2
#define LIGHT_SENSOR_SAMPLE_Buff                     ANSB.RB2
#define LIGHT_SENSOR_SAMPLE_Tris                     TRISB.RB2
// PIN 15
#define TMR3_IO1_MRXSTX3_EXT0_Lat                    LATB.RB1
#define TMR3_IO1_MRXSTX3_EXT0_Buff                   ANSB.RB1
#define TMR3_IO1_MRXSTX3_EXT0_Port                   PORTB.RB1
#define TMR3_IO1_MRXSTX3_EXT0_Tris                   TRISB.RB1
// PIN 16
#define VREFF_Lat                                 LATB.RB0
#define VREFF_Buff                                ANSB.RB0
#define VREFF_Tris                                TRISB.RB0
#define VREFF_Port                                PORTB.RB0
//#define TMR4_IO2_MTXSRX3_EXT1_Lat                    LATB.RB0
//#define TMR4_IO2_MTXSRX3_EXT1_Buff                   ANSB.RB0
//#define TMR4_IO2_MTXSRX3_EXT1_Tris                   TRISB.RB0
//#define TMR4_IO2_MTXSRX3_EXT1_Port                   PORTB.RB0
// PIN 17
#define PGC_Lat                                      LATB.RB6
#define PGC_Buff                                     ANSB.RB6
#define PGC_Tris                                     TRISB.RB6
// PIN 18
#define PGD_Lat                                      LATB.RB7
#define PGD_Buff                                     ANSB.RB7
#define PGD_Tris                                     TRISB.RB7
// PIN 19 - AVDD
// PIN 20 - AVSS
// PIN 21
#define SW_PRE_STEP_UP_TERMINAL_Lat                  LATB.RB8
#define SW_PRE_STEP_UP_TERMINAL_Buff                 ANSB.RB8
#define SW_PRE_STEP_UP_TERMINAL_Tris                 TRISB.RB8
// PIN 22
#define TEMP_AN_SAMPLE_Lat                           LATB.RB9
#define TEMP_AN_SAMPLE_Buff                          ANSB.RB9
#define TEMP_AN_SAMPLE_Tris                          TRISB.RB9
// PIN 23
#define SW_URF_POWER_Lat                             LATB.RB10
#define SW_URF_POWER_Buff                            ANSB.RB10
#define SW_URF_POWER_Tris                            TRISB.RB10
// PIN 24
#define USB_VOLTAGE_SAMPLE_Lat                       LATB.RB11
#define USB_VOLTAGE_SAMPLE_Buff                      ANSB.RB11
#define USB_VOLTAGE_SAMPLE_Tris                      TRISB.RB11
// PIN 25 - VSS
// PIN 26 - VDD
// PIN 27
#define EN_BATTERY_BYPASS_Lat                        LATB.RB12
#define EN_BATTERY_BYPASS_Port                       PORTB.RB12
#define EN_BATTERY_BYPASS_Buff                       ANSB.RB12
#define EN_BATTERY_BYPASS_Tris                       TRISB.RB12
// PIN 28
#define PIN_12V_VOLTAGE_SAMPLE_Lat                   LATB.RB13
#define PIN_12V_VOLTAGE_SAMPLE_Buff                  ANSB.RB13
#define PIN_12V_VOLTAGE_SAMPLE_Tris                  TRISB.RB13
// PIN 29
#define LED_RED_Lat                                  LATB.RB14
#define LED_RED_Buff                                 ANSB.RB14
#define LED_RED_Tris                                 TRISB.RB14
// PIN 30
#define LED_GREEN_Lat                                LATB.RB15
#define LED_GREEN_Buff                               ANSB.RB15
#define LED_GREEN_Tris                               TRISB.RB15
// PIN 31
#define CS_MIKROBUS_PWM7_Lat                         LATF.RF4
#define CS_MIKROBUS_PWM7_Tris                        TRISF.RF4
//pin 32
#define PHY_SCK                                      LATF.RF5
#define PHY_SCK_Tris                                 TRISF.RF5
#define PHY_SCK_PIN                                  LATF.RF5
//pin 33

#define PHY_SDI_Lat                                  LATF.RF3
#define PHY_SDI                                      PORTF.RF3
#define PHY_SDI_Tris                                 TRISF.RF3
//pin 34
#define PHY_SDO                                      LATF.RF2
#define PHY_SDO_Tris                                 TRISF.RF2
#define PHY_SDO_PIN                                  LATF.RF2
// PIN 35
#define INT_MIKROBUS_Lat                             LATF.RF6
#define INT_MIKROBUS_Port                            PORTF.RF6
#define INT_MIKROBUS_Tris                            TRISF.RF6
// PIN 36
#define SDA_Lat                                      LATG.RG3
#define SDA_Port                                     PORTG.RG3
#define SDA_Tris                                     TRISG.RG3
// PIN 37
#define SCL_Lat                                      LATG.RG2
#define SCL_Tris                                     TRISG.RG2
// PIN 38 - VDD
// PIN 39 - OSCI
// PIN 40 - OSCO
// PIN 41 - VSS
// PIN 42
#define nIRQ_PIN                                     PORTD.RD8
#define nIRQ_Tris                                    TRISD.RD8
// PIN 43
#define PWM_MIKROBUS_Lat                             LATD.RD9
#define PWM_MIKROBUS_Port                            PORTD.RD9
#define PWM_MIKROBUS_Tris                            TRISD.RD9
// PIN 44
#define MTXSRX2_Lat                                  LATD.RD10
#define MTXSRX2_Tris                                 TRISD.RD10
// PIN 45
#define MRXSTX2_Lat                                  LATD.RD11
#define MRXSTX2_Tris                                 TRISD.RD11
// PIN 46
#define RD0_Lat                                      LATD.RD0
#define RDO_Tris                                     TRISD.RD0
//PIN 47
#define RC13_Lat                                     LATC.RC13
#define RC13_Buff                                    ANSC.RC13
#define RC13_Tris                                    TRISC.RC13
// PIN 48
#define RC14_Lat                                     LATC.RC14
#define RC14_Buff                                    ANSC.RC14
#define RC14_Tris                                    TRISC.RC14

// PIN 49
#define POWER_TEMP_AN_Lat                            LATD.RD1
#define POWER_TEMP_AN_Tris                           TRISD.RD1
// PIN 50
#define SW_USB_VOLTAGE_Lat                           LATD.RD2
#define SW_USB_VOLTAGE_Tris                          TRISD.RD2
// PIN 51
#define SW_VREFF_Lat                                 LATD.RD3
#define SW_VREFF_Tris                                TRISD.RD3
// PIN 52
#define MTXSRX1_Lat                                  LATD.RD4
#define MTXSRX1_Tris                                 TRISD.RD4
// PIN 53
#define MRXSTX1_Lat                                  LATD.RD5
#define MRXSTX1_Tris                                 TRISD.RD5
// PIN 54
#define SW_12V_VOLTAGE_Lat                           LATD.RD6
#define SW_12V_VOLTAGE_Buff                          ANSD.RD6
#define SW_12V_VOLTAGE_Tris                          TRISD.RD6
// PIN 55
#define CS_EEPROM_Lat                                LATD.RD7
#define CS_EEPROM_Buff                               ANSD.RD7
#define CS_EEPROM_Tris                               TRISD.RD7
// PIN 56 - VCAP
// PIN 57 - N/C
// PIN 58
#define SW_CR123_VOLTAGE_Lat                         LATF.RF0
#define SW_CR123_VOLTAGE_Tris                        TRISF.RF0
// PIN 59
#define nSDN                                         LATF.RF1
#define nSDN_Tris                                    TRISF.RF1
// PIN 60
#define SW_VOC_Lat                                   LATE.RE0
#define SW_VOC_Tris                                  TRISE.RE0
// PIN 61
#define nSEL                                         LATE.RE1
#define nSEL_Tris                                    TRISE.RE1
// PIN 62
#define RE2_Lat                                      LATE.RE2
#define RE2_Tris                                     TRISE.RE2
// PIN 63
#define RE3_Lat                                      LATE.RE3
#define RE3_Tris                                     TRISE.RE3
// PIN 64
#define RE4_Lat                                      LATE.RE4
#define RE4_Buff                                     ANSE.RE4
#define RE4_Tris                                     TRISE.RE4
void PrintRealTime(unsigned int TimeInSec);
void Pseudo_Uart2_Write_Byte(char din);
void Pseudo_Uart2_Write_Text(unsigned char *p);
void Pseudo_Uart2_Enable(char mode);
int GetSampleFromUart(void);
void InitUartForRxData(void);
void Get60SamplesFromUart(void);
void PrintOpticDataToUart(char mode);
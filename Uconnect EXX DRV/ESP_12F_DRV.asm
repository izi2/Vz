
_Init_ESP:

;ESP_12F_DRV.c,24 :: 		char Init_ESP(void)
;ESP_12F_DRV.c,26 :: 		PrintOut(PrintHandler, "\rInit ESP(WIFI)...");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_1_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,27 :: 		Read_Write_MCP23S17_IO(ESP_EN_PIN, OFF);
	CLR	W11
	MOV.B	#10, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,28 :: 		Read_Write_MCP23S17_IO(ESP_FLASH, ON);
	MOV.B	#1, W11
	MOV.B	#12, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,29 :: 		Delay_ms(300);
	MOV	#25, W8
	MOV	#27143, W7
L_Init_ESP0:
	DEC	W7
	BRA NZ	L_Init_ESP0
	DEC	W8
	BRA NZ	L_Init_ESP0
;ESP_12F_DRV.c,30 :: 		Read_Write_MCP23S17_IO(ESP_EN_PIN, ON);
	MOV.B	#1, W11
	MOV.B	#10, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,31 :: 		Read_Write_MCP23S17_IO(ESP_RESET, OFF);
	CLR	W11
	MOV.B	#11, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,32 :: 		Delay_ms(200);
	MOV	#17, W8
	MOV	#18095, W7
L_Init_ESP2:
	DEC	W7
	BRA NZ	L_Init_ESP2
	DEC	W8
	BRA NZ	L_Init_ESP2
;ESP_12F_DRV.c,33 :: 		Read_Write_MCP23S17_IO(ESP_RESET, ON);
	MOV.B	#1, W11
	MOV.B	#11, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,34 :: 		Delay_ms(2000);
	MOV	#163, W8
	MOV	#49887, W7
L_Init_ESP4:
	DEC	W7
	BRA NZ	L_Init_ESP4
	DEC	W8
	BRA NZ	L_Init_ESP4
	NOP
	NOP
;ESP_12F_DRV.c,35 :: 		Pseudo_Uart1_Enable(ON);
	MOV.B	#1, W10
	CALL	_Pseudo_Uart1_Enable
;ESP_12F_DRV.c,36 :: 		Pseudo_Uart1_Write_Text("ATE0\r\n");
	MOV	#lo_addr(?lstr2_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,37 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP6:
	DEC	W7
	BRA NZ	L_Init_ESP6
	NOP
	NOP
;ESP_12F_DRV.c,38 :: 		Pseudo_Uart1_Write_Text("ATE0\r\n");
	MOV	#lo_addr(?lstr3_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,39 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP8:
	DEC	W7
	BRA NZ	L_Init_ESP8
	NOP
	NOP
;ESP_12F_DRV.c,40 :: 		Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
	MOV	#lo_addr(?lstr4_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,41 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP10:
	DEC	W7
	BRA NZ	L_Init_ESP10
	NOP
	NOP
;ESP_12F_DRV.c,42 :: 		Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
	MOV	#lo_addr(?lstr5_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,43 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP12:
	DEC	W7
	BRA NZ	L_Init_ESP12
	NOP
	NOP
;ESP_12F_DRV.c,44 :: 		Pseudo_Uart1_Enable(OFF);
	CLR	W10
	CALL	_Pseudo_Uart1_Enable
;ESP_12F_DRV.c,45 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr6_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,46 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,47 :: 		SendAtCommandToEsp("AT+CIPDINFO=0\r\n");
	MOV	#lo_addr(?lstr7_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,48 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,49 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr8_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,50 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,51 :: 		if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
	MOV	#lo_addr(?lstr9_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__Init_ESP124
	GOTO	L_Init_ESP14
L__Init_ESP124:
	GOTO	___Init_ESP_EspInit_OK
L_Init_ESP14:
;ESP_12F_DRV.c,52 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr10_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,53 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,54 :: 		if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
	MOV	#lo_addr(?lstr11_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__Init_ESP125
	GOTO	L_Init_ESP15
L__Init_ESP125:
	GOTO	___Init_ESP_EspInit_OK
L_Init_ESP15:
;ESP_12F_DRV.c,55 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr12_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,56 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,57 :: 		if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
	MOV	#lo_addr(?lstr13_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__Init_ESP126
	GOTO	L_Init_ESP16
L__Init_ESP126:
	GOTO	___Init_ESP_EspInit_OK
L_Init_ESP16:
;ESP_12F_DRV.c,58 :: 		PrintOut(PrintHandler, "\rFailed To Init ESP!!!");
	MOV	#lo_addr(?lstr_14_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,59 :: 		return 0;
	CLR	W0
	GOTO	L_end_Init_ESP
;ESP_12F_DRV.c,61 :: 		EspInit_OK:
___Init_ESP_EspInit_OK:
;ESP_12F_DRV.c,62 :: 		PrintOut(PrintHandler, "\rESP successfully initialized");
	MOV	#lo_addr(?lstr_15_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,63 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,64 :: 		}
;ESP_12F_DRV.c,63 :: 		return 1;
;ESP_12F_DRV.c,64 :: 		}
L_end_Init_ESP:
	POP	W11
	POP	W10
	RETURN
; end of _Init_ESP

_ConnectToServer:

;ESP_12F_DRV.c,66 :: 		char ConnectToServer(void)
;ESP_12F_DRV.c,68 :: 		SendAtCommandToEsp(Server_IP_String);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr16_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,69 :: 		GetEspData(5000000);
	MOV	#19264, W10
	MOV	#76, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,70 :: 		if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
	MOV	#lo_addr(?lstr17_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__ConnectToServer128
	GOTO	L_ConnectToServer17
L__ConnectToServer128:
	MOV.B	#1, W0
	GOTO	L_end_ConnectToServer
L_ConnectToServer17:
;ESP_12F_DRV.c,74 :: 		SendAtCommandToEsp(Server_IP_String);
	MOV	#lo_addr(?lstr18_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,75 :: 		GetEspData(5000000);
	MOV	#19264, W10
	MOV	#76, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,76 :: 		if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
	MOV	#lo_addr(?lstr19_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__ConnectToServer129
	GOTO	L_ConnectToServer18
L__ConnectToServer129:
	MOV.B	#1, W0
	GOTO	L_end_ConnectToServer
L_ConnectToServer18:
;ESP_12F_DRV.c,80 :: 		return 0;
	CLR	W0
;ESP_12F_DRV.c,81 :: 		}
;ESP_12F_DRV.c,80 :: 		return 0;
;ESP_12F_DRV.c,81 :: 		}
L_end_ConnectToServer:
	POP	W11
	POP	W10
	RETURN
; end of _ConnectToServer

_CheckGettingIP:

;ESP_12F_DRV.c,83 :: 		char CheckGettingIP(void)
;ESP_12F_DRV.c,85 :: 		PrintOut(PrintHandler, ".");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_20_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,86 :: 		SendAtCommandToEsp("AT+CIPSTATUS\r\n");
	MOV	#lo_addr(?lstr21_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,87 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,88 :: 		if(strstr(ESP_RX_Buffer,"S:2")) return 1;
	MOV	#lo_addr(?lstr22_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__CheckGettingIP131
	GOTO	L_CheckGettingIP19
L__CheckGettingIP131:
	MOV.B	#1, W0
	GOTO	L_end_CheckGettingIP
L_CheckGettingIP19:
;ESP_12F_DRV.c,89 :: 		else return 0;
	CLR	W0
;ESP_12F_DRV.c,90 :: 		}
;ESP_12F_DRV.c,89 :: 		else return 0;
;ESP_12F_DRV.c,90 :: 		}
L_end_CheckGettingIP:
	POP	W11
	POP	W10
	RETURN
; end of _CheckGettingIP

_CheckWifiConnection:

;ESP_12F_DRV.c,92 :: 		char CheckWifiConnection(void)
;ESP_12F_DRV.c,95 :: 		SendAtCommandToEsp("AT+CIPSTATUS\r\n");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr23_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,96 :: 		if(GetEspData(1000)==2) return 1;
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
	CP.B	W0, #2
	BRA Z	L__CheckWifiConnection133
	GOTO	L_CheckWifiConnection21
L__CheckWifiConnection133:
	MOV.B	#1, W0
	GOTO	L_end_CheckWifiConnection
L_CheckWifiConnection21:
;ESP_12F_DRV.c,97 :: 		if(strstr(ESP_RX_Buffer,"S:3")) return 1;
	MOV	#lo_addr(?lstr24_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__CheckWifiConnection134
	GOTO	L_CheckWifiConnection22
L__CheckWifiConnection134:
	MOV.B	#1, W0
	GOTO	L_end_CheckWifiConnection
L_CheckWifiConnection22:
;ESP_12F_DRV.c,98 :: 		else return 0;
	CLR	W0
;ESP_12F_DRV.c,99 :: 		}
;ESP_12F_DRV.c,98 :: 		else return 0;
;ESP_12F_DRV.c,99 :: 		}
L_end_CheckWifiConnection:
	POP	W11
	POP	W10
	RETURN
; end of _CheckWifiConnection

_ConnectingToWifiNet:
	LNK	#4

;ESP_12F_DRV.c,101 :: 		char ConnectingToWifiNet(void)
;ESP_12F_DRV.c,103 :: 		int i=0;
	PUSH	W10
	PUSH	W11
;ESP_12F_DRV.c,106 :: 		unsigned long ulTemp=0;
	MOV	#0, W0
	MOV	W0, [W14+0]
	MOV	#0, W0
	MOV	W0, [W14+2]
;ESP_12F_DRV.c,107 :: 		asm clrwdt;
	CLRWDT
;ESP_12F_DRV.c,108 :: 		PrintOut(PrintHandler, "\rWifi Connection Process...");
	MOV	#lo_addr(?lstr_25_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,109 :: 		SendAtCommandToEsp("AT+CWMODE=1\r\n");
	MOV	#lo_addr(?lstr26_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,110 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,111 :: 		SendAtCommandToEsp("AT+CIPMUX=0\r\n");
	MOV	#lo_addr(?lstr27_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,112 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,113 :: 		PrintOut(PrintHandler, "\rWaiting For IP...");
	MOV	#lo_addr(?lstr_28_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,114 :: 		SendAtCommandToEsp(SSID_String);
	MOV	#lo_addr(?lstr29_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,115 :: 		while(ulTemp++<8000)
L_ConnectingToWifiNet24:
	MOV	[W14+0], W3
	MOV	[W14+2], W4
	MOV	[W14+0], W1
	MOV	[W14+2], W2
	ADD	W14, #0, W0
	ADD	W1, #1, [W0++]
	ADDC	W2, #0, [W0--]
	MOV	#8000, W0
	MOV	#0, W1
	CP	W3, W0
	CPB	W4, W1
	BRA LTU	L__ConnectingToWifiNet136
	GOTO	L_ConnectingToWifiNet25
L__ConnectingToWifiNet136:
;ESP_12F_DRV.c,117 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,118 :: 		if(strstr(ESP_RX_Buffer,"GOT IP")) break;
	MOV	#lo_addr(?lstr30_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__ConnectingToWifiNet137
	GOTO	L_ConnectingToWifiNet26
L__ConnectingToWifiNet137:
	GOTO	L_ConnectingToWifiNet25
L_ConnectingToWifiNet26:
;ESP_12F_DRV.c,119 :: 		}
	GOTO	L_ConnectingToWifiNet24
L_ConnectingToWifiNet25:
;ESP_12F_DRV.c,120 :: 		if(ulTemp>=8000) {PrintOut(PrintHandler, "\rFailed To Get IP"); return 0;}
	MOV	#8000, W1
	MOV	#0, W2
	ADD	W14, #0, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA LEU	L__ConnectingToWifiNet138
	GOTO	L_ConnectingToWifiNet27
L__ConnectingToWifiNet138:
	MOV	#lo_addr(?lstr_31_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	CLR	W0
	GOTO	L_end_ConnectingToWifiNet
L_ConnectingToWifiNet27:
;ESP_12F_DRV.c,121 :: 		PrintOut(PrintHandler, "\rGeting IP Address Successfully");
	MOV	#lo_addr(?lstr_32_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,122 :: 		delay_ms(2000);
	MOV	#163, W8
	MOV	#49887, W7
L_ConnectingToWifiNet28:
	DEC	W7
	BRA NZ	L_ConnectingToWifiNet28
	DEC	W8
	BRA NZ	L_ConnectingToWifiNet28
	NOP
	NOP
;ESP_12F_DRV.c,124 :: 		SendAtCommandToEsp("AT+CWJAP?\r\n");
	MOV	#lo_addr(?lstr33_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,125 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,126 :: 		PrintOut(PrintHandler,"\rRSSI:%s",ESP_RX_Buffer);
	MOV	#lo_addr(_ESP_RX_Buffer), W0
	PUSH	W0
	MOV	#lo_addr(?lstr_34_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;ESP_12F_DRV.c,127 :: 		PrintOut(PrintHandler, "\rConnecting To Server...");
	MOV	#lo_addr(?lstr_35_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,128 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ConnectingToWifiNet139
	GOTO	L_ConnectingToWifiNet30
L__ConnectingToWifiNet139:
;ESP_12F_DRV.c,130 :: 		if(!ConnectToServer()) return 0;
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ConnectingToWifiNet140
	GOTO	L_ConnectingToWifiNet31
L__ConnectingToWifiNet140:
	CLR	W0
	GOTO	L_end_ConnectingToWifiNet
L_ConnectingToWifiNet31:
;ESP_12F_DRV.c,131 :: 		}
L_ConnectingToWifiNet30:
;ESP_12F_DRV.c,132 :: 		PrintOut(PrintHandler, "\rConnected To Server Successfully");
	MOV	#lo_addr(?lstr_36_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,133 :: 		LED_Activation(LED_RED,LED_ON);
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
;ESP_12F_DRV.c,134 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,135 :: 		}
;ESP_12F_DRV.c,134 :: 		return 1;
;ESP_12F_DRV.c,135 :: 		}
L_end_ConnectingToWifiNet:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _ConnectingToWifiNet

_SendAtCommandToEsp:

;ESP_12F_DRV.c,137 :: 		void SendAtCommandToEsp(char *buff)
;ESP_12F_DRV.c,139 :: 		unsigned int i=0;
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
;ESP_12F_DRV.c,143 :: 		while(buff[i]!=0)
L_SendAtCommandToEsp32:
; i start address is: 2 (W1)
	ADD	W10, W1, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__SendAtCommandToEsp142
	GOTO	L_SendAtCommandToEsp33
L__SendAtCommandToEsp142:
;ESP_12F_DRV.c,145 :: 		Uart1_Write(buff[i]);
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;ESP_12F_DRV.c,146 :: 		i++;
	INC	W1
;ESP_12F_DRV.c,147 :: 		}
; i end address is: 2 (W1)
	GOTO	L_SendAtCommandToEsp32
L_SendAtCommandToEsp33:
;ESP_12F_DRV.c,148 :: 		}
L_end_SendAtCommandToEsp:
	RETURN
; end of _SendAtCommandToEsp

_WIFI_Send_One_Array:
	LNK	#102

;ESP_12F_DRV.c,150 :: 		char WIFI_Send_One_Array(char *m_data,  unsigned int len)
;ESP_12F_DRV.c,152 :: 		char cmd[100],cTemp=0;
	MOV	#0, W0
	MOV.B	W0, [W14+100]
;ESP_12F_DRV.c,154 :: 		SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr37_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,155 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
	POP.D	W10
;ESP_12F_DRV.c,156 :: 		sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
	ADD	W14, #0, W1
	PUSH.D	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_38_ESP_12F_DRV), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP.D	W10
;ESP_12F_DRV.c,157 :: 		SendAtCommandToEsp(cmd);
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,158 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,159 :: 		if(!strstr(ESP_RX_Buffer,">")) return 0;
	MOV	#lo_addr(?lstr39_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA Z	L__WIFI_Send_One_Array144
	GOTO	L_WIFI_Send_One_Array34
L__WIFI_Send_One_Array144:
	CLR	W0
	GOTO	L_end_WIFI_Send_One_Array
L_WIFI_Send_One_Array34:
;ESP_12F_DRV.c,160 :: 		for(i=0;i<len;i++) Uart1_Write(m_data[i]);
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_WIFI_Send_One_Array35:
; i start address is: 2 (W1)
	CP	W1, W11
	BRA LTU	L__WIFI_Send_One_Array145
	GOTO	L_WIFI_Send_One_Array36
L__WIFI_Send_One_Array145:
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
; i start address is: 4 (W2)
	ADD	W1, #1, W2
; i end address is: 2 (W1)
	MOV	W2, W1
; i end address is: 4 (W2)
	GOTO	L_WIFI_Send_One_Array35
L_WIFI_Send_One_Array36:
;ESP_12F_DRV.c,161 :: 		SCL_Lat=1;
	BSET.B	LATG, #2
;ESP_12F_DRV.c,162 :: 		while(cTemp++<10)
L_WIFI_Send_One_Array38:
	MOV.B	[W14+100], W2
	MOV.B	[W14+100], W1
	MOV	#100, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
	CP.B	W2, #10
	BRA LTU	L__WIFI_Send_One_Array146
	GOTO	L_WIFI_Send_One_Array39
L__WIFI_Send_One_Array146:
;ESP_12F_DRV.c,164 :: 		GetEspData(10000);
	PUSH.D	W10
	MOV	#10000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,165 :: 		if(strstr(ESP_RX_Buffer,"OK")) break;
	MOV	#lo_addr(?lstr40_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA NZ	L__WIFI_Send_One_Array147
	GOTO	L_WIFI_Send_One_Array40
L__WIFI_Send_One_Array147:
	GOTO	L_WIFI_Send_One_Array39
L_WIFI_Send_One_Array40:
;ESP_12F_DRV.c,166 :: 		}
	GOTO	L_WIFI_Send_One_Array38
L_WIFI_Send_One_Array39:
;ESP_12F_DRV.c,167 :: 		if(cTemp>=10) return 0;
	MOV.B	[W14+100], W0
	CP.B	W0, #10
	BRA GEU	L__WIFI_Send_One_Array148
	GOTO	L_WIFI_Send_One_Array41
L__WIFI_Send_One_Array148:
	CLR	W0
	GOTO	L_end_WIFI_Send_One_Array
L_WIFI_Send_One_Array41:
;ESP_12F_DRV.c,168 :: 		SCL_Lat=0;
	BCLR.B	LATG, #2
;ESP_12F_DRV.c,169 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,171 :: 		}
L_end_WIFI_Send_One_Array:
	ULNK
	RETURN
; end of _WIFI_Send_One_Array

_WIFI_Send_One_Array_Not_Wait_To_OK:
	LNK	#100

;ESP_12F_DRV.c,173 :: 		char WIFI_Send_One_Array_Not_Wait_To_OK(char *m_data,  unsigned int len)
;ESP_12F_DRV.c,178 :: 		SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr41_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,179 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
	POP.D	W10
;ESP_12F_DRV.c,180 :: 		sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
	ADD	W14, #0, W1
	PUSH.D	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_42_ESP_12F_DRV), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP.D	W10
;ESP_12F_DRV.c,181 :: 		SendAtCommandToEsp(cmd);
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,182 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,183 :: 		if(!strstr(ESP_RX_Buffer,">")) return 0;
	MOV	#lo_addr(?lstr43_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA Z	L__WIFI_Send_One_Array_Not_Wait_To_OK150
	GOTO	L_WIFI_Send_One_Array_Not_Wait_To_OK42
L__WIFI_Send_One_Array_Not_Wait_To_OK150:
	CLR	W0
	GOTO	L_end_WIFI_Send_One_Array_Not_Wait_To_OK
L_WIFI_Send_One_Array_Not_Wait_To_OK42:
;ESP_12F_DRV.c,184 :: 		for(i=0;i<len;i++) Uart1_Write(m_data[i]);
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_WIFI_Send_One_Array_Not_Wait_To_OK43:
; i start address is: 2 (W1)
	CP	W1, W11
	BRA LTU	L__WIFI_Send_One_Array_Not_Wait_To_OK151
	GOTO	L_WIFI_Send_One_Array_Not_Wait_To_OK44
L__WIFI_Send_One_Array_Not_Wait_To_OK151:
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
	INC	W1
; i end address is: 2 (W1)
	GOTO	L_WIFI_Send_One_Array_Not_Wait_To_OK43
L_WIFI_Send_One_Array_Not_Wait_To_OK44:
;ESP_12F_DRV.c,185 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,186 :: 		}
L_end_WIFI_Send_One_Array_Not_Wait_To_OK:
	ULNK
	RETURN
; end of _WIFI_Send_One_Array_Not_Wait_To_OK

_ESP_Testing_Func:
	LNK	#2048

;ESP_12F_DRV.c,188 :: 		void ESP_Testing_Func(void)
;ESP_12F_DRV.c,191 :: 		unsigned int BufferLength=140,i,NumOfTx=5;
	PUSH	W10
	PUSH	W11
; BufferLength start address is: 2 (W1)
	MOV	#140, W1
; NumOfTx start address is: 4 (W2)
	MOV	#5, W2
;ESP_12F_DRV.c,193 :: 		PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
	MOV	#lo_addr(?lstr_44_ESP_12F_DRV), W0
	PUSH	W2
	PUSH	W1
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	POP	W1
	POP	W2
;ESP_12F_DRV.c,194 :: 		for(i=0;i<BufferLength;i++) buffer[i]=0xAA;
; i start address is: 0 (W0)
	CLR	W0
; BufferLength end address is: 2 (W1)
; NumOfTx end address is: 4 (W2)
; i end address is: 0 (W0)
	MOV	W1, W4
	MOV	W2, W5
	MOV	W0, W2
L_ESP_Testing_Func46:
; i start address is: 4 (W2)
; NumOfTx start address is: 10 (W5)
; BufferLength start address is: 8 (W4)
	CP	W2, W4
	BRA LTU	L__ESP_Testing_Func153
	GOTO	L_ESP_Testing_Func47
L__ESP_Testing_Func153:
	ADD	W14, #0, W0
	ADD	W0, W2, W1
	MOV.B	#170, W0
	MOV.B	W0, [W1]
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_ESP_Testing_Func46
L_ESP_Testing_Func47:
;ESP_12F_DRV.c,195 :: 		for(i=0;i<NumOfTx;i++)
; i start address is: 2 (W1)
	CLR	W1
; BufferLength end address is: 8 (W4)
; NumOfTx end address is: 10 (W5)
; i end address is: 2 (W1)
L_ESP_Testing_Func49:
; i start address is: 2 (W1)
; BufferLength start address is: 8 (W4)
; NumOfTx start address is: 10 (W5)
	CP	W1, W5
	BRA LTU	L__ESP_Testing_Func154
	GOTO	L_ESP_Testing_Func50
L__ESP_Testing_Func154:
;ESP_12F_DRV.c,197 :: 		SCL_Lat=1;
	BSET.B	LATG, #2
;ESP_12F_DRV.c,199 :: 		WIFI_Send_One_Array(Buffer,BufferLength);
	ADD	W14, #0, W0
	PUSH.D	W4
	PUSH	W1
	MOV	W4, W11
	MOV	W0, W10
	CALL	_WIFI_Send_One_Array
	POP	W1
	POP.D	W4
;ESP_12F_DRV.c,200 :: 		SCL_Lat=0;
	BCLR.B	LATG, #2
;ESP_12F_DRV.c,195 :: 		for(i=0;i<NumOfTx;i++)
	INC	W1
;ESP_12F_DRV.c,202 :: 		}
; i end address is: 2 (W1)
	GOTO	L_ESP_Testing_Func49
L_ESP_Testing_Func50:
;ESP_12F_DRV.c,203 :: 		PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,BufferLength,(unsigned long)((unsigned long)NumOfTx*(unsigned long)BufferLength));
	MOV	W5, W2
	CLR	W3
	MOV	W4, W0
	CLR	W1
	PUSH.D	W4
	CALL	__Multiply_32x32
	POP.D	W4
	PUSH.D	W0
	PUSH	W4
; BufferLength end address is: 8 (W4)
	PUSH	W5
; NumOfTx end address is: 10 (W5)
	MOV	#lo_addr(?lstr_45_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#12, W15
;ESP_12F_DRV.c,205 :: 		}
L_end_ESP_Testing_Func:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _ESP_Testing_Func

_ESP_Testing_Vz_Demo:
	LNK	#2174

;ESP_12F_DRV.c,207 :: 		void ESP_Testing_Vz_Demo(void)
;ESP_12F_DRV.c,210 :: 		unsigned int vz[60],i,j,k,NumOfTx=0,uiTemp,WifiCounter=0,LedOut=0,LedCount,NumOfCycle=30;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
; NumOfTx start address is: 2 (W1)
	CLR	W1
; WifiCounter start address is: 4 (W2)
	CLR	W2
; LedOut start address is: 6 (W3)
	CLR	W3
; NumOfCycle start address is: 8 (W4)
	MOV	#30, W4
;ESP_12F_DRV.c,212 :: 		char SamplingCounter=0;
; SamplingCounter start address is: 10 (W5)
	CLR	W5
;ESP_12F_DRV.c,213 :: 		PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
	MOV	#lo_addr(?lstr_46_ESP_12F_DRV), W0
	PUSH.D	W4
	PUSH.D	W2
	PUSH	W1
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	POP	W1
	POP.D	W2
	POP.D	W4
;ESP_12F_DRV.c,214 :: 		for(i=0;i<60;i++) vz[i]=300+i;
; i start address is: 0 (W0)
	CLR	W0
; WifiCounter end address is: 4 (W2)
; SamplingCounter end address is: 10 (W5)
; i end address is: 0 (W0)
; LedOut end address is: 6 (W3)
; NumOfTx end address is: 2 (W1)
; NumOfCycle end address is: 8 (W4)
	MOV	W4, W8
	MOV	W1, W4
	MOV.B	W5, W7
	MOV	W2, W5
	MOV	W3, W2
	MOV	W0, W3
L_ESP_Testing_Vz_Demo52:
; i start address is: 6 (W3)
; SamplingCounter start address is: 14 (W7)
; NumOfCycle start address is: 16 (W8)
; LedOut start address is: 4 (W2)
; WifiCounter start address is: 10 (W5)
; NumOfTx start address is: 8 (W4)
	MOV	#60, W0
	CP	W3, W0
	BRA LTU	L__ESP_Testing_Vz_Demo156
	GOTO	L_ESP_Testing_Vz_Demo53
L__ESP_Testing_Vz_Demo156:
	ADD	W14, #0, W1
	SL	W3, #1, W0
	ADD	W1, W0, W1
	MOV	#300, W0
	ADD	W0, W3, [W1]
	INC	W3
; i end address is: 6 (W3)
	GOTO	L_ESP_Testing_Vz_Demo52
L_ESP_Testing_Vz_Demo53:
;ESP_12F_DRV.c,215 :: 		for(k=0;k<NumOfCycle;k++)
; k start address is: 6 (W3)
	CLR	W3
; LedOut end address is: 4 (W2)
; NumOfCycle end address is: 16 (W8)
; NumOfTx end address is: 8 (W4)
; k end address is: 6 (W3)
; SamplingCounter end address is: 14 (W7)
; WifiCounter end address is: 10 (W5)
	MOV	W2, W6
L_ESP_Testing_Vz_Demo55:
; k start address is: 6 (W3)
; NumOfTx start address is: 8 (W4)
; WifiCounter start address is: 10 (W5)
; LedOut start address is: 12 (W6)
; NumOfCycle start address is: 16 (W8)
; SamplingCounter start address is: 14 (W7)
	CP	W3, W8
	BRA LTU	L__ESP_Testing_Vz_Demo157
	GOTO	L_ESP_Testing_Vz_Demo56
L__ESP_Testing_Vz_Demo157:
;ESP_12F_DRV.c,217 :: 		asm clrwdt;
	CLRWDT
;ESP_12F_DRV.c,219 :: 		if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);} //run time 30uSec
	MOV	[W14+124], W2
	MOV	#1, W1
	MOV	#124, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
	CP	W2, #20
	BRA GEU	L__ESP_Testing_Vz_Demo158
	GOTO	L__ESP_Testing_Vz_Demo120
L__ESP_Testing_Vz_Demo158:
	MOV	#255, W0
	XOR	W6, W0, W1
	MOV	W1, W6
	CLR	W0
	MOV	W0, [W14+124]
	PUSH.D	W6
	PUSH	W8
	PUSH.D	W4
	PUSH	W3
	MOV.B	W1, W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
; LedOut end address is: 12 (W6)
	POP	W3
	POP.D	W4
	POP	W8
	POP.D	W6
	GOTO	L_ESP_Testing_Vz_Demo58
L__ESP_Testing_Vz_Demo120:
L_ESP_Testing_Vz_Demo58:
;ESP_12F_DRV.c,220 :: 		if(SamplingCounter==0)
; LedOut start address is: 12 (W6)
	CP.B	W7, #0
	BRA Z	L__ESP_Testing_Vz_Demo159
	GOTO	L_ESP_Testing_Vz_Demo59
L__ESP_Testing_Vz_Demo159:
;ESP_12F_DRV.c,222 :: 		j=0;
	CLR	W0
	MOV	W0, [W14+120]
;ESP_12F_DRV.c,223 :: 		Wifi_Buffer[j++]=1;//ID
	MOV	#126, W2
	ADD	W14, W2, W2
	MOV.B	#1, W0
	MOV.B	W0, [W2]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,224 :: 		Wifi_Buffer[j++]=0;//Length MSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,225 :: 		Wifi_Buffer[j++]=120;//Length LSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,226 :: 		Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,227 :: 		for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
; i start address is: 18 (W9)
	CLR	W9
; LedOut end address is: 12 (W6)
; NumOfCycle end address is: 16 (W8)
; NumOfTx end address is: 8 (W4)
; k end address is: 6 (W3)
; SamplingCounter end address is: 14 (W7)
; WifiCounter end address is: 10 (W5)
; i end address is: 18 (W9)
L_ESP_Testing_Vz_Demo60:
; i start address is: 18 (W9)
; LedOut start address is: 12 (W6)
; SamplingCounter start address is: 14 (W7)
; NumOfCycle start address is: 16 (W8)
; WifiCounter start address is: 10 (W5)
; NumOfTx start address is: 8 (W4)
; k start address is: 6 (W3)
	MOV	#60, W0
	CP	W9, W0
	BRA LTU	L__ESP_Testing_Vz_Demo160
	GOTO	L_ESP_Testing_Vz_Demo61
L__ESP_Testing_Vz_Demo160:
	MOV	#126, W2
	ADD	W14, W2, W2
	ADD	W14, #0, W1
	SL	W9, #1, W0
	ADD	W1, W0, W0
	PUSH	W3
	PUSH.D	W4
	PUSH	W8
	PUSH.D	W6
	PUSH	W9
	MOV	[W14+120], W12
	CLR	W13
	MOV	W2, W11
	MOV	[W0], W10
	CALL	_SInt2Array
	POP	W9
	POP.D	W6
	POP	W8
	POP.D	W4
	POP	W3
	MOV	W0, [W14+120]
	INC	W9
; i end address is: 18 (W9)
	GOTO	L_ESP_Testing_Vz_Demo60
L_ESP_Testing_Vz_Demo61:
;ESP_12F_DRV.c,228 :: 		Wifi_Buffer[j++]=1;//ID
	MOV	#126, W2
	ADD	W14, W2, W2
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,229 :: 		Wifi_Buffer[j++]=0;//Length MSB  PLC
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,230 :: 		Wifi_Buffer[j++]=20;//Length LSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#20, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,231 :: 		Wifi_Buffer[j++]=0x04;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,232 :: 		for(i=0;i<20;i++) Wifi_Buffer[j++];
; i start address is: 0 (W0)
	CLR	W0
; LedOut end address is: 12 (W6)
; NumOfCycle end address is: 16 (W8)
; NumOfTx end address is: 8 (W4)
; k end address is: 6 (W3)
; i end address is: 0 (W0)
; SamplingCounter end address is: 14 (W7)
; WifiCounter end address is: 10 (W5)
	PUSH	W3
	MOV	W5, W3
	MOV	W6, W5
	MOV	W4, W2
	MOV	W8, W4
	MOV	W0, W8
	POP	W6
L_ESP_Testing_Vz_Demo63:
; i start address is: 16 (W8)
; k start address is: 12 (W6)
; NumOfTx start address is: 4 (W2)
; WifiCounter start address is: 6 (W3)
; NumOfCycle start address is: 8 (W4)
; SamplingCounter start address is: 14 (W7)
; LedOut start address is: 10 (W5)
	CP	W8, #20
	BRA LTU	L__ESP_Testing_Vz_Demo161
	GOTO	L_ESP_Testing_Vz_Demo64
L__ESP_Testing_Vz_Demo161:
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
	INC	W8
; i end address is: 16 (W8)
	GOTO	L_ESP_Testing_Vz_Demo63
L_ESP_Testing_Vz_Demo64:
;ESP_12F_DRV.c,233 :: 		SamplingCounter++;
; SamplingCounter start address is: 0 (W0)
	ADD.B	W7, #1, W0
; SamplingCounter end address is: 14 (W7)
;ESP_12F_DRV.c,234 :: 		}
	PUSH	W0
; WifiCounter end address is: 6 (W3)
; SamplingCounter end address is: 0 (W0)
; NumOfTx end address is: 4 (W2)
; k end address is: 12 (W6)
; NumOfCycle end address is: 8 (W4)
; LedOut end address is: 10 (W5)
	MOV	W3, W0
	POP	W3
	GOTO	L_ESP_Testing_Vz_Demo66
L_ESP_Testing_Vz_Demo59:
;ESP_12F_DRV.c,237 :: 		Wifi_Buffer[j++]=1;//ID
; WifiCounter start address is: 10 (W5)
; SamplingCounter start address is: 14 (W7)
; k start address is: 6 (W3)
; NumOfTx start address is: 8 (W4)
; NumOfCycle start address is: 16 (W8)
; LedOut start address is: 12 (W6)
	MOV	#126, W2
	ADD	W14, W2, W2
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,238 :: 		Wifi_Buffer[j++]=0;//Length MSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,239 :: 		Wifi_Buffer[j++]=120;//Length LSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,240 :: 		Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,241 :: 		for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
; i start address is: 18 (W9)
	CLR	W9
; LedOut end address is: 12 (W6)
; NumOfCycle end address is: 16 (W8)
; NumOfTx end address is: 8 (W4)
; k end address is: 6 (W3)
; SamplingCounter end address is: 14 (W7)
; WifiCounter end address is: 10 (W5)
; i end address is: 18 (W9)
	PUSH	W8
	PUSH	W6
	MOV	W3, W6
	MOV.B	W7, W8
	MOV	W4, W7
	POP	W3
	POP	W4
L_ESP_Testing_Vz_Demo67:
; i start address is: 18 (W9)
; LedOut start address is: 6 (W3)
; SamplingCounter start address is: 16 (W8)
; NumOfCycle start address is: 8 (W4)
; WifiCounter start address is: 10 (W5)
; NumOfTx start address is: 14 (W7)
; k start address is: 12 (W6)
	MOV	#60, W0
	CP	W9, W0
	BRA LTU	L__ESP_Testing_Vz_Demo162
	GOTO	L_ESP_Testing_Vz_Demo68
L__ESP_Testing_Vz_Demo162:
	MOV	#126, W2
	ADD	W14, W2, W2
	ADD	W14, #0, W1
	SL	W9, #1, W0
	ADD	W1, W0, W0
	PUSH.D	W6
	PUSH.D	W4
	PUSH	W8
	PUSH	W3
	PUSH	W9
	MOV	[W14+120], W12
	CLR	W13
	MOV	W2, W11
	MOV	[W0], W10
	CALL	_SInt2Array
	POP	W9
	POP	W3
	POP	W8
	POP.D	W4
	POP.D	W6
	MOV	W0, [W14+120]
	INC	W9
; i end address is: 18 (W9)
	GOTO	L_ESP_Testing_Vz_Demo67
L_ESP_Testing_Vz_Demo68:
;ESP_12F_DRV.c,242 :: 		SamplingCounter++;
	ADD.B	W8, #1, W0
; SamplingCounter end address is: 16 (W8)
; SamplingCounter start address is: 2 (W1)
	MOV.B	W0, W1
;ESP_12F_DRV.c,243 :: 		if(SamplingCounter==5)
	CP.B	W0, #5
	BRA Z	L__ESP_Testing_Vz_Demo163
	GOTO	L__ESP_Testing_Vz_Demo121
L__ESP_Testing_Vz_Demo163:
; SamplingCounter end address is: 2 (W1)
;ESP_12F_DRV.c,245 :: 		uiTemp=j;
	MOV	[W14+120], W0
	MOV	W0, [W14+122]
;ESP_12F_DRV.c,246 :: 		NumOfTx++;
; NumOfTx start address is: 2 (W1)
	ADD	W7, #1, W1
; NumOfTx end address is: 14 (W7)
;ESP_12F_DRV.c,249 :: 		WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_Buffer,j);
	MOV	#126, W0
	ADD	W14, W0, W0
	PUSH	W1
	PUSH	W6
	PUSH.D	W4
	PUSH	W3
	MOV	[W14+120], W11
	MOV	W0, W10
	CALL	_WIFI_Send_One_Array_Not_Wait_To_OK
	POP	W3
	POP.D	W4
	POP	W6
	POP	W1
;ESP_12F_DRV.c,251 :: 		SamplingCounter=0;
; SamplingCounter start address is: 0 (W0)
	CLR	W0
; NumOfTx end address is: 2 (W1)
; SamplingCounter end address is: 0 (W0)
	MOV	W1, W2
;ESP_12F_DRV.c,252 :: 		}
	GOTO	L_ESP_Testing_Vz_Demo70
L__ESP_Testing_Vz_Demo121:
;ESP_12F_DRV.c,243 :: 		if(SamplingCounter==5)
	MOV.B	W1, W0
	MOV	W7, W2
;ESP_12F_DRV.c,252 :: 		}
L_ESP_Testing_Vz_Demo70:
;ESP_12F_DRV.c,253 :: 		}
; SamplingCounter start address is: 0 (W0)
; NumOfTx start address is: 4 (W2)
	PUSH	W0
; LedOut end address is: 6 (W3)
; WifiCounter end address is: 10 (W5)
; SamplingCounter end address is: 0 (W0)
; NumOfTx end address is: 4 (W2)
; k end address is: 12 (W6)
; NumOfCycle end address is: 8 (W4)
	MOV	W5, W0
	MOV	W3, W5
	POP	W3
L_ESP_Testing_Vz_Demo66:
;ESP_12F_DRV.c,254 :: 		Delay_ms(10);
; NumOfTx start address is: 4 (W2)
; SamplingCounter start address is: 6 (W3)
; k start address is: 12 (W6)
; WifiCounter start address is: 0 (W0)
; NumOfCycle start address is: 8 (W4)
; LedOut start address is: 10 (W5)
	MOV	#53333, W7
L_ESP_Testing_Vz_Demo71:
	DEC	W7
	BRA NZ	L_ESP_Testing_Vz_Demo71
	NOP
;ESP_12F_DRV.c,256 :: 		if(WifiCounter++>WifiConnectionLimit)
	MOV	W0, W1
; WifiCounter start address is: 14 (W7)
	ADD	W0, #1, W7
; WifiCounter end address is: 0 (W0)
	MOV	#600, W0
	CP	W1, W0
	BRA GTU	L__ESP_Testing_Vz_Demo164
	GOTO	L__ESP_Testing_Vz_Demo122
L__ESP_Testing_Vz_Demo164:
; WifiCounter end address is: 14 (W7)
;ESP_12F_DRV.c,258 :: 		WifiCounter=0;
; WifiCounter start address is: 2 (W1)
	CLR	W1
;ESP_12F_DRV.c,259 :: 		if(CheckWifiConnection()==0)
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_CheckWifiConnection
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP.B	W0, #0
	BRA Z	L__ESP_Testing_Vz_Demo165
	GOTO	L_ESP_Testing_Vz_Demo74
L__ESP_Testing_Vz_Demo165:
;ESP_12F_DRV.c,261 :: 		SendAtCommandToEsp("+++");
	PUSH	W1
	MOV	#lo_addr(?lstr47_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,262 :: 		PrintOut(PrintHandler, "\rWIFI Connection Not OK!");
	MOV	#lo_addr(?lstr_48_ESP_12F_DRV), W0
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,265 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo166
	GOTO	L_ESP_Testing_Vz_Demo75
L__ESP_Testing_Vz_Demo166:
;ESP_12F_DRV.c,266 :: 		if(!ConnectToServer()) ConnectToServer();
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_ConnectToServer
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo167
	GOTO	L_ESP_Testing_Vz_Demo76
L__ESP_Testing_Vz_Demo167:
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_ConnectToServer
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
L_ESP_Testing_Vz_Demo76:
L_ESP_Testing_Vz_Demo75:
;ESP_12F_DRV.c,267 :: 		if(!CheckWifiConnection())
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_CheckWifiConnection
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo168
	GOTO	L_ESP_Testing_Vz_Demo77
L__ESP_Testing_Vz_Demo168:
;ESP_12F_DRV.c,268 :: 		if(!CheckWifiConnection())
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_CheckWifiConnection
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo169
	GOTO	L_ESP_Testing_Vz_Demo78
L__ESP_Testing_Vz_Demo169:
;ESP_12F_DRV.c,269 :: 		if(!CheckWifiConnection())
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_CheckWifiConnection
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo170
	GOTO	L_ESP_Testing_Vz_Demo79
L__ESP_Testing_Vz_Demo170:
;ESP_12F_DRV.c,271 :: 		if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);}
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_Init_ESP
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo171
	GOTO	L_ESP_Testing_Vz_Demo80
L__ESP_Testing_Vz_Demo171:
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_LED_Activation
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
L_ESP_Testing_Vz_Demo80:
;ESP_12F_DRV.c,272 :: 		ConnectingToWifiNet();
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_ConnectingToWifiNet
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
;ESP_12F_DRV.c,273 :: 		}
L_ESP_Testing_Vz_Demo79:
L_ESP_Testing_Vz_Demo78:
L_ESP_Testing_Vz_Demo77:
;ESP_12F_DRV.c,275 :: 		}
L_ESP_Testing_Vz_Demo74:
;ESP_12F_DRV.c,276 :: 		}
	MOV	W1, W0
	GOTO	L_ESP_Testing_Vz_Demo73
; WifiCounter end address is: 2 (W1)
L__ESP_Testing_Vz_Demo122:
;ESP_12F_DRV.c,256 :: 		if(WifiCounter++>WifiConnectionLimit)
	MOV	W7, W0
;ESP_12F_DRV.c,276 :: 		}
L_ESP_Testing_Vz_Demo73:
;ESP_12F_DRV.c,215 :: 		for(k=0;k<NumOfCycle;k++)
; WifiCounter start address is: 0 (W0)
; k start address is: 2 (W1)
	ADD	W6, #1, W1
; k end address is: 12 (W6)
;ESP_12F_DRV.c,277 :: 		}
	MOV.B	W3, W7
; NumOfTx end address is: 4 (W2)
; SamplingCounter end address is: 6 (W3)
; NumOfCycle end address is: 8 (W4)
; LedOut end address is: 10 (W5)
; WifiCounter end address is: 0 (W0)
; k end address is: 2 (W1)
	MOV	W1, W3
	MOV	W4, W8
	MOV	W2, W4
	MOV	W5, W6
	MOV	W0, W5
	GOTO	L_ESP_Testing_Vz_Demo55
L_ESP_Testing_Vz_Demo56:
;ESP_12F_DRV.c,278 :: 		Read_Write_MCP23S17_IO(USER_LED,ON);
; NumOfTx start address is: 8 (W4)
	PUSH	W4
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
	POP	W4
;ESP_12F_DRV.c,279 :: 		PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,uiTemp,(unsigned long)((unsigned long)NumOfTx*(unsigned long)uiTemp));
	MOV	W4, W2
	CLR	W3
	MOV	[W14+122], W0
	CLR	W1
	PUSH	W4
	CALL	__Multiply_32x32
	POP	W4
	PUSH.D	W0
	MOV	#122, W0
	ADD	W14, W0, W0
	PUSH	[W0]
	PUSH	W4
; NumOfTx end address is: 8 (W4)
	MOV	#lo_addr(?lstr_49_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#12, W15
;ESP_12F_DRV.c,280 :: 		}
L_end_ESP_Testing_Vz_Demo:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _ESP_Testing_Vz_Demo

_PullDataFromIDP:
	LNK	#10

;ESP_12F_DRV.c,283 :: 		char *PullDataFromIDP(int *length,char *Buff)
;ESP_12F_DRV.c,287 :: 		if(strstr(Buff,"+IPD"))
	PUSH	W11
	PUSH.D	W10
	MOV	W11, W10
	MOV	#lo_addr(?lstr50_ESP_12F_DRV), W11
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA NZ	L__PullDataFromIDP173
	GOTO	L_PullDataFromIDP81
L__PullDataFromIDP173:
;ESP_12F_DRV.c,290 :: 		p1=strstr(Buff,"+IPD,");
	PUSH	W10
	MOV	W11, W10
	MOV	#lo_addr(?lstr51_ESP_12F_DRV), W11
	CALL	_strstr
; p1 start address is: 4 (W2)
	MOV	W0, W2
;ESP_12F_DRV.c,291 :: 		p2=strstr(p1,":");
	MOV	#lo_addr(?lstr52_ESP_12F_DRV), W11
	MOV	W0, W10
	CALL	_strstr
	POP	W10
; p2 start address is: 12 (W6)
	MOV	W0, W6
;ESP_12F_DRV.c,292 :: 		if((p1)&&(p2))
	CP0	W2
	BRA NZ	L__PullDataFromIDP174
	GOTO	L__PullDataFromIDP113
L__PullDataFromIDP174:
	CP0	W6
	BRA NZ	L__PullDataFromIDP175
	GOTO	L__PullDataFromIDP112
L__PullDataFromIDP175:
L__PullDataFromIDP111:
;ESP_12F_DRV.c,294 :: 		i=5;
; i start address is: 14 (W7)
	MOV.B	#5, W7
; p2 end address is: 12 (W6)
; p1 end address is: 4 (W2)
; i end address is: 14 (W7)
;ESP_12F_DRV.c,295 :: 		while(p1[i]!=':')
L_PullDataFromIDP85:
; i start address is: 14 (W7)
; p2 start address is: 12 (W6)
; p1 start address is: 4 (W2)
	ZE	W7, W0
	ADD	W2, W0, W0
	MOV.B	[W0], W1
	MOV.B	#58, W0
	CP.B	W1, W0
	BRA NZ	L__PullDataFromIDP176
	GOTO	L_PullDataFromIDP86
L__PullDataFromIDP176:
;ESP_12F_DRV.c,297 :: 		text[i-5]=p1[i++];
	ZE	W7, W0
	SUB	W0, #5, W1
	ADD	W14, #0, W0
	ADD	W0, W1, W1
	ZE	W7, W0
	ADD	W2, W0, W0
	MOV.B	[W0], [W1]
	INC.B	W7
;ESP_12F_DRV.c,298 :: 		}
; p1 end address is: 4 (W2)
	GOTO	L_PullDataFromIDP85
L_PullDataFromIDP86:
;ESP_12F_DRV.c,299 :: 		text[i-5]=0;
	ZE	W7, W0
; i end address is: 14 (W7)
	SUB	W0, #5, W0
	ADD	W14, #0, W2
	ADD	W2, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;ESP_12F_DRV.c,300 :: 		*length=atoi(text);
	PUSH	W10
	MOV	W2, W10
	CALL	_atoi
	POP	W10
	MOV	W0, [W10]
;ESP_12F_DRV.c,301 :: 		p2++;
	ADD	W6, #1, W0
; p2 end address is: 12 (W6)
;ESP_12F_DRV.c,302 :: 		return p2;
	GOTO	L_end_PullDataFromIDP
;ESP_12F_DRV.c,292 :: 		if((p1)&&(p2))
L__PullDataFromIDP113:
L__PullDataFromIDP112:
;ESP_12F_DRV.c,304 :: 		else return 0;
	CLR	W0
	GOTO	L_end_PullDataFromIDP
;ESP_12F_DRV.c,305 :: 		}
L_PullDataFromIDP81:
;ESP_12F_DRV.c,306 :: 		}
L_end_PullDataFromIDP:
	POP	W11
	ULNK
	RETURN
; end of _PullDataFromIDP

_CheckDataFromGateway:

;ESP_12F_DRV.c,308 :: 		char CheckDataFromGateway(void)
;ESP_12F_DRV.c,312 :: 		if((ESP_RX_Int_Flag)&&(strstr(ESP_RX_Buffer,"+IPD")))
	PUSH	W10
	PUSH	W11
	BTSS	IFS0bits, #11
	GOTO	L__CheckDataFromGateway116
	MOV	#lo_addr(?lstr53_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__CheckDataFromGateway178
	GOTO	L__CheckDataFromGateway115
L__CheckDataFromGateway178:
L__CheckDataFromGateway114:
;ESP_12F_DRV.c,314 :: 		if(!(p=PullDataFromIDP(&Gateway_Buffer_Length,ESP_RX_Buffer))) {Data_From_Gateway_Flag=FALSE;return 0;}
	MOV	#lo_addr(_ESP_RX_Buffer), W11
	MOV	#lo_addr(_Gateway_Buffer_Length), W10
	CALL	_PullDataFromIDP
; p start address is: 4 (W2)
	MOV	W0, W2
	CP0	W0
	BRA Z	L__CheckDataFromGateway179
	GOTO	L_CheckDataFromGateway91
L__CheckDataFromGateway179:
; p end address is: 4 (W2)
	MOV	#lo_addr(_Data_From_Gateway_Flag), W1
	CLR	W0
	MOV.B	W0, [W1]
	CLR	W0
	GOTO	L_end_CheckDataFromGateway
L_CheckDataFromGateway91:
;ESP_12F_DRV.c,315 :: 		Data_From_Gateway_Flag=TRUE;
; p start address is: 4 (W2)
	MOV	#lo_addr(_Data_From_Gateway_Flag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;ESP_12F_DRV.c,316 :: 		for(i=0;i<Gateway_Buffer_Length;i++) ESP_GateWay_Buffer[i]=p[i];
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_CheckDataFromGateway92:
; i start address is: 6 (W3)
; p start address is: 4 (W2)
; p end address is: 4 (W2)
	MOV	#lo_addr(_Gateway_Buffer_Length), W0
	CP	W3, [W0]
	BRA LTU	L__CheckDataFromGateway180
	GOTO	L_CheckDataFromGateway93
L__CheckDataFromGateway180:
; p end address is: 4 (W2)
; p start address is: 4 (W2)
	MOV	#lo_addr(_ESP_GateWay_Buffer), W0
	ADD	W0, W3, W1
	ADD	W2, W3, W0
	MOV.B	[W0], [W1]
	INC	W3
; p end address is: 4 (W2)
; i end address is: 6 (W3)
	GOTO	L_CheckDataFromGateway92
L_CheckDataFromGateway93:
;ESP_12F_DRV.c,321 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;ESP_12F_DRV.c,322 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;ESP_12F_DRV.c,323 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_CheckDataFromGateway
;ESP_12F_DRV.c,312 :: 		if((ESP_RX_Int_Flag)&&(strstr(ESP_RX_Buffer,"+IPD")))
L__CheckDataFromGateway116:
L__CheckDataFromGateway115:
;ESP_12F_DRV.c,325 :: 		else return 0;
	CLR	W0
;ESP_12F_DRV.c,326 :: 		}
;ESP_12F_DRV.c,325 :: 		else return 0;
;ESP_12F_DRV.c,326 :: 		}
L_end_CheckDataFromGateway:
	POP	W11
	POP	W10
	RETURN
; end of _CheckDataFromGateway

_GetEspData:

;ESP_12F_DRV.c,328 :: 		char GetEspData(unsigned long TimeOut_uSec_Start)
;ESP_12F_DRV.c,330 :: 		unsigned long ulTemp=0;
; ulTemp start address is: 16 (W8)
	CLR	W8
	CLR	W9
;ESP_12F_DRV.c,332 :: 		if(CheckDataFromGateway()) return 2;
	PUSH.D	W10
	CALL	_CheckDataFromGateway
	POP.D	W10
	CP0.B	W0
	BRA NZ	L__GetEspData182
	GOTO	L_GetEspData96
L__GetEspData182:
; ulTemp end address is: 16 (W8)
	MOV.B	#2, W0
	GOTO	L_end_GetEspData
L_GetEspData96:
;ESP_12F_DRV.c,333 :: 		else {ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;}
; ulTemp start address is: 16 (W8)
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
; ulTemp end address is: 16 (W8)
	MOV.D	W8, W2
;ESP_12F_DRV.c,334 :: 		while((ulTemp++<TimeOut_uSec_Start)&&(ESP_RX_Int_Flag==0)) {asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;} //For correct TIME OUT
L_GetEspData98:
; ulTemp start address is: 4 (W2)
; ulTemp start address is: 4 (W2)
	MOV.D	W2, W0
	ADD	W2, #1, W2
	ADDC	W3, #0, W3
; ulTemp end address is: 4 (W2)
	CP	W0, W10
	CPB	W1, W11
	BRA LTU	L__GetEspData183
	GOTO	L__GetEspData119
L__GetEspData183:
; ulTemp end address is: 4 (W2)
; ulTemp start address is: 4 (W2)
	BTSC	IFS0bits, #11
	GOTO	L__GetEspData118
L__GetEspData117:
	CLRWDT
	CLRWDT
	CLRWDT
	CLRWDT
	CLRWDT
; ulTemp end address is: 4 (W2)
	GOTO	L_GetEspData98
L__GetEspData119:
L__GetEspData118:
;ESP_12F_DRV.c,335 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;ESP_12F_DRV.c,336 :: 		if(ESP_RX_Int_Flag)
	BTSS	IFS0bits, #11
	GOTO	L_GetEspData102
;ESP_12F_DRV.c,338 :: 		if(CheckDataFromGateway()) return 2;
	PUSH.D	W10
	CALL	_CheckDataFromGateway
	POP.D	W10
	CP0.B	W0
	BRA NZ	L__GetEspData184
	GOTO	L_GetEspData103
L__GetEspData184:
	MOV.B	#2, W0
	GOTO	L_end_GetEspData
L_GetEspData103:
;ESP_12F_DRV.c,342 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;ESP_12F_DRV.c,343 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_GetEspData
;ESP_12F_DRV.c,344 :: 		}
L_GetEspData102:
;ESP_12F_DRV.c,345 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;ESP_12F_DRV.c,346 :: 		return 0;
	CLR	W0
;ESP_12F_DRV.c,347 :: 		}
L_end_GetEspData:
	RETURN
; end of _GetEspData

_ReConnectToServer:

;ESP_12F_DRV.c,349 :: 		char ReConnectToServer(void)
;ESP_12F_DRV.c,351 :: 		LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);
	PUSH	W10
	PUSH	W11
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_LED_Activation
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
;ESP_12F_DRV.c,352 :: 		SendAtCommandToEsp("+++");
	MOV	#lo_addr(?lstr54_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,353 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ReConnectToServer186
	GOTO	L_ReConnectToServer104
L__ReConnectToServer186:
;ESP_12F_DRV.c,354 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ReConnectToServer187
	GOTO	L_ReConnectToServer105
L__ReConnectToServer187:
;ESP_12F_DRV.c,355 :: 		if(!ConnectToServer()) ConnectToServer();
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ReConnectToServer188
	GOTO	L_ReConnectToServer106
L__ReConnectToServer188:
	CALL	_ConnectToServer
L_ReConnectToServer106:
L_ReConnectToServer105:
L_ReConnectToServer104:
;ESP_12F_DRV.c,356 :: 		if(!CheckWifiConnection())
	CALL	_CheckWifiConnection
	CP0.B	W0
	BRA Z	L__ReConnectToServer189
	GOTO	L_ReConnectToServer107
L__ReConnectToServer189:
;ESP_12F_DRV.c,357 :: 		if(!CheckWifiConnection())
	CALL	_CheckWifiConnection
	CP0.B	W0
	BRA Z	L__ReConnectToServer190
	GOTO	L_ReConnectToServer108
L__ReConnectToServer190:
;ESP_12F_DRV.c,358 :: 		if(!CheckWifiConnection())
	CALL	_CheckWifiConnection
	CP0.B	W0
	BRA Z	L__ReConnectToServer191
	GOTO	L_ReConnectToServer109
L__ReConnectToServer191:
;ESP_12F_DRV.c,360 :: 		if(!Init_ESP()) return ConnectingToWifiNet();
	CALL	_Init_ESP
	CP0.B	W0
	BRA Z	L__ReConnectToServer192
	GOTO	L_ReConnectToServer110
L__ReConnectToServer192:
	CALL	_ConnectingToWifiNet
	GOTO	L_end_ReConnectToServer
L_ReConnectToServer110:
;ESP_12F_DRV.c,361 :: 		}
L_ReConnectToServer109:
L_ReConnectToServer108:
L_ReConnectToServer107:
;ESP_12F_DRV.c,362 :: 		LED_Activation(LED_RED,LED_ON);LED_Activation(LED_GREEN,LED_ON);
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
	CLR	W11
	MOV.B	#4, W10
	CALL	_LED_Activation
;ESP_12F_DRV.c,363 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,364 :: 		}
;ESP_12F_DRV.c,363 :: 		return 1;
;ESP_12F_DRV.c,364 :: 		}
L_end_ReConnectToServer:
	POP	W11
	POP	W10
	RETURN
; end of _ReConnectToServer

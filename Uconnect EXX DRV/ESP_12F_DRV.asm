
_Init_ESP:

;ESP_12F_DRV.c,34 :: 		char Init_ESP(void)
;ESP_12F_DRV.c,36 :: 		PrintOut(PrintHandler, "\rInit ESP(WIFI)...");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_1_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,37 :: 		Read_Write_MCP23S17_IO(ESP_EN_PIN, OFF);
	CLR	W11
	MOV.B	#10, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,38 :: 		Read_Write_MCP23S17_IO(ESP_FLASH, ON);
	MOV.B	#1, W11
	MOV.B	#12, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,39 :: 		Delay_ms(300);
	MOV	#25, W8
	MOV	#27143, W7
L_Init_ESP0:
	DEC	W7
	BRA NZ	L_Init_ESP0
	DEC	W8
	BRA NZ	L_Init_ESP0
;ESP_12F_DRV.c,40 :: 		Read_Write_MCP23S17_IO(ESP_EN_PIN, ON);
	MOV.B	#1, W11
	MOV.B	#10, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,41 :: 		Read_Write_MCP23S17_IO(ESP_RESET, OFF);
	CLR	W11
	MOV.B	#11, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,42 :: 		Delay_ms(200);
	MOV	#17, W8
	MOV	#18095, W7
L_Init_ESP2:
	DEC	W7
	BRA NZ	L_Init_ESP2
	DEC	W8
	BRA NZ	L_Init_ESP2
;ESP_12F_DRV.c,43 :: 		Read_Write_MCP23S17_IO(ESP_RESET, ON);
	MOV.B	#1, W11
	MOV.B	#11, W10
	CALL	_Read_Write_MCP23S17_IO
;ESP_12F_DRV.c,44 :: 		Delay_ms(2000);
	MOV	#163, W8
	MOV	#49887, W7
L_Init_ESP4:
	DEC	W7
	BRA NZ	L_Init_ESP4
	DEC	W8
	BRA NZ	L_Init_ESP4
	NOP
	NOP
;ESP_12F_DRV.c,45 :: 		Pseudo_Uart1_Enable(ON);
	MOV.B	#1, W10
	CALL	_Pseudo_Uart1_Enable
;ESP_12F_DRV.c,46 :: 		Pseudo_Uart1_Write_Text("ATE0\r\n");
	MOV	#lo_addr(?lstr2_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,47 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP6:
	DEC	W7
	BRA NZ	L_Init_ESP6
	NOP
	NOP
;ESP_12F_DRV.c,48 :: 		Pseudo_Uart1_Write_Text("ATE0\r\n");
	MOV	#lo_addr(?lstr3_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,49 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP8:
	DEC	W7
	BRA NZ	L_Init_ESP8
	NOP
	NOP
;ESP_12F_DRV.c,50 :: 		Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
	MOV	#lo_addr(?lstr4_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,51 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP10:
	DEC	W7
	BRA NZ	L_Init_ESP10
	NOP
	NOP
;ESP_12F_DRV.c,52 :: 		Pseudo_Uart1_Write_Text("AT+UART=2000000,8,1,0,0\r\n");
	MOV	#lo_addr(?lstr5_ESP_12F_DRV), W10
	CALL	_Pseudo_Uart1_Write_Text
;ESP_12F_DRV.c,53 :: 		Delay_ms(5);
	MOV	#26666, W7
L_Init_ESP12:
	DEC	W7
	BRA NZ	L_Init_ESP12
	NOP
	NOP
;ESP_12F_DRV.c,54 :: 		Pseudo_Uart1_Enable(OFF);
	CLR	W10
	CALL	_Pseudo_Uart1_Enable
;ESP_12F_DRV.c,55 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr6_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,56 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,57 :: 		SendAtCommandToEsp("AT+CIPDINFO=0\r\n");
	MOV	#lo_addr(?lstr7_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,58 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,59 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr8_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,60 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,61 :: 		if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
	MOV	#lo_addr(?lstr9_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__Init_ESP165
	GOTO	L_Init_ESP14
L__Init_ESP165:
	GOTO	___Init_ESP_EspInit_OK
L_Init_ESP14:
;ESP_12F_DRV.c,62 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr10_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,63 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,64 :: 		if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
	MOV	#lo_addr(?lstr11_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__Init_ESP166
	GOTO	L_Init_ESP15
L__Init_ESP166:
	GOTO	___Init_ESP_EspInit_OK
L_Init_ESP15:
;ESP_12F_DRV.c,65 :: 		SendAtCommandToEsp("ATE0\r\n");
	MOV	#lo_addr(?lstr12_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,66 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,67 :: 		if(strstr(ESP_RX_Buffer,"OK")) goto EspInit_OK;
	MOV	#lo_addr(?lstr13_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__Init_ESP167
	GOTO	L_Init_ESP16
L__Init_ESP167:
	GOTO	___Init_ESP_EspInit_OK
L_Init_ESP16:
;ESP_12F_DRV.c,68 :: 		PrintOut(PrintHandler, "\rFailed To Init ESP!!!");
	MOV	#lo_addr(?lstr_14_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,69 :: 		return 0;
	CLR	W0
	GOTO	L_end_Init_ESP
;ESP_12F_DRV.c,71 :: 		EspInit_OK:
___Init_ESP_EspInit_OK:
;ESP_12F_DRV.c,72 :: 		PrintOut(PrintHandler, "\rESP successfully initialized");
	MOV	#lo_addr(?lstr_15_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,73 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,74 :: 		}
;ESP_12F_DRV.c,73 :: 		return 1;
;ESP_12F_DRV.c,74 :: 		}
L_end_Init_ESP:
	POP	W11
	POP	W10
	RETURN
; end of _Init_ESP

_ConnectToServer:

;ESP_12F_DRV.c,76 :: 		char ConnectToServer(void)
;ESP_12F_DRV.c,78 :: 		SendAtCommandToEsp(CIPSTART_String);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,79 :: 		GetEspData(5000000);
	MOV	#19264, W10
	MOV	#76, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,80 :: 		if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
	MOV	#lo_addr(?lstr16_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__ConnectToServer169
	GOTO	L_ConnectToServer17
L__ConnectToServer169:
	MOV.B	#1, W0
	GOTO	L_end_ConnectToServer
L_ConnectToServer17:
;ESP_12F_DRV.c,84 :: 		SendAtCommandToEsp(CIPSTART_String);
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,85 :: 		GetEspData(5000000);
	MOV	#19264, W10
	MOV	#76, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,86 :: 		if(strstr(ESP_RX_Buffer,"CONNECT")) return 1;
	MOV	#lo_addr(?lstr17_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__ConnectToServer170
	GOTO	L_ConnectToServer18
L__ConnectToServer170:
	MOV.B	#1, W0
	GOTO	L_end_ConnectToServer
L_ConnectToServer18:
;ESP_12F_DRV.c,90 :: 		return 0;
	CLR	W0
;ESP_12F_DRV.c,91 :: 		}
;ESP_12F_DRV.c,90 :: 		return 0;
;ESP_12F_DRV.c,91 :: 		}
L_end_ConnectToServer:
	POP	W11
	POP	W10
	RETURN
; end of _ConnectToServer

_CheckGettingIP:

;ESP_12F_DRV.c,93 :: 		char CheckGettingIP(void)
;ESP_12F_DRV.c,95 :: 		PrintOut(PrintHandler, ".");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_18_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,96 :: 		SendAtCommandToEsp("AT+CIPSTATUS\r\n");
	MOV	#lo_addr(?lstr19_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,97 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,98 :: 		if(strstr(ESP_RX_Buffer,"S:2")) return 1;
	MOV	#lo_addr(?lstr20_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__CheckGettingIP172
	GOTO	L_CheckGettingIP19
L__CheckGettingIP172:
	MOV.B	#1, W0
	GOTO	L_end_CheckGettingIP
L_CheckGettingIP19:
;ESP_12F_DRV.c,99 :: 		else return 0;
	CLR	W0
;ESP_12F_DRV.c,100 :: 		}
;ESP_12F_DRV.c,99 :: 		else return 0;
;ESP_12F_DRV.c,100 :: 		}
L_end_CheckGettingIP:
	POP	W11
	POP	W10
	RETURN
; end of _CheckGettingIP

_CheckWifiConnection:

;ESP_12F_DRV.c,102 :: 		char CheckWifiConnection(void)
;ESP_12F_DRV.c,105 :: 		SendAtCommandToEsp("AT+CIPSTATUS\r\n");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr21_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,106 :: 		if(GetEspData(1000)==2) return 1;
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
	CP.B	W0, #2
	BRA Z	L__CheckWifiConnection174
	GOTO	L_CheckWifiConnection21
L__CheckWifiConnection174:
	MOV.B	#1, W0
	GOTO	L_end_CheckWifiConnection
L_CheckWifiConnection21:
;ESP_12F_DRV.c,107 :: 		if(strstr(ESP_RX_Buffer,"S:3")) return 1;
	MOV	#lo_addr(?lstr22_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__CheckWifiConnection175
	GOTO	L_CheckWifiConnection22
L__CheckWifiConnection175:
	MOV.B	#1, W0
	GOTO	L_end_CheckWifiConnection
L_CheckWifiConnection22:
;ESP_12F_DRV.c,108 :: 		else return 0;
	CLR	W0
;ESP_12F_DRV.c,109 :: 		}
;ESP_12F_DRV.c,108 :: 		else return 0;
;ESP_12F_DRV.c,109 :: 		}
L_end_CheckWifiConnection:
	POP	W11
	POP	W10
	RETURN
; end of _CheckWifiConnection

_ConnectingToWifiNet:
	LNK	#4

;ESP_12F_DRV.c,111 :: 		char ConnectingToWifiNet(void)
;ESP_12F_DRV.c,113 :: 		int i=0;
	PUSH	W10
	PUSH	W11
;ESP_12F_DRV.c,116 :: 		unsigned long ulTemp=0;
	MOV	#0, W0
	MOV	W0, [W14+0]
	MOV	#0, W0
	MOV	W0, [W14+2]
;ESP_12F_DRV.c,117 :: 		asm clrwdt;
	CLRWDT
;ESP_12F_DRV.c,118 :: 		PrintOut(PrintHandler, "\rWifi Connection Process...");
	MOV	#lo_addr(?lstr_23_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,119 :: 		SendAtCommandToEsp("AT+CWMODE=1\r\n");
	MOV	#lo_addr(?lstr24_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,120 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,121 :: 		SendAtCommandToEsp("AT+CIPMUX=0\r\n");
	MOV	#lo_addr(?lstr25_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,122 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,123 :: 		PrintOut(PrintHandler, "\rWaiting For IP...");
	MOV	#lo_addr(?lstr_26_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,124 :: 		SendAtCommandToEsp(CWJAP_String);
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,125 :: 		while(ulTemp++<8000)
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
	BRA LTU	L__ConnectingToWifiNet177
	GOTO	L_ConnectingToWifiNet25
L__ConnectingToWifiNet177:
;ESP_12F_DRV.c,127 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,128 :: 		if(strstr(ESP_RX_Buffer,"GOT IP")) break;
	MOV	#lo_addr(?lstr27_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__ConnectingToWifiNet178
	GOTO	L_ConnectingToWifiNet26
L__ConnectingToWifiNet178:
	GOTO	L_ConnectingToWifiNet25
L_ConnectingToWifiNet26:
;ESP_12F_DRV.c,129 :: 		}
	GOTO	L_ConnectingToWifiNet24
L_ConnectingToWifiNet25:
;ESP_12F_DRV.c,130 :: 		if(ulTemp>=8000) {PrintOut(PrintHandler, "\rFailed To Get IP"); return 0;}
	MOV	#8000, W1
	MOV	#0, W2
	ADD	W14, #0, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA LEU	L__ConnectingToWifiNet179
	GOTO	L_ConnectingToWifiNet27
L__ConnectingToWifiNet179:
	MOV	#lo_addr(?lstr_28_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	CLR	W0
	GOTO	L_end_ConnectingToWifiNet
L_ConnectingToWifiNet27:
;ESP_12F_DRV.c,131 :: 		PrintOut(PrintHandler, "\rGeting IP Address Successfully");
	MOV	#lo_addr(?lstr_29_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,132 :: 		delay_ms(2000);
	MOV	#163, W8
	MOV	#49887, W7
L_ConnectingToWifiNet28:
	DEC	W7
	BRA NZ	L_ConnectingToWifiNet28
	DEC	W8
	BRA NZ	L_ConnectingToWifiNet28
	NOP
	NOP
;ESP_12F_DRV.c,133 :: 		if(i=GetWifiRssi()) PrintOut(PrintHandler, "\rRSSI: %ddbm",i);
	CALL	_GetWifiRssi
; i start address is: 2 (W1)
	MOV	W0, W1
	CP0	W0
	BRA NZ	L__ConnectingToWifiNet180
	GOTO	L_ConnectingToWifiNet30
L__ConnectingToWifiNet180:
	PUSH	W1
; i end address is: 2 (W1)
	MOV	#lo_addr(?lstr_30_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
	GOTO	L_ConnectingToWifiNet31
L_ConnectingToWifiNet30:
;ESP_12F_DRV.c,134 :: 		else PrintOut(PrintHandler, "\rFailed To Get RSSI");
	MOV	#lo_addr(?lstr_31_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
L_ConnectingToWifiNet31:
;ESP_12F_DRV.c,135 :: 		PrintOut(PrintHandler, "\rConnecting To Server...");
	MOV	#lo_addr(?lstr_32_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,136 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ConnectingToWifiNet181
	GOTO	L_ConnectingToWifiNet32
L__ConnectingToWifiNet181:
;ESP_12F_DRV.c,138 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ConnectingToWifiNet182
	GOTO	L_ConnectingToWifiNet33
L__ConnectingToWifiNet182:
;ESP_12F_DRV.c,140 :: 		PrintOut(PrintHandler, "\rFailed To Connect To Server!!!");
	MOV	#lo_addr(?lstr_33_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,141 :: 		return 0;
	CLR	W0
	GOTO	L_end_ConnectingToWifiNet
;ESP_12F_DRV.c,142 :: 		}
L_ConnectingToWifiNet33:
;ESP_12F_DRV.c,143 :: 		}
L_ConnectingToWifiNet32:
;ESP_12F_DRV.c,144 :: 		PrintOut(PrintHandler, "\rConnected To Server Successfully");
	MOV	#lo_addr(?lstr_34_ESP_12F_DRV), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,145 :: 		LED_Activation(LED_RED,LED_ON);
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
;ESP_12F_DRV.c,146 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,147 :: 		}
;ESP_12F_DRV.c,146 :: 		return 1;
;ESP_12F_DRV.c,147 :: 		}
L_end_ConnectingToWifiNet:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _ConnectingToWifiNet

_GetWifiRssi:
	LNK	#10

;ESP_12F_DRV.c,149 :: 		int GetWifiRssi(void)
;ESP_12F_DRV.c,153 :: 		char *p,i=0,str[10];
	PUSH	W10
	PUSH	W11
; i start address is: 26 (W13)
	CLR	W13
;ESP_12F_DRV.c,154 :: 		SendAtCommandToEsp("AT+CWJAP?\r\n");
	MOV	#lo_addr(?lstr35_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,155 :: 		GetEspData(1000);
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,156 :: 		if(!(p=strstr(ESP_RX_Buffer,"-"))) return 0;
	MOV	#lo_addr(?lstr36_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
; p start address is: 4 (W2)
	MOV	W0, W2
	CP0	W0
	BRA Z	L__GetWifiRssi184
	GOTO	L_GetWifiRssi34
L__GetWifiRssi184:
; i end address is: 26 (W13)
; p end address is: 4 (W2)
	CLR	W0
	GOTO	L_end_GetWifiRssi
L_GetWifiRssi34:
;ESP_12F_DRV.c,157 :: 		while((p[i]!='\r')&&(i<5)) str[i]=p[i++];
; p start address is: 4 (W2)
; i start address is: 26 (W13)
	MOV.B	W13, W6
; p end address is: 4 (W2)
L_GetWifiRssi35:
; i end address is: 26 (W13)
; p start address is: 4 (W2)
; i start address is: 12 (W6)
	ZE	W6, W0
	ADD	W2, W0, W0
	MOV.B	[W0], W0
	CP.B	W0, #13
	BRA NZ	L__GetWifiRssi185
	GOTO	L__GetWifiRssi160
L__GetWifiRssi185:
	CP.B	W6, #5
	BRA LTU	L__GetWifiRssi186
	GOTO	L__GetWifiRssi159
L__GetWifiRssi186:
L__GetWifiRssi158:
	ADD	W14, #0, W1
	ZE	W6, W0
	ADD	W1, W0, W1
	ZE	W6, W0
	ADD	W2, W0, W0
	MOV.B	[W0], [W1]
	INC.B	W6
; p end address is: 4 (W2)
	GOTO	L_GetWifiRssi35
L__GetWifiRssi160:
L__GetWifiRssi159:
;ESP_12F_DRV.c,158 :: 		if(i>=5) return 0;
	CP.B	W6, #5
	BRA GEU	L__GetWifiRssi187
	GOTO	L_GetWifiRssi39
L__GetWifiRssi187:
; i end address is: 12 (W6)
	CLR	W0
	GOTO	L_end_GetWifiRssi
L_GetWifiRssi39:
;ESP_12F_DRV.c,159 :: 		str[i]=0;
; i start address is: 12 (W6)
	ADD	W14, #0, W2
	ZE	W6, W0
; i end address is: 12 (W6)
	ADD	W2, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;ESP_12F_DRV.c,160 :: 		return atoi(str);
	MOV	W2, W10
	CALL	_atoi
;ESP_12F_DRV.c,161 :: 		}
;ESP_12F_DRV.c,160 :: 		return atoi(str);
;ESP_12F_DRV.c,161 :: 		}
L_end_GetWifiRssi:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GetWifiRssi

_SendAtCommandToEsp:

;ESP_12F_DRV.c,163 :: 		void SendAtCommandToEsp(char *buff)
;ESP_12F_DRV.c,165 :: 		unsigned int i=0;
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
;ESP_12F_DRV.c,169 :: 		while(buff[i]!=0)
L_SendAtCommandToEsp40:
; i start address is: 2 (W1)
	ADD	W10, W1, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__SendAtCommandToEsp189
	GOTO	L_SendAtCommandToEsp41
L__SendAtCommandToEsp189:
;ESP_12F_DRV.c,171 :: 		Uart1_Write(buff[i]);
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;ESP_12F_DRV.c,172 :: 		i++;
	INC	W1
;ESP_12F_DRV.c,173 :: 		}
; i end address is: 2 (W1)
	GOTO	L_SendAtCommandToEsp40
L_SendAtCommandToEsp41:
;ESP_12F_DRV.c,174 :: 		}
L_end_SendAtCommandToEsp:
	RETURN
; end of _SendAtCommandToEsp

_WIFI_Send_One_Array:
	LNK	#102

;ESP_12F_DRV.c,176 :: 		char WIFI_Send_One_Array(char *m_data,  unsigned int len)
;ESP_12F_DRV.c,178 :: 		char cmd[100],cTemp=0;
	MOV	#0, W0
	MOV.B	W0, [W14+100]
;ESP_12F_DRV.c,180 :: 		SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr37_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,181 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
	POP.D	W10
;ESP_12F_DRV.c,182 :: 		sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
	ADD	W14, #0, W1
	PUSH.D	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_38_ESP_12F_DRV), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP.D	W10
;ESP_12F_DRV.c,183 :: 		SendAtCommandToEsp(cmd);
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,184 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,185 :: 		if(!strstr(ESP_RX_Buffer,">")) return 0;
	MOV	#lo_addr(?lstr39_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA Z	L__WIFI_Send_One_Array191
	GOTO	L_WIFI_Send_One_Array42
L__WIFI_Send_One_Array191:
	CLR	W0
	GOTO	L_end_WIFI_Send_One_Array
L_WIFI_Send_One_Array42:
;ESP_12F_DRV.c,186 :: 		for(i=0;i<len;i++) Uart1_Write(m_data[i]);
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_WIFI_Send_One_Array43:
; i start address is: 2 (W1)
	CP	W1, W11
	BRA LTU	L__WIFI_Send_One_Array192
	GOTO	L_WIFI_Send_One_Array44
L__WIFI_Send_One_Array192:
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
	GOTO	L_WIFI_Send_One_Array43
L_WIFI_Send_One_Array44:
;ESP_12F_DRV.c,187 :: 		SCL_Lat=1;
	BSET.B	LATG, #2
;ESP_12F_DRV.c,188 :: 		while(cTemp++<10)
L_WIFI_Send_One_Array46:
	MOV.B	[W14+100], W2
	MOV.B	[W14+100], W1
	MOV	#100, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
	CP.B	W2, #10
	BRA LTU	L__WIFI_Send_One_Array193
	GOTO	L_WIFI_Send_One_Array47
L__WIFI_Send_One_Array193:
;ESP_12F_DRV.c,190 :: 		GetEspData(10000);
	PUSH.D	W10
	MOV	#10000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,191 :: 		if(strstr(ESP_RX_Buffer,"OK")) break;
	MOV	#lo_addr(?lstr40_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA NZ	L__WIFI_Send_One_Array194
	GOTO	L_WIFI_Send_One_Array48
L__WIFI_Send_One_Array194:
	GOTO	L_WIFI_Send_One_Array47
L_WIFI_Send_One_Array48:
;ESP_12F_DRV.c,192 :: 		}
	GOTO	L_WIFI_Send_One_Array46
L_WIFI_Send_One_Array47:
;ESP_12F_DRV.c,193 :: 		if(cTemp>=10) return 0;
	MOV.B	[W14+100], W0
	CP.B	W0, #10
	BRA GEU	L__WIFI_Send_One_Array195
	GOTO	L_WIFI_Send_One_Array49
L__WIFI_Send_One_Array195:
	CLR	W0
	GOTO	L_end_WIFI_Send_One_Array
L_WIFI_Send_One_Array49:
;ESP_12F_DRV.c,194 :: 		SCL_Lat=0;
	BCLR.B	LATG, #2
;ESP_12F_DRV.c,195 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,197 :: 		}
L_end_WIFI_Send_One_Array:
	ULNK
	RETURN
; end of _WIFI_Send_One_Array

_WIFI_Send_One_Array_Not_Wait_To_OK:
	LNK	#100

;ESP_12F_DRV.c,199 :: 		char WIFI_Send_One_Array_Not_Wait_To_OK(char *m_data,  unsigned int len)
;ESP_12F_DRV.c,204 :: 		SendAtCommandToEsp("AT+CIPBUFRESET\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr41_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,205 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
	POP.D	W10
;ESP_12F_DRV.c,206 :: 		sprintf(cmd,"AT+CIPSENDBUF=%u\r\n",len);
	ADD	W14, #0, W1
	PUSH.D	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_42_ESP_12F_DRV), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP.D	W10
;ESP_12F_DRV.c,207 :: 		SendAtCommandToEsp(cmd);
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SendAtCommandToEsp
	POP	W10
;ESP_12F_DRV.c,208 :: 		GetEspData(1000);
	PUSH.D	W10
	MOV	#1000, W10
	MOV	#0, W11
	CALL	_GetEspData
;ESP_12F_DRV.c,209 :: 		if(!strstr(ESP_RX_Buffer,">")) return 0;
	MOV	#lo_addr(?lstr43_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA Z	L__WIFI_Send_One_Array_Not_Wait_To_OK197
	GOTO	L_WIFI_Send_One_Array_Not_Wait_To_OK50
L__WIFI_Send_One_Array_Not_Wait_To_OK197:
	CLR	W0
	GOTO	L_end_WIFI_Send_One_Array_Not_Wait_To_OK
L_WIFI_Send_One_Array_Not_Wait_To_OK50:
;ESP_12F_DRV.c,210 :: 		for(i=0;i<len;i++) Uart1_Write(m_data[i]);
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_WIFI_Send_One_Array_Not_Wait_To_OK51:
; i start address is: 2 (W1)
	CP	W1, W11
	BRA LTU	L__WIFI_Send_One_Array_Not_Wait_To_OK198
	GOTO	L_WIFI_Send_One_Array_Not_Wait_To_OK52
L__WIFI_Send_One_Array_Not_Wait_To_OK198:
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
	INC	W1
; i end address is: 2 (W1)
	GOTO	L_WIFI_Send_One_Array_Not_Wait_To_OK51
L_WIFI_Send_One_Array_Not_Wait_To_OK52:
;ESP_12F_DRV.c,211 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,212 :: 		}
L_end_WIFI_Send_One_Array_Not_Wait_To_OK:
	ULNK
	RETURN
; end of _WIFI_Send_One_Array_Not_Wait_To_OK

_ESP_Testing_Func:
	LNK	#2048

;ESP_12F_DRV.c,214 :: 		void ESP_Testing_Func(void)
;ESP_12F_DRV.c,217 :: 		unsigned int BufferLength=140,i,NumOfTx=5;
	PUSH	W10
	PUSH	W11
; BufferLength start address is: 2 (W1)
	MOV	#140, W1
; NumOfTx start address is: 4 (W2)
	MOV	#5, W2
;ESP_12F_DRV.c,219 :: 		PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
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
;ESP_12F_DRV.c,220 :: 		for(i=0;i<BufferLength;i++) buffer[i]=0xAA;
; i start address is: 0 (W0)
	CLR	W0
; BufferLength end address is: 2 (W1)
; NumOfTx end address is: 4 (W2)
; i end address is: 0 (W0)
	MOV	W1, W4
	MOV	W2, W5
	MOV	W0, W2
L_ESP_Testing_Func54:
; i start address is: 4 (W2)
; NumOfTx start address is: 10 (W5)
; BufferLength start address is: 8 (W4)
	CP	W2, W4
	BRA LTU	L__ESP_Testing_Func200
	GOTO	L_ESP_Testing_Func55
L__ESP_Testing_Func200:
	ADD	W14, #0, W0
	ADD	W0, W2, W1
	MOV.B	#170, W0
	MOV.B	W0, [W1]
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_ESP_Testing_Func54
L_ESP_Testing_Func55:
;ESP_12F_DRV.c,221 :: 		for(i=0;i<NumOfTx;i++)
; i start address is: 2 (W1)
	CLR	W1
; BufferLength end address is: 8 (W4)
; NumOfTx end address is: 10 (W5)
; i end address is: 2 (W1)
L_ESP_Testing_Func57:
; i start address is: 2 (W1)
; BufferLength start address is: 8 (W4)
; NumOfTx start address is: 10 (W5)
	CP	W1, W5
	BRA LTU	L__ESP_Testing_Func201
	GOTO	L_ESP_Testing_Func58
L__ESP_Testing_Func201:
;ESP_12F_DRV.c,223 :: 		SCL_Lat=1;
	BSET.B	LATG, #2
;ESP_12F_DRV.c,225 :: 		WIFI_Send_One_Array(Buffer,BufferLength);
	ADD	W14, #0, W0
	PUSH.D	W4
	PUSH	W1
	MOV	W4, W11
	MOV	W0, W10
	CALL	_WIFI_Send_One_Array
	POP	W1
	POP.D	W4
;ESP_12F_DRV.c,226 :: 		SCL_Lat=0;
	BCLR.B	LATG, #2
;ESP_12F_DRV.c,221 :: 		for(i=0;i<NumOfTx;i++)
	INC	W1
;ESP_12F_DRV.c,228 :: 		}
; i end address is: 2 (W1)
	GOTO	L_ESP_Testing_Func57
L_ESP_Testing_Func58:
;ESP_12F_DRV.c,229 :: 		PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,BufferLength,(unsigned long)((unsigned long)NumOfTx*(unsigned long)BufferLength));
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
;ESP_12F_DRV.c,231 :: 		}
L_end_ESP_Testing_Func:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _ESP_Testing_Func

_ESP_Testing_Vz_Demo:
	LNK	#2174

;ESP_12F_DRV.c,233 :: 		void ESP_Testing_Vz_Demo(void)
;ESP_12F_DRV.c,236 :: 		unsigned int vz[60],i,j,k,NumOfTx=0,uiTemp,WifiCounter=0,LedOut=0,LedCount,NumOfCycle=30;
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
;ESP_12F_DRV.c,238 :: 		char SamplingCounter=0;
; SamplingCounter start address is: 10 (W5)
	CLR	W5
;ESP_12F_DRV.c,239 :: 		PrintOut(PrintHandler, "\rTest: Packets Transmiting...");
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
;ESP_12F_DRV.c,240 :: 		for(i=0;i<60;i++) vz[i]=300+i;
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
L_ESP_Testing_Vz_Demo60:
; i start address is: 6 (W3)
; SamplingCounter start address is: 14 (W7)
; NumOfCycle start address is: 16 (W8)
; LedOut start address is: 4 (W2)
; WifiCounter start address is: 10 (W5)
; NumOfTx start address is: 8 (W4)
	MOV	#60, W0
	CP	W3, W0
	BRA LTU	L__ESP_Testing_Vz_Demo203
	GOTO	L_ESP_Testing_Vz_Demo61
L__ESP_Testing_Vz_Demo203:
	ADD	W14, #0, W1
	SL	W3, #1, W0
	ADD	W1, W0, W1
	MOV	#300, W0
	ADD	W0, W3, [W1]
	INC	W3
; i end address is: 6 (W3)
	GOTO	L_ESP_Testing_Vz_Demo60
L_ESP_Testing_Vz_Demo61:
;ESP_12F_DRV.c,241 :: 		for(k=0;k<NumOfCycle;k++)
; k start address is: 6 (W3)
	CLR	W3
; LedOut end address is: 4 (W2)
; NumOfCycle end address is: 16 (W8)
; NumOfTx end address is: 8 (W4)
; k end address is: 6 (W3)
; SamplingCounter end address is: 14 (W7)
; WifiCounter end address is: 10 (W5)
	MOV	W2, W6
L_ESP_Testing_Vz_Demo63:
; k start address is: 6 (W3)
; NumOfTx start address is: 8 (W4)
; WifiCounter start address is: 10 (W5)
; LedOut start address is: 12 (W6)
; NumOfCycle start address is: 16 (W8)
; SamplingCounter start address is: 14 (W7)
	CP	W3, W8
	BRA LTU	L__ESP_Testing_Vz_Demo204
	GOTO	L_ESP_Testing_Vz_Demo64
L__ESP_Testing_Vz_Demo204:
;ESP_12F_DRV.c,243 :: 		asm clrwdt;
	CLRWDT
;ESP_12F_DRV.c,245 :: 		if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);} //run time 30uSec
	MOV	[W14+124], W2
	MOV	#1, W1
	MOV	#124, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
	CP	W2, #20
	BRA GEU	L__ESP_Testing_Vz_Demo205
	GOTO	L__ESP_Testing_Vz_Demo161
L__ESP_Testing_Vz_Demo205:
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
	GOTO	L_ESP_Testing_Vz_Demo66
L__ESP_Testing_Vz_Demo161:
L_ESP_Testing_Vz_Demo66:
;ESP_12F_DRV.c,246 :: 		if(SamplingCounter==0)
; LedOut start address is: 12 (W6)
	CP.B	W7, #0
	BRA Z	L__ESP_Testing_Vz_Demo206
	GOTO	L_ESP_Testing_Vz_Demo67
L__ESP_Testing_Vz_Demo206:
;ESP_12F_DRV.c,248 :: 		j=0;
	CLR	W0
	MOV	W0, [W14+120]
;ESP_12F_DRV.c,249 :: 		Wifi_Buffer[j++]=1;//ID
	MOV	#126, W2
	ADD	W14, W2, W2
	MOV.B	#1, W0
	MOV.B	W0, [W2]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,250 :: 		Wifi_Buffer[j++]=0;//Length MSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,251 :: 		Wifi_Buffer[j++]=120;//Length LSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,252 :: 		Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,253 :: 		for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
; i start address is: 18 (W9)
	CLR	W9
; LedOut end address is: 12 (W6)
; NumOfCycle end address is: 16 (W8)
; NumOfTx end address is: 8 (W4)
; k end address is: 6 (W3)
; SamplingCounter end address is: 14 (W7)
; WifiCounter end address is: 10 (W5)
; i end address is: 18 (W9)
L_ESP_Testing_Vz_Demo68:
; i start address is: 18 (W9)
; LedOut start address is: 12 (W6)
; SamplingCounter start address is: 14 (W7)
; NumOfCycle start address is: 16 (W8)
; WifiCounter start address is: 10 (W5)
; NumOfTx start address is: 8 (W4)
; k start address is: 6 (W3)
	MOV	#60, W0
	CP	W9, W0
	BRA LTU	L__ESP_Testing_Vz_Demo207
	GOTO	L_ESP_Testing_Vz_Demo69
L__ESP_Testing_Vz_Demo207:
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
	GOTO	L_ESP_Testing_Vz_Demo68
L_ESP_Testing_Vz_Demo69:
;ESP_12F_DRV.c,254 :: 		Wifi_Buffer[j++]=1;//ID
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
;ESP_12F_DRV.c,255 :: 		Wifi_Buffer[j++]=0;//Length MSB  PLC
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,256 :: 		Wifi_Buffer[j++]=20;//Length LSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#20, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,257 :: 		Wifi_Buffer[j++]=0x04;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,258 :: 		for(i=0;i<20;i++) Wifi_Buffer[j++];
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
L_ESP_Testing_Vz_Demo71:
; i start address is: 16 (W8)
; k start address is: 12 (W6)
; NumOfTx start address is: 4 (W2)
; WifiCounter start address is: 6 (W3)
; NumOfCycle start address is: 8 (W4)
; SamplingCounter start address is: 14 (W7)
; LedOut start address is: 10 (W5)
	CP	W8, #20
	BRA LTU	L__ESP_Testing_Vz_Demo208
	GOTO	L_ESP_Testing_Vz_Demo72
L__ESP_Testing_Vz_Demo208:
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
	INC	W8
; i end address is: 16 (W8)
	GOTO	L_ESP_Testing_Vz_Demo71
L_ESP_Testing_Vz_Demo72:
;ESP_12F_DRV.c,259 :: 		SamplingCounter++;
; SamplingCounter start address is: 0 (W0)
	ADD.B	W7, #1, W0
; SamplingCounter end address is: 14 (W7)
;ESP_12F_DRV.c,260 :: 		}
	PUSH	W0
; WifiCounter end address is: 6 (W3)
; SamplingCounter end address is: 0 (W0)
; NumOfTx end address is: 4 (W2)
; k end address is: 12 (W6)
; NumOfCycle end address is: 8 (W4)
; LedOut end address is: 10 (W5)
	MOV	W3, W0
	POP	W3
	GOTO	L_ESP_Testing_Vz_Demo74
L_ESP_Testing_Vz_Demo67:
;ESP_12F_DRV.c,263 :: 		Wifi_Buffer[j++]=1;//ID
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
;ESP_12F_DRV.c,264 :: 		Wifi_Buffer[j++]=0;//Length MSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,265 :: 		Wifi_Buffer[j++]=120;//Length LSB
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,266 :: 		Wifi_Buffer[j++]=0x01;// Velocity=0(bit 0)/Distance=1(bit 1)/PLC bit 2/Algo (bit 3-bit 7)
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W2, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#1, W1
	MOV	#120, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], [W0]
;ESP_12F_DRV.c,267 :: 		for (i=0; i < 60; i++) j=SInt2Array(vz[i],Wifi_Buffer,j);
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
L_ESP_Testing_Vz_Demo75:
; i start address is: 18 (W9)
; LedOut start address is: 6 (W3)
; SamplingCounter start address is: 16 (W8)
; NumOfCycle start address is: 8 (W4)
; WifiCounter start address is: 10 (W5)
; NumOfTx start address is: 14 (W7)
; k start address is: 12 (W6)
	MOV	#60, W0
	CP	W9, W0
	BRA LTU	L__ESP_Testing_Vz_Demo209
	GOTO	L_ESP_Testing_Vz_Demo76
L__ESP_Testing_Vz_Demo209:
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
	GOTO	L_ESP_Testing_Vz_Demo75
L_ESP_Testing_Vz_Demo76:
;ESP_12F_DRV.c,268 :: 		SamplingCounter++;
	ADD.B	W8, #1, W0
; SamplingCounter end address is: 16 (W8)
; SamplingCounter start address is: 2 (W1)
	MOV.B	W0, W1
;ESP_12F_DRV.c,269 :: 		if(SamplingCounter==5)
	CP.B	W0, #5
	BRA Z	L__ESP_Testing_Vz_Demo210
	GOTO	L__ESP_Testing_Vz_Demo162
L__ESP_Testing_Vz_Demo210:
; SamplingCounter end address is: 2 (W1)
;ESP_12F_DRV.c,271 :: 		uiTemp=j;
	MOV	[W14+120], W0
	MOV	W0, [W14+122]
;ESP_12F_DRV.c,272 :: 		NumOfTx++;
; NumOfTx start address is: 2 (W1)
	ADD	W7, #1, W1
; NumOfTx end address is: 14 (W7)
;ESP_12F_DRV.c,275 :: 		WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_Buffer,j);
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
;ESP_12F_DRV.c,277 :: 		SamplingCounter=0;
; SamplingCounter start address is: 0 (W0)
	CLR	W0
; NumOfTx end address is: 2 (W1)
; SamplingCounter end address is: 0 (W0)
	MOV	W1, W2
;ESP_12F_DRV.c,278 :: 		}
	GOTO	L_ESP_Testing_Vz_Demo78
L__ESP_Testing_Vz_Demo162:
;ESP_12F_DRV.c,269 :: 		if(SamplingCounter==5)
	MOV.B	W1, W0
	MOV	W7, W2
;ESP_12F_DRV.c,278 :: 		}
L_ESP_Testing_Vz_Demo78:
;ESP_12F_DRV.c,279 :: 		}
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
L_ESP_Testing_Vz_Demo74:
;ESP_12F_DRV.c,280 :: 		Delay_ms(10);
; NumOfTx start address is: 4 (W2)
; SamplingCounter start address is: 6 (W3)
; k start address is: 12 (W6)
; WifiCounter start address is: 0 (W0)
; NumOfCycle start address is: 8 (W4)
; LedOut start address is: 10 (W5)
	MOV	#53333, W7
L_ESP_Testing_Vz_Demo79:
	DEC	W7
	BRA NZ	L_ESP_Testing_Vz_Demo79
	NOP
;ESP_12F_DRV.c,282 :: 		if(WifiCounter++>WifiConnectionLimit)
	MOV	W0, W1
; WifiCounter start address is: 14 (W7)
	ADD	W0, #1, W7
; WifiCounter end address is: 0 (W0)
	MOV	#600, W0
	CP	W1, W0
	BRA GTU	L__ESP_Testing_Vz_Demo211
	GOTO	L__ESP_Testing_Vz_Demo163
L__ESP_Testing_Vz_Demo211:
; WifiCounter end address is: 14 (W7)
;ESP_12F_DRV.c,284 :: 		WifiCounter=0;
; WifiCounter start address is: 2 (W1)
	CLR	W1
;ESP_12F_DRV.c,285 :: 		if(CheckWifiConnection()==0)
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
	BRA Z	L__ESP_Testing_Vz_Demo212
	GOTO	L_ESP_Testing_Vz_Demo82
L__ESP_Testing_Vz_Demo212:
;ESP_12F_DRV.c,287 :: 		SendAtCommandToEsp("+++");
	PUSH	W1
	MOV	#lo_addr(?lstr47_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,288 :: 		PrintOut(PrintHandler, "\rWIFI Connection Not OK!");
	MOV	#lo_addr(?lstr_48_ESP_12F_DRV), W0
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;ESP_12F_DRV.c,291 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
	CP0.B	W0
	BRA Z	L__ESP_Testing_Vz_Demo213
	GOTO	L_ESP_Testing_Vz_Demo83
L__ESP_Testing_Vz_Demo213:
;ESP_12F_DRV.c,292 :: 		if(!ConnectToServer()) ConnectToServer();
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
	BRA Z	L__ESP_Testing_Vz_Demo214
	GOTO	L_ESP_Testing_Vz_Demo84
L__ESP_Testing_Vz_Demo214:
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_ConnectToServer
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
L_ESP_Testing_Vz_Demo84:
L_ESP_Testing_Vz_Demo83:
;ESP_12F_DRV.c,293 :: 		if(!CheckWifiConnection())
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
	BRA Z	L__ESP_Testing_Vz_Demo215
	GOTO	L_ESP_Testing_Vz_Demo85
L__ESP_Testing_Vz_Demo215:
;ESP_12F_DRV.c,294 :: 		if(!CheckWifiConnection())
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
	BRA Z	L__ESP_Testing_Vz_Demo216
	GOTO	L_ESP_Testing_Vz_Demo86
L__ESP_Testing_Vz_Demo216:
;ESP_12F_DRV.c,295 :: 		if(!CheckWifiConnection())
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
	BRA Z	L__ESP_Testing_Vz_Demo217
	GOTO	L_ESP_Testing_Vz_Demo87
L__ESP_Testing_Vz_Demo217:
;ESP_12F_DRV.c,297 :: 		if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);}
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
	BRA Z	L__ESP_Testing_Vz_Demo218
	GOTO	L_ESP_Testing_Vz_Demo88
L__ESP_Testing_Vz_Demo218:
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
L_ESP_Testing_Vz_Demo88:
;ESP_12F_DRV.c,298 :: 		ConnectingToWifiNet();
	PUSH	W1
	PUSH.D	W4
	PUSH	W6
	PUSH.D	W2
	CALL	_ConnectingToWifiNet
	POP.D	W2
	POP	W6
	POP.D	W4
	POP	W1
;ESP_12F_DRV.c,299 :: 		}
L_ESP_Testing_Vz_Demo87:
L_ESP_Testing_Vz_Demo86:
L_ESP_Testing_Vz_Demo85:
;ESP_12F_DRV.c,301 :: 		}
L_ESP_Testing_Vz_Demo82:
;ESP_12F_DRV.c,302 :: 		}
	MOV	W1, W0
	GOTO	L_ESP_Testing_Vz_Demo81
; WifiCounter end address is: 2 (W1)
L__ESP_Testing_Vz_Demo163:
;ESP_12F_DRV.c,282 :: 		if(WifiCounter++>WifiConnectionLimit)
	MOV	W7, W0
;ESP_12F_DRV.c,302 :: 		}
L_ESP_Testing_Vz_Demo81:
;ESP_12F_DRV.c,241 :: 		for(k=0;k<NumOfCycle;k++)
; WifiCounter start address is: 0 (W0)
; k start address is: 2 (W1)
	ADD	W6, #1, W1
; k end address is: 12 (W6)
;ESP_12F_DRV.c,303 :: 		}
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
	GOTO	L_ESP_Testing_Vz_Demo63
L_ESP_Testing_Vz_Demo64:
;ESP_12F_DRV.c,304 :: 		Read_Write_MCP23S17_IO(USER_LED,ON);
; NumOfTx start address is: 8 (W4)
	PUSH	W4
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
	POP	W4
;ESP_12F_DRV.c,305 :: 		PrintOut(PrintHandler, "\rEND OF Transmiting.\rNumber Of Packet:%u\rPacket Length:%u\rSUM:%lu",NumOfTx,uiTemp,(unsigned long)((unsigned long)NumOfTx*(unsigned long)uiTemp));
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
;ESP_12F_DRV.c,306 :: 		}
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

;ESP_12F_DRV.c,309 :: 		char *PullDataFromIDP(int *length,char *Buff)
;ESP_12F_DRV.c,313 :: 		if(strstr(Buff,"+IPD"))
	PUSH	W11
	PUSH.D	W10
	MOV	W11, W10
	MOV	#lo_addr(?lstr50_ESP_12F_DRV), W11
	CALL	_strstr
	POP.D	W10
	CP0	W0
	BRA NZ	L__PullDataFromIDP220
	GOTO	L_PullDataFromIDP89
L__PullDataFromIDP220:
;ESP_12F_DRV.c,316 :: 		p1=strstr(Buff,"+IPD,");
	PUSH	W10
	MOV	W11, W10
	MOV	#lo_addr(?lstr51_ESP_12F_DRV), W11
	CALL	_strstr
; p1 start address is: 4 (W2)
	MOV	W0, W2
;ESP_12F_DRV.c,317 :: 		p2=strstr(p1,":");
	MOV	#lo_addr(?lstr52_ESP_12F_DRV), W11
	MOV	W0, W10
	CALL	_strstr
	POP	W10
; p2 start address is: 12 (W6)
	MOV	W0, W6
;ESP_12F_DRV.c,318 :: 		if((p1)&&(p2))
	CP0	W2
	BRA NZ	L__PullDataFromIDP221
	GOTO	L__PullDataFromIDP151
L__PullDataFromIDP221:
	CP0	W6
	BRA NZ	L__PullDataFromIDP222
	GOTO	L__PullDataFromIDP150
L__PullDataFromIDP222:
L__PullDataFromIDP149:
;ESP_12F_DRV.c,320 :: 		i=5;
; i start address is: 14 (W7)
	MOV.B	#5, W7
; p2 end address is: 12 (W6)
; p1 end address is: 4 (W2)
; i end address is: 14 (W7)
;ESP_12F_DRV.c,321 :: 		while(p1[i]!=':')
L_PullDataFromIDP93:
; i start address is: 14 (W7)
; p2 start address is: 12 (W6)
; p1 start address is: 4 (W2)
	ZE	W7, W0
	ADD	W2, W0, W0
	MOV.B	[W0], W1
	MOV.B	#58, W0
	CP.B	W1, W0
	BRA NZ	L__PullDataFromIDP223
	GOTO	L_PullDataFromIDP94
L__PullDataFromIDP223:
;ESP_12F_DRV.c,323 :: 		text[i-5]=p1[i++];
	ZE	W7, W0
	SUB	W0, #5, W1
	ADD	W14, #0, W0
	ADD	W0, W1, W1
	ZE	W7, W0
	ADD	W2, W0, W0
	MOV.B	[W0], [W1]
	INC.B	W7
;ESP_12F_DRV.c,324 :: 		}
; p1 end address is: 4 (W2)
	GOTO	L_PullDataFromIDP93
L_PullDataFromIDP94:
;ESP_12F_DRV.c,325 :: 		text[i-5]=0;
	ZE	W7, W0
; i end address is: 14 (W7)
	SUB	W0, #5, W0
	ADD	W14, #0, W2
	ADD	W2, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;ESP_12F_DRV.c,326 :: 		*length=atoi(text);
	PUSH	W10
	MOV	W2, W10
	CALL	_atoi
	POP	W10
	MOV	W0, [W10]
;ESP_12F_DRV.c,327 :: 		p2++;
	ADD	W6, #1, W0
; p2 end address is: 12 (W6)
;ESP_12F_DRV.c,328 :: 		return p2;
	GOTO	L_end_PullDataFromIDP
;ESP_12F_DRV.c,318 :: 		if((p1)&&(p2))
L__PullDataFromIDP151:
L__PullDataFromIDP150:
;ESP_12F_DRV.c,330 :: 		else return 0;
	CLR	W0
	GOTO	L_end_PullDataFromIDP
;ESP_12F_DRV.c,331 :: 		}
L_PullDataFromIDP89:
;ESP_12F_DRV.c,332 :: 		}
L_end_PullDataFromIDP:
	POP	W11
	ULNK
	RETURN
; end of _PullDataFromIDP

_CheckDataFromGateway:

;ESP_12F_DRV.c,334 :: 		char CheckDataFromGateway(void)
;ESP_12F_DRV.c,338 :: 		if((ESP_RX_Int_Flag)&&(strstr(ESP_RX_Buffer,"+IPD")))
	PUSH	W10
	PUSH	W11
	BTSS	IFS0bits, #11
	GOTO	L__CheckDataFromGateway154
	MOV	#lo_addr(?lstr53_ESP_12F_DRV), W11
	MOV	#lo_addr(_ESP_RX_Buffer), W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__CheckDataFromGateway225
	GOTO	L__CheckDataFromGateway153
L__CheckDataFromGateway225:
L__CheckDataFromGateway152:
;ESP_12F_DRV.c,340 :: 		if(!(p=PullDataFromIDP(&Gateway_Buffer_Length,ESP_RX_Buffer))) {Data_From_Gateway_Flag=FALSE;return 0;}
	MOV	#lo_addr(_ESP_RX_Buffer), W11
	MOV	#lo_addr(_Gateway_Buffer_Length), W10
	CALL	_PullDataFromIDP
; p start address is: 4 (W2)
	MOV	W0, W2
	CP0	W0
	BRA Z	L__CheckDataFromGateway226
	GOTO	L_CheckDataFromGateway99
L__CheckDataFromGateway226:
; p end address is: 4 (W2)
	MOV	#lo_addr(_Data_From_Gateway_Flag), W1
	CLR	W0
	MOV.B	W0, [W1]
	CLR	W0
	GOTO	L_end_CheckDataFromGateway
L_CheckDataFromGateway99:
;ESP_12F_DRV.c,341 :: 		Data_From_Gateway_Flag=TRUE;
; p start address is: 4 (W2)
	MOV	#lo_addr(_Data_From_Gateway_Flag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;ESP_12F_DRV.c,342 :: 		for(i=0;i<Gateway_Buffer_Length;i++) ESP_GateWay_Buffer[i]=p[i];
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_CheckDataFromGateway100:
; i start address is: 6 (W3)
; p start address is: 4 (W2)
; p end address is: 4 (W2)
	MOV	#lo_addr(_Gateway_Buffer_Length), W0
	CP	W3, [W0]
	BRA LTU	L__CheckDataFromGateway227
	GOTO	L_CheckDataFromGateway101
L__CheckDataFromGateway227:
; p end address is: 4 (W2)
; p start address is: 4 (W2)
	MOV	#lo_addr(_ESP_GateWay_Buffer), W0
	ADD	W0, W3, W1
	ADD	W2, W3, W0
	MOV.B	[W0], [W1]
	INC	W3
; p end address is: 4 (W2)
; i end address is: 6 (W3)
	GOTO	L_CheckDataFromGateway100
L_CheckDataFromGateway101:
;ESP_12F_DRV.c,347 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;ESP_12F_DRV.c,348 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;ESP_12F_DRV.c,349 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_CheckDataFromGateway
;ESP_12F_DRV.c,338 :: 		if((ESP_RX_Int_Flag)&&(strstr(ESP_RX_Buffer,"+IPD")))
L__CheckDataFromGateway154:
L__CheckDataFromGateway153:
;ESP_12F_DRV.c,351 :: 		else return 0;
	CLR	W0
;ESP_12F_DRV.c,352 :: 		}
;ESP_12F_DRV.c,351 :: 		else return 0;
;ESP_12F_DRV.c,352 :: 		}
L_end_CheckDataFromGateway:
	POP	W11
	POP	W10
	RETURN
; end of _CheckDataFromGateway

_GetEspData:

;ESP_12F_DRV.c,354 :: 		char GetEspData(unsigned long TimeOut_uSec_Start)
;ESP_12F_DRV.c,356 :: 		unsigned long ulTemp=0;
; ulTemp start address is: 16 (W8)
	CLR	W8
	CLR	W9
;ESP_12F_DRV.c,358 :: 		if(CheckDataFromGateway()) return 2;
	PUSH.D	W10
	CALL	_CheckDataFromGateway
	POP.D	W10
	CP0.B	W0
	BRA NZ	L__GetEspData229
	GOTO	L_GetEspData104
L__GetEspData229:
; ulTemp end address is: 16 (W8)
	MOV.B	#2, W0
	GOTO	L_end_GetEspData
L_GetEspData104:
;ESP_12F_DRV.c,359 :: 		else {ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;}
; ulTemp start address is: 16 (W8)
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
; ulTemp end address is: 16 (W8)
	MOV.D	W8, W2
;ESP_12F_DRV.c,360 :: 		while((ulTemp++<TimeOut_uSec_Start)&&(ESP_RX_Int_Flag==0)) {asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;asm clrwdt;} //For correct TIME OUT
L_GetEspData106:
; ulTemp start address is: 4 (W2)
; ulTemp start address is: 4 (W2)
	MOV.D	W2, W0
	ADD	W2, #1, W2
	ADDC	W3, #0, W3
; ulTemp end address is: 4 (W2)
	CP	W0, W10
	CPB	W1, W11
	BRA LTU	L__GetEspData230
	GOTO	L__GetEspData157
L__GetEspData230:
; ulTemp end address is: 4 (W2)
; ulTemp start address is: 4 (W2)
	BTSC	IFS0bits, #11
	GOTO	L__GetEspData156
L__GetEspData155:
	CLRWDT
	CLRWDT
	CLRWDT
	CLRWDT
	CLRWDT
; ulTemp end address is: 4 (W2)
	GOTO	L_GetEspData106
L__GetEspData157:
L__GetEspData156:
;ESP_12F_DRV.c,361 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;ESP_12F_DRV.c,362 :: 		if(ESP_RX_Int_Flag)
	BTSS	IFS0bits, #11
	GOTO	L_GetEspData110
;ESP_12F_DRV.c,364 :: 		if(CheckDataFromGateway()) return 2;
	PUSH.D	W10
	CALL	_CheckDataFromGateway
	POP.D	W10
	CP0.B	W0
	BRA NZ	L__GetEspData231
	GOTO	L_GetEspData111
L__GetEspData231:
	MOV.B	#2, W0
	GOTO	L_end_GetEspData
L_GetEspData111:
;ESP_12F_DRV.c,368 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;ESP_12F_DRV.c,369 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_GetEspData
;ESP_12F_DRV.c,370 :: 		}
L_GetEspData110:
;ESP_12F_DRV.c,371 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;ESP_12F_DRV.c,372 :: 		return 0;
	CLR	W0
;ESP_12F_DRV.c,373 :: 		}
L_end_GetEspData:
	RETURN
; end of _GetEspData

_ReConnectToServer:

;ESP_12F_DRV.c,375 :: 		char ReConnectToServer(void)
;ESP_12F_DRV.c,378 :: 		LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);
	PUSH	W10
	PUSH	W11
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_LED_Activation
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
;ESP_12F_DRV.c,379 :: 		SendAtCommandToEsp("+++");
	MOV	#lo_addr(?lstr54_ESP_12F_DRV), W10
	CALL	_SendAtCommandToEsp
;ESP_12F_DRV.c,380 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ReConnectToServer233
	GOTO	L_ReConnectToServer112
L__ReConnectToServer233:
;ESP_12F_DRV.c,381 :: 		if(!ConnectToServer())
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ReConnectToServer234
	GOTO	L_ReConnectToServer113
L__ReConnectToServer234:
;ESP_12F_DRV.c,382 :: 		if(!ConnectToServer()) ConnectToServer();
	CALL	_ConnectToServer
	CP0.B	W0
	BRA Z	L__ReConnectToServer235
	GOTO	L_ReConnectToServer114
L__ReConnectToServer235:
	CALL	_ConnectToServer
L_ReConnectToServer114:
L_ReConnectToServer113:
L_ReConnectToServer112:
;ESP_12F_DRV.c,383 :: 		if(!CheckWifiConnection())
	CALL	_CheckWifiConnection
	CP0.B	W0
	BRA Z	L__ReConnectToServer236
	GOTO	L_ReConnectToServer115
L__ReConnectToServer236:
;ESP_12F_DRV.c,384 :: 		if(!CheckWifiConnection())
	CALL	_CheckWifiConnection
	CP0.B	W0
	BRA Z	L__ReConnectToServer237
	GOTO	L_ReConnectToServer116
L__ReConnectToServer237:
;ESP_12F_DRV.c,385 :: 		if(!CheckWifiConnection())
	CALL	_CheckWifiConnection
	CP0.B	W0
	BRA Z	L__ReConnectToServer238
	GOTO	L_ReConnectToServer117
L__ReConnectToServer238:
;ESP_12F_DRV.c,387 :: 		return ConnectingToWifiNet();
	CALL	_ConnectingToWifiNet
	GOTO	L_end_ReConnectToServer
;ESP_12F_DRV.c,388 :: 		}
L_ReConnectToServer117:
L_ReConnectToServer116:
L_ReConnectToServer115:
;ESP_12F_DRV.c,389 :: 		LED_Activation(LED_RED,LED_ON);LED_Activation(LED_GREEN,LED_ON);
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
	CLR	W11
	MOV.B	#4, W10
	CALL	_LED_Activation
;ESP_12F_DRV.c,390 :: 		return 1;
	MOV.B	#1, W0
;ESP_12F_DRV.c,392 :: 		}
;ESP_12F_DRV.c,390 :: 		return 1;
;ESP_12F_DRV.c,392 :: 		}
L_end_ReConnectToServer:
	POP	W11
	POP	W10
	RETURN
; end of _ReConnectToServer

_RunAlgorithmAndBuiledTxParametersPacket:

;ESP_12F_DRV.c,394 :: 		void RunAlgorithmAndBuiledTxParametersPacket(void)
;ESP_12F_DRV.c,397 :: 		switch (AlgorithmTypeParametr)
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket118
;ESP_12F_DRV.c,399 :: 		case No_Algo:
L_RunAlgorithmAndBuiledTxParametersPacket120:
;ESP_12F_DRV.c,400 :: 		OpticDataGetCleanBuffer();
	CALL	_OpticDataGetCleanBuffer
;ESP_12F_DRV.c,401 :: 		return;
	GOTO	L_end_RunAlgorithmAndBuiledTxParametersPacket
;ESP_12F_DRV.c,403 :: 		case Algo_2:
L_RunAlgorithmAndBuiledTxParametersPacket121:
;ESP_12F_DRV.c,404 :: 		Vz_Algorithm_2();
	CALL	_Vz_Algorithm_2
;ESP_12F_DRV.c,405 :: 		if(Algo_Parametrs_Out_Buffer[0])
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W0
	CP0.B	[W0]
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket240
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket122
L__RunAlgorithmAndBuiledTxParametersPacket240:
;ESP_12F_DRV.c,407 :: 		WifiBufferLength++;
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,408 :: 		Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,409 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,410 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_2_Buffer_Length;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,411 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_2;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,412 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[1];
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+1), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,413 :: 		Wifi_TX_Buffer[WifiBufferLength]=Algo_Parametrs_Out_Buffer[2];
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+2), W0
	MOV.B	[W0], [W1]
;ESP_12F_DRV.c,414 :: 		}
L_RunAlgorithmAndBuiledTxParametersPacket122:
;ESP_12F_DRV.c,415 :: 		break;
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket119
;ESP_12F_DRV.c,416 :: 		case Algo_3_4:
L_RunAlgorithmAndBuiledTxParametersPacket123:
;ESP_12F_DRV.c,417 :: 		Vz_Algorithm_3_4();
	CALL	_Vz_Algorithm_3_4
;ESP_12F_DRV.c,418 :: 		if(Algo_Parametrs_Out_Buffer[0])
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W0
	CP0.B	[W0]
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket241
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket124
L__RunAlgorithmAndBuiledTxParametersPacket241:
;ESP_12F_DRV.c,420 :: 		Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,421 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,422 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_3_4_Buffer_Length;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#22, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,423 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_3_4;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,424 :: 		for(i=1;i<=Algo_3_4_Buffer_Length;i++) Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[i];
; i start address is: 4 (W2)
	MOV	#1, W2
; i end address is: 4 (W2)
L_RunAlgorithmAndBuiledTxParametersPacket125:
; i start address is: 4 (W2)
	CP	W2, #22
	BRA LEU	L__RunAlgorithmAndBuiledTxParametersPacket242
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket126
L__RunAlgorithmAndBuiledTxParametersPacket242:
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W0
	ADD	W0, W2, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket125
L_RunAlgorithmAndBuiledTxParametersPacket126:
;ESP_12F_DRV.c,425 :: 		}
L_RunAlgorithmAndBuiledTxParametersPacket124:
;ESP_12F_DRV.c,426 :: 		break;
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket119
;ESP_12F_DRV.c,427 :: 		case Algo_5:
L_RunAlgorithmAndBuiledTxParametersPacket128:
;ESP_12F_DRV.c,428 :: 		Vz_Algorithm_5();
	CALL	_Vz_Algorithm_5
;ESP_12F_DRV.c,429 :: 		if(Algo_Parametrs_Out_Buffer[0])
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W0
	CP0.B	[W0]
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket243
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket129
L__RunAlgorithmAndBuiledTxParametersPacket243:
;ESP_12F_DRV.c,431 :: 		Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,432 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,433 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_5_Buffer_Length;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,434 :: 		Wifi_TX_Buffer[WifiBufferLength++]=Algo_5;
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,435 :: 		for(i=1;i<=Algo_5_Buffer_Length;i++) Wifi_TX_Buffer[WifiBufferLength++]=Algo_Parametrs_Out_Buffer[i];
; i start address is: 4 (W2)
	MOV	#1, W2
; i end address is: 4 (W2)
L_RunAlgorithmAndBuiledTxParametersPacket130:
; i start address is: 4 (W2)
	CP	W2, #10
	BRA LEU	L__RunAlgorithmAndBuiledTxParametersPacket244
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket131
L__RunAlgorithmAndBuiledTxParametersPacket244:
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W0
	ADD	W0, W2, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket130
L_RunAlgorithmAndBuiledTxParametersPacket131:
;ESP_12F_DRV.c,436 :: 		}
L_RunAlgorithmAndBuiledTxParametersPacket129:
;ESP_12F_DRV.c,437 :: 		break;
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket119
;ESP_12F_DRV.c,438 :: 		}
L_RunAlgorithmAndBuiledTxParametersPacket118:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket245
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket120
L__RunAlgorithmAndBuiledTxParametersPacket245:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket246
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket121
L__RunAlgorithmAndBuiledTxParametersPacket246:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket247
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket123
L__RunAlgorithmAndBuiledTxParametersPacket247:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__RunAlgorithmAndBuiledTxParametersPacket248
	GOTO	L_RunAlgorithmAndBuiledTxParametersPacket128
L__RunAlgorithmAndBuiledTxParametersPacket248:
L_RunAlgorithmAndBuiledTxParametersPacket119:
;ESP_12F_DRV.c,439 :: 		}
L_end_RunAlgorithmAndBuiledTxParametersPacket:
	RETURN
; end of _RunAlgorithmAndBuiledTxParametersPacket

_AddRawDataToWifiBuffer:

;ESP_12F_DRV.c,441 :: 		void AddRawDataToWifiBuffer(void)
;ESP_12F_DRV.c,444 :: 		if(AlgorithmTypeParametr==No_Algo)
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__AddRawDataToWifiBuffer250
	GOTO	L_AddRawDataToWifiBuffer133
L__AddRawDataToWifiBuffer250:
;ESP_12F_DRV.c,446 :: 		OpticDataGetFrame_AllData(void);
	CALL	_OpticDataGetFrame_AllData
;ESP_12F_DRV.c,447 :: 		Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,448 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,449 :: 		Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,450 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;// Velocity=0(bit 0)/Distance=1(bit 1)
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,451 :: 		for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_AddRawDataToWifiBuffer134:
; i start address is: 4 (W2)
	MOV.B	#60, W0
	CP.B	W2, W0
	BRA LTU	L__AddRawDataToWifiBuffer251
	GOTO	L_AddRawDataToWifiBuffer135
L__AddRawDataToWifiBuffer251:
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W2
	MOV	_WifiBufferLength, W12
	CLR	W13
	MOV	#lo_addr(_Wifi_TX_Buffer), W11
	MOV	W0, W10
	CALL	_SInt2Array
	POP	W2
	MOV	W0, _WifiBufferLength
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_AddRawDataToWifiBuffer134
L_AddRawDataToWifiBuffer135:
;ESP_12F_DRV.c,452 :: 		Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,453 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,454 :: 		Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,455 :: 		Wifi_TX_Buffer[WifiBufferLength++]=1;// Velocity=0(bit 0)/Distance=1(bit 1)
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,456 :: 		for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Distance_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_AddRawDataToWifiBuffer137:
; i start address is: 4 (W2)
	MOV.B	#60, W0
	CP.B	W2, W0
	BRA LTU	L__AddRawDataToWifiBuffer252
	GOTO	L_AddRawDataToWifiBuffer138
L__AddRawDataToWifiBuffer252:
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W2
	MOV	_WifiBufferLength, W12
	CLR	W13
	MOV	#lo_addr(_Wifi_TX_Buffer), W11
	MOV	W0, W10
	CALL	_SInt2Array
	POP	W2
	MOV	W0, _WifiBufferLength
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_AddRawDataToWifiBuffer137
L_AddRawDataToWifiBuffer138:
;ESP_12F_DRV.c,457 :: 		return;
	GOTO	L_end_AddRawDataToWifiBuffer
;ESP_12F_DRV.c,459 :: 		}
L_AddRawDataToWifiBuffer133:
;ESP_12F_DRV.c,460 :: 		else if(AlgorithmTypeParametr==Algo_5)
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__AddRawDataToWifiBuffer253
	GOTO	L_AddRawDataToWifiBuffer141
L__AddRawDataToWifiBuffer253:
;ESP_12F_DRV.c,462 :: 		Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,463 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,464 :: 		Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,465 :: 		Wifi_TX_Buffer[WifiBufferLength++]=1;// Velocity=0(bit 0)/Distance=1(bit 1)
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,466 :: 		for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Distance_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_AddRawDataToWifiBuffer142:
; i start address is: 4 (W2)
	MOV.B	#60, W0
	CP.B	W2, W0
	BRA LTU	L__AddRawDataToWifiBuffer254
	GOTO	L_AddRawDataToWifiBuffer143
L__AddRawDataToWifiBuffer254:
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W2
	MOV	_WifiBufferLength, W12
	CLR	W13
	MOV	#lo_addr(_Wifi_TX_Buffer), W11
	MOV	W0, W10
	CALL	_SInt2Array
	POP	W2
	MOV	W0, _WifiBufferLength
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_AddRawDataToWifiBuffer142
L_AddRawDataToWifiBuffer143:
;ESP_12F_DRV.c,467 :: 		return;
	GOTO	L_end_AddRawDataToWifiBuffer
;ESP_12F_DRV.c,468 :: 		}
L_AddRawDataToWifiBuffer141:
;ESP_12F_DRV.c,470 :: 		{          Wifi_TX_Buffer[WifiBufferLength++]=EndUnitID;//ID
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,471 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;//Length MSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,472 :: 		Wifi_TX_Buffer[WifiBufferLength++]=120;//Length LSB
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,473 :: 		Wifi_TX_Buffer[WifiBufferLength++]=0;// Velocity=0(bit 0)/Distance=1(bit 1)
	MOV	#lo_addr(_Wifi_TX_Buffer), W1
	MOV	#lo_addr(_WifiBufferLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	_WifiBufferLength, W0
	INC	W0
	MOV	W0, _WifiBufferLength
;ESP_12F_DRV.c,474 :: 		for (i=0; i < 60; i++) WifiBufferLength=SInt2Array(Vz_Sensor_Velocity_Buffer_int[i],Wifi_TX_Buffer,WifiBufferLength);
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_AddRawDataToWifiBuffer146:
; i start address is: 4 (W2)
	MOV.B	#60, W0
	CP.B	W2, W0
	BRA LTU	L__AddRawDataToWifiBuffer255
	GOTO	L_AddRawDataToWifiBuffer147
L__AddRawDataToWifiBuffer255:
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W2
	MOV	_WifiBufferLength, W12
	CLR	W13
	MOV	#lo_addr(_Wifi_TX_Buffer), W11
	MOV	W0, W10
	CALL	_SInt2Array
	POP	W2
	MOV	W0, _WifiBufferLength
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_AddRawDataToWifiBuffer146
L_AddRawDataToWifiBuffer147:
;ESP_12F_DRV.c,477 :: 		}
;ESP_12F_DRV.c,475 :: 		return;
;ESP_12F_DRV.c,477 :: 		}
L_end_AddRawDataToWifiBuffer:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _AddRawDataToWifiBuffer

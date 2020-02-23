
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68
	LNK	#8

;Main.c,38 :: 		void main()
;Main.c,40 :: 		char LedCount=0,LedOut=0,OpticDataFlag;
	PUSH	W10
	PUSH	W11
	MOV	#0, W0
	MOV.B	W0, [W14+1]
	MOV	#0, W0
	MOV.B	W0, [W14+2]
;Main.c,41 :: 		unsigned int WifiCounter=0,VZCounter=0,i,SamplingCounter=0,k;
	MOV	#0, W0
	MOV	W0, [W14+4]
	MOV	#0, W0
	MOV	W0, [W14+6]
;Main.c,43 :: 		BoardInit();
	CALL	_BoardInit
;Main.c,44 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;Main.c,45 :: 		LED_Activation(LED_GREEN,LED_ON);
	CLR	W11
	MOV.B	#4, W10
	CALL	_LED_Activation
;Main.c,46 :: 		Init_uClick_VZ();
	CALL	_Init_uClick_VZ
;Main.c,48 :: 		ConfigFileInit(ExtEeprom_WriteByte,ExtEeprom_ReadByte);
	MOV	#lo_addr(_ExtEeprom_ReadByte), W11
	MOV	#lo_addr(_ExtEeprom_WriteByte), W10
	CALL	_ConfigFileInit
;Main.c,49 :: 		initConfig();
	CALL	_initConfig
;Main.c,54 :: 		if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);wifi_state=0;}
	CALL	_Init_ESP
	CP0.B	W0
	BRA Z	L__main68
	GOTO	L_main0
L__main68:
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_LED_Activation
	CLR	W11
	MOV.B	#3, W10
	CALL	_LED_Activation
	MOV	#lo_addr(_wifi_state), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_main1
L_main0:
;Main.c,55 :: 		else wifi_state=ConnectingToWifiNet();
	CALL	_ConnectingToWifiNet
	MOV	#lo_addr(_wifi_state), W1
	MOV.B	W0, [W1]
L_main1:
;Main.c,57 :: 		PrintOut(PrintHandler, "\r***** S T A R T - M a i n *******");
	MOV	#lo_addr(?lstr_1_Main), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;Main.c,58 :: 		while(TRUE)
L_main2:
;Main.c,60 :: 		asm clrwdt;
	CLRWDT
;Main.c,63 :: 		if(VZ_ON_Flag)
	MOV	#lo_addr(_VZ_ON_Flag), W0
	CP0.B	[W0]
	BRA NZ	L__main69
	GOTO	L_main4
L__main69:
;Main.c,65 :: 		while((!(OpticDataFlag=OpticDataCheckIfReady()))&&(VZCounter++<15000)) {asm clrwdt;Delay_us(1);}
L_main5:
	CALL	_OpticDataCheckIfReady
	MOV.B	W0, [W14+0]
	CP0.B	W0
	BRA Z	L__main70
	GOTO	L__main57
L__main70:
	MOV	[W14+6], W2
	MOV	[W14+6], W1
	ADD	W14, #6, W0
	ADD	W1, #1, [W0]
	MOV	#15000, W0
	CP	W2, W0
	BRA LTU	L__main71
	GOTO	L__main56
L__main71:
L__main55:
	CLRWDT
	MOV	#5, W7
L_main9:
	DEC	W7
	BRA NZ	L_main9
	NOP
	GOTO	L_main5
L__main57:
L__main56:
;Main.c,66 :: 		if(OpticDataFlag)
	ADD	W14, #0, W0
	CP0.B	[W0]
	BRA NZ	L__main72
	GOTO	L_main11
L__main72:
;Main.c,68 :: 		SCL_Lat^=1;
	BTG	LATG, #2
;Main.c,69 :: 		if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);} //run time 30uSec
	MOV.B	[W14+1], W2
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
	CP.B	W2, #20
	BRA GEU	L__main73
	GOTO	L_main12
L__main73:
	MOV.B	[W14+2], W2
	MOV.B	#255, W1
	ADD	W14, #2, W0
	XOR.B	W2, W1, [W0]
	CLR	W0
	MOV.B	W0, [W14+1]
	MOV.B	[W14+2], W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
L_main12:
;Main.c,72 :: 		if((AlgorithmTypeParametr!=No_Algo)||((AlgorithmTypeParametr==No_Algo)&&(RawDataTX_Enable==FALSE))) RunAlgorithmAndBuiledTxParametersPacket();
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__main74
	GOTO	L__main60
L__main74:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__main75
	GOTO	L__main59
L__main75:
	MOV	#lo_addr(_RawDataTX_Enable), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__main76
	GOTO	L__main58
L__main76:
	GOTO	L__main53
L__main59:
L__main58:
	GOTO	L_main17
L__main53:
L__main60:
	CALL	_RunAlgorithmAndBuiledTxParametersPacket
L_main17:
;Main.c,73 :: 		if(RawDataTX_Enable==TRUE) AddRawDataToWifiBuffer();
	MOV	#lo_addr(_RawDataTX_Enable), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__main77
	GOTO	L_main18
L__main77:
	CALL	_AddRawDataToWifiBuffer
L_main18:
;Main.c,77 :: 		if(WifiBufferLength)
	MOV	#lo_addr(_WifiBufferLength), W0
	CP0	[W0]
	BRA NZ	L__main78
	GOTO	L_main19
L__main78:
;Main.c,79 :: 		WIFI_Send_One_Array_Not_Wait_To_OK(Wifi_TX_Buffer,WifiBufferLength);
	MOV	_WifiBufferLength, W11
	MOV	#lo_addr(_Wifi_TX_Buffer), W10
	CALL	_WIFI_Send_One_Array_Not_Wait_To_OK
;Main.c,80 :: 		WifiBufferLength=0;
	CLR	W0
	MOV	W0, _WifiBufferLength
;Main.c,81 :: 		}
L_main19:
;Main.c,83 :: 		}
	GOTO	L_main20
L_main11:
;Main.c,84 :: 		else OpticDataGetCleanBuffer();
	CALL	_OpticDataGetCleanBuffer
L_main20:
;Main.c,85 :: 		}
	GOTO	L_main21
L_main4:
;Main.c,86 :: 		else Delay_ms(10);
	MOV	#53333, W7
L_main22:
	DEC	W7
	BRA NZ	L_main22
	NOP
L_main21:
;Main.c,87 :: 		VZCounter=0;
	CLR	W0
	MOV	W0, [W14+6]
;Main.c,90 :: 		if(Data_From_Gateway_Flag)
	MOV	#lo_addr(_Data_From_Gateway_Flag), W0
	CP0.B	[W0]
	BRA NZ	L__main79
	GOTO	L_main24
L__main79:
;Main.c,94 :: 		parssData(ESP_GateWay_Buffer, Gateway_Buffer_Length);
	MOV	_Gateway_Buffer_Length, W11
	MOV	#lo_addr(_ESP_GateWay_Buffer), W10
	CALL	_parssData
;Main.c,98 :: 		Data_From_Gateway_Flag=FALSE;
	MOV	#lo_addr(_Data_From_Gateway_Flag), W1
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,99 :: 		}
L_main24:
;Main.c,102 :: 		if(WifiCounter++>WifiConnectionLimit)
	MOV	[W14+4], W2
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #1, [W0]
	MOV	#600, W0
	CP	W2, W0
	BRA GTU	L__main80
	GOTO	L_main25
L__main80:
;Main.c,104 :: 		WifiCounter=0;
	CLR	W0
	MOV	W0, [W14+4]
;Main.c,105 :: 		if(CheckWifiConnection()==0) wifi_state= ReConnectToServer();
	CALL	_CheckWifiConnection
	CP.B	W0, #0
	BRA Z	L__main81
	GOTO	L_main26
L__main81:
	CALL	_ReConnectToServer
	MOV	#lo_addr(_wifi_state), W1
	MOV.B	W0, [W1]
L_main26:
;Main.c,106 :: 		}
L_main25:
;Main.c,109 :: 		CheckAndSwitchToBattery();
	CALL	_CheckAndSwitchToBattery
;Main.c,110 :: 		}
	GOTO	L_main2
;Main.c,111 :: 		}
L_end_main:
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_Init_uClick_VZ:

;Main.c,118 :: 		void Init_uClick_VZ(void)
;Main.c,120 :: 		Mikrobus_PowerOut_Enable(ON,100);
	PUSH	W10
	PUSH	W11
	MOV	#100, W11
	MOV.B	#1, W10
	CALL	_Mikrobus_PowerOut_Enable
;Main.c,121 :: 		CheckAndSwitchToBattery();
	CALL	_CheckAndSwitchToBattery
;Main.c,122 :: 		SPI1_Init();
	CALL	_SPI1_Init
;Main.c,123 :: 		SPI1_Initialize_MCP();
	CALL	_SPI1_Initialize_MCP
;Main.c,124 :: 		Delay_ms(10);
	MOV	#53333, W7
L_Init_uClick_VZ27:
	DEC	W7
	BRA NZ	L_Init_uClick_VZ27
	NOP
;Main.c,125 :: 		INT_MIKROBUS_Tris=INPUT;
	BSET.B	TRISF, #6
;Main.c,126 :: 		CS_SRAM_Tris=OUTPUT;
	BCLR	TRISD, #9
;Main.c,127 :: 		CS_SRAM_Lat=ON;
	BSET	LATD, #9
;Main.c,128 :: 		CS_MCP23S17_Lat=ON;
	BSET.B	LATB, #5
;Main.c,129 :: 		CS_MCP23S17_Buff=DIGITAL;
	BCLR.B	ANSB, #5
;Main.c,130 :: 		CS_MCP23S17_Tris=OUTPUT;
	BCLR.B	TRISB, #5
;Main.c,131 :: 		CS_SC16IS740_Tris=OUTPUT;
	BCLR.B	TRISE, #5
;Main.c,132 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;Main.c,133 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;Main.c,134 :: 		Init_MCP23S17();
	CALL	_Init_MCP23S17
;Main.c,135 :: 		Init_SC16IS740();
	CALL	_Init_SC16IS740
;Main.c,136 :: 		Read_Write_MCP23S17_IO(EN_1_8V,ON);
	MOV.B	#1, W11
	CLR	W10
	CALL	_Read_Write_MCP23S17_IO
;Main.c,137 :: 		Read_Write_MCP23S17_IO(USER_LED,ON);
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
;Main.c,138 :: 		Init_SRAM();
	CALL	_Init_SRAM
;Main.c,139 :: 		Init_ExtEeprom();
	CALL	_Init_ExtEeprom
;Main.c,140 :: 		}
L_end_Init_uClick_VZ:
	POP	W11
	POP	W10
	RETURN
; end of _Init_uClick_VZ

_UART2_Interrupt:
	LNK	#2
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Main.c,147 :: 		void UART2_Interrupt() iv IVT_ADDR_U2RXINTERRUPT
;Main.c,149 :: 		unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=(UART2_RX_Buffer_Length-1);
; time_counter start address is: 0 (W0)
	CLR	W0
; TimeLimit start address is: 2 (W1)
	MOV	#100, W1
; uiTemp start address is: 4 (W2)
	MOV	#199, W2
;Main.c,150 :: 		U2STAbits.OERR=0;
	BCLR.B	U2STAbits, #1
;Main.c,151 :: 		Uart2_RX_Int_En=0;
	BCLR	IEC1bits, #14
;Main.c,152 :: 		Uart2_Rx_Int_Flag=1;
	BSET	IFS1bits, #14
;Main.c,153 :: 		i=0;
; i start address is: 6 (W3)
	CLR	W3
; TimeLimit end address is: 2 (W1)
; uiTemp end address is: 4 (W2)
; i end address is: 6 (W3)
; time_counter end address is: 0 (W0)
	MOV	W3, W4
	MOV	W2, W3
	MOV	W1, W2
;Main.c,154 :: 		while(1)
L_UART2_Interrupt29:
;Main.c,156 :: 		while((!Uart2_Data_Ready()) && (time_counter < TimeLimit))
; i start address is: 8 (W4)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
; time_counter start address is: 0 (W0)
; time_counter end address is: 0 (W0)
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
	MOV	W0, W1
L_UART2_Interrupt31:
; time_counter start address is: 2 (W1)
; TimeLimit start address is: 4 (W2)
; uiTemp start address is: 6 (W3)
; i start address is: 8 (W4)
	CALL	_UART2_Data_Ready
	CP0	W0
	BRA Z	L__UART2_Interrupt85
	GOTO	L__UART2_Interrupt63
L__UART2_Interrupt85:
	CP	W1, W2
	BRA LTU	L__UART2_Interrupt86
	GOTO	L__UART2_Interrupt62
L__UART2_Interrupt86:
L__UART2_Interrupt61:
;Main.c,158 :: 		Delay_us(100);
	MOV	#533, W7
L_UART2_Interrupt35:
	DEC	W7
	BRA NZ	L_UART2_Interrupt35
	NOP
;Main.c,159 :: 		time_counter++;
	INC	W1
;Main.c,160 :: 		}
	GOTO	L_UART2_Interrupt31
;Main.c,156 :: 		while((!Uart2_Data_Ready()) && (time_counter < TimeLimit))
L__UART2_Interrupt63:
L__UART2_Interrupt62:
;Main.c,161 :: 		if (time_counter<TimeLimit)
	CP	W1, W2
	BRA LTU	L__UART2_Interrupt87
	GOTO	L_UART2_Interrupt37
L__UART2_Interrupt87:
; time_counter end address is: 2 (W1)
;Main.c,163 :: 		time_counter=0;
; time_counter start address is: 10 (W5)
	CLR	W5
;Main.c,164 :: 		if (i<uiTemp) UART2_RX_Interrupt_Buffer[i++]=Uart2_Read();
	CP	W4, W3
	BRA LTU	L__UART2_Interrupt88
	GOTO	L_UART2_Interrupt38
L__UART2_Interrupt88:
	MOV	#lo_addr(_UART2_RX_Interrupt_Buffer), W0
	ADD	W0, W4, W0
	MOV	W0, [W14+0]
	CALL	_UART2_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
; i start address is: 0 (W0)
	ADD	W4, #1, W0
; i end address is: 8 (W4)
	MOV	W0, W4
; i end address is: 0 (W0)
	GOTO	L_UART2_Interrupt39
L_UART2_Interrupt38:
;Main.c,165 :: 		else Uart2_Read();
; i start address is: 8 (W4)
	CALL	_UART2_Read
; i end address is: 8 (W4)
L_UART2_Interrupt39:
;Main.c,166 :: 		}
; i start address is: 8 (W4)
	GOTO	L_UART2_Interrupt40
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; time_counter end address is: 10 (W5)
L_UART2_Interrupt37:
;Main.c,169 :: 		UART2_RX_Interrupt_Buffer[i]=0;
	MOV	#lo_addr(_UART2_RX_Interrupt_Buffer), W0
	ADD	W0, W4, W1
; i end address is: 8 (W4)
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,170 :: 		U2STAbits.OERR=0;
	BCLR.B	U2STAbits, #1
;Main.c,171 :: 		return;
	GOTO	L_end_UART2_Interrupt
;Main.c,172 :: 		}
L_UART2_Interrupt40:
;Main.c,173 :: 		}
; i start address is: 8 (W4)
; time_counter start address is: 10 (W5)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
	MOV	W5, W0
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; time_counter end address is: 10 (W5)
; i end address is: 8 (W4)
	GOTO	L_UART2_Interrupt29
;Main.c,174 :: 		}
L_end_UART2_Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	ULNK
	RETFIE
; end of _UART2_Interrupt

_UART1_Interrupt:
	LNK	#2
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Main.c,176 :: 		void UART1_Interrupt() iv IVT_ADDR_U1RXINTERRUPT
;Main.c,178 :: 		unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=(UART2_RX_Buffer_Length-1);
; TimeLimit start address is: 4 (W2)
	MOV	#100, W2
; uiTemp start address is: 6 (W3)
	MOV	#199, W3
;Main.c,179 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;Main.c,180 :: 		ESP_RX_Int_En=0;
	BCLR	IEC0bits, #11
;Main.c,181 :: 		ESP_RX_Int_Flag=1;
	BSET	IFS0bits, #11
;Main.c,182 :: 		i=0;
; i start address is: 8 (W4)
	CLR	W4
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
;Main.c,183 :: 		while(1)
L_UART1_Interrupt41:
;Main.c,185 :: 		time_counter=0;
; i start address is: 8 (W4)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
; time_counter start address is: 0 (W0)
	CLR	W0
; time_counter end address is: 0 (W0)
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
	MOV	W0, W1
;Main.c,186 :: 		while((!Uart1_Data_Ready()) && (time_counter < TimeLimit))
L_UART1_Interrupt43:
; time_counter start address is: 2 (W1)
; TimeLimit start address is: 4 (W2)
; uiTemp start address is: 6 (W3)
; i start address is: 8 (W4)
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA Z	L__UART1_Interrupt90
	GOTO	L__UART1_Interrupt66
L__UART1_Interrupt90:
	CP	W1, W2
	BRA LTU	L__UART1_Interrupt91
	GOTO	L__UART1_Interrupt65
L__UART1_Interrupt91:
L__UART1_Interrupt64:
;Main.c,188 :: 		Delay_us(1);
	MOV	#5, W7
L_UART1_Interrupt47:
	DEC	W7
	BRA NZ	L_UART1_Interrupt47
	NOP
;Main.c,189 :: 		time_counter++;
	INC	W1
;Main.c,190 :: 		}
	GOTO	L_UART1_Interrupt43
;Main.c,186 :: 		while((!Uart1_Data_Ready()) && (time_counter < TimeLimit))
L__UART1_Interrupt66:
L__UART1_Interrupt65:
;Main.c,191 :: 		if (time_counter<TimeLimit)
	CP	W1, W2
	BRA LTU	L__UART1_Interrupt92
	GOTO	L_UART1_Interrupt49
L__UART1_Interrupt92:
; time_counter end address is: 2 (W1)
;Main.c,193 :: 		if (i<uiTemp) ESP_RX_Buffer[i++]=Uart1_Read();
	CP	W4, W3
	BRA LTU	L__UART1_Interrupt93
	GOTO	L_UART1_Interrupt50
L__UART1_Interrupt93:
	MOV	#lo_addr(_ESP_RX_Buffer), W0
	ADD	W0, W4, W0
	MOV	W0, [W14+0]
	CALL	_UART1_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
; i start address is: 0 (W0)
	ADD	W4, #1, W0
; i end address is: 8 (W4)
	MOV	W0, W4
; i end address is: 0 (W0)
	GOTO	L_UART1_Interrupt51
L_UART1_Interrupt50:
;Main.c,194 :: 		else Uart1_Read();
; i start address is: 8 (W4)
	CALL	_UART1_Read
; i end address is: 8 (W4)
L_UART1_Interrupt51:
;Main.c,195 :: 		}
; i start address is: 8 (W4)
	GOTO	L_UART1_Interrupt52
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
L_UART1_Interrupt49:
;Main.c,198 :: 		ESP_RX_Buffer[i]=0;
	MOV	#lo_addr(_ESP_RX_Buffer), W0
	ADD	W0, W4, W1
; i end address is: 8 (W4)
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,199 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;Main.c,200 :: 		return;
	GOTO	L_end_UART1_Interrupt
;Main.c,201 :: 		}
L_UART1_Interrupt52:
;Main.c,202 :: 		}
; i start address is: 8 (W4)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
	GOTO	L_UART1_Interrupt41
;Main.c,203 :: 		}
L_end_UART1_Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	ULNK
	RETFIE
; end of _UART1_Interrupt

_RTCC_Alarm:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Main.c,205 :: 		void RTCC_Alarm() iv IVT_ADDR_RTCCINTERRUPT
;Main.c,207 :: 		RTCCON1H.ALRMEN=OFF;
	BCLR	RTCCON1H, #15
;Main.c,208 :: 		RTCC_INT_EN=OFF;
	BCLR	IEC3, #14
;Main.c,209 :: 		WakeUpFromSleepMode();
	CALL	_WakeUpFromSleepMode
;Main.c,210 :: 		PrintOut(PrintHandler, "\r*****RTCC INTERRUPT*******");
	MOV	#lo_addr(?lstr_2_Main), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;Main.c,211 :: 		return;
;Main.c,212 :: 		}
L_end_RTCC_Alarm:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _RTCC_Alarm

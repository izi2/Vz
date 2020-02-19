
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68
	LNK	#10

;Main.c,28 :: 		void main()
;Main.c,30 :: 		char LedCount=0,LedOut=0,OpticDataFlag;
	PUSH	W10
	PUSH	W11
	ADD	W14, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSmain_LedCount_L0), W0
	REPEAT	#5
	MOV.B	[W0++], [W1++]
;Main.c,31 :: 		unsigned int WifiCounter=0,VZCounter=0,i,SamplingCounter=0,k;
;Main.c,33 :: 		uint_8 firstProgramming = TRUE;
;Main.c,38 :: 		char  loopi = 0;
;Main.c,40 :: 		BoardInit();
	CALL	_BoardInit
;Main.c,41 :: 		ESP_RX_Int_Flag=0;ESP_RX_Int_En=1;
	BCLR	IFS0bits, #11
	BSET	IEC0bits, #11
;Main.c,42 :: 		LED_Activation(LED_GREEN,LED_ON);
	CLR	W11
	MOV.B	#4, W10
	CALL	_LED_Activation
;Main.c,43 :: 		Init_uClick_VZ();
	CALL	_Init_uClick_VZ
;Main.c,44 :: 		ConfigFileInit(ExtEeprom_WriteByte,ExtEeprom_ReadByte);
	MOV	#lo_addr(_ExtEeprom_ReadByte), W11
	MOV	#lo_addr(_ExtEeprom_WriteByte), W10
	CALL	_ConfigFileInit
;Main.c,46 :: 		initConfig();
	CALL	_initConfig
;Main.c,52 :: 		if(!Init_ESP()) {LED_Activation(LED_GREEN,LED_OFF);LED_Activation(LED_RED,LED_ON);wifi_state=0;}
	CALL	_Init_ESP
	CP0.B	W0
	BRA Z	L__main59
	GOTO	L_main0
L__main59:
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
;Main.c,53 :: 		else wifi_state=ConnectingToWifiNet();
	CALL	_ConnectingToWifiNet
	MOV	#lo_addr(_wifi_state), W1
	MOV.B	W0, [W1]
L_main1:
;Main.c,55 :: 		PrintOut(PrintHandler, "\r***** S T A R T - M a i n *******");
	MOV	#lo_addr(?lstr_1_Main), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;Main.c,56 :: 		while(TRUE)
L_main2:
;Main.c,58 :: 		asm clrwdt;
	CLRWDT
;Main.c,61 :: 		VZ_ON_Flag=FALSE;
	MOV	#lo_addr(_VZ_ON_Flag), W1
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,62 :: 		if(VZ_ON_Flag)
	MOV	#lo_addr(_VZ_ON_Flag), W0
	CP0.B	[W0]
	BRA NZ	L__main60
	GOTO	L_main4
L__main60:
;Main.c,64 :: 		while((!(OpticDataFlag=OpticDataCheckIfReady()))&&(VZCounter++<15000)) {asm clrwdt;Delay_us(1);}
L_main5:
	CALL	_OpticDataCheckIfReady
	MOV.B	W0, [W14+0]
	CP0.B	W0
	BRA Z	L__main61
	GOTO	L__main51
L__main61:
	MOV	[W14+8], W2
	MOV	[W14+8], W1
	ADD	W14, #8, W0
	ADD	W1, #1, [W0]
	MOV	#15000, W0
	CP	W2, W0
	BRA LTU	L__main62
	GOTO	L__main50
L__main62:
L__main49:
	CLRWDT
	MOV	#5, W7
L_main9:
	DEC	W7
	BRA NZ	L_main9
	NOP
	GOTO	L_main5
L__main51:
L__main50:
;Main.c,65 :: 		if(OpticDataFlag)
	ADD	W14, #0, W0
	CP0.B	[W0]
	BRA NZ	L__main63
	GOTO	L_main11
L__main63:
;Main.c,67 :: 		SCL_Lat^=1;
	BTG	LATG, #2
;Main.c,68 :: 		if(LedCount++>=20){LedOut^=0xFF;LedCount=0;Read_Write_MCP23S17_IO(USER_LED,LedOut);} //run time 30uSec
	MOV.B	[W14+4], W2
	MOV.B	[W14+4], W1
	ADD	W14, #4, W0
	ADD.B	W1, #1, [W0]
	CP.B	W2, #20
	BRA GEU	L__main64
	GOTO	L_main12
L__main64:
	MOV.B	[W14+5], W2
	MOV.B	#255, W1
	ADD	W14, #5, W0
	XOR.B	W2, W1, [W0]
	CLR	W0
	MOV.B	W0, [W14+4]
	MOV.B	[W14+5], W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
L_main12:
;Main.c,71 :: 		OpticDataGetFrame_VelocityOnly(); //for example
	CALL	_OpticDataGetFrame_VelocityOnly
;Main.c,76 :: 		}
	GOTO	L_main13
L_main11:
;Main.c,77 :: 		else OpticDataGetCleanBuffer();
	CALL	_OpticDataGetCleanBuffer
L_main13:
;Main.c,78 :: 		}
	GOTO	L_main14
L_main4:
;Main.c,79 :: 		else Delay_ms(10);
	MOV	#53333, W7
L_main15:
	DEC	W7
	BRA NZ	L_main15
	NOP
L_main14:
;Main.c,80 :: 		VZCounter=0;
	CLR	W0
	MOV	W0, [W14+8]
;Main.c,83 :: 		if(Data_From_Gateway_Flag)
	MOV	#lo_addr(_Data_From_Gateway_Flag), W0
	CP0.B	[W0]
	BRA NZ	L__main65
	GOTO	L_main17
L__main65:
;Main.c,85 :: 		PrintOut(PrintHandler, "\rGateway Buffer-Length:%d\rData:",Gateway_Buffer_Length);
	PUSH	_Gateway_Buffer_Length
	MOV	#lo_addr(?lstr_2_Main), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;Main.c,86 :: 		parssData(ESP_GateWay_Buffer,Gateway_Buffer_Length);
	MOV	_Gateway_Buffer_Length, W11
	MOV	#lo_addr(_ESP_GateWay_Buffer), W10
	CALL	_parssData
;Main.c,87 :: 		for(i=0;i<Gateway_Buffer_Length;i++) Uart2_Write(ESP_GateWay_Buffer[i]);
	CLR	W0
	MOV	W0, [W14+2]
L_main18:
	MOV	[W14+2], W1
	MOV	#lo_addr(_Gateway_Buffer_Length), W0
	CP	W1, [W0]
	BRA LTU	L__main66
	GOTO	L_main19
L__main66:
	MOV	#lo_addr(_ESP_GateWay_Buffer), W1
	ADD	W14, #2, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	ZE	W0, W10
	CALL	_UART2_Write
	MOV	#1, W1
	ADD	W14, #2, W0
	ADD	W1, [W0], [W0]
	GOTO	L_main18
L_main19:
;Main.c,91 :: 		Data_From_Gateway_Flag=FALSE;
	MOV	#lo_addr(_Data_From_Gateway_Flag), W1
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,92 :: 		}
L_main17:
;Main.c,95 :: 		if(WifiCounter++>WifiConnectionLimit)
	MOV	[W14+6], W2
	MOV	[W14+6], W1
	ADD	W14, #6, W0
	ADD	W1, #1, [W0]
	MOV	#600, W0
	CP	W2, W0
	BRA GTU	L__main67
	GOTO	L_main21
L__main67:
;Main.c,97 :: 		WifiCounter=0;
	CLR	W0
	MOV	W0, [W14+6]
;Main.c,98 :: 		if(CheckWifiConnection()==0) wifi_state= ReConnectToServer();
	CALL	_CheckWifiConnection
	CP.B	W0, #0
	BRA Z	L__main68
	GOTO	L_main22
L__main68:
	CALL	_ReConnectToServer
	MOV	#lo_addr(_wifi_state), W1
	MOV.B	W0, [W1]
L_main22:
;Main.c,99 :: 		}
L_main21:
;Main.c,102 :: 		CheckAndSwitchToBattery();
	CALL	_CheckAndSwitchToBattery
;Main.c,103 :: 		}
	GOTO	L_main2
;Main.c,104 :: 		}
L_end_main:
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_Enable_VZ_Pointer:

;Main.c,106 :: 		void Enable_VZ_Pointer(char mode)
;Main.c,108 :: 		Read_Write_MCP23S17_IO(EN_LASER,mode);
	PUSH	W10
	PUSH	W11
	MOV.B	W10, W11
	MOV.B	#7, W10
	CALL	_Read_Write_MCP23S17_IO
;Main.c,109 :: 		}
L_end_Enable_VZ_Pointer:
	POP	W11
	POP	W10
	RETURN
; end of _Enable_VZ_Pointer

_Init_uClick_VZ:

;Main.c,111 :: 		void Init_uClick_VZ(void)
;Main.c,113 :: 		Mikrobus_PowerOut_Enable(ON,100);
	PUSH	W10
	PUSH	W11
	MOV	#100, W11
	MOV.B	#1, W10
	CALL	_Mikrobus_PowerOut_Enable
;Main.c,114 :: 		CheckAndSwitchToBattery();
	CALL	_CheckAndSwitchToBattery
;Main.c,115 :: 		SPI1_Init();
	CALL	_SPI1_Init
;Main.c,116 :: 		SPI1_Initialize_MCP();
	CALL	_SPI1_Initialize_MCP
;Main.c,117 :: 		Delay_ms(10);
	MOV	#53333, W7
L_Init_uClick_VZ23:
	DEC	W7
	BRA NZ	L_Init_uClick_VZ23
	NOP
;Main.c,118 :: 		INT_MIKROBUS_Tris=INPUT;
	BSET.B	TRISF, #6
;Main.c,119 :: 		CS_SRAM_Tris=OUTPUT;
	BCLR	TRISD, #9
;Main.c,120 :: 		CS_SRAM_Lat=ON;
	BSET	LATD, #9
;Main.c,121 :: 		CS_MCP23S17_Lat=ON;
	BSET.B	LATB, #5
;Main.c,122 :: 		CS_MCP23S17_Buff=DIGITAL;
	BCLR.B	ANSB, #5
;Main.c,123 :: 		CS_MCP23S17_Tris=OUTPUT;
	BCLR.B	TRISB, #5
;Main.c,124 :: 		CS_SC16IS740_Tris=OUTPUT;
	BCLR.B	TRISE, #5
;Main.c,125 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;Main.c,126 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;Main.c,127 :: 		Init_MCP23S17();
	CALL	_Init_MCP23S17
;Main.c,128 :: 		Init_SC16IS740();
	CALL	_Init_SC16IS740
;Main.c,129 :: 		Read_Write_MCP23S17_IO(EN_1_8V,ON);
	MOV.B	#1, W11
	CLR	W10
	CALL	_Read_Write_MCP23S17_IO
;Main.c,130 :: 		Read_Write_MCP23S17_IO(USER_LED,ON);
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_Read_Write_MCP23S17_IO
;Main.c,131 :: 		Init_SRAM();
	CALL	_Init_SRAM
;Main.c,132 :: 		Init_ExtEeprom();
	CALL	_Init_ExtEeprom
;Main.c,133 :: 		}
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

;Main.c,140 :: 		void UART2_Interrupt() iv IVT_ADDR_U2RXINTERRUPT
;Main.c,142 :: 		unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=(UART2_RX_Buffer_Length-1);
; time_counter start address is: 0 (W0)
	CLR	W0
; TimeLimit start address is: 2 (W1)
	MOV	#100, W1
; uiTemp start address is: 4 (W2)
	MOV	#199, W2
;Main.c,143 :: 		U2STAbits.OERR=0;
	BCLR.B	U2STAbits, #1
;Main.c,144 :: 		Uart2_RX_Int_En=0;
	BCLR	IEC1bits, #14
;Main.c,145 :: 		Uart2_Rx_Int_Flag=1;
	BSET	IFS1bits, #14
;Main.c,146 :: 		i=0;
; i start address is: 6 (W3)
	CLR	W3
; TimeLimit end address is: 2 (W1)
; uiTemp end address is: 4 (W2)
; i end address is: 6 (W3)
; time_counter end address is: 0 (W0)
	MOV	W3, W4
	MOV	W2, W3
	MOV	W1, W2
;Main.c,147 :: 		while(1)
L_UART2_Interrupt25:
;Main.c,149 :: 		while((!Uart2_Data_Ready()) && (time_counter < TimeLimit))
; i start address is: 8 (W4)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
; time_counter start address is: 0 (W0)
; time_counter end address is: 0 (W0)
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
	MOV	W0, W1
L_UART2_Interrupt27:
; time_counter start address is: 2 (W1)
; TimeLimit start address is: 4 (W2)
; uiTemp start address is: 6 (W3)
; i start address is: 8 (W4)
	CALL	_UART2_Data_Ready
	CP0	W0
	BRA Z	L__UART2_Interrupt73
	GOTO	L__UART2_Interrupt54
L__UART2_Interrupt73:
	CP	W1, W2
	BRA LTU	L__UART2_Interrupt74
	GOTO	L__UART2_Interrupt53
L__UART2_Interrupt74:
L__UART2_Interrupt52:
;Main.c,151 :: 		Delay_us(100);
	MOV	#533, W7
L_UART2_Interrupt31:
	DEC	W7
	BRA NZ	L_UART2_Interrupt31
	NOP
;Main.c,152 :: 		time_counter++;
	INC	W1
;Main.c,153 :: 		}
	GOTO	L_UART2_Interrupt27
;Main.c,149 :: 		while((!Uart2_Data_Ready()) && (time_counter < TimeLimit))
L__UART2_Interrupt54:
L__UART2_Interrupt53:
;Main.c,154 :: 		if (time_counter<TimeLimit)
	CP	W1, W2
	BRA LTU	L__UART2_Interrupt75
	GOTO	L_UART2_Interrupt33
L__UART2_Interrupt75:
; time_counter end address is: 2 (W1)
;Main.c,156 :: 		time_counter=0;
; time_counter start address is: 10 (W5)
	CLR	W5
;Main.c,157 :: 		if (i<uiTemp) UART2_RX_Interrupt_Buffer[i++]=Uart2_Read();
	CP	W4, W3
	BRA LTU	L__UART2_Interrupt76
	GOTO	L_UART2_Interrupt34
L__UART2_Interrupt76:
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
	GOTO	L_UART2_Interrupt35
L_UART2_Interrupt34:
;Main.c,158 :: 		else Uart2_Read();
; i start address is: 8 (W4)
	CALL	_UART2_Read
; i end address is: 8 (W4)
L_UART2_Interrupt35:
;Main.c,159 :: 		}
; i start address is: 8 (W4)
	GOTO	L_UART2_Interrupt36
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; time_counter end address is: 10 (W5)
L_UART2_Interrupt33:
;Main.c,162 :: 		UART2_RX_Interrupt_Buffer[i]=0;
	MOV	#lo_addr(_UART2_RX_Interrupt_Buffer), W0
	ADD	W0, W4, W1
; i end address is: 8 (W4)
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,163 :: 		U2STAbits.OERR=0;
	BCLR.B	U2STAbits, #1
;Main.c,164 :: 		return;
	GOTO	L_end_UART2_Interrupt
;Main.c,165 :: 		}
L_UART2_Interrupt36:
;Main.c,166 :: 		}
; i start address is: 8 (W4)
; time_counter start address is: 10 (W5)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
	MOV	W5, W0
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; time_counter end address is: 10 (W5)
; i end address is: 8 (W4)
	GOTO	L_UART2_Interrupt25
;Main.c,167 :: 		}
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

;Main.c,169 :: 		void UART1_Interrupt() iv IVT_ADDR_U1RXINTERRUPT
;Main.c,171 :: 		unsigned int i=0,time_counter=0,TimeLimit=100,uiTemp=(UART2_RX_Buffer_Length-1);
; TimeLimit start address is: 4 (W2)
	MOV	#100, W2
; uiTemp start address is: 6 (W3)
	MOV	#199, W3
;Main.c,172 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;Main.c,173 :: 		ESP_RX_Int_En=0;
	BCLR	IEC0bits, #11
;Main.c,174 :: 		ESP_RX_Int_Flag=1;
	BSET	IFS0bits, #11
;Main.c,175 :: 		i=0;
; i start address is: 8 (W4)
	CLR	W4
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
;Main.c,176 :: 		while(1)
L_UART1_Interrupt37:
;Main.c,178 :: 		time_counter=0;
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
;Main.c,179 :: 		while((!Uart1_Data_Ready()) && (time_counter < TimeLimit))
L_UART1_Interrupt39:
; time_counter start address is: 2 (W1)
; TimeLimit start address is: 4 (W2)
; uiTemp start address is: 6 (W3)
; i start address is: 8 (W4)
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA Z	L__UART1_Interrupt78
	GOTO	L__UART1_Interrupt57
L__UART1_Interrupt78:
	CP	W1, W2
	BRA LTU	L__UART1_Interrupt79
	GOTO	L__UART1_Interrupt56
L__UART1_Interrupt79:
L__UART1_Interrupt55:
;Main.c,181 :: 		Delay_us(1);
	MOV	#5, W7
L_UART1_Interrupt43:
	DEC	W7
	BRA NZ	L_UART1_Interrupt43
	NOP
;Main.c,182 :: 		time_counter++;
	INC	W1
;Main.c,183 :: 		}
	GOTO	L_UART1_Interrupt39
;Main.c,179 :: 		while((!Uart1_Data_Ready()) && (time_counter < TimeLimit))
L__UART1_Interrupt57:
L__UART1_Interrupt56:
;Main.c,184 :: 		if (time_counter<TimeLimit)
	CP	W1, W2
	BRA LTU	L__UART1_Interrupt80
	GOTO	L_UART1_Interrupt45
L__UART1_Interrupt80:
; time_counter end address is: 2 (W1)
;Main.c,186 :: 		if (i<uiTemp) ESP_RX_Buffer[i++]=Uart1_Read();
	CP	W4, W3
	BRA LTU	L__UART1_Interrupt81
	GOTO	L_UART1_Interrupt46
L__UART1_Interrupt81:
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
	GOTO	L_UART1_Interrupt47
L_UART1_Interrupt46:
;Main.c,187 :: 		else Uart1_Read();
; i start address is: 8 (W4)
	CALL	_UART1_Read
; i end address is: 8 (W4)
L_UART1_Interrupt47:
;Main.c,188 :: 		}
; i start address is: 8 (W4)
	GOTO	L_UART1_Interrupt48
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
L_UART1_Interrupt45:
;Main.c,191 :: 		ESP_RX_Buffer[i]=0;
	MOV	#lo_addr(_ESP_RX_Buffer), W0
	ADD	W0, W4, W1
; i end address is: 8 (W4)
	CLR	W0
	MOV.B	W0, [W1]
;Main.c,192 :: 		U1STAbits.OERR=0;
	BCLR.B	U1STAbits, #1
;Main.c,193 :: 		return;
	GOTO	L_end_UART1_Interrupt
;Main.c,194 :: 		}
L_UART1_Interrupt48:
;Main.c,195 :: 		}
; i start address is: 8 (W4)
; uiTemp start address is: 6 (W3)
; TimeLimit start address is: 4 (W2)
; TimeLimit end address is: 4 (W2)
; uiTemp end address is: 6 (W3)
; i end address is: 8 (W4)
	GOTO	L_UART1_Interrupt37
;Main.c,196 :: 		}
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

;Main.c,198 :: 		void RTCC_Alarm() iv IVT_ADDR_RTCCINTERRUPT
;Main.c,200 :: 		RTCCON1H.ALRMEN=OFF;
	BCLR	RTCCON1H, #15
;Main.c,201 :: 		RTCC_INT_EN=OFF;
	BCLR	IEC3, #14
;Main.c,202 :: 		WakeUpFromSleepMode();
	CALL	_WakeUpFromSleepMode
;Main.c,203 :: 		PrintOut(PrintHandler, "\r*****RTCC INTERRUPT*******");
	MOV	#lo_addr(?lstr_3_Main), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;Main.c,204 :: 		return;
;Main.c,205 :: 		}
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


_Get60SamplesFromUart:
	LNK	#2

;Debug_Drv.c,16 :: 		void Get60SamplesFromUart(void)
;Debug_Drv.c,23 :: 		for(i=0;i<60;i++) Vz_Sensor_Distance_Buffer_int[i]=GetSampleFromUart();
; i start address is: 14 (W7)
	CLR	W7
; i end address is: 14 (W7)
L_Get60SamplesFromUart0:
; i start address is: 14 (W7)
	MOV.B	#60, W0
	CP.B	W7, W0
	BRA LTU	L__Get60SamplesFromUart42
	GOTO	L_Get60SamplesFromUart1
L__Get60SamplesFromUart42:
	ZE	W7, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+0]
	CALL	_GetSampleFromUart
	MOV	[W14+0], W1
	MOV	W0, [W1]
	INC.B	W7
; i end address is: 14 (W7)
	GOTO	L_Get60SamplesFromUart0
L_Get60SamplesFromUart1:
;Debug_Drv.c,25 :: 		}
L_end_Get60SamplesFromUart:
	ULNK
	RETURN
; end of _Get60SamplesFromUart

_InitUartForRxData:

;Debug_Drv.c,27 :: 		void InitUartForRxData(void)
;Debug_Drv.c,29 :: 		MRXSTX2_Tris=INPUT;
	BSET	TRISD, #11
;Debug_Drv.c,30 :: 		UART2_Read();UART2_Read();
	CALL	_UART2_Read
	CALL	_UART2_Read
;Debug_Drv.c,31 :: 		}
L_end_InitUartForRxData:
	RETURN
; end of _InitUartForRxData

_GetSampleFromUart:
	LNK	#12

;Debug_Drv.c,33 :: 		int GetSampleFromUart(void)
;Debug_Drv.c,35 :: 		char txt[10]={0},cTemp=0,i=0;
	PUSH	W10
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSGetSampleFromUart_txt_L0), W0
	REPEAT	#9
	MOV.B	[W0++], [W1++]
; cTemp start address is: 4 (W2)
	CLR	W2
; i start address is: 12 (W6)
	CLR	W6
;Debug_Drv.c,36 :: 		txt[0]=0x30;
	ADD	W14, #0, W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
; cTemp end address is: 4 (W2)
; i end address is: 12 (W6)
	MOV.B	W2, W1
;Debug_Drv.c,37 :: 		while(cTemp!='\n')
L_GetSampleFromUart3:
; i start address is: 12 (W6)
; cTemp start address is: 2 (W1)
	CP.B	W1, #10
	BRA NZ	L__GetSampleFromUart45
	GOTO	L_GetSampleFromUart4
L__GetSampleFromUart45:
;Debug_Drv.c,39 :: 		asm clrwdt;
	CLRWDT
;Debug_Drv.c,40 :: 		if(UART2_Data_Ready()) {cTemp=txt[i++]=UART2_Read();U2STAbits.OERR = 0;}
	CALL	_UART2_Data_Ready
	CP0	W0
	BRA NZ	L__GetSampleFromUart46
	GOTO	L__GetSampleFromUart40
L__GetSampleFromUart46:
; cTemp end address is: 2 (W1)
	ADD	W14, #0, W1
	ZE	W6, W0
	ADD	W1, W0, W0
	MOV	W0, [W14+10]
	CALL	_UART2_Read
	MOV	[W14+10], W1
	MOV.B	W0, [W1]
; cTemp start address is: 0 (W0)
	MOV.B	[W1], W0
; i start address is: 2 (W1)
	ADD.B	W6, #1, W1
; i end address is: 12 (W6)
	BCLR.B	U2STAbits, #1
; cTemp end address is: 0 (W0)
; i end address is: 2 (W1)
	MOV.B	W1, W6
	MOV.B	W0, W1
	GOTO	L_GetSampleFromUart5
L__GetSampleFromUart40:
L_GetSampleFromUart5:
;Debug_Drv.c,41 :: 		}
; i start address is: 12 (W6)
; cTemp start address is: 2 (W1)
; cTemp end address is: 2 (W1)
	GOTO	L_GetSampleFromUart3
L_GetSampleFromUart4:
;Debug_Drv.c,42 :: 		txt[i-1]=0;
	ZE	W6, W0
; i end address is: 12 (W6)
	DEC	W0
	ADD	W14, #0, W2
	ADD	W2, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;Debug_Drv.c,43 :: 		return atoi(txt);
	MOV	W2, W10
	CALL	_atoi
;Debug_Drv.c,44 :: 		}
;Debug_Drv.c,43 :: 		return atoi(txt);
;Debug_Drv.c,44 :: 		}
L_end_GetSampleFromUart:
	POP	W10
	ULNK
	RETURN
; end of _GetSampleFromUart

_PrintRealTime:
	LNK	#14

;Debug_Drv.c,46 :: 		void PrintRealTime(unsigned int TimeInSec)
;Debug_Drv.c,51 :: 		Pseudo_Uart2_Enable(1);
	PUSH	W11
	PUSH	W10
	MOV.B	#1, W10
	CALL	_Pseudo_Uart2_Enable
	POP	W10
;Debug_Drv.c,52 :: 		MainLoopLimit= (unsigned long)TimeInSec*1000/10;
	MOV	W10, W0
	CLR	W1
	MOV	#1000, W2
	MOV	#0, W3
	CALL	__Multiply_32x32
	MOV	#10, W2
	MOV	#0, W3
	CLR	W4
	CALL	__Divide_32x32
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;Debug_Drv.c,53 :: 		for(index=0;index<MainLoopLimit;index++)
	CLR	W0
	MOV	W0, [W14+4]
L_PrintRealTime6:
	MOV	[W14+4], W1
	CLR	W2
	ADD	W14, #0, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA LTU	L__PrintRealTime48
	GOTO	L_PrintRealTime7
L__PrintRealTime48:
;Debug_Drv.c,55 :: 		SCL_Lat^=1;
	BTG	LATG, #2
;Debug_Drv.c,56 :: 		while(!OpticDataCheckIfReady());
L_PrintRealTime9:
	PUSH	W10
	CALL	_OpticDataCheckIfReady
	POP	W10
	CP0.B	W0
	BRA Z	L__PrintRealTime49
	GOTO	L_PrintRealTime10
L__PrintRealTime49:
	GOTO	L_PrintRealTime9
L_PrintRealTime10:
;Debug_Drv.c,61 :: 		OpticDataGetFrame_DistanceOnly();
	PUSH	W10
	CALL	_OpticDataGetFrame_DistanceOnly
	POP	W10
;Debug_Drv.c,63 :: 		for(i=0;i<60;i++)
; i start address is: 24 (W12)
	CLR	W12
; i end address is: 24 (W12)
	MOV	W12, W5
L_PrintRealTime11:
; i start address is: 10 (W5)
	MOV	#60, W0
	CP	W5, W0
	BRA LTU	L__PrintRealTime50
	GOTO	L_PrintRealTime12
L__PrintRealTime50:
;Debug_Drv.c,69 :: 		IntToStr(Vz_Sensor_Distance_Buffer_int[i], txt);
	ADD	W14, #6, W2
	SL	W5, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W10
	MOV	W2, W11
	MOV	W0, W10
	CALL	_IntToStr
;Debug_Drv.c,71 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #6, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
;Debug_Drv.c,72 :: 		Pseudo_Uart2_Write_Text("\r");
	MOV	#lo_addr(?lstr1_Debug_Drv), W10
	CALL	_Pseudo_Uart2_Write_Text
	POP	W10
;Debug_Drv.c,63 :: 		for(i=0;i<60;i++)
; i start address is: 24 (W12)
	ADD	W5, #1, W12
; i end address is: 10 (W5)
;Debug_Drv.c,73 :: 		}
	MOV	W12, W5
; i end address is: 24 (W12)
	GOTO	L_PrintRealTime11
L_PrintRealTime12:
;Debug_Drv.c,53 :: 		for(index=0;index<MainLoopLimit;index++)
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #1, [W0]
;Debug_Drv.c,74 :: 		}
	GOTO	L_PrintRealTime6
L_PrintRealTime7:
;Debug_Drv.c,75 :: 		Pseudo_Uart2_Enable(0);
	PUSH	W10
	CLR	W10
	CALL	_Pseudo_Uart2_Enable
	POP	W10
;Debug_Drv.c,76 :: 		}
L_end_PrintRealTime:
	POP	W11
	ULNK
	RETURN
; end of _PrintRealTime

_Pseudo_Uart2_Write_Byte:

;Debug_Drv.c,78 :: 		void Pseudo_Uart2_Write_Byte(char din)
;Debug_Drv.c,83 :: 		MTXSRX2_Lat=0;       //Start Bit
	BCLR	LATD, #10
;Debug_Drv.c,84 :: 		for(k=0;k<0;k++);
; k start address is: 0 (W0)
	CLR	W0
; k end address is: 0 (W0)
L_Pseudo_Uart2_Write_Byte14:
; k start address is: 0 (W0)
	CP	W0, #0
	BRA LTU	L__Pseudo_Uart2_Write_Byte52
	GOTO	L_Pseudo_Uart2_Write_Byte15
L__Pseudo_Uart2_Write_Byte52:
; k start address is: 0 (W0)
	INC	W0
; k end address is: 0 (W0)
; k end address is: 0 (W0)
	GOTO	L_Pseudo_Uart2_Write_Byte14
L_Pseudo_Uart2_Write_Byte15:
;Debug_Drv.c,85 :: 		for(i=0;i<8;i++) //run time
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_Pseudo_Uart2_Write_Byte17:
; i start address is: 2 (W1)
	CP.B	W1, #8
	BRA LTU	L__Pseudo_Uart2_Write_Byte53
	GOTO	L_Pseudo_Uart2_Write_Byte18
L__Pseudo_Uart2_Write_Byte53:
;Debug_Drv.c,87 :: 		MTXSRX2_Lat=din&0x01; //
	ZE	W10, W0
	AND	W0, #1, W0
	BTSS	W0, #0
	BCLR	LATD, #10
	BTSC	W0, #0
	BSET	LATD, #10
;Debug_Drv.c,88 :: 		din>>=1;
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;Debug_Drv.c,85 :: 		for(i=0;i<8;i++) //run time
	INC.B	W1
;Debug_Drv.c,89 :: 		}
; i end address is: 2 (W1)
	GOTO	L_Pseudo_Uart2_Write_Byte17
L_Pseudo_Uart2_Write_Byte18:
;Debug_Drv.c,90 :: 		MTXSRX2_Lat=1;       //Stop Bit
	BSET	LATD, #10
;Debug_Drv.c,91 :: 		Delay_us(1);
	MOV	#5, W7
L_Pseudo_Uart2_Write_Byte20:
	DEC	W7
	BRA NZ	L_Pseudo_Uart2_Write_Byte20
	NOP
;Debug_Drv.c,92 :: 		}
L_end_Pseudo_Uart2_Write_Byte:
	RETURN
; end of _Pseudo_Uart2_Write_Byte

_Pseudo_Uart2_Write_Text:

;Debug_Drv.c,94 :: 		void Pseudo_Uart2_Write_Text(unsigned char *p)
;Debug_Drv.c,96 :: 		int i=0;
; i start address is: 4 (W2)
	CLR	W2
;Debug_Drv.c,97 :: 		Pseudo_Uart2_Enable(ON);
	PUSH	W10
	MOV.B	#1, W10
	CALL	_Pseudo_Uart2_Enable
; i end address is: 4 (W2)
	POP	W10
;Debug_Drv.c,98 :: 		while(p[i]!=0) Pseudo_Uart2_Write_Byte(p[i++]);
L_Pseudo_Uart2_Write_Text22:
; i start address is: 4 (W2)
	ADD	W10, W2, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Pseudo_Uart2_Write_Text55
	GOTO	L_Pseudo_Uart2_Write_Text23
L__Pseudo_Uart2_Write_Text55:
	ADD	W10, W2, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_Pseudo_Uart2_Write_Byte
	POP	W10
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_Pseudo_Uart2_Write_Text22
L_Pseudo_Uart2_Write_Text23:
;Debug_Drv.c,99 :: 		Pseudo_Uart2_Enable(OFF);
	PUSH	W10
	CLR	W10
	CALL	_Pseudo_Uart2_Enable
	POP	W10
;Debug_Drv.c,100 :: 		}
L_end_Pseudo_Uart2_Write_Text:
	RETURN
; end of _Pseudo_Uart2_Write_Text

_Pseudo_Uart2_Enable:

;Debug_Drv.c,102 :: 		void Pseudo_Uart2_Enable(char mode)
;Debug_Drv.c,104 :: 		switch (mode)
	GOTO	L_Pseudo_Uart2_Enable24
;Debug_Drv.c,106 :: 		case 1  :
L_Pseudo_Uart2_Enable26:
;Debug_Drv.c,107 :: 		MTXSRX2_Lat=1;
	BSET	LATD, #10
;Debug_Drv.c,108 :: 		U2MODEbits.UARTEN = 0;
	BCLR	U2MODEbits, #15
;Debug_Drv.c,109 :: 		U2STAbits.UTXEN = 0;
	BCLR	U2STAbits, #10
;Debug_Drv.c,110 :: 		break;
	GOTO	L_Pseudo_Uart2_Enable25
;Debug_Drv.c,111 :: 		case 0  :
L_Pseudo_Uart2_Enable27:
;Debug_Drv.c,112 :: 		U2MODEbits.UARTEN = 1;
	BSET	U2MODEbits, #15
;Debug_Drv.c,113 :: 		U2STAbits.UTXEN = 1;
	BSET	U2STAbits, #10
;Debug_Drv.c,114 :: 		U2RXREG=0;
	CLR	U2RXREG
;Debug_Drv.c,115 :: 		U2STAbits.URXDA=0;
	BCLR.B	U2STAbits, #0
;Debug_Drv.c,116 :: 		U2STAbits.OERR = 0;
	BCLR.B	U2STAbits, #1
;Debug_Drv.c,117 :: 		Uart2_Rx_Int_Flag=0;
	BCLR	IFS1bits, #14
;Debug_Drv.c,118 :: 		break;
	GOTO	L_Pseudo_Uart2_Enable25
;Debug_Drv.c,119 :: 		}
L_Pseudo_Uart2_Enable24:
	CP.B	W10, #1
	BRA NZ	L__Pseudo_Uart2_Enable57
	GOTO	L_Pseudo_Uart2_Enable26
L__Pseudo_Uart2_Enable57:
	CP.B	W10, #0
	BRA NZ	L__Pseudo_Uart2_Enable58
	GOTO	L_Pseudo_Uart2_Enable27
L__Pseudo_Uart2_Enable58:
L_Pseudo_Uart2_Enable25:
;Debug_Drv.c,120 :: 		}
L_end_Pseudo_Uart2_Enable:
	RETURN
; end of _Pseudo_Uart2_Enable

_PrintOpticDataToUart:
	LNK	#2

;Debug_Drv.c,122 :: 		void PrintOpticDataToUart(char mode)
;Debug_Drv.c,124 :: 		unsigned int BufferIndex=0,i,LoopIndex;
;Debug_Drv.c,125 :: 		if(mode&Velocity_Print)
	BTSS	W10, #0
	GOTO	L_PrintOpticDataToUart28
;Debug_Drv.c,127 :: 		PrintOut(PrintHandler,"\rVelocity: units - mm/sec \r");
	MOV	#lo_addr(?lstr_2_Debug_Drv), W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	POP	W10
;Debug_Drv.c,128 :: 		for(i=0;i<60;i++)  PrintOut(PrintHandler,"%.2f,",(float)Vz_Sensor_Velocity_Buffer_int[i]/256.0);
	CLR	W0
	MOV	W0, [W14+0]
L_PrintOpticDataToUart29:
	MOV	#60, W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GTU	L__PrintOpticDataToUart60
	GOTO	L_PrintOpticDataToUart30
L__PrintOpticDataToUart60:
	MOV	[W14+0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W10
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17280, W3
	CALL	__Div_FP
	PUSH.D	W0
	MOV	#lo_addr(?lstr_3_Debug_Drv), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#8, W15
	POP	W10
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
	GOTO	L_PrintOpticDataToUart29
L_PrintOpticDataToUart30:
;Debug_Drv.c,129 :: 		}
L_PrintOpticDataToUart28:
;Debug_Drv.c,130 :: 		if(mode&Distance_Print)
	BTSS	W10, #1
	GOTO	L_PrintOpticDataToUart32
;Debug_Drv.c,132 :: 		PrintOut(PrintHandler,"\rDistance: units - mm\r");
	MOV	#lo_addr(?lstr_4_Debug_Drv), W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	POP	W10
;Debug_Drv.c,133 :: 		for(i=0;i<60;i++)  PrintOut(PrintHandler,"%.2f,",(float)(Vz_Sensor_Distance_Buffer_int[i]&0x3FFF)/1024);
	CLR	W0
	MOV	W0, [W14+0]
L_PrintOpticDataToUart33:
	MOV	#60, W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GTU	L__PrintOpticDataToUart61
	GOTO	L_PrintOpticDataToUart34
L__PrintOpticDataToUart61:
	MOV	[W14+0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#16383, W0
	AND	W1, W0, W0
	PUSH	W10
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17536, W3
	CALL	__Div_FP
	PUSH.D	W0
	MOV	#lo_addr(?lstr_5_Debug_Drv), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#8, W15
	POP	W10
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
	GOTO	L_PrintOpticDataToUart33
L_PrintOpticDataToUart34:
;Debug_Drv.c,134 :: 		}
L_PrintOpticDataToUart32:
;Debug_Drv.c,135 :: 		if(mode&Mask_Print)
	BTSS	W10, #2
	GOTO	L_PrintOpticDataToUart36
;Debug_Drv.c,137 :: 		PrintOut(PrintHandler,"\rMask:\r");
	MOV	#lo_addr(?lstr_6_Debug_Drv), W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
	POP	W10
;Debug_Drv.c,138 :: 		for(i=0;i<60;i++)  PrintOut(PrintHandler,"%d,",(int)((Vz_Sensor_Distance_Buffer_int[i]&0xC000)>>14));
	CLR	W0
	MOV	W0, [W14+0]
L_PrintOpticDataToUart37:
	MOV	#60, W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GTU	L__PrintOpticDataToUart62
	GOTO	L_PrintOpticDataToUart38
L__PrintOpticDataToUart62:
	MOV	[W14+0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#49152, W0
	AND	W1, W0, W0
	LSR	W0, #14, W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_7_Debug_Drv), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
	POP	W10
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
	GOTO	L_PrintOpticDataToUart37
L_PrintOpticDataToUart38:
;Debug_Drv.c,139 :: 		}
L_PrintOpticDataToUart36:
;Debug_Drv.c,140 :: 		}
L_end_PrintOpticDataToUart:
	ULNK
	RETURN
; end of _PrintOpticDataToUart

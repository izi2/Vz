
_Init_SC16IS740:

;SC16IS740_DRV.c,7 :: 		void Init_SC16IS740(void)
;SC16IS740_DRV.c,9 :: 		CS_SC16IS740_Tris=OUTPUT;
	PUSH	W10
	PUSH	W11
	BCLR.B	TRISE, #5
;SC16IS740_DRV.c,10 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;SC16IS740_DRV.c,11 :: 		Read_Write_MCP23S17_IO(RESET_ADP,OFF);
	CLR	W11
	MOV.B	#2, W10
	CALL	_Read_Write_MCP23S17_IO
;SC16IS740_DRV.c,12 :: 		Delay_ms(10);
	MOV	#53333, W7
L_Init_SC16IS7400:
	DEC	W7
	BRA NZ	L_Init_SC16IS7400
	NOP
;SC16IS740_DRV.c,13 :: 		Read_Write_MCP23S17_IO(RESET_ADP,ON);
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_Read_Write_MCP23S17_IO
;SC16IS740_DRV.c,14 :: 		Delay_ms(10);
	MOV	#53333, W7
L_Init_SC16IS7402:
	DEC	W7
	BRA NZ	L_Init_SC16IS7402
	NOP
;SC16IS740_DRV.c,15 :: 		Write_To_SC16IS740_Internal_Register(0x03,0x83);  //LCR - LCR[7] =1;
	MOV.B	#131, W11
	MOV.B	#3, W10
	CALL	_Write_To_SC16IS740_Internal_Register
;SC16IS740_DRV.c,16 :: 		Write_To_SC16IS740_Internal_Register(0x00,0x08);  // BPS = 115200 - LSB   XTAL= 14.7456Mhz
	MOV.B	#8, W11
	CLR	W10
	CALL	_Write_To_SC16IS740_Internal_Register
;SC16IS740_DRV.c,17 :: 		Write_To_SC16IS740_Internal_Register(0x01,0x00);  // BPS = 115200- MSB
	CLR	W11
	MOV.B	#1, W10
	CALL	_Write_To_SC16IS740_Internal_Register
;SC16IS740_DRV.c,18 :: 		Write_To_SC16IS740_Internal_Register(0x03,0x03);  //LCR - LCR[7] =0;
	MOV.B	#3, W11
	MOV.B	#3, W10
	CALL	_Write_To_SC16IS740_Internal_Register
;SC16IS740_DRV.c,19 :: 		Write_To_SC16IS740_Internal_Register(0x02,0x07);  //FCR FIFO enable;Word length 8 bit
	MOV.B	#7, W11
	MOV.B	#2, W10
	CALL	_Write_To_SC16IS740_Internal_Register
;SC16IS740_DRV.c,20 :: 		Write_To_SC16IS740_Internal_Register(0x01,0x03);  //IER[0]=1 enable the RHR interrupt;IER[1] enable the THR interrupt
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_Write_To_SC16IS740_Internal_Register
;SC16IS740_DRV.c,21 :: 		}
L_end_Init_SC16IS740:
	POP	W11
	POP	W10
	RETURN
; end of _Init_SC16IS740

_Write_To_SC16IS740_Internal_Register:

;SC16IS740_DRV.c,23 :: 		void Write_To_SC16IS740_Internal_Register(char Register_ADD,char Register_Data)
;SC16IS740_DRV.c,25 :: 		Register_ADD<<=3;
	PUSH	W10
	ZE	W10, W0
	SL	W0, #3, W0
	MOV.B	W0, W10
;SC16IS740_DRV.c,26 :: 		Register_ADD&=0x7F;
	ZE	W0, W1
	MOV	#127, W0
	AND	W1, W0, W0
	MOV.B	W0, W10
;SC16IS740_DRV.c,27 :: 		CS_SC16IS740_Lat=OFF;
	BCLR.B	LATE, #5
;SC16IS740_DRV.c,28 :: 		SPIPut_SC16IS740(Register_ADD);
	MOV.B	W0, W10
	CALL	_SPIPut_SC16IS740
;SC16IS740_DRV.c,29 :: 		SPIPut_SC16IS740(Register_Data);
	MOV.B	W11, W10
	CALL	_SPIPut_SC16IS740
;SC16IS740_DRV.c,30 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;SC16IS740_DRV.c,31 :: 		}
L_end_Write_To_SC16IS740_Internal_Register:
	POP	W10
	RETURN
; end of _Write_To_SC16IS740_Internal_Register

_Read_From_SC16IS740_Internal_Register:

;SC16IS740_DRV.c,33 :: 		char Read_From_SC16IS740_Internal_Register(char Register_ADD)
;SC16IS740_DRV.c,36 :: 		Register_ADD<<=3;
	PUSH	W10
	ZE	W10, W0
	SL	W0, #3, W0
	MOV.B	W0, W10
;SC16IS740_DRV.c,37 :: 		Register_ADD|=0x80;
	ZE	W0, W1
	MOV	#128, W0
	IOR	W1, W0, W0
	MOV.B	W0, W10
;SC16IS740_DRV.c,38 :: 		CS_SC16IS740_Lat=OFF;
	BCLR.B	LATE, #5
;SC16IS740_DRV.c,39 :: 		SPIPut_SC16IS740(Register_ADD);
	MOV.B	W0, W10
	CALL	_SPIPut_SC16IS740
;SC16IS740_DRV.c,40 :: 		cTemp=SPIGet_SC16IS740(0x00);
	CLR	W10
	CALL	_SPIGet_SC16IS740
;SC16IS740_DRV.c,41 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;SC16IS740_DRV.c,42 :: 		return cTemp;
;SC16IS740_DRV.c,43 :: 		}
;SC16IS740_DRV.c,42 :: 		return cTemp;
;SC16IS740_DRV.c,43 :: 		}
L_end_Read_From_SC16IS740_Internal_Register:
	POP	W10
	RETURN
; end of _Read_From_SC16IS740_Internal_Register

_SC16IS740_WriteBufferToUart:

;SC16IS740_DRV.c,45 :: 		void SC16IS740_WriteBufferToUart(char *buff,char length) ///// max 64
;SC16IS740_DRV.c,50 :: 		if(length >SC16IS740_Buffer_Length) length=SC16IS740_Buffer_Length;
	MOV.B	#64, W0
	CP.B	W11, W0
	BRA GTU	L__SC16IS740_WriteBufferToUart23
	GOTO	L_SC16IS740_WriteBufferToUart4
L__SC16IS740_WriteBufferToUart23:
	MOV.B	#64, W11
L_SC16IS740_WriteBufferToUart4:
;SC16IS740_DRV.c,51 :: 		Write_To_SC16IS740_Internal_Register(0x02,0x07); //clears the contents of the Tx and Rx FIFO
	PUSH.D	W10
	MOV.B	#7, W11
	MOV.B	#2, W10
	CALL	_Write_To_SC16IS740_Internal_Register
	POP.D	W10
;SC16IS740_DRV.c,52 :: 		CS_SC16IS740_Lat=OFF;
	BCLR.B	LATE, #5
;SC16IS740_DRV.c,53 :: 		SPIPut_SC16IS740(0x00);
	PUSH	W10
	CLR	W10
	CALL	_SPIPut_SC16IS740
	POP	W10
;SC16IS740_DRV.c,54 :: 		for(i=0;i<length;i++)
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_SC16IS740_WriteBufferToUart5:
; i start address is: 2 (W1)
	ZE	W11, W0
	CP	W1, W0
	BRA LTU	L__SC16IS740_WriteBufferToUart24
	GOTO	L_SC16IS740_WriteBufferToUart6
L__SC16IS740_WriteBufferToUart24:
;SC16IS740_DRV.c,56 :: 		SPIPut_SC16IS740(buff[i]);
	ADD	W10, W1, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_SPIPut_SC16IS740
	POP	W10
;SC16IS740_DRV.c,54 :: 		for(i=0;i<length;i++)
	INC	W1
;SC16IS740_DRV.c,57 :: 		}
; i end address is: 2 (W1)
	GOTO	L_SC16IS740_WriteBufferToUart5
L_SC16IS740_WriteBufferToUart6:
;SC16IS740_DRV.c,58 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;SC16IS740_DRV.c,66 :: 		}
L_end_SC16IS740_WriteBufferToUart:
	RETURN
; end of _SC16IS740_WriteBufferToUart

_SC16IS740_ReadBufferFromUart:
	LNK	#2

;SC16IS740_DRV.c,68 :: 		char SC16IS740_ReadBufferFromUart(char *buff)
;SC16IS740_DRV.c,71 :: 		len=Read_From_SC16IS740_Internal_Register(0x09);
	PUSH	W11
	PUSH	W10
	MOV.B	#9, W10
	CALL	_Read_From_SC16IS740_Internal_Register
; len start address is: 4 (W2)
	MOV.B	W0, W2
;SC16IS740_DRV.c,72 :: 		CS_SC16IS740_Lat=OFF;
	BCLR.B	LATE, #5
;SC16IS740_DRV.c,73 :: 		SPIPut_SC16IS740(0x80);
	MOV.B	#128, W10
	CALL	_SPIPut_SC16IS740
	POP	W10
;SC16IS740_DRV.c,74 :: 		for(i=0;i<len;i++)
; i start address is: 6 (W3)
	CLR	W3
; len end address is: 4 (W2)
; i end address is: 6 (W3)
L_SC16IS740_ReadBufferFromUart8:
; i start address is: 6 (W3)
; len start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__SC16IS740_ReadBufferFromUart26
	GOTO	L_SC16IS740_ReadBufferFromUart9
L__SC16IS740_ReadBufferFromUart26:
;SC16IS740_DRV.c,76 :: 		buff[i]=SPIGet_SC16IS740(0x00);
	ZE	W3, W0
	ADD	W10, W0, W0
	MOV	W0, [W14+0]
	PUSH	W10
	CLR	W10
	CALL	_SPIGet_SC16IS740
	POP	W10
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;SC16IS740_DRV.c,74 :: 		for(i=0;i<len;i++)
	INC.B	W3
;SC16IS740_DRV.c,77 :: 		}
; i end address is: 6 (W3)
	GOTO	L_SC16IS740_ReadBufferFromUart8
L_SC16IS740_ReadBufferFromUart9:
;SC16IS740_DRV.c,78 :: 		CS_SC16IS740_Lat=ON;
	BSET.B	LATE, #5
;SC16IS740_DRV.c,79 :: 		buff[len]=0;
	ZE	W2, W0
	ADD	W10, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;SC16IS740_DRV.c,80 :: 		Write_To_SC16IS740_Internal_Register(0x02,0x03); //clears the contents of the receive FIFO
	PUSH	W10
	MOV.B	#3, W11
	MOV.B	#2, W10
	CALL	_Write_To_SC16IS740_Internal_Register
	POP	W10
;SC16IS740_DRV.c,85 :: 		return len;
	MOV.B	W2, W0
; len end address is: 4 (W2)
;SC16IS740_DRV.c,86 :: 		}
;SC16IS740_DRV.c,85 :: 		return len;
;SC16IS740_DRV.c,86 :: 		}
L_end_SC16IS740_ReadBufferFromUart:
	POP	W11
	ULNK
	RETURN
; end of _SC16IS740_ReadBufferFromUart

_CheckSC16IS740UartDataReady:

;SC16IS740_DRV.c,88 :: 		char CheckSC16IS740UartDataReady(unsigned int  TimeOut,char *buff)
;SC16IS740_DRV.c,91 :: 		int i=0;
	PUSH	W10
; i start address is: 2 (W1)
	CLR	W1
;SC16IS740_DRV.c,92 :: 		if(TimeOut==0)
	CP	W10, #0
	BRA Z	L__CheckSC16IS740UartDataReady28
	GOTO	L_CheckSC16IS740UartDataReady11
L__CheckSC16IS740UartDataReady28:
; i end address is: 2 (W1)
;SC16IS740_DRV.c,94 :: 		if((Read_From_SC16IS740_Internal_Register(0x02)&0x0C)==0x0C) return SC16IS740_ReadBufferFromUart(buff);
	MOV.B	#2, W10
	CALL	_Read_From_SC16IS740_Internal_Register
	ZE	W0, W0
	AND	W0, #12, W0
	CP	W0, #12
	BRA Z	L__CheckSC16IS740UartDataReady29
	GOTO	L_CheckSC16IS740UartDataReady12
L__CheckSC16IS740UartDataReady29:
	MOV	W11, W10
	CALL	_SC16IS740_ReadBufferFromUart
	GOTO	L_end_CheckSC16IS740UartDataReady
L_CheckSC16IS740UartDataReady12:
;SC16IS740_DRV.c,95 :: 		else return 0;
	CLR	W0
	GOTO	L_end_CheckSC16IS740UartDataReady
;SC16IS740_DRV.c,96 :: 		}
L_CheckSC16IS740UartDataReady11:
;SC16IS740_DRV.c,97 :: 		while(i++<TimeOut)
; i start address is: 2 (W1)
L_CheckSC16IS740UartDataReady14:
; i end address is: 2 (W1)
; i start address is: 4 (W2)
; i start address is: 2 (W1)
	MOV	W1, W0
; i start address is: 4 (W2)
	ADD	W1, #1, W2
; i end address is: 2 (W1)
; i end address is: 4 (W2)
	CP	W0, W10
	BRA LTU	L__CheckSC16IS740UartDataReady30
	GOTO	L_CheckSC16IS740UartDataReady15
L__CheckSC16IS740UartDataReady30:
; i end address is: 4 (W2)
;SC16IS740_DRV.c,99 :: 		if((Read_From_SC16IS740_Internal_Register(0x02)&0x0C)==0x0C) return SC16IS740_ReadBufferFromUart(buff);
; i start address is: 4 (W2)
	PUSH	W10
	MOV.B	#2, W10
	CALL	_Read_From_SC16IS740_Internal_Register
	POP	W10
	ZE	W0, W0
	AND	W0, #12, W0
	CP	W0, #12
	BRA Z	L__CheckSC16IS740UartDataReady31
	GOTO	L_CheckSC16IS740UartDataReady16
L__CheckSC16IS740UartDataReady31:
; i end address is: 4 (W2)
	MOV	W11, W10
	CALL	_SC16IS740_ReadBufferFromUart
	GOTO	L_end_CheckSC16IS740UartDataReady
L_CheckSC16IS740UartDataReady16:
;SC16IS740_DRV.c,100 :: 		Delay_us(900);
; i start address is: 4 (W2)
	MOV	#4800, W7
L_CheckSC16IS740UartDataReady17:
	DEC	W7
	BRA NZ	L_CheckSC16IS740UartDataReady17
;SC16IS740_DRV.c,101 :: 		}
	MOV	W2, W1
; i end address is: 4 (W2)
	GOTO	L_CheckSC16IS740UartDataReady14
L_CheckSC16IS740UartDataReady15:
;SC16IS740_DRV.c,102 :: 		return 0;
	CLR	W0
;SC16IS740_DRV.c,103 :: 		}
;SC16IS740_DRV.c,102 :: 		return 0;
;SC16IS740_DRV.c,103 :: 		}
L_end_CheckSC16IS740UartDataReady:
	POP	W10
	RETURN
; end of _CheckSC16IS740UartDataReady

_SPIGet_SC16IS740:

;SC16IS740_DRV.c,105 :: 		char SPIGet_SC16IS740(char din)
;SC16IS740_DRV.c,107 :: 		return SPI1_Read(din);
	ZE	W10, W10
	CALL	_SPI1_Read
;SC16IS740_DRV.c,108 :: 		}
L_end_SPIGet_SC16IS740:
	RETURN
; end of _SPIGet_SC16IS740

_SPIPut_SC16IS740:

;SC16IS740_DRV.c,110 :: 		void SPIPut_SC16IS740(char din)
;SC16IS740_DRV.c,112 :: 		SPI1_Write(din);
	ZE	W10, W10
	CALL	_SPI1_Write
;SC16IS740_DRV.c,113 :: 		}
L_end_SPIPut_SC16IS740:
	RETURN
; end of _SPIPut_SC16IS740

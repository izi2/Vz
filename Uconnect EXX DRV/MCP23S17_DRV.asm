
_Init_MCP23S17:

;MCP23S17_DRV.c,8 :: 		void Init_MCP23S17(void)
;MCP23S17_DRV.c,10 :: 		CS_MCP23S17_Lat=ON;
	PUSH	W10
	PUSH	W11
	BSET.B	LATB, #5
;MCP23S17_DRV.c,11 :: 		CS_MCP23S17_Buff=DIGITAL;
	BCLR.B	ANSB, #5
;MCP23S17_DRV.c,12 :: 		CS_MCP23S17_Tris=OUTPUT;
	BCLR.B	TRISB, #5
;MCP23S17_DRV.c,13 :: 		Write_To_MCP23S17_Internal_Register(0x00,0x28); //PORT A  IN/OUT
	MOV.B	#40, W11
	CLR	W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,14 :: 		Write_To_MCP23S17_Internal_Register(0x01,0x10); //PORT B  IN/OUT
	MOV.B	#16, W11
	MOV.B	#1, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,15 :: 		Write_To_MCP23S17_Internal_Register(0x13,0xFE); //LATB B
	MOV.B	#254, W11
	MOV.B	#19, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,16 :: 		Write_To_MCP23S17_Internal_Register(0x12,0x17); //LATB B
	MOV.B	#23, W11
	MOV.B	#18, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,18 :: 		}
L_end_Init_MCP23S17:
	POP	W11
	POP	W10
	RETURN
; end of _Init_MCP23S17

_Read_Write_MCP23S17_IO:

;MCP23S17_DRV.c,20 :: 		char Read_Write_MCP23S17_IO(char PinName,char mode)
;MCP23S17_DRV.c,24 :: 		switch (PinName)
	PUSH	W10
	PUSH	W11
	GOTO	L_Read_Write_MCP23S17_IO0
;MCP23S17_DRV.c,26 :: 		case EN_1_8V:
L_Read_Write_MCP23S17_IO2:
;MCP23S17_DRV.c,27 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,28 :: 		if(mode) din|=0x01; else   din&=0xFE;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO43
	GOTO	L_Read_Write_MCP23S17_IO3
L__Read_Write_MCP23S17_IO43:
; din start address is: 0 (W0)
	IOR.B	W1, #1, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO4
L_Read_Write_MCP23S17_IO3:
; din start address is: 2 (W1)
	MOV.B	#254, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO4:
;MCP23S17_DRV.c,29 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,30 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,31 :: 		case CS_FLASH:
L_Read_Write_MCP23S17_IO5:
;MCP23S17_DRV.c,32 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,33 :: 		if(mode) din|=0x02; else   din&=0xFD;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO44
	GOTO	L_Read_Write_MCP23S17_IO6
L__Read_Write_MCP23S17_IO44:
; din start address is: 0 (W0)
	IOR.B	W1, #2, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO7
L_Read_Write_MCP23S17_IO6:
; din start address is: 2 (W1)
	MOV.B	#253, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO7:
;MCP23S17_DRV.c,34 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,35 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,36 :: 		case RESET_ADP:
L_Read_Write_MCP23S17_IO8:
;MCP23S17_DRV.c,37 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,38 :: 		if(mode) din|=0x04; else   din&=0xFB;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO45
	GOTO	L_Read_Write_MCP23S17_IO9
L__Read_Write_MCP23S17_IO45:
; din start address is: 0 (W0)
	IOR.B	W1, #4, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO10
L_Read_Write_MCP23S17_IO9:
; din start address is: 2 (W1)
	MOV.B	#251, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO10:
;MCP23S17_DRV.c,39 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,40 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,41 :: 		case USER_LED:
L_Read_Write_MCP23S17_IO11:
;MCP23S17_DRV.c,42 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,43 :: 		if(mode) din|=0x08; else   din&=0xF7;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO46
	GOTO	L_Read_Write_MCP23S17_IO12
L__Read_Write_MCP23S17_IO46:
; din start address is: 0 (W0)
	IOR.B	W1, #8, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO13
L_Read_Write_MCP23S17_IO12:
; din start address is: 2 (W1)
	MOV.B	#247, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO13:
;MCP23S17_DRV.c,44 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,45 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,46 :: 		case HOLD_SRAM:
L_Read_Write_MCP23S17_IO14:
;MCP23S17_DRV.c,47 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,48 :: 		if(mode) din|=0x20; else   din&=0xDF;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO47
	GOTO	L_Read_Write_MCP23S17_IO15
L__Read_Write_MCP23S17_IO47:
	MOV.B	#32, W0
; din start address is: 0 (W0)
	IOR.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO16
L_Read_Write_MCP23S17_IO15:
; din start address is: 2 (W1)
	MOV.B	#223, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO16:
;MCP23S17_DRV.c,49 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,50 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,51 :: 		case WP_FLASH:
L_Read_Write_MCP23S17_IO17:
;MCP23S17_DRV.c,52 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,53 :: 		if(mode) din|=0x40; else   din&=0xBF;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO48
	GOTO	L_Read_Write_MCP23S17_IO18
L__Read_Write_MCP23S17_IO48:
	MOV.B	#64, W0
; din start address is: 0 (W0)
	IOR.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO19
L_Read_Write_MCP23S17_IO18:
; din start address is: 2 (W1)
	MOV.B	#191, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO19:
;MCP23S17_DRV.c,54 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,55 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,56 :: 		case RESET_VZ:
L_Read_Write_MCP23S17_IO20:
;MCP23S17_DRV.c,57 :: 		din=Read_From_MCP23S17_Internal_Register(0x13); //GPIOB
	MOV.B	#19, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,58 :: 		if(mode) din|=0x80; else   din&=0x7F;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO49
	GOTO	L_Read_Write_MCP23S17_IO21
L__Read_Write_MCP23S17_IO49:
	MOV.B	#128, W0
; din start address is: 0 (W0)
	IOR.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO22
L_Read_Write_MCP23S17_IO21:
; din start address is: 2 (W1)
	MOV.B	#127, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO22:
;MCP23S17_DRV.c,59 :: 		Write_To_MCP23S17_Internal_Register(0x15,din);//OLATB
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#21, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,60 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,61 :: 		case ESP_FLASH:
L_Read_Write_MCP23S17_IO23:
;MCP23S17_DRV.c,62 :: 		din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
	MOV.B	#18, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,63 :: 		if(mode) din|=0x02; else   din&=0xFD;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO50
	GOTO	L_Read_Write_MCP23S17_IO24
L__Read_Write_MCP23S17_IO50:
; din start address is: 0 (W0)
	IOR.B	W1, #2, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO25
L_Read_Write_MCP23S17_IO24:
; din start address is: 2 (W1)
	MOV.B	#253, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO25:
;MCP23S17_DRV.c,64 :: 		Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#20, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,65 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,66 :: 		case ESP_RESET:
L_Read_Write_MCP23S17_IO26:
;MCP23S17_DRV.c,67 :: 		din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
	MOV.B	#18, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,68 :: 		if(mode) din|=0x04; else   din&=0xFB;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO51
	GOTO	L_Read_Write_MCP23S17_IO27
L__Read_Write_MCP23S17_IO51:
; din start address is: 0 (W0)
	IOR.B	W1, #4, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO28
L_Read_Write_MCP23S17_IO27:
; din start address is: 2 (W1)
	MOV.B	#251, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO28:
;MCP23S17_DRV.c,69 :: 		Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#20, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,70 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,71 :: 		case ESP_EN_PIN:
L_Read_Write_MCP23S17_IO29:
;MCP23S17_DRV.c,72 :: 		din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
	MOV.B	#18, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,73 :: 		if(mode) din|=0x10; else   din&=0xEF;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO52
	GOTO	L_Read_Write_MCP23S17_IO30
L__Read_Write_MCP23S17_IO52:
; din start address is: 0 (W0)
	IOR.B	W1, #16, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO31
L_Read_Write_MCP23S17_IO30:
; din start address is: 2 (W1)
	MOV.B	#239, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO31:
;MCP23S17_DRV.c,74 :: 		Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#20, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,75 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,76 :: 		case ESP_CTS:
L_Read_Write_MCP23S17_IO32:
;MCP23S17_DRV.c,77 :: 		din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
	MOV.B	#18, W10
	CALL	_Read_From_MCP23S17_Internal_Register
;MCP23S17_DRV.c,78 :: 		if(din&0x20) return 1;else return 0;
	BTSS	W0, #5
	GOTO	L_Read_Write_MCP23S17_IO33
	MOV.B	#1, W0
	GOTO	L_end_Read_Write_MCP23S17_IO
L_Read_Write_MCP23S17_IO33:
	CLR	W0
	GOTO	L_end_Read_Write_MCP23S17_IO
;MCP23S17_DRV.c,80 :: 		case ESP_RTS:
L_Read_Write_MCP23S17_IO35:
;MCP23S17_DRV.c,81 :: 		din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
	MOV.B	#18, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,82 :: 		if(mode) din|=0x40; else   din&=0xBF;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO53
	GOTO	L_Read_Write_MCP23S17_IO36
L__Read_Write_MCP23S17_IO53:
	MOV.B	#64, W0
; din start address is: 0 (W0)
	IOR.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO37
L_Read_Write_MCP23S17_IO36:
; din start address is: 2 (W1)
	MOV.B	#191, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO37:
;MCP23S17_DRV.c,83 :: 		Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#20, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,84 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,85 :: 		case EN_LASER:
L_Read_Write_MCP23S17_IO38:
;MCP23S17_DRV.c,86 :: 		din=Read_From_MCP23S17_Internal_Register(0x12); //GPIOA
	MOV.B	#18, W10
	CALL	_Read_From_MCP23S17_Internal_Register
; din start address is: 2 (W1)
	MOV.B	W0, W1
;MCP23S17_DRV.c,87 :: 		if(mode) din|=0x80; else   din&=0x7F;
	CP0.B	W11
	BRA NZ	L__Read_Write_MCP23S17_IO54
	GOTO	L_Read_Write_MCP23S17_IO39
L__Read_Write_MCP23S17_IO54:
	MOV.B	#128, W0
; din start address is: 0 (W0)
	IOR.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
	GOTO	L_Read_Write_MCP23S17_IO40
L_Read_Write_MCP23S17_IO39:
; din start address is: 2 (W1)
	MOV.B	#127, W0
; din start address is: 0 (W0)
	AND.B	W1, W0, W0
; din end address is: 2 (W1)
; din end address is: 0 (W0)
L_Read_Write_MCP23S17_IO40:
;MCP23S17_DRV.c,88 :: 		Write_To_MCP23S17_Internal_Register(0x14,din);//OLATA
; din start address is: 0 (W0)
	MOV.B	W0, W11
; din end address is: 0 (W0)
	MOV.B	#20, W10
	CALL	_Write_To_MCP23S17_Internal_Register
;MCP23S17_DRV.c,89 :: 		break;
	GOTO	L_Read_Write_MCP23S17_IO1
;MCP23S17_DRV.c,90 :: 		}
L_Read_Write_MCP23S17_IO0:
	CP.B	W10, #0
	BRA NZ	L__Read_Write_MCP23S17_IO55
	GOTO	L_Read_Write_MCP23S17_IO2
L__Read_Write_MCP23S17_IO55:
	CP.B	W10, #1
	BRA NZ	L__Read_Write_MCP23S17_IO56
	GOTO	L_Read_Write_MCP23S17_IO5
L__Read_Write_MCP23S17_IO56:
	CP.B	W10, #2
	BRA NZ	L__Read_Write_MCP23S17_IO57
	GOTO	L_Read_Write_MCP23S17_IO8
L__Read_Write_MCP23S17_IO57:
	CP.B	W10, #3
	BRA NZ	L__Read_Write_MCP23S17_IO58
	GOTO	L_Read_Write_MCP23S17_IO11
L__Read_Write_MCP23S17_IO58:
	CP.B	W10, #4
	BRA NZ	L__Read_Write_MCP23S17_IO59
	GOTO	L_Read_Write_MCP23S17_IO14
L__Read_Write_MCP23S17_IO59:
	CP.B	W10, #5
	BRA NZ	L__Read_Write_MCP23S17_IO60
	GOTO	L_Read_Write_MCP23S17_IO17
L__Read_Write_MCP23S17_IO60:
	CP.B	W10, #6
	BRA NZ	L__Read_Write_MCP23S17_IO61
	GOTO	L_Read_Write_MCP23S17_IO20
L__Read_Write_MCP23S17_IO61:
	CP.B	W10, #12
	BRA NZ	L__Read_Write_MCP23S17_IO62
	GOTO	L_Read_Write_MCP23S17_IO23
L__Read_Write_MCP23S17_IO62:
	CP.B	W10, #11
	BRA NZ	L__Read_Write_MCP23S17_IO63
	GOTO	L_Read_Write_MCP23S17_IO26
L__Read_Write_MCP23S17_IO63:
	CP.B	W10, #10
	BRA NZ	L__Read_Write_MCP23S17_IO64
	GOTO	L_Read_Write_MCP23S17_IO29
L__Read_Write_MCP23S17_IO64:
	CP.B	W10, #9
	BRA NZ	L__Read_Write_MCP23S17_IO65
	GOTO	L_Read_Write_MCP23S17_IO32
L__Read_Write_MCP23S17_IO65:
	CP.B	W10, #8
	BRA NZ	L__Read_Write_MCP23S17_IO66
	GOTO	L_Read_Write_MCP23S17_IO35
L__Read_Write_MCP23S17_IO66:
	CP.B	W10, #7
	BRA NZ	L__Read_Write_MCP23S17_IO67
	GOTO	L_Read_Write_MCP23S17_IO38
L__Read_Write_MCP23S17_IO67:
L_Read_Write_MCP23S17_IO1:
;MCP23S17_DRV.c,92 :: 		}
L_end_Read_Write_MCP23S17_IO:
	POP	W11
	POP	W10
	RETURN
; end of _Read_Write_MCP23S17_IO

_Write_To_MCP23S17_Internal_Register:

;MCP23S17_DRV.c,94 :: 		void Write_To_MCP23S17_Internal_Register(char Register_ADD,char Register_Data)
;MCP23S17_DRV.c,96 :: 		CS_MCP23S17_Lat=OFF;
	PUSH	W10
	BCLR.B	LATB, #5
;MCP23S17_DRV.c,97 :: 		SPIPut_MCP23S17(0x40);
	PUSH	W10
	MOV.B	#64, W10
	CALL	_SPIPut_MCP23S17
	POP	W10
;MCP23S17_DRV.c,98 :: 		SPIPut_MCP23S17(Register_ADD);
	CALL	_SPIPut_MCP23S17
;MCP23S17_DRV.c,99 :: 		SPIPut_MCP23S17(Register_Data);
	MOV.B	W11, W10
	CALL	_SPIPut_MCP23S17
;MCP23S17_DRV.c,100 :: 		CS_MCP23S17_Lat=ON;
	BSET.B	LATB, #5
;MCP23S17_DRV.c,101 :: 		}
L_end_Write_To_MCP23S17_Internal_Register:
	POP	W10
	RETURN
; end of _Write_To_MCP23S17_Internal_Register

_Read_From_MCP23S17_Internal_Register:

;MCP23S17_DRV.c,103 :: 		char Read_From_MCP23S17_Internal_Register(char Register_ADD)
;MCP23S17_DRV.c,106 :: 		CS_MCP23S17_Lat=OFF;
	PUSH	W10
	BCLR.B	LATB, #5
;MCP23S17_DRV.c,107 :: 		SPIPut_MCP23S17(0x41);
	PUSH	W10
	MOV.B	#65, W10
	CALL	_SPIPut_MCP23S17
	POP	W10
;MCP23S17_DRV.c,108 :: 		SPIPut_MCP23S17(Register_ADD);
	CALL	_SPIPut_MCP23S17
;MCP23S17_DRV.c,109 :: 		DataOut=SPIGet_MCP23S17(0x00);
	CLR	W10
	CALL	_SPIGet_MCP23S17
;MCP23S17_DRV.c,110 :: 		CS_MCP23S17_Lat=ON;
	BSET.B	LATB, #5
;MCP23S17_DRV.c,111 :: 		return DataOut;
;MCP23S17_DRV.c,112 :: 		}
;MCP23S17_DRV.c,111 :: 		return DataOut;
;MCP23S17_DRV.c,112 :: 		}
L_end_Read_From_MCP23S17_Internal_Register:
	POP	W10
	RETURN
; end of _Read_From_MCP23S17_Internal_Register

_SPIPut_MCP23S17:

;MCP23S17_DRV.c,114 :: 		void SPIPut_MCP23S17(char din)
;MCP23S17_DRV.c,116 :: 		SPI1_Write(din);
	ZE	W10, W10
	CALL	_SPI1_Write
;MCP23S17_DRV.c,117 :: 		}
L_end_SPIPut_MCP23S17:
	RETURN
; end of _SPIPut_MCP23S17

_SPIGet_MCP23S17:

;MCP23S17_DRV.c,119 :: 		char SPIGet_MCP23S17(char din)
;MCP23S17_DRV.c,121 :: 		return SPI1_Read(din);
	ZE	W10, W10
	CALL	_SPI1_Read
;MCP23S17_DRV.c,122 :: 		}
L_end_SPIGet_MCP23S17:
	RETURN
; end of _SPIGet_MCP23S17

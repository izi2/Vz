
_OpticDataGetFrame_VelocityOnly:
	LNK	#4

;VZ_Sensor.c,9 :: 		void OpticDataGetFrame_VelocityOnly(void)
;VZ_Sensor.c,12 :: 		unsigned int BufferIndex=0,i,LoopIndex;
	PUSH	W10
; BufferIndex start address is: 10 (W5)
	CLR	W5
;VZ_Sensor.c,14 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,15 :: 		SPI1_Write(VZ_SPI_READ);
	MOV	#27, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,16 :: 		SPI1_Write(VZ_SPI_TARGET_COMMAND);
	MOV	#3, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,17 :: 		SPI1_Write(0x10);
	MOV	#16, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,18 :: 		SPI1_Write(0x01);
	MOV	#1, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,19 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,20 :: 		Delay_us(200);
	MOV	#1066, W7
L_OpticDataGetFrame_VelocityOnly0:
	DEC	W7
	BRA NZ	L_OpticDataGetFrame_VelocityOnly0
	NOP
	NOP
;VZ_Sensor.c,21 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
; LoopIndex start address is: 6 (W3)
	CLR	W3
; BufferIndex end address is: 10 (W5)
; LoopIndex end address is: 6 (W3)
L_OpticDataGetFrame_VelocityOnly2:
; LoopIndex start address is: 6 (W3)
; BufferIndex start address is: 10 (W5)
	CP	W3, #8
	BRA LTU	L__OpticDataGetFrame_VelocityOnly95
	GOTO	L_OpticDataGetFrame_VelocityOnly3
L__OpticDataGetFrame_VelocityOnly95:
;VZ_Sensor.c,23 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,24 :: 		for(i=0;i<8;i++)
; i start address is: 8 (W4)
	CLR	W4
; BufferIndex end address is: 10 (W5)
; i end address is: 8 (W4)
; LoopIndex end address is: 6 (W3)
L_OpticDataGetFrame_VelocityOnly5:
; i start address is: 8 (W4)
; BufferIndex start address is: 10 (W5)
; LoopIndex start address is: 6 (W3)
	CP	W4, #8
	BRA LTU	L__OpticDataGetFrame_VelocityOnly96
	GOTO	L_OpticDataGetFrame_VelocityOnly6
L__OpticDataGetFrame_VelocityOnly96:
;VZ_Sensor.c,26 :: 		if((LoopIndex<7)||(i<4))  Vz_Sensor_Velocity_Buffer_int[BufferIndex++]=(int)(((unsigned int)SPI1_Read(0x00))|((unsigned int)(SPI1_Read(0x00)<<8)));
	CP	W3, #7
	BRA GEU	L__OpticDataGetFrame_VelocityOnly97
	GOTO	L__OpticDataGetFrame_VelocityOnly84
L__OpticDataGetFrame_VelocityOnly97:
	CP	W4, #4
	BRA GEU	L__OpticDataGetFrame_VelocityOnly98
	GOTO	L__OpticDataGetFrame_VelocityOnly83
L__OpticDataGetFrame_VelocityOnly98:
	GOTO	L_OpticDataGetFrame_VelocityOnly10
L__OpticDataGetFrame_VelocityOnly84:
L__OpticDataGetFrame_VelocityOnly83:
	SL	W5, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+2]
	CLR	W10
	CALL	_SPI1_Read
	MOV	W0, [W14+0]
	CLR	W10
	CALL	_SPI1_Read
	SL	W0, #8, W2
	MOV	[W14+2], W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
	INC	W5
	GOTO	L_OpticDataGetFrame_VelocityOnly11
L_OpticDataGetFrame_VelocityOnly10:
;VZ_Sensor.c,27 :: 		else {SPI1_Read(0x00);SPI1_Read(0x00);}
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
; BufferIndex end address is: 10 (W5)
L_OpticDataGetFrame_VelocityOnly11:
;VZ_Sensor.c,28 :: 		SPI1_Read(0x00);SPI1_Read(0x00);
; BufferIndex start address is: 10 (W5)
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
;VZ_Sensor.c,24 :: 		for(i=0;i<8;i++)
	INC	W4
;VZ_Sensor.c,29 :: 		}
; i end address is: 8 (W4)
	GOTO	L_OpticDataGetFrame_VelocityOnly5
L_OpticDataGetFrame_VelocityOnly6:
;VZ_Sensor.c,30 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,31 :: 		Delay_us(70);
	MOV	#373, W7
L_OpticDataGetFrame_VelocityOnly12:
	DEC	W7
	BRA NZ	L_OpticDataGetFrame_VelocityOnly12
	NOP
;VZ_Sensor.c,21 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
	INC	W3
;VZ_Sensor.c,32 :: 		}
; BufferIndex end address is: 10 (W5)
; LoopIndex end address is: 6 (W3)
	GOTO	L_OpticDataGetFrame_VelocityOnly2
L_OpticDataGetFrame_VelocityOnly3:
;VZ_Sensor.c,33 :: 		}
L_end_OpticDataGetFrame_VelocityOnly:
	POP	W10
	ULNK
	RETURN
; end of _OpticDataGetFrame_VelocityOnly

_OpticDataGetFrame_DistanceOnly:
	LNK	#4

;VZ_Sensor.c,35 :: 		void OpticDataGetFrame_DistanceOnly(void)
;VZ_Sensor.c,38 :: 		unsigned int BufferIndex=0,i,LoopIndex;
	PUSH	W10
; BufferIndex start address is: 10 (W5)
	CLR	W5
;VZ_Sensor.c,40 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,41 :: 		SPI1_Write(VZ_SPI_READ);
	MOV	#27, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,42 :: 		SPI1_Write(VZ_SPI_TARGET_COMMAND);
	MOV	#3, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,43 :: 		SPI1_Write(0x10);
	MOV	#16, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,44 :: 		SPI1_Write(0x01);
	MOV	#1, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,45 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,46 :: 		Delay_us(200);
	MOV	#1066, W7
L_OpticDataGetFrame_DistanceOnly14:
	DEC	W7
	BRA NZ	L_OpticDataGetFrame_DistanceOnly14
	NOP
	NOP
;VZ_Sensor.c,47 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
; LoopIndex start address is: 6 (W3)
	CLR	W3
; BufferIndex end address is: 10 (W5)
; LoopIndex end address is: 6 (W3)
L_OpticDataGetFrame_DistanceOnly16:
; LoopIndex start address is: 6 (W3)
; BufferIndex start address is: 10 (W5)
	CP	W3, #8
	BRA LTU	L__OpticDataGetFrame_DistanceOnly100
	GOTO	L_OpticDataGetFrame_DistanceOnly17
L__OpticDataGetFrame_DistanceOnly100:
;VZ_Sensor.c,49 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,50 :: 		for(i=0;i<8;i++)
; i start address is: 8 (W4)
	CLR	W4
; BufferIndex end address is: 10 (W5)
; i end address is: 8 (W4)
; LoopIndex end address is: 6 (W3)
L_OpticDataGetFrame_DistanceOnly19:
; i start address is: 8 (W4)
; BufferIndex start address is: 10 (W5)
; LoopIndex start address is: 6 (W3)
	CP	W4, #8
	BRA LTU	L__OpticDataGetFrame_DistanceOnly101
	GOTO	L_OpticDataGetFrame_DistanceOnly20
L__OpticDataGetFrame_DistanceOnly101:
;VZ_Sensor.c,52 :: 		SPI1_Read(0x00);SPI1_Read(0x00);
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
;VZ_Sensor.c,53 :: 		if((LoopIndex<7)||(i<4))
	CP	W3, #7
	BRA GEU	L__OpticDataGetFrame_DistanceOnly102
	GOTO	L__OpticDataGetFrame_DistanceOnly87
L__OpticDataGetFrame_DistanceOnly102:
	CP	W4, #4
	BRA GEU	L__OpticDataGetFrame_DistanceOnly103
	GOTO	L__OpticDataGetFrame_DistanceOnly86
L__OpticDataGetFrame_DistanceOnly103:
	GOTO	L_OpticDataGetFrame_DistanceOnly24
L__OpticDataGetFrame_DistanceOnly87:
L__OpticDataGetFrame_DistanceOnly86:
;VZ_Sensor.c,55 :: 		Vz_Sensor_Distance_Buffer_int[BufferIndex++]=(((unsigned int)SPI1_Read(0x00))|((unsigned int)((SPI1_Read(0x00)&0x3F)<<8)));
	SL	W5, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+2]
	CLR	W10
	CALL	_SPI1_Read
	MOV	W0, [W14+0]
	CLR	W10
	CALL	_SPI1_Read
	MOV	#63, W1
	AND	W0, W1, W0
	SL	W0, #8, W2
	MOV	[W14+2], W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
	INC	W5
;VZ_Sensor.c,56 :: 		}
	GOTO	L_OpticDataGetFrame_DistanceOnly25
L_OpticDataGetFrame_DistanceOnly24:
;VZ_Sensor.c,57 :: 		else {SPI1_Read(0x00);SPI1_Read(0x00);}
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
; BufferIndex end address is: 10 (W5)
L_OpticDataGetFrame_DistanceOnly25:
;VZ_Sensor.c,50 :: 		for(i=0;i<8;i++)
; BufferIndex start address is: 10 (W5)
	INC	W4
;VZ_Sensor.c,58 :: 		}
; i end address is: 8 (W4)
	GOTO	L_OpticDataGetFrame_DistanceOnly19
L_OpticDataGetFrame_DistanceOnly20:
;VZ_Sensor.c,59 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,60 :: 		Delay_us(70);
	MOV	#373, W7
L_OpticDataGetFrame_DistanceOnly26:
	DEC	W7
	BRA NZ	L_OpticDataGetFrame_DistanceOnly26
	NOP
;VZ_Sensor.c,47 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
	INC	W3
;VZ_Sensor.c,61 :: 		}
; BufferIndex end address is: 10 (W5)
; LoopIndex end address is: 6 (W3)
	GOTO	L_OpticDataGetFrame_DistanceOnly16
L_OpticDataGetFrame_DistanceOnly17:
;VZ_Sensor.c,62 :: 		}
L_end_OpticDataGetFrame_DistanceOnly:
	POP	W10
	ULNK
	RETURN
; end of _OpticDataGetFrame_DistanceOnly

_OpticDataGetFrame_AllData:
	LNK	#4

;VZ_Sensor.c,64 :: 		void OpticDataGetFrame_AllData(void)
;VZ_Sensor.c,67 :: 		unsigned int BufferIndex=0,i,LoopIndex;
	PUSH	W10
; BufferIndex start address is: 10 (W5)
	CLR	W5
;VZ_Sensor.c,69 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,70 :: 		SPI1_Write(VZ_SPI_READ);
	MOV	#27, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,71 :: 		SPI1_Write(VZ_SPI_TARGET_COMMAND);
	MOV	#3, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,72 :: 		SPI1_Write(0x10);
	MOV	#16, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,73 :: 		SPI1_Write(0x01);
	MOV	#1, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,74 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,75 :: 		Delay_us(200);
	MOV	#1066, W7
L_OpticDataGetFrame_AllData28:
	DEC	W7
	BRA NZ	L_OpticDataGetFrame_AllData28
	NOP
	NOP
;VZ_Sensor.c,76 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
; LoopIndex start address is: 6 (W3)
	CLR	W3
; BufferIndex end address is: 10 (W5)
; LoopIndex end address is: 6 (W3)
L_OpticDataGetFrame_AllData30:
; LoopIndex start address is: 6 (W3)
; BufferIndex start address is: 10 (W5)
	CP	W3, #8
	BRA LTU	L__OpticDataGetFrame_AllData105
	GOTO	L_OpticDataGetFrame_AllData31
L__OpticDataGetFrame_AllData105:
;VZ_Sensor.c,78 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,79 :: 		for(i=0;i<8;i++)
; i start address is: 8 (W4)
	CLR	W4
; BufferIndex end address is: 10 (W5)
; i end address is: 8 (W4)
; LoopIndex end address is: 6 (W3)
L_OpticDataGetFrame_AllData33:
; i start address is: 8 (W4)
; BufferIndex start address is: 10 (W5)
; LoopIndex start address is: 6 (W3)
	CP	W4, #8
	BRA LTU	L__OpticDataGetFrame_AllData106
	GOTO	L_OpticDataGetFrame_AllData34
L__OpticDataGetFrame_AllData106:
;VZ_Sensor.c,81 :: 		if((LoopIndex<7)||(i<4))
	CP	W3, #7
	BRA GEU	L__OpticDataGetFrame_AllData107
	GOTO	L__OpticDataGetFrame_AllData90
L__OpticDataGetFrame_AllData107:
	CP	W4, #4
	BRA GEU	L__OpticDataGetFrame_AllData108
	GOTO	L__OpticDataGetFrame_AllData89
L__OpticDataGetFrame_AllData108:
	GOTO	L_OpticDataGetFrame_AllData38
L__OpticDataGetFrame_AllData90:
L__OpticDataGetFrame_AllData89:
;VZ_Sensor.c,83 :: 		Vz_Sensor_Velocity_Buffer_int[BufferIndex]=(int)(((unsigned int)SPI1_Read(0x00))|((unsigned int)(SPI1_Read(0x00)<<8)));
	SL	W5, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+2]
	CLR	W10
	CALL	_SPI1_Read
	MOV	W0, [W14+0]
	CLR	W10
	CALL	_SPI1_Read
	SL	W0, #8, W2
	MOV	[W14+2], W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;VZ_Sensor.c,84 :: 		Vz_Sensor_Distance_Buffer_int[BufferIndex++]=(((unsigned int)SPI1_Read(0x00))|((unsigned int)(SPI1_Read(0x00)<<8)));
	SL	W5, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+2]
	CLR	W10
	CALL	_SPI1_Read
	MOV	W0, [W14+0]
	CLR	W10
	CALL	_SPI1_Read
	SL	W0, #8, W2
	MOV	[W14+2], W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
	INC	W5
;VZ_Sensor.c,85 :: 		}
	GOTO	L_OpticDataGetFrame_AllData39
L_OpticDataGetFrame_AllData38:
;VZ_Sensor.c,86 :: 		else {SPI1_Read(0x00);SPI1_Read(0x00);SPI1_Read(0x00);SPI1_Read(0x00);}
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
; BufferIndex end address is: 10 (W5)
L_OpticDataGetFrame_AllData39:
;VZ_Sensor.c,79 :: 		for(i=0;i<8;i++)
; BufferIndex start address is: 10 (W5)
	INC	W4
;VZ_Sensor.c,87 :: 		}
; i end address is: 8 (W4)
	GOTO	L_OpticDataGetFrame_AllData33
L_OpticDataGetFrame_AllData34:
;VZ_Sensor.c,88 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,89 :: 		Delay_us(70);
	MOV	#373, W7
L_OpticDataGetFrame_AllData40:
	DEC	W7
	BRA NZ	L_OpticDataGetFrame_AllData40
	NOP
;VZ_Sensor.c,76 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
	INC	W3
;VZ_Sensor.c,90 :: 		}
; BufferIndex end address is: 10 (W5)
; LoopIndex end address is: 6 (W3)
	GOTO	L_OpticDataGetFrame_AllData30
L_OpticDataGetFrame_AllData31:
;VZ_Sensor.c,91 :: 		}
L_end_OpticDataGetFrame_AllData:
	POP	W10
	ULNK
	RETURN
; end of _OpticDataGetFrame_AllData

_OpticDataGetCleanBuffer:

;VZ_Sensor.c,93 :: 		void OpticDataGetCleanBuffer(void)
;VZ_Sensor.c,95 :: 		unsigned int BufferIndex=0,i,LoopIndex;
	PUSH	W10
;VZ_Sensor.c,97 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,98 :: 		SPI1_Write(VZ_SPI_READ);
	MOV	#27, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,99 :: 		SPI1_Write(VZ_SPI_TARGET_COMMAND);
	MOV	#3, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,100 :: 		SPI1_Write(0x10);
	MOV	#16, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,101 :: 		SPI1_Write(0x01);
	MOV	#1, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,102 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,103 :: 		Delay_us(200);
	MOV	#1066, W7
L_OpticDataGetCleanBuffer42:
	DEC	W7
	BRA NZ	L_OpticDataGetCleanBuffer42
	NOP
	NOP
;VZ_Sensor.c,104 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
; LoopIndex start address is: 2 (W1)
	CLR	W1
; LoopIndex end address is: 2 (W1)
L_OpticDataGetCleanBuffer44:
; LoopIndex start address is: 2 (W1)
	CP	W1, #8
	BRA LTU	L__OpticDataGetCleanBuffer110
	GOTO	L_OpticDataGetCleanBuffer45
L__OpticDataGetCleanBuffer110:
;VZ_Sensor.c,106 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,107 :: 		for(i=0;i<8;i++)
; i start address is: 0 (W0)
	CLR	W0
; i end address is: 0 (W0)
; LoopIndex end address is: 2 (W1)
	MOV	W0, W2
L_OpticDataGetCleanBuffer47:
; i start address is: 4 (W2)
; LoopIndex start address is: 2 (W1)
	CP	W2, #8
	BRA LTU	L__OpticDataGetCleanBuffer111
	GOTO	L_OpticDataGetCleanBuffer48
L__OpticDataGetCleanBuffer111:
;VZ_Sensor.c,109 :: 		SPI1_Read(0x00);SPI1_Read(0x00);
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
;VZ_Sensor.c,110 :: 		SPI1_Read(0x00);SPI1_Read(0x00);
	CLR	W10
	CALL	_SPI1_Read
	CLR	W10
	CALL	_SPI1_Read
;VZ_Sensor.c,107 :: 		for(i=0;i<8;i++)
	INC	W2
;VZ_Sensor.c,111 :: 		}
; i end address is: 4 (W2)
	GOTO	L_OpticDataGetCleanBuffer47
L_OpticDataGetCleanBuffer48:
;VZ_Sensor.c,112 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,113 :: 		Delay_us(70);
	MOV	#373, W7
L_OpticDataGetCleanBuffer50:
	DEC	W7
	BRA NZ	L_OpticDataGetCleanBuffer50
	NOP
;VZ_Sensor.c,104 :: 		for(LoopIndex=0;LoopIndex<8;LoopIndex++)
	INC	W1
;VZ_Sensor.c,114 :: 		}
; LoopIndex end address is: 2 (W1)
	GOTO	L_OpticDataGetCleanBuffer44
L_OpticDataGetCleanBuffer45:
;VZ_Sensor.c,115 :: 		OpticDataCheckIfReady();
	CALL	_OpticDataCheckIfReady
;VZ_Sensor.c,116 :: 		}
L_end_OpticDataGetCleanBuffer:
	POP	W10
	RETURN
; end of _OpticDataGetCleanBuffer

_Vz_SetBist:
	LNK	#8

;VZ_Sensor.c,118 :: 		void Vz_SetBist(char mode)
;VZ_Sensor.c,120 :: 		char Buff[8]={0x01,0x00,0x04,0x00,0x00,0x00,0x00,0x00};
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSVz_SetBist_Buff_L0), W0
	REPEAT	#7
	MOV.B	[W0++], [W1++]
;VZ_Sensor.c,122 :: 		switch (mode)
	GOTO	L_Vz_SetBist52
;VZ_Sensor.c,124 :: 		case Saw:
L_Vz_SetBist54:
;VZ_Sensor.c,125 :: 		Buff[4]=0x03;
	ADD	W14, #0, W0
	ADD	W0, #4, W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;VZ_Sensor.c,126 :: 		break;
	GOTO	L_Vz_SetBist53
;VZ_Sensor.c,127 :: 		case Sinus:
L_Vz_SetBist55:
;VZ_Sensor.c,128 :: 		Buff[4]=0x04;
	ADD	W14, #0, W0
	ADD	W0, #4, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;VZ_Sensor.c,129 :: 		break;
	GOTO	L_Vz_SetBist53
;VZ_Sensor.c,130 :: 		}
L_Vz_SetBist52:
	CP.B	W10, #1
	BRA NZ	L__Vz_SetBist113
	GOTO	L_Vz_SetBist54
L__Vz_SetBist113:
	CP.B	W10, #2
	BRA NZ	L__Vz_SetBist114
	GOTO	L_Vz_SetBist55
L__Vz_SetBist114:
L_Vz_SetBist53:
;VZ_Sensor.c,131 :: 		VzSensor_SpiWriteAddr(VZ_SPI_TARGET_COMMAND,0x010d,Buff,8);
	ADD	W14, #0, W0
	MOV.B	#8, W13
	MOV	W0, W12
	MOV	#269, W11
	MOV.B	#3, W10
	CALL	_VzSensor_SpiWriteAddr
;VZ_Sensor.c,132 :: 		Delay_ms(100);
	MOV	#9, W8
	MOV	#9047, W7
L_Vz_SetBist56:
	DEC	W7
	BRA NZ	L_Vz_SetBist56
	DEC	W8
	BRA NZ	L_Vz_SetBist56
;VZ_Sensor.c,133 :: 		}
L_end_Vz_SetBist:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Vz_SetBist

_OpticDataCheckIfReady:
	LNK	#4

;VZ_Sensor.c,135 :: 		char OpticDataCheckIfReady(void)
;VZ_Sensor.c,137 :: 		char Buff[4] = {0x00};
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV.B	W0, [W14+0]
	MOV	#0, W0
	MOV.B	W0, [W14+1]
	MOV	#0, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
;VZ_Sensor.c,138 :: 		VzSensor_SpiReadAddr(VZ_SPI_TARGET_COMMAND,0x0111,Buff,4);
	ADD	W14, #0, W0
	MOV.B	#4, W13
	MOV	W0, W12
	MOV	#273, W11
	MOV.B	#3, W10
	CALL	_VzSensor_SpiReadAddr
;VZ_Sensor.c,140 :: 		if(Buff[0]==1) return 1;
	ADD	W14, #0, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__OpticDataCheckIfReady116
	GOTO	L_OpticDataCheckIfReady58
L__OpticDataCheckIfReady116:
	MOV.B	#1, W0
	GOTO	L_end_OpticDataCheckIfReady
L_OpticDataCheckIfReady58:
;VZ_Sensor.c,141 :: 		else return 0;
	CLR	W0
;VZ_Sensor.c,142 :: 		}
;VZ_Sensor.c,141 :: 		else return 0;
;VZ_Sensor.c,142 :: 		}
L_end_OpticDataCheckIfReady:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _OpticDataCheckIfReady

_OpticDataOnSPI_ON:
	LNK	#4

;VZ_Sensor.c,144 :: 		char  OpticDataOnSPI_ON(void)
;VZ_Sensor.c,146 :: 		char Buff[4] = {0x00};
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV.B	W0, [W14+0]
	MOV	#0, W0
	MOV.B	W0, [W14+1]
	MOV	#0, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
;VZ_Sensor.c,147 :: 		Buff[0] =1;
	ADD	W14, #0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;VZ_Sensor.c,148 :: 		VzSensor_SpiWriteAddr(VZ_SPI_TARGET_PARAMETER,0x006f,Buff,4);
	MOV.B	#4, W13
	MOV	W1, W12
	MOV	#111, W11
	MOV.B	#2, W10
	CALL	_VzSensor_SpiWriteAddr
;VZ_Sensor.c,149 :: 		VzSensor_SpiReadAddr(VZ_SPI_TARGET_PARAMETER,0x006f,Buff,4);
	ADD	W14, #0, W0
	MOV.B	#4, W13
	MOV	W0, W12
	MOV	#111, W11
	MOV.B	#2, W10
	CALL	_VzSensor_SpiReadAddr
;VZ_Sensor.c,150 :: 		if (Buff[0] == 1)
	ADD	W14, #0, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__OpticDataOnSPI_ON118
	GOTO	L_OpticDataOnSPI_ON60
L__OpticDataOnSPI_ON118:
;VZ_Sensor.c,152 :: 		PrintOut(PrintHandler,"\rOpticDataOnSPI ON");
	MOV	#lo_addr(?lstr_1_VZ_Sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;VZ_Sensor.c,153 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_OpticDataOnSPI_ON
;VZ_Sensor.c,154 :: 		}
L_OpticDataOnSPI_ON60:
;VZ_Sensor.c,157 :: 		PrintOut(PrintHandler,"\rOpticDataOnSPI OFF !!!");
	MOV	#lo_addr(?lstr_2_VZ_Sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;VZ_Sensor.c,158 :: 		return 0;
	CLR	W0
;VZ_Sensor.c,160 :: 		}
;VZ_Sensor.c,158 :: 		return 0;
;VZ_Sensor.c,160 :: 		}
L_end_OpticDataOnSPI_ON:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _OpticDataOnSPI_ON

_VzSensor_ReadFWVer:
	LNK	#4

;VZ_Sensor.c,162 :: 		void VzSensor_ReadFWVer(void)
;VZ_Sensor.c,167 :: 		VzSensor_SpiReadAddr(VZ_SPI_TARGET_PARAMETER, 0x0001,VersBuff,4);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W14, #0, W0
	MOV.B	#4, W13
	MOV	W0, W12
	MOV	#1, W11
	MOV.B	#2, W10
	CALL	_VzSensor_SpiReadAddr
;VZ_Sensor.c,168 :: 		PrintOut(PrintHandler,"\rVZ Sensor SW_Verson %d.%d.%d.%d", (unsigned int)VersBuff[0], (unsigned int)VersBuff[1], (unsigned int)VersBuff[2], (unsigned int)VersBuff[3]);
	ADD	W14, #0, W4
	ADD	W4, #3, W0
	ZE	[W0], W3
	ADD	W4, #2, W0
	ZE	[W0], W2
	ADD	W4, #1, W0
	ZE	[W0], W1
	ZE	[W4], W0
	PUSH	W3
	PUSH	W2
	PUSH	W1
	PUSH	W0
	MOV	#lo_addr(?lstr_3_VZ_Sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#12, W15
;VZ_Sensor.c,169 :: 		}
L_end_VzSensor_ReadFWVer:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _VzSensor_ReadFWVer

_VzSensor_SpiWriteAddr:

;VZ_Sensor.c,171 :: 		void VzSensor_SpiWriteAddr(char target, unsigned int addr,char *TxBuffer,char TxBufferLength)
;VZ_Sensor.c,174 :: 		VZ_Sensor_CS=OFF;
	PUSH	W10
	BCLR.B	LATF, #4
;VZ_Sensor.c,175 :: 		SPI1_Write(VZ_SPI_WRITE);
	PUSH	W10
	MOV	#26, W10
	CALL	_SPI1_Write
	POP	W10
;VZ_Sensor.c,176 :: 		SPI1_Write(target);
	ZE	W10, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,177 :: 		SPI1_Write(addr&0x00FF);
	MOV	#255, W0
	AND	W11, W0, W0
	MOV	W0, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,178 :: 		SPI1_Write(((addr&0xFF00)>>8));
	MOV	#65280, W0
	AND	W11, W0, W0
	LSR	W0, #8, W0
	MOV	W0, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,179 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,180 :: 		Delay_us(200);
	MOV	#1066, W7
L_VzSensor_SpiWriteAddr62:
	DEC	W7
	BRA NZ	L_VzSensor_SpiWriteAddr62
	NOP
	NOP
;VZ_Sensor.c,181 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,182 :: 		for(i=0;i<TxBufferLength;i++) SPI1_Write(TxBuffer[i]);
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_VzSensor_SpiWriteAddr64:
; i start address is: 2 (W1)
	CP.B	W1, W13
	BRA LTU	L__VzSensor_SpiWriteAddr121
	GOTO	L_VzSensor_SpiWriteAddr65
L__VzSensor_SpiWriteAddr121:
	ZE	W1, W0
	ADD	W12, W0, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_SPI1_Write
	POP	W10
	INC.B	W1
; i end address is: 2 (W1)
	GOTO	L_VzSensor_SpiWriteAddr64
L_VzSensor_SpiWriteAddr65:
;VZ_Sensor.c,183 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,184 :: 		}
L_end_VzSensor_SpiWriteAddr:
	POP	W10
	RETURN
; end of _VzSensor_SpiWriteAddr

_VzSensor_SpiReadAddr:
	LNK	#2

;VZ_Sensor.c,186 :: 		void VzSensor_SpiReadAddr(char target, unsigned int addr,char *RxBuffer,char RxBufferLength)
;VZ_Sensor.c,189 :: 		VZ_Sensor_CS=OFF;
	PUSH	W10
	BCLR.B	LATF, #4
;VZ_Sensor.c,190 :: 		SPI1_Write(VZ_SPI_READ);
	PUSH	W10
	MOV	#27, W10
	CALL	_SPI1_Write
	POP	W10
;VZ_Sensor.c,191 :: 		SPI1_Write(target);
	ZE	W10, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,192 :: 		SPI1_Write((addr&0x00FF));
	MOV	#255, W0
	AND	W11, W0, W0
	MOV	W0, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,193 :: 		SPI1_Write(((addr&0xFF00)>>8));
	MOV	#65280, W0
	AND	W11, W0, W0
	LSR	W0, #8, W0
	MOV	W0, W10
	CALL	_SPI1_Write
;VZ_Sensor.c,194 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,195 :: 		Delay_us(200);
	MOV	#1066, W7
L_VzSensor_SpiReadAddr67:
	DEC	W7
	BRA NZ	L_VzSensor_SpiReadAddr67
	NOP
	NOP
;VZ_Sensor.c,196 :: 		VZ_Sensor_CS=OFF;
	BCLR.B	LATF, #4
;VZ_Sensor.c,197 :: 		for(i=0;i<RxBufferLength;i++) RxBuffer[i]=SPI1_Read(0x00);
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_VzSensor_SpiReadAddr69:
; i start address is: 4 (W2)
	CP.B	W2, W13
	BRA LTU	L__VzSensor_SpiReadAddr123
	GOTO	L_VzSensor_SpiReadAddr70
L__VzSensor_SpiReadAddr123:
	ZE	W2, W0
	ADD	W12, W0, W0
	MOV	W0, [W14+0]
	PUSH	W10
	CLR	W10
	CALL	_SPI1_Read
	POP	W10
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_VzSensor_SpiReadAddr69
L_VzSensor_SpiReadAddr70:
;VZ_Sensor.c,198 :: 		VZ_Sensor_CS=ON;
	BSET.B	LATF, #4
;VZ_Sensor.c,199 :: 		}
L_end_VzSensor_SpiReadAddr:
	POP	W10
	ULNK
	RETURN
; end of _VzSensor_SpiReadAddr

_Init_VZ_Sensor:
	LNK	#4

;VZ_Sensor.c,201 :: 		char Init_VZ_Sensor(uint_8 bist)
;VZ_Sensor.c,203 :: 		unsigned int i=0;
	PUSH	W11
	MOV	#0, W0
	MOV	W0, [W14+2]
;VZ_Sensor.c,205 :: 		PrintOut(PrintHandler,"\rInit Vz Sensor...");
	MOV	#lo_addr(?lstr_4_VZ_Sensor), W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;VZ_Sensor.c,207 :: 		Read_Write_MCP23S17_IO(RESET_VZ,OFF);
	CLR	W11
	MOV.B	#6, W10
	CALL	_Read_Write_MCP23S17_IO
;VZ_Sensor.c,208 :: 		Delay_ms(100);
	MOV	#9, W8
	MOV	#9047, W7
L_Init_VZ_Sensor72:
	DEC	W7
	BRA NZ	L_Init_VZ_Sensor72
	DEC	W8
	BRA NZ	L_Init_VZ_Sensor72
;VZ_Sensor.c,209 :: 		Read_Write_MCP23S17_IO(RESET_VZ,ON);
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_Read_Write_MCP23S17_IO
	POP	W10
;VZ_Sensor.c,210 :: 		Delay_ms(2000);
	MOV	#163, W8
	MOV	#49887, W7
L_Init_VZ_Sensor74:
	DEC	W7
	BRA NZ	L_Init_VZ_Sensor74
	DEC	W8
	BRA NZ	L_Init_VZ_Sensor74
	NOP
	NOP
;VZ_Sensor.c,212 :: 		Vz_SetBist(bist);
	CALL	_Vz_SetBist
;VZ_Sensor.c,213 :: 		while((i++<15)&&(!(RtFlag=OpticDataOnSPI_ON()))) {asm clrwdt;Delay_ms(100);}
L_Init_VZ_Sensor76:
	MOV	[W14+2], W2
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
	CP	W2, #15
	BRA LTU	L__Init_VZ_Sensor125
	GOTO	L__Init_VZ_Sensor93
L__Init_VZ_Sensor125:
	PUSH	W10
	CALL	_OpticDataOnSPI_ON
	POP	W10
	MOV.B	W0, [W14+0]
	CP0.B	W0
	BRA Z	L__Init_VZ_Sensor126
	GOTO	L__Init_VZ_Sensor92
L__Init_VZ_Sensor126:
L__Init_VZ_Sensor91:
	CLRWDT
	MOV	#9, W8
	MOV	#9047, W7
L_Init_VZ_Sensor80:
	DEC	W7
	BRA NZ	L_Init_VZ_Sensor80
	DEC	W8
	BRA NZ	L_Init_VZ_Sensor80
	GOTO	L_Init_VZ_Sensor76
L__Init_VZ_Sensor93:
L__Init_VZ_Sensor92:
;VZ_Sensor.c,214 :: 		return RtFlag;
	MOV.B	[W14+0], W0
;VZ_Sensor.c,215 :: 		}
;VZ_Sensor.c,214 :: 		return RtFlag;
;VZ_Sensor.c,215 :: 		}
L_end_Init_VZ_Sensor:
	POP	W11
	ULNK
	RETURN
; end of _Init_VZ_Sensor

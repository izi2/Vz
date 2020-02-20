
_setHeaders:

;Process_data.c,17 :: 		uint_16 setHeaders(char *header, char *buffer, uint_16 index)
;Process_data.c,19 :: 		header[H_TYPE_DATA] = (uint_8) buffer[index];
	ADD	W11, W12, W0
	MOV.B	[W0], [W10]
;Process_data.c,20 :: 		header[H_LENGTH_DATA] = (uint_8) buffer[index + 1];
	ADD	W10, #1, W1
	ADD	W12, #1, W0
	ADD	W11, W0, W0
	MOV.B	[W0], [W1]
;Process_data.c,24 :: 		return index + LENGTH_HEADERS_CMD;
	ADD	W12, #2, W0
;Process_data.c,25 :: 		}
L_end_setHeaders:
	RETURN
; end of _setHeaders

_setData:

;Process_data.c,27 :: 		uint_16 setData(char *datap, char *header, char *buffer, uint_16 index)
;Process_data.c,29 :: 		uint_16 i = 0;
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
;Process_data.c,30 :: 		for (; i < header[H_LENGTH_DATA]; i++)
L_setData0:
; i start address is: 4 (W2)
	ADD	W11, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W2, W0
	BRA LTU	L__setData24
	GOTO	L_setData1
L__setData24:
;Process_data.c,32 :: 		datap[i] = buffer[index];
	ADD	W10, W2, W1
	ADD	W12, W13, W0
	MOV.B	[W0], [W1]
;Process_data.c,33 :: 		index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Process_data.c,30 :: 		for (; i < header[H_LENGTH_DATA]; i++)
	INC	W2
;Process_data.c,34 :: 		}
	GOTO	L_setData0
L_setData1:
;Process_data.c,35 :: 		datap[i] = '\0';
	ADD	W10, W2, W1
; i end address is: 4 (W2)
	CLR	W0
	MOV.B	W0, [W1]
;Process_data.c,36 :: 		return index;
	MOV	W13, W0
;Process_data.c,37 :: 		}
L_end_setData:
	RETURN
; end of _setData

_insertParamsToParamsIn:

;Process_data.c,39 :: 		void insertParamsToParamsIn(char *datap, uint_8 len)
;Process_data.c,41 :: 		uint_8 i = 0;
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
;Process_data.c,43 :: 		for (; i < len; i += 2)
L_insertParamsToParamsIn3:
; i start address is: 6 (W3)
	CP.B	W3, W11
	BRA LTU	L__insertParamsToParamsIn26
	GOTO	L_insertParamsToParamsIn4
L__insertParamsToParamsIn26:
;Process_data.c,45 :: 		value = CombineSignedHighLow((uint_8) datap[i], (uint_8) datap[i + 1]);
	ZE	W3, W0
	INC	W0
	ADD	W10, W0, W1
	ZE	W3, W0
	ADD	W10, W0, W0
	PUSH	W3
	PUSH.D	W10
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	CALL	_CombineSignedHighLow
	POP.D	W10
	POP	W3
; value start address is: 8 (W4)
	MOV	W0, W4
;Process_data.c,47 :: 		if (value != -1)
	MOV	#65535, W1
	CP	W0, W1
	BRA NZ	L__insertParamsToParamsIn27
	GOTO	L_insertParamsToParamsIn6
L__insertParamsToParamsIn27:
;Process_data.c,49 :: 		ParamsIn[i / 2] = value;
	ZE	W3, W0
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #1, W1
	MOV	#lo_addr(_ParamsIn), W0
	ADD	W0, W1, W0
	MOV	W4, [W0]
; value end address is: 8 (W4)
;Process_data.c,50 :: 		}
L_insertParamsToParamsIn6:
;Process_data.c,43 :: 		for (; i < len; i += 2)
; i start address is: 0 (W0)
	ADD.B	W3, #2, W0
; i end address is: 6 (W3)
;Process_data.c,51 :: 		}
	MOV.B	W0, W3
; i end address is: 0 (W0)
	GOTO	L_insertParamsToParamsIn3
L_insertParamsToParamsIn4:
;Process_data.c,52 :: 		}
L_end_insertParamsToParamsIn:
	RETURN
; end of _insertParamsToParamsIn

_AddHeaders:

;Process_data.c,54 :: 		char* AddHeaders(uint_8 type,propertySensor* proper, char* dataS,uint_8 index)
;Process_data.c,56 :: 		uint_8 len = proper->endAddress - proper->address;
	ADD	W11, #2, W1
	MOV	[W11], W0
	SUBR	W0, [W1], W0
; len start address is: 4 (W2)
	MOV.B	W0, W2
;Process_data.c,57 :: 		dataS[index++] = EndUnitID;
	ZE	W13, W0
	ADD	W12, W0, W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,58 :: 		dataS[index++] = 0;
	ZE	W13, W0
	ADD	W12, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,59 :: 		dataS[index++] = len;
	ZE	W13, W0
	ADD	W12, W0, W0
	MOV.B	W2, [W0]
; len end address is: 4 (W2)
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,60 :: 		dataS[index++] = type;
	ZE	W13, W0
	ADD	W12, W0, W0
	MOV.B	W10, [W0]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,62 :: 		return index;
	ZE	W13, W0
;Process_data.c,64 :: 		}
L_end_AddHeaders:
	RETURN
; end of _AddHeaders

_parssData:
	LNK	#116

;Process_data.c,67 :: 		void parssData(char *buffer, int bufferLength)
;Process_data.c,71 :: 		uint_8 changesInNet = 0;
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV.B	W0, [W14+108]
	MOV	#0, W0
	MOV	W0, [W14+110]
;Process_data.c,72 :: 		uint_16 i = 0;
;Process_data.c,74 :: 		initConfigSensor(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_initConfigSensor
	POP.D	W10
;Process_data.c,75 :: 		while (i < bufferLength)
L_parssData7:
	MOV	#110, W0
	ADD	W14, W0, W0
	CP	W11, [W0]
	BRA GTU	L__parssData30
	GOTO	L_parssData8
L__parssData30:
;Process_data.c,77 :: 		i = setHeaders(HEADERS, buffer, i);
	ADD	W14, #0, W0
	PUSH.D	W10
	MOV	[W14+110], W12
	MOV	W10, W11
	MOV	W0, W10
	CALL	_setHeaders
	POP.D	W10
;Process_data.c,78 :: 		i = setData(DATA, HEADERS, buffer, i);
	ADD	W14, #0, W2
	ADD	W14, #2, W1
	PUSH.D	W10
	MOV	W0, W13
	MOV	W10, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_setData
	MOV	W0, [W14+110]
;Process_data.c,80 :: 		PrintOut(PrintHandler, "\rlen %d, type %d", HEADERS[H_LENGTH_DATA], HEADERS[H_TYPE_DATA]);
	ADD	W14, #0, W0
	MOV.B	[W0], W2
	INC	W0
	MOV.B	[W0], W1
	ZE	W2, W0
	PUSH	W0
	ZE	W1, W0
	PUSH	W0
	MOV	#lo_addr(?lstr_1_Process_data), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#8, W15
	POP.D	W10
;Process_data.c,81 :: 		switch (HEADERS[H_TYPE_DATA])
	ADD	W14, #0, W0
	MOV	W0, [W14+114]
	GOTO	L_parssData9
;Process_data.c,83 :: 		case P_ID_SENSOR:
L_parssData11:
;Process_data.c,84 :: 		saveInEEpromPropertyConfig(&cS.idS, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,85 :: 		LoadUnitId(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadUnitId
	POP.D	W10
;Process_data.c,86 :: 		break;
	GOTO	L_parssData10
;Process_data.c,87 :: 		case P_ALGO_SELECTED:
L_parssData12:
;Process_data.c,88 :: 		saveInEEpromPropertyConfig(&cS.algoSelected, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#66, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,89 :: 		LoadAlgoSelected(&cS) ;
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadAlgoSelected
	POP.D	W10
;Process_data.c,90 :: 		break;
	GOTO	L_parssData10
;Process_data.c,92 :: 		case P_TRANSMITED_TO_GATWAY:
L_parssData13:
;Process_data.c,93 :: 		saveInEEpromPropertyConfig(&cS.transmitedToGatway, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#54, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,94 :: 		LoadTransmitedToGatway(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadTransmitedToGatway
	POP.D	W10
;Process_data.c,95 :: 		break;
	GOTO	L_parssData10
;Process_data.c,96 :: 		case P_POINTER_LEASER:
L_parssData14:
;Process_data.c,97 :: 		saveInEEpromPropertyConfig(&cS.pointerLeaser, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#48, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,98 :: 		LoadPointerLeaser(&cS)  ;
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadPointerLeaser
	POP.D	W10
;Process_data.c,99 :: 		break;
	GOTO	L_parssData10
;Process_data.c,101 :: 		case P_NET_NAME:
L_parssData15:
;Process_data.c,102 :: 		saveInEEpromPropertyConfig(&cS.networkName, DATA);
	ADD	W14, #2, W1
	MOV	#78, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,103 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,104 :: 		break;
	GOTO	L_parssData10
;Process_data.c,106 :: 		case P_NET_PASS:
L_parssData16:
;Process_data.c,107 :: 		saveInEEpromPropertyConfig(&cS.networkPassword, DATA);
	ADD	W14, #2, W1
	MOV	#84, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,108 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,109 :: 		break;
	GOTO	L_parssData10
;Process_data.c,110 :: 		case P_NET_PORT:
L_parssData17:
;Process_data.c,111 :: 		saveInEEpromPropertyConfig(&cS.networkPort, DATA);
	ADD	W14, #2, W1
	MOV	#90, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,112 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,113 :: 		break;
	GOTO	L_parssData10
;Process_data.c,114 :: 		case P_NET_IP:
L_parssData18:
;Process_data.c,115 :: 		saveInEEpromPropertyConfig(&cS.networkServerIp, DATA);
	ADD	W14, #2, W1
	MOV	#96, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,116 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,117 :: 		break;
	GOTO	L_parssData10
;Process_data.c,118 :: 		case P_PARAMS:
L_parssData19:
;Process_data.c,119 :: 		insertParamsToParamsIn(DATA, HEADERS[H_LENGTH_DATA]);
	ADD	W14, #0, W0
	ADD	W0, #1, W1
	ADD	W14, #2, W0
	PUSH.D	W10
	MOV.B	[W1], W11
	MOV	W0, W10
	CALL	_insertParamsToParamsIn
;Process_data.c,120 :: 		saveInEEpromPropertyConfig(&cS.paramsIn, ParamsIn);
	MOV	#72, W0
	ADD	W14, W0, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,121 :: 		break;
	GOTO	L_parssData10
;Process_data.c,122 :: 		case P_STATUS:
L_parssData20:
;Process_data.c,123 :: 		sendStatus();
	PUSH.D	W10
	CALL	_sendStatus
	POP.D	W10
;Process_data.c,124 :: 		break;
	GOTO	L_parssData10
;Process_data.c,126 :: 		}
L_parssData9:
	MOV	[W14+114], W1
	MOV.B	[W1], W0
	CP.B	W0, #15
	BRA NZ	L__parssData31
	GOTO	L_parssData11
L__parssData31:
	MOV.B	[W1], W0
	CP.B	W0, #9
	BRA NZ	L__parssData32
	GOTO	L_parssData12
L__parssData32:
	MOV.B	[W1], W0
	CP.B	W0, #6
	BRA NZ	L__parssData33
	GOTO	L_parssData13
L__parssData33:
	MOV.B	[W1], W0
	CP.B	W0, #5
	BRA NZ	L__parssData34
	GOTO	L_parssData14
L__parssData34:
	MOV.B	[W1], W0
	CP.B	W0, #11
	BRA NZ	L__parssData35
	GOTO	L_parssData15
L__parssData35:
	MOV.B	[W1], W0
	CP.B	W0, #12
	BRA NZ	L__parssData36
	GOTO	L_parssData16
L__parssData36:
	MOV.B	[W1], W0
	CP.B	W0, #13
	BRA NZ	L__parssData37
	GOTO	L_parssData17
L__parssData37:
	MOV.B	[W1], W0
	CP.B	W0, #14
	BRA NZ	L__parssData38
	GOTO	L_parssData18
L__parssData38:
	MOV.B	[W1], W0
	CP.B	W0, #10
	BRA NZ	L__parssData39
	GOTO	L_parssData19
L__parssData39:
	MOV.B	[W1], W0
	CP.B	W0, #17
	BRA NZ	L__parssData40
	GOTO	L_parssData20
L__parssData40:
L_parssData10:
;Process_data.c,127 :: 		if (changesInNet)
	MOV	#108, W0
	ADD	W14, W0, W0
	CP0.B	[W0]
	BRA NZ	L__parssData41
	GOTO	L_parssData21
L__parssData41:
;Process_data.c,129 :: 		LoadWifi(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_LoadWifi
	POP.D	W10
;Process_data.c,130 :: 		}
L_parssData21:
;Process_data.c,132 :: 		}
	GOTO	L_parssData7
L_parssData8:
;Process_data.c,135 :: 		}
L_end_parssData:
	POP	W13
	POP	W12
	ULNK
	RETURN
; end of _parssData

_sendStatus:
	LNK	#368

;Process_data.c,137 :: 		void sendStatus()
;Process_data.c,141 :: 		uint_8 index = dataSend;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV.B	W1, [W14+366]
;Process_data.c,143 :: 		readEEpromRawData(&cS.idS, dataSend,index);
	ADD	W14, #0, W0
	MOV.B	W1, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readEEpromRawData
;Process_data.c,144 :: 		index = AddHeaders(P_ID_SENSOR,&cS.idS,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ADD	W14, #0, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#15, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,146 :: 		readEEpromRawData(&cS.pointerLeaser, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	ADD	W14, #6, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,147 :: 		index = AddHeaders(P_POINTER_LEASER,&cS.pointerLeaser,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ADD	W14, #6, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#5, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,149 :: 		readEEpromRawData(&cS.transmitedToGatway, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	ADD	W14, #12, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,150 :: 		index = AddHeaders(P_TRANSMITED_TO_GATWAY,&cS.transmitedToGatway,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ADD	W14, #12, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#6, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,151 :: 		readEEpromRawData(&cS.transmitRowData, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#60, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,152 :: 		index = AddHeaders(P_TRANSMITED_TO_GATWAY,&cS.transmitRowData,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#60, W0
	ADD	W14, W0, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#6, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,153 :: 		readEEpromRawData(&cS.paramsIn, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	ADD	W14, #30, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,154 :: 		index = AddHeaders(P_PARAMS,&cS.paramsIn,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ADD	W14, #30, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#10, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,155 :: 		readEEpromRawData(&cS.networkName, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#36, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,156 :: 		index = AddHeaders(P_NET_NAME,&cS.networkName,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#36, W0
	ADD	W14, W0, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#11, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,157 :: 		readEEpromRawData(&cS.networkPassword, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#42, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,158 :: 		index = AddHeaders(P_NET_PASS,&cS.networkPassword,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#12, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,160 :: 		readEEpromRawData(&cS.networkPort, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#48, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,161 :: 		index = AddHeaders(P_NET_PORT,&cS.networkPort,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#48, W0
	ADD	W14, W0, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#13, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,163 :: 		readEEpromRawData(&cS.networkServerIp, dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#54, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_readEEpromRawData
;Process_data.c,164 :: 		index = AddHeaders(P_NET_IP,&cS.networkServerIp,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#54, W0
	ADD	W14, W0, W0
	MOV.B	[W14+366], W13
	MOV	W1, W12
	MOV	W0, W11
	MOV.B	#14, W10
	CALL	_AddHeaders
	MOV.B	W0, [W14+366]
;Process_data.c,165 :: 		PrintOut(PrintHandler, "\ri %d, ", index);
	PUSH	W0
	MOV	#lo_addr(?lstr_2_Process_data), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;Process_data.c,166 :: 		WIFI_Send_One_Array_Not_Wait_To_OK(dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#366, W0
	ADD	W14, W0, W0
	ZE	[W0], W11
	MOV	W1, W10
	CALL	_WIFI_Send_One_Array_Not_Wait_To_OK
;Process_data.c,170 :: 		}
L_end_sendStatus:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _sendStatus

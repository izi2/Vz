
_setHeaders:

;Process_data.c,25 :: 		uint_16 setHeaders(char *header, char *buffer, uint_16 index)
;Process_data.c,27 :: 		header[H_TYPE_DATA] = (uint_8) buffer[index];
	ADD	W11, W12, W0
	MOV.B	[W0], [W10]
;Process_data.c,28 :: 		header[H_LENGTH_DATA] = (uint_8) buffer[index + 1];
	ADD	W10, #1, W1
	ADD	W12, #1, W0
	ADD	W11, W0, W0
	MOV.B	[W0], [W1]
;Process_data.c,32 :: 		return index + LENGTH_HEADERS_CMD;
	ADD	W12, #2, W0
;Process_data.c,33 :: 		}
L_end_setHeaders:
	RETURN
; end of _setHeaders

_setData:

;Process_data.c,35 :: 		uint_16 setData(char *datap, char *header, char *buffer, uint_16 index)
;Process_data.c,37 :: 		uint_16 i = 0;
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
;Process_data.c,38 :: 		for (; i < header[H_LENGTH_DATA]; i++)
L_setData0:
; i start address is: 4 (W2)
	ADD	W11, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W2, W0
	BRA LTU	L__setData36
	GOTO	L_setData1
L__setData36:
;Process_data.c,40 :: 		datap[i] = buffer[index];
	ADD	W10, W2, W1
	ADD	W12, W13, W0
	MOV.B	[W0], [W1]
;Process_data.c,41 :: 		index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Process_data.c,38 :: 		for (; i < header[H_LENGTH_DATA]; i++)
	INC	W2
;Process_data.c,42 :: 		}
	GOTO	L_setData0
L_setData1:
;Process_data.c,43 :: 		datap[i] = '\0';
	ADD	W10, W2, W1
; i end address is: 4 (W2)
	CLR	W0
	MOV.B	W0, [W1]
;Process_data.c,44 :: 		return index;
	MOV	W13, W0
;Process_data.c,45 :: 		}
L_end_setData:
	RETURN
; end of _setData

_insertParamsToParamsIn:

;Process_data.c,47 :: 		void insertParamsToParamsIn(char *datap, uint_8 len)
;Process_data.c,49 :: 		uint_8 i = 0;
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
;Process_data.c,51 :: 		for (; i < len; i += 2)
L_insertParamsToParamsIn3:
; i start address is: 6 (W3)
	CP.B	W3, W11
	BRA LTU	L__insertParamsToParamsIn38
	GOTO	L_insertParamsToParamsIn4
L__insertParamsToParamsIn38:
;Process_data.c,53 :: 		value = CombineSignedHighLow((uint_8) datap[i], (uint_8) datap[i + 1]);
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
;Process_data.c,55 :: 		if (value != -1)
	MOV	#65535, W1
	CP	W0, W1
	BRA NZ	L__insertParamsToParamsIn39
	GOTO	L_insertParamsToParamsIn6
L__insertParamsToParamsIn39:
;Process_data.c,57 :: 		ParamsIn[i / 2] = value;
	ZE	W3, W0
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #1, W1
	MOV	#lo_addr(_ParamsIn), W0
	ADD	W0, W1, W0
	MOV	W4, [W0]
; value end address is: 8 (W4)
;Process_data.c,58 :: 		}
L_insertParamsToParamsIn6:
;Process_data.c,51 :: 		for (; i < len; i += 2)
; i start address is: 0 (W0)
	ADD.B	W3, #2, W0
; i end address is: 6 (W3)
;Process_data.c,59 :: 		}
	MOV.B	W0, W3
; i end address is: 0 (W0)
	GOTO	L_insertParamsToParamsIn3
L_insertParamsToParamsIn4:
;Process_data.c,60 :: 		}
L_end_insertParamsToParamsIn:
	RETURN
; end of _insertParamsToParamsIn

_AddHeaders:

;Process_data.c,62 :: 		char* AddHeaders(uint_8 type,uint_8 length, char* dataS,uint_8 index)
;Process_data.c,65 :: 		dataS[index++] = EndUnitID;
	ZE	W13, W0
	ADD	W12, W0, W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,66 :: 		dataS[index++] = 0;
	ZE	W13, W0
	ADD	W12, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,67 :: 		dataS[index++] = length;
	ZE	W13, W0
	ADD	W12, W0, W0
	MOV.B	W11, [W0]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,68 :: 		dataS[index++] = type;
	ZE	W13, W0
	ADD	W12, W0, W0
	MOV.B	W10, [W0]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,70 :: 		return index;
	ZE	W13, W0
;Process_data.c,72 :: 		}
L_end_AddHeaders:
	RETURN
; end of _AddHeaders

_parssData:
	LNK	#116

;Process_data.c,75 :: 		void parssData(char *buffer, int bufferLength)
;Process_data.c,79 :: 		uint_8 changesInNet = 0;
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV.B	W0, [W14+108]
	MOV	#0, W0
	MOV	W0, [W14+110]
;Process_data.c,80 :: 		uint_16 i = 0;
;Process_data.c,82 :: 		initConfigSensor(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_initConfigSensor
	POP.D	W10
;Process_data.c,83 :: 		while (i < bufferLength)
L_parssData7:
	MOV	#110, W0
	ADD	W14, W0, W0
	CP	W11, [W0]
	BRA GTU	L__parssData42
	GOTO	L_parssData8
L__parssData42:
;Process_data.c,85 :: 		i = setHeaders(HEADERS, buffer, i);
	ADD	W14, #0, W0
	PUSH.D	W10
	MOV	[W14+110], W12
	MOV	W10, W11
	MOV	W0, W10
	CALL	_setHeaders
	POP.D	W10
;Process_data.c,86 :: 		i = setData(DATA, HEADERS, buffer, i);
	ADD	W14, #0, W2
	ADD	W14, #2, W1
	PUSH.D	W10
	MOV	W0, W13
	MOV	W10, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_setData
	MOV	W0, [W14+110]
;Process_data.c,88 :: 		PrintOut(PrintHandler, "\rlen %d, type %d", HEADERS[H_LENGTH_DATA], HEADERS[H_TYPE_DATA]);
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
;Process_data.c,89 :: 		switch (HEADERS[H_TYPE_DATA])
	ADD	W14, #0, W0
	MOV	W0, [W14+114]
	GOTO	L_parssData9
;Process_data.c,91 :: 		case P_ID_SENSOR:
L_parssData11:
;Process_data.c,92 :: 		saveInEEpromPropertyConfig(&cS.idS, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,93 :: 		LoadUnitId(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadUnitId
	POP.D	W10
;Process_data.c,94 :: 		break;
	GOTO	L_parssData10
;Process_data.c,95 :: 		case P_ALGO_SELECTED:
L_parssData12:
;Process_data.c,96 :: 		saveInEEpromPropertyConfig(&cS.algoSelected, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#66, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,97 :: 		LoadAlgoSelected(&cS) ;
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadAlgoSelected
	POP.D	W10
;Process_data.c,98 :: 		break;
	GOTO	L_parssData10
;Process_data.c,100 :: 		case P_TRANSMITED_TO_GATWAY:
L_parssData13:
;Process_data.c,101 :: 		saveInEEpromPropertyConfig(&cS.transmitedToGatway, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#54, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,102 :: 		LoadTransmitedToGatway(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadTransmitedToGatway
	POP.D	W10
;Process_data.c,103 :: 		break;
	GOTO	L_parssData10
;Process_data.c,105 :: 		case P_TRANSMITED_ROW_DATA:
L_parssData14:
;Process_data.c,106 :: 		saveInEEpromPropertyConfig(&cS.transmitRowData, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#102, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,107 :: 		LoadTransmitedToGatway(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadTransmitedToGatway
	POP.D	W10
;Process_data.c,108 :: 		break;
	GOTO	L_parssData10
;Process_data.c,110 :: 		case P_POINTER_LEASER:
L_parssData15:
;Process_data.c,111 :: 		saveInEEpromPropertyConfig(&cS.pointerLeaser, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#48, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,112 :: 		LoadPointerLeaser(&cS)  ;
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadPointerLeaser
	POP.D	W10
;Process_data.c,113 :: 		break;
	GOTO	L_parssData10
;Process_data.c,115 :: 		case P_NET_NAME:
L_parssData16:
;Process_data.c,116 :: 		saveInEEpromPropertyConfig(&cS.networkName, DATA);
	ADD	W14, #2, W1
	MOV	#78, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,117 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,118 :: 		break;
	GOTO	L_parssData10
;Process_data.c,120 :: 		case P_NET_PASS:
L_parssData17:
;Process_data.c,121 :: 		saveInEEpromPropertyConfig(&cS.networkPassword, DATA);
	ADD	W14, #2, W1
	MOV	#84, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,122 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,123 :: 		break;
	GOTO	L_parssData10
;Process_data.c,124 :: 		case P_NET_PORT:
L_parssData18:
;Process_data.c,125 :: 		saveInEEpromPropertyConfig(&cS.networkPort, DATA);
	ADD	W14, #2, W1
	MOV	#90, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,126 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,127 :: 		break;
	GOTO	L_parssData10
;Process_data.c,128 :: 		case P_NET_IP:
L_parssData19:
;Process_data.c,129 :: 		saveInEEpromPropertyConfig(&cS.networkServerIp, DATA);
	ADD	W14, #2, W1
	MOV	#96, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,130 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+108]
;Process_data.c,131 :: 		break;
	GOTO	L_parssData10
;Process_data.c,132 :: 		case P_PARAMS:
L_parssData20:
;Process_data.c,133 :: 		insertParamsToParamsIn(DATA, HEADERS[H_LENGTH_DATA]);
	ADD	W14, #0, W0
	ADD	W0, #1, W1
	ADD	W14, #2, W0
	PUSH.D	W10
	MOV.B	[W1], W11
	MOV	W0, W10
	CALL	_insertParamsToParamsIn
;Process_data.c,134 :: 		saveInEEpromPropertyConfig(&cS.paramsIn, ParamsIn);
	MOV	#72, W0
	ADD	W14, W0, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,135 :: 		break;
	GOTO	L_parssData10
;Process_data.c,136 :: 		case P_STATUS:
L_parssData21:
;Process_data.c,137 :: 		sendStatus();
	PUSH.D	W10
	CALL	_sendStatus
	POP.D	W10
;Process_data.c,138 :: 		break;
	GOTO	L_parssData10
;Process_data.c,140 :: 		}
L_parssData9:
	MOV	[W14+114], W1
	MOV.B	[W1], W0
	CP.B	W0, #15
	BRA NZ	L__parssData43
	GOTO	L_parssData11
L__parssData43:
	MOV.B	[W1], W0
	CP.B	W0, #9
	BRA NZ	L__parssData44
	GOTO	L_parssData12
L__parssData44:
	MOV.B	[W1], W0
	CP.B	W0, #6
	BRA NZ	L__parssData45
	GOTO	L_parssData13
L__parssData45:
	MOV.B	[W1], W0
	CP.B	W0, #16
	BRA NZ	L__parssData46
	GOTO	L_parssData14
L__parssData46:
	MOV.B	[W1], W0
	CP.B	W0, #5
	BRA NZ	L__parssData47
	GOTO	L_parssData15
L__parssData47:
	MOV.B	[W1], W0
	CP.B	W0, #11
	BRA NZ	L__parssData48
	GOTO	L_parssData16
L__parssData48:
	MOV.B	[W1], W0
	CP.B	W0, #12
	BRA NZ	L__parssData49
	GOTO	L_parssData17
L__parssData49:
	MOV.B	[W1], W0
	CP.B	W0, #13
	BRA NZ	L__parssData50
	GOTO	L_parssData18
L__parssData50:
	MOV.B	[W1], W0
	CP.B	W0, #14
	BRA NZ	L__parssData51
	GOTO	L_parssData19
L__parssData51:
	MOV.B	[W1], W0
	CP.B	W0, #10
	BRA NZ	L__parssData52
	GOTO	L_parssData20
L__parssData52:
	MOV.B	[W1], W0
	CP.B	W0, #17
	BRA NZ	L__parssData53
	GOTO	L_parssData21
L__parssData53:
L_parssData10:
;Process_data.c,141 :: 		if (changesInNet)
	MOV	#108, W0
	ADD	W14, W0, W0
	CP0.B	[W0]
	BRA NZ	L__parssData54
	GOTO	L_parssData22
L__parssData54:
;Process_data.c,143 :: 		LoadWifi(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_LoadWifi
	POP.D	W10
;Process_data.c,144 :: 		}
L_parssData22:
;Process_data.c,146 :: 		}
	GOTO	L_parssData7
L_parssData8:
;Process_data.c,149 :: 		}
L_end_parssData:
	POP	W13
	POP	W12
	ULNK
	RETURN
; end of _parssData

_lenParams:

;Process_data.c,151 :: 		uint_8 lenParams()
;Process_data.c,153 :: 		switch (AlgorithmTypeParametr)
	GOTO	L_lenParams23
;Process_data.c,155 :: 		case Algorithm_2:
L_lenParams25:
;Process_data.c,156 :: 		return algo2_params_in_size;
	MOV.B	#5, W0
	GOTO	L_end_lenParams
;Process_data.c,158 :: 		case Algorithm_3_4:
L_lenParams26:
;Process_data.c,159 :: 		return  algo_3_4_params_in_size;
	MOV.B	#8, W0
	GOTO	L_end_lenParams
;Process_data.c,160 :: 		case Algorithm_5:
L_lenParams27:
;Process_data.c,161 :: 		return algo5_params_in_size;
	MOV.B	#9, W0
	GOTO	L_end_lenParams
;Process_data.c,162 :: 		}
L_lenParams23:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__lenParams56
	GOTO	L_lenParams25
L__lenParams56:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__lenParams57
	GOTO	L_lenParams26
L__lenParams57:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__lenParams58
	GOTO	L_lenParams27
L__lenParams58:
;Process_data.c,163 :: 		}
L_end_lenParams:
	RETURN
; end of _lenParams

_addStringData:
	LNK	#50

;Process_data.c,165 :: 		uint_8 addStringData(propertySensor* propertyRead,char* dataSend,uint_8 index)
;Process_data.c,168 :: 		uint_8 lenData = 0;
	PUSH	W10
	PUSH	W13
;Process_data.c,169 :: 		uint_8 i = 0;
;Process_data.c,170 :: 		readEEpromRawData(propertyRead, tempData,0);
	ADD	W14, #0, W0
	PUSH	W12
	PUSH	W11
	CLR	W12
	MOV	W0, W11
	CALL	_readEEpromRawData
	POP	W11
	POP	W12
;Process_data.c,171 :: 		lenData = strlen(tempData);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_strlen
; lenData start address is: 6 (W3)
	MOV.B	W0, W3
;Process_data.c,172 :: 		index = AddHeaders(P_NET_NAME,lenData,dataSend,index);
	PUSH	W12
	PUSH	W11
	MOV.B	W12, W13
	MOV	W11, W12
	MOV.B	W0, W11
	MOV.B	#11, W10
	CALL	_AddHeaders
	POP	W11
	POP	W12
	MOV.B	W0, W12
;Process_data.c,174 :: 		for(i=0;i<lenData;i++)
; i start address is: 8 (W4)
	CLR	W4
; lenData end address is: 6 (W3)
; i end address is: 8 (W4)
L_addStringData28:
; i start address is: 8 (W4)
; lenData start address is: 6 (W3)
	CP.B	W4, W3
	BRA LTU	L__addStringData60
	GOTO	L_addStringData29
L__addStringData60:
;Process_data.c,176 :: 		dataSend[index++] = tempData[i];
	ZE	W12, W0
	ADD	W11, W0, W2
	ADD	W14, #0, W1
	ZE	W4, W0
	ADD	W1, W0, W0
	MOV.B	[W0], [W2]
	ADD.B	W12, #1, W0
	MOV.B	W0, W12
;Process_data.c,174 :: 		for(i=0;i<lenData;i++)
	INC.B	W4
;Process_data.c,177 :: 		}
; lenData end address is: 6 (W3)
; i end address is: 8 (W4)
	GOTO	L_addStringData28
L_addStringData29:
;Process_data.c,179 :: 		return index;
	MOV.B	W12, W0
;Process_data.c,180 :: 		}
;Process_data.c,179 :: 		return index;
;Process_data.c,180 :: 		}
L_end_addStringData:
	POP	W13
	POP	W10
	ULNK
	RETURN
; end of _addStringData

_sendStatus:
	LNK	#366

;Process_data.c,182 :: 		void sendStatus()
;Process_data.c,185 :: 		uint_8 i = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
; i start address is: 8 (W4)
	CLR	W4
;Process_data.c,187 :: 		uint_8 index = 0;
; index start address is: 2 (W1)
	CLR	W1
;Process_data.c,189 :: 		uint_8 lenData = lenParams();
	CALL	_lenParams
; lenData start address is: 6 (W3)
	MOV.B	W0, W3
;Process_data.c,190 :: 		initConfigSensor(&cS);
	ADD	W14, #0, W0
	PUSH	W3
	PUSH	W1
	PUSH	W4
	MOV	W0, W10
	CALL	_initConfigSensor
	POP	W4
	POP	W1
	POP	W3
;Process_data.c,192 :: 		index = AddHeaders(P_ID_SENSOR,1,dataSend,index);
	MOV	#66, W0
	ADD	W14, W0, W0
	MOV.B	W1, W13
; index end address is: 2 (W1)
	MOV	W0, W12
	MOV.B	#1, W11
	MOV.B	#15, W10
	CALL	_AddHeaders
; index start address is: 10 (W5)
	MOV.B	W0, W5
;Process_data.c,193 :: 		dataSend[index++] = EndUnitID;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	ADD.B	W5, #1, W0
; index end address is: 10 (W5)
;Process_data.c,195 :: 		index = AddHeaders(P_POINTER_LEASER,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_AddHeaders
; index start address is: 10 (W5)
	MOV.B	W0, W5
;Process_data.c,196 :: 		dataSend[index++] = PointerLeaser_Enable;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_PointerLeaser_Enable), W0
	MOV.B	[W0], [W1]
	ADD.B	W5, #1, W0
; index end address is: 10 (W5)
;Process_data.c,199 :: 		index = AddHeaders(P_TRANSMITED_TO_GATWAY,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_AddHeaders
; index start address is: 10 (W5)
	MOV.B	W0, W5
;Process_data.c,200 :: 		dataSend[index++] = PlcDataTX_Enable;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_PlcDataTX_Enable), W0
	MOV.B	[W0], [W1]
	ADD.B	W5, #1, W0
; index end address is: 10 (W5)
;Process_data.c,202 :: 		index = AddHeaders(P_TRANSMITED_ROW_DATA,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#16, W10
	CALL	_AddHeaders
; index start address is: 10 (W5)
	MOV.B	W0, W5
;Process_data.c,203 :: 		dataSend[index++] = RawDataTX_Enable;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_RawDataTX_Enable), W0
	MOV.B	[W0], [W1]
	ADD.B	W5, #1, W1
; index end address is: 10 (W5)
;Process_data.c,206 :: 		index = AddHeaders(P_PARAMS,lenData*2,dataSend,index);
	ZE	W3, W0
	SL	W0, #1, W0
	MOV.B	W1, W13
	MOV	W2, W12
	MOV.B	W0, W11
	MOV.B	#10, W10
	CALL	_AddHeaders
; index start address is: 2 (W1)
	MOV.B	W0, W1
; i end address is: 8 (W4)
; index end address is: 2 (W1)
; lenData end address is: 6 (W3)
	MOV.B	W4, W5
	MOV.B	W1, W4
;Process_data.c,207 :: 		for(;i< lenData;i++)
L_sendStatus31:
; index start address is: 8 (W4)
; lenData start address is: 6 (W3)
; i start address is: 10 (W5)
	CP.B	W5, W3
	BRA LTU	L__sendStatus62
	GOTO	L_sendStatus32
L__sendStatus62:
;Process_data.c,209 :: 		index =  Int2Array(ParamsIn[i], dataSend,  index);
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W5, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_ParamsIn), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W5
; index end address is: 8 (W4)
	PUSH	W3
	ZE	W4, W12
	CLR	W13
	MOV	W2, W11
	MOV	W0, W10
	CALL	_Int2Array
	POP	W3
	POP	W5
; index start address is: 8 (W4)
	MOV.B	W0, W4
;Process_data.c,207 :: 		for(;i< lenData;i++)
	INC.B	W5
;Process_data.c,210 :: 		}
; lenData end address is: 6 (W3)
; i end address is: 10 (W5)
	GOTO	L_sendStatus31
L_sendStatus32:
;Process_data.c,212 :: 		index = addStringData(&cS.networkName,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#36, W0
	ADD	W14, W0, W0
	MOV.B	W4, W12
; index end address is: 8 (W4)
	MOV	W1, W11
	MOV	W0, W10
	CALL	_addStringData
;Process_data.c,213 :: 		index = addStringData(&cS.networkPassword,dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#42, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_addStringData
;Process_data.c,214 :: 		index = addStringData(&cS.networkPort,dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#48, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_addStringData
;Process_data.c,215 :: 		index = addStringData(&cS.networkServerIp,dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#54, W1
	ADD	W14, W1, W1
	MOV.B	W0, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_addStringData
;Process_data.c,217 :: 		WIFI_Send_One_Array_Not_Wait_To_OK(dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ZE	W0, W11
	MOV	W1, W10
	CALL	_WIFI_Send_One_Array_Not_Wait_To_OK
;Process_data.c,221 :: 		}
L_end_sendStatus:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _sendStatus

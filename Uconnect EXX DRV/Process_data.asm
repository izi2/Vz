
_setHeaders:

;Process_data.c,26 :: 		uint_16 setHeaders(char *header, char *buffer, uint_16 index)
;Process_data.c,28 :: 		header[H_TYPE_DATA] = (uint_8) buffer[index];
	ADD	W11, W12, W0
	MOV.B	[W0], [W10]
;Process_data.c,29 :: 		header[H_LENGTH_DATA] = (uint_8) buffer[index + 1];
	ADD	W10, #1, W1
	ADD	W12, #1, W0
	ADD	W11, W0, W0
	MOV.B	[W0], [W1]
;Process_data.c,33 :: 		return index + LENGTH_HEADERS_CMD;
	ADD	W12, #2, W0
;Process_data.c,34 :: 		}
L_end_setHeaders:
	RETURN
; end of _setHeaders

_setData:

;Process_data.c,36 :: 		uint_16 setData(char *datap, char *header, char *buffer, uint_16 index)
;Process_data.c,38 :: 		uint_16 i = 0;
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
;Process_data.c,39 :: 		for (; i < header[H_LENGTH_DATA]; i++)
L_setData0:
; i start address is: 4 (W2)
	ADD	W11, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W2, W0
	BRA LTU	L__setData42
	GOTO	L_setData1
L__setData42:
;Process_data.c,41 :: 		datap[i] = buffer[index];
	ADD	W10, W2, W1
	ADD	W12, W13, W0
	MOV.B	[W0], [W1]
;Process_data.c,42 :: 		index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Process_data.c,39 :: 		for (; i < header[H_LENGTH_DATA]; i++)
	INC	W2
;Process_data.c,43 :: 		}
	GOTO	L_setData0
L_setData1:
;Process_data.c,44 :: 		datap[i] = '\0';
	ADD	W10, W2, W1
; i end address is: 4 (W2)
	CLR	W0
	MOV.B	W0, [W1]
;Process_data.c,45 :: 		return index;
	MOV	W13, W0
;Process_data.c,46 :: 		}
L_end_setData:
	RETURN
; end of _setData

_insertParamsToParamsIn:

;Process_data.c,48 :: 		void insertParamsToParamsIn(char *datap, uint_8 len)
;Process_data.c,50 :: 		uint_8 i = 0;
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
;Process_data.c,52 :: 		for (; i < len; i += 2)
L_insertParamsToParamsIn3:
; i start address is: 6 (W3)
	CP.B	W3, W11
	BRA LTU	L__insertParamsToParamsIn44
	GOTO	L_insertParamsToParamsIn4
L__insertParamsToParamsIn44:
;Process_data.c,54 :: 		value = CombineSignedHighLow((uint_8) datap[i], (uint_8) datap[i + 1]);
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
;Process_data.c,56 :: 		if (value != -1)
	MOV	#65535, W1
	CP	W0, W1
	BRA NZ	L__insertParamsToParamsIn45
	GOTO	L_insertParamsToParamsIn6
L__insertParamsToParamsIn45:
;Process_data.c,58 :: 		ParamsIn[i / 2] = value;
	ZE	W3, W0
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #1, W1
	MOV	#lo_addr(_ParamsIn), W0
	ADD	W0, W1, W0
	MOV	W4, [W0]
; value end address is: 8 (W4)
;Process_data.c,59 :: 		}
L_insertParamsToParamsIn6:
;Process_data.c,52 :: 		for (; i < len; i += 2)
; i start address is: 0 (W0)
	ADD.B	W3, #2, W0
; i end address is: 6 (W3)
;Process_data.c,60 :: 		}
	MOV.B	W0, W3
; i end address is: 0 (W0)
	GOTO	L_insertParamsToParamsIn3
L_insertParamsToParamsIn4:
;Process_data.c,61 :: 		}
L_end_insertParamsToParamsIn:
	RETURN
; end of _insertParamsToParamsIn

_AddHeaders:

;Process_data.c,63 :: 		char* AddHeaders(uint_8 type,uint_8 length, char* dataS,uint_8 index)
;Process_data.c,66 :: 		dataS[index++] = EndUnitID;
	ZE	W13, W0
	ADD	W12, W0, W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,67 :: 		dataS[index++] = 0;
	ZE	W13, W0
	ADD	W12, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,68 :: 		dataS[index++] = length;
	ZE	W13, W0
	ADD	W12, W0, W0
	MOV.B	W11, [W0]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,69 :: 		dataS[index++] = type;
	ZE	W13, W0
	ADD	W12, W0, W0
	MOV.B	W10, [W0]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,71 :: 		return index;
	ZE	W13, W0
;Process_data.c,73 :: 		}
L_end_AddHeaders:
	RETURN
; end of _AddHeaders

_parssData:
	LNK	#118

;Process_data.c,76 :: 		void parssData(char *buffer, int bufferLength)
;Process_data.c,80 :: 		uint_8 changesInNet = 0;
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV.B	W0, [W14+110]
;Process_data.c,81 :: 		uint_8 oldAlgoSelected = AlgorithmTypeParametr;
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+42]
;Process_data.c,82 :: 		uint_16 i = 0;
	MOV	#0, W0
	MOV	W0, [W14+112]
;Process_data.c,84 :: 		initConfigSensor(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_initConfigSensor
	POP.D	W10
;Process_data.c,85 :: 		while (i < bufferLength)
L_parssData7:
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W11, [W0]
	BRA GTU	L__parssData48
	GOTO	L_parssData8
L__parssData48:
;Process_data.c,87 :: 		i = setHeaders(HEADERS, buffer, i);
	ADD	W14, #0, W0
	PUSH.D	W10
	MOV	[W14+112], W12
	MOV	W10, W11
	MOV	W0, W10
	CALL	_setHeaders
	POP.D	W10
;Process_data.c,88 :: 		i = setData(DATA, HEADERS, buffer, i);
	ADD	W14, #0, W2
	ADD	W14, #2, W1
	PUSH.D	W10
	MOV	W0, W13
	MOV	W10, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_setData
	MOV	W0, [W14+112]
;Process_data.c,90 :: 		PrintOut(PrintHandler, "\rlen %d, type %d", HEADERS[H_LENGTH_DATA], HEADERS[H_TYPE_DATA]);
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
;Process_data.c,91 :: 		switch (HEADERS[H_TYPE_DATA])
	ADD	W14, #0, W0
	MOV	W0, [W14+116]
	GOTO	L_parssData9
;Process_data.c,93 :: 		case P_ID_SENSOR:
L_parssData11:
;Process_data.c,94 :: 		saveInEEpromPropertyConfig(&cS.idS, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#44, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,95 :: 		LoadUnitId(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadUnitId
	POP.D	W10
;Process_data.c,96 :: 		break;
	GOTO	L_parssData10
;Process_data.c,97 :: 		case P_ALGO_SELECTED:
L_parssData12:
;Process_data.c,98 :: 		if(oldAlgoSelected != DATA[0])
	ADD	W14, #2, W1
	MOV.B	[W14+42], W0
	CP.B	W0, [W1]
	BRA NZ	L__parssData49
	GOTO	L_parssData13
L__parssData49:
;Process_data.c,100 :: 		saveInEEpromPropertyConfig(&cS.algoSelected, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#68, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,101 :: 		LoadAlgoSelected(&cS) ;
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadAlgoSelected
;Process_data.c,102 :: 		saveInEEpromPropertyConfig(&cS.paramsIn,getDefultParams());
	CALL	_getDefultParams
	MOV	#74, W1
	ADD	W14, W1, W1
	MOV	W0, W11
	MOV	W1, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,103 :: 		LoadParamsIn(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadParamsIn
	POP.D	W10
;Process_data.c,104 :: 		}
L_parssData13:
;Process_data.c,105 :: 		break;
	GOTO	L_parssData10
;Process_data.c,107 :: 		case P_TRANSMITED_TO_GATWAY:
L_parssData14:
;Process_data.c,108 :: 		saveInEEpromPropertyConfig(&cS.transmitedToGatway, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#56, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,109 :: 		LoadTransmitedToGatway(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadTransmitedToGatway
	POP.D	W10
;Process_data.c,110 :: 		break;
	GOTO	L_parssData10
;Process_data.c,112 :: 		case P_TRANSMITED_ROW_DATA:
L_parssData15:
;Process_data.c,113 :: 		saveInEEpromPropertyConfig(&cS.transmitRowData, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#104, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,114 :: 		LoadTransmitedRawDataToGatway(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadTransmitedRawDataToGatway
	POP.D	W10
;Process_data.c,115 :: 		break;
	GOTO	L_parssData10
;Process_data.c,117 :: 		case P_POINTER_LEASER:
L_parssData16:
;Process_data.c,118 :: 		saveInEEpromPropertyConfig(&cS.pointerLeaser, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#50, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,119 :: 		LoadPointerLeaser(&cS)  ;
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadPointerLeaser
	POP.D	W10
;Process_data.c,120 :: 		break;
	GOTO	L_parssData10
;Process_data.c,121 :: 		case P_SENSOR_BIST:
L_parssData17:
;Process_data.c,122 :: 		saveInEEpromPropertyConfig(&cS.sensorBist, &DATA[0]);
	ADD	W14, #2, W1
	MOV	#62, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;Process_data.c,123 :: 		LoadSensorBist(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	MOV	W0, W10
	CALL	_LoadSensorBist
	POP.D	W10
;Process_data.c,124 :: 		break;
	GOTO	L_parssData10
;Process_data.c,126 :: 		case P_NET_NAME:
L_parssData18:
;Process_data.c,127 :: 		saveInEEpromPropertyConfig(&cS.networkName, DATA);
	ADD	W14, #2, W1
	MOV	#80, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,128 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+110]
;Process_data.c,129 :: 		break;
	GOTO	L_parssData10
;Process_data.c,130 :: 		case P_NET_PASS:
L_parssData19:
;Process_data.c,131 :: 		saveInEEpromPropertyConfig(&cS.networkPassword, DATA);
	ADD	W14, #2, W1
	MOV	#86, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,132 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+110]
;Process_data.c,133 :: 		break;
	GOTO	L_parssData10
;Process_data.c,134 :: 		case P_NET_PORT:
L_parssData20:
;Process_data.c,135 :: 		saveInEEpromPropertyConfig(&cS.networkPort, DATA);
	ADD	W14, #2, W1
	MOV	#92, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,136 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+110]
;Process_data.c,137 :: 		break;
	GOTO	L_parssData10
;Process_data.c,138 :: 		case P_NET_IP:
L_parssData21:
;Process_data.c,139 :: 		saveInEEpromPropertyConfig(&cS.networkServerIp, DATA);
	ADD	W14, #2, W1
	MOV	#98, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,140 :: 		changesInNet = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+110]
;Process_data.c,141 :: 		break;
	GOTO	L_parssData10
;Process_data.c,142 :: 		case P_PARAMS:
L_parssData22:
;Process_data.c,143 :: 		insertParamsToParamsIn(DATA, HEADERS[H_LENGTH_DATA]);
	ADD	W14, #0, W0
	ADD	W0, #1, W1
	ADD	W14, #2, W0
	PUSH.D	W10
	MOV.B	[W1], W11
	MOV	W0, W10
	CALL	_insertParamsToParamsIn
;Process_data.c,144 :: 		saveInEEpromPropertyConfig(&cS.paramsIn, ParamsIn);
	MOV	#74, W0
	ADD	W14, W0, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,145 :: 		break;
	GOTO	L_parssData10
;Process_data.c,146 :: 		case P_STATUS:
L_parssData23:
;Process_data.c,147 :: 		sendStatus();
	PUSH.D	W10
	CALL	_sendStatus
	POP.D	W10
;Process_data.c,148 :: 		break;
	GOTO	L_parssData10
;Process_data.c,150 :: 		case P_GET_RAW_DATA:
L_parssData24:
;Process_data.c,151 :: 		SendMeRawData = DATA[0];
	ADD	W14, #2, W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_SendMeRawData), W0
	MOV.B	W1, [W0]
;Process_data.c,152 :: 		PrintOut(PrintHandler, "\rSendMeRawData %d",SendMeRawData);
	MOV	#lo_addr(_SendMeRawData), W0
	ZE	[W0], W0
	PUSH.D	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_2_Process_data), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
	POP.D	W10
;Process_data.c,153 :: 		break;
	GOTO	L_parssData10
;Process_data.c,155 :: 		}
L_parssData9:
	MOV	[W14+116], W1
	MOV.B	[W1], W0
	CP.B	W0, #16
	BRA NZ	L__parssData50
	GOTO	L_parssData11
L__parssData50:
	MOV.B	[W1], W0
	CP.B	W0, #10
	BRA NZ	L__parssData51
	GOTO	L_parssData12
L__parssData51:
	MOV.B	[W1], W0
	CP.B	W0, #7
	BRA NZ	L__parssData52
	GOTO	L_parssData14
L__parssData52:
	MOV.B	[W1], W0
	CP.B	W0, #17
	BRA NZ	L__parssData53
	GOTO	L_parssData15
L__parssData53:
	MOV.B	[W1], W0
	CP.B	W0, #6
	BRA NZ	L__parssData54
	GOTO	L_parssData16
L__parssData54:
	MOV.B	[W1], W0
	CP.B	W0, #8
	BRA NZ	L__parssData55
	GOTO	L_parssData17
L__parssData55:
	MOV.B	[W1], W0
	CP.B	W0, #12
	BRA NZ	L__parssData56
	GOTO	L_parssData18
L__parssData56:
	MOV.B	[W1], W0
	CP.B	W0, #13
	BRA NZ	L__parssData57
	GOTO	L_parssData19
L__parssData57:
	MOV.B	[W1], W0
	CP.B	W0, #14
	BRA NZ	L__parssData58
	GOTO	L_parssData20
L__parssData58:
	MOV.B	[W1], W0
	CP.B	W0, #15
	BRA NZ	L__parssData59
	GOTO	L_parssData21
L__parssData59:
	MOV.B	[W1], W0
	CP.B	W0, #11
	BRA NZ	L__parssData60
	GOTO	L_parssData22
L__parssData60:
	MOV.B	[W1], W0
	CP.B	W0, #18
	BRA NZ	L__parssData61
	GOTO	L_parssData23
L__parssData61:
	MOV.B	[W1], W0
	CP.B	W0, #20
	BRA NZ	L__parssData62
	GOTO	L_parssData24
L__parssData62:
L_parssData10:
;Process_data.c,156 :: 		if (changesInNet)
	MOV	#110, W0
	ADD	W14, W0, W0
	CP0.B	[W0]
	BRA NZ	L__parssData63
	GOTO	L_parssData25
L__parssData63:
;Process_data.c,158 :: 		LoadWifi(&cS);
	MOV	#44, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_LoadWifi
	POP.D	W10
;Process_data.c,159 :: 		}
L_parssData25:
;Process_data.c,161 :: 		}
	GOTO	L_parssData7
L_parssData8:
;Process_data.c,164 :: 		}
L_end_parssData:
	POP	W13
	POP	W12
	ULNK
	RETURN
; end of _parssData

_lenParams:

;Process_data.c,166 :: 		uint_8 lenParams()
;Process_data.c,168 :: 		switch (AlgorithmTypeParametr)
	GOTO	L_lenParams26
;Process_data.c,170 :: 		case Algo_2:
L_lenParams28:
;Process_data.c,171 :: 		return algo2_params_in_size;
	MOV.B	#5, W0
	GOTO	L_end_lenParams
;Process_data.c,173 :: 		case Algo_3_4:
L_lenParams29:
;Process_data.c,174 :: 		return  algo_3_4_params_in_size;
	MOV.B	#8, W0
	GOTO	L_end_lenParams
;Process_data.c,175 :: 		case Algo_5:
L_lenParams30:
;Process_data.c,176 :: 		return algo5_params_in_size;
	MOV.B	#9, W0
	GOTO	L_end_lenParams
;Process_data.c,177 :: 		case No_Algo:
L_lenParams31:
;Process_data.c,178 :: 		return 0;
	CLR	W0
	GOTO	L_end_lenParams
;Process_data.c,179 :: 		}
L_lenParams26:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__lenParams65
	GOTO	L_lenParams28
L__lenParams65:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__lenParams66
	GOTO	L_lenParams29
L__lenParams66:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__lenParams67
	GOTO	L_lenParams30
L__lenParams67:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__lenParams68
	GOTO	L_lenParams31
L__lenParams68:
;Process_data.c,180 :: 		}
L_end_lenParams:
	RETURN
; end of _lenParams

_addStringData:
	LNK	#50

;Process_data.c,182 :: 		uint_8 addStringData(propertySensor* propertyRead,uint_8 typeData, char* dataSend,uint_8 index)
;Process_data.c,185 :: 		uint_8 lenData = 0;
	PUSH	W10
	PUSH	W11
;Process_data.c,186 :: 		uint_8 i = 0;
;Process_data.c,187 :: 		readFromMemProperty(propertyRead, tempData);
	ADD	W14, #0, W0
	PUSH.D	W12
	PUSH	W11
	MOV	W0, W11
	CALL	_readFromMemProperty
	POP	W11
	POP.D	W12
;Process_data.c,188 :: 		lenData = strlen(tempData);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_strlen
; lenData start address is: 6 (W3)
	MOV.B	W0, W3
;Process_data.c,189 :: 		index = AddHeaders(typeData,lenData,dataSend,index);
	PUSH	W13
	MOV.B	W11, W10
	MOV.B	W0, W11
	CALL	_AddHeaders
	POP	W13
	MOV.B	W0, W13
;Process_data.c,191 :: 		for(i=0;i<lenData;i++)
; i start address is: 8 (W4)
	CLR	W4
; lenData end address is: 6 (W3)
; i end address is: 8 (W4)
L_addStringData32:
; i start address is: 8 (W4)
; lenData start address is: 6 (W3)
	CP.B	W4, W3
	BRA LTU	L__addStringData70
	GOTO	L_addStringData33
L__addStringData70:
;Process_data.c,193 :: 		dataSend[index++] = tempData[i];
	ZE	W13, W0
	ADD	W12, W0, W2
	ADD	W14, #0, W1
	ZE	W4, W0
	ADD	W1, W0, W0
	MOV.B	[W0], [W2]
	ADD.B	W13, #1, W0
	MOV.B	W0, W13
;Process_data.c,191 :: 		for(i=0;i<lenData;i++)
	INC.B	W4
;Process_data.c,194 :: 		}
; lenData end address is: 6 (W3)
; i end address is: 8 (W4)
	GOTO	L_addStringData32
L_addStringData33:
;Process_data.c,196 :: 		return index;
	MOV.B	W13, W0
;Process_data.c,197 :: 		}
;Process_data.c,196 :: 		return index;
;Process_data.c,197 :: 		}
L_end_addStringData:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _addStringData

_sendStatus:
	LNK	#366

;Process_data.c,199 :: 		void sendStatus()
;Process_data.c,202 :: 		uint_8 i = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
; i start address is: 6 (W3)
	CLR	W3
;Process_data.c,204 :: 		uint_8 index = 0;
; index start address is: 2 (W1)
	CLR	W1
;Process_data.c,205 :: 		uint_8 lenData = 0;
;Process_data.c,208 :: 		initConfigSensor(&cS);
	ADD	W14, #0, W0
	PUSH	W1
	PUSH	W3
	MOV	W0, W10
	CALL	_initConfigSensor
	POP	W3
	POP	W1
;Process_data.c,210 :: 		index = AddHeaders(P_ID_SENSOR,1,dataSend,index);
	MOV	#66, W0
	ADD	W14, W0, W0
	MOV.B	W1, W13
; index end address is: 2 (W1)
	MOV	W0, W12
	MOV.B	#1, W11
	MOV.B	#16, W10
	CALL	_AddHeaders
; index start address is: 8 (W4)
	MOV.B	W0, W4
;Process_data.c,211 :: 		dataSend[index++] = EndUnitID;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_EndUnitID), W0
	MOV.B	[W0], [W1]
	ADD.B	W4, #1, W0
; index end address is: 8 (W4)
;Process_data.c,213 :: 		index = AddHeaders(P_POINTER_LEASER,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_AddHeaders
; index start address is: 8 (W4)
	MOV.B	W0, W4
;Process_data.c,214 :: 		dataSend[index++] = PointerLeaser_Enable;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_PointerLeaser_Enable), W0
	MOV.B	[W0], [W1]
	ADD.B	W4, #1, W0
; index end address is: 8 (W4)
;Process_data.c,217 :: 		index = AddHeaders(P_TRANSMITED_TO_GATWAY,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#7, W10
	CALL	_AddHeaders
; index start address is: 8 (W4)
	MOV.B	W0, W4
;Process_data.c,218 :: 		dataSend[index++] = PlcDataTX_Enable;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_PlcDataTX_Enable), W0
	MOV.B	[W0], [W1]
	ADD.B	W4, #1, W0
; index end address is: 8 (W4)
;Process_data.c,220 :: 		index = AddHeaders(P_TRANSMITED_ROW_DATA,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#17, W10
	CALL	_AddHeaders
; index start address is: 8 (W4)
	MOV.B	W0, W4
;Process_data.c,221 :: 		dataSend[index++] = RawDataTX_Enable;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_RawDataTX_Enable), W0
	MOV.B	[W0], [W1]
	ADD.B	W4, #1, W0
; index end address is: 8 (W4)
;Process_data.c,223 :: 		index = AddHeaders(P_ALGO_SELECTED,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#10, W10
	CALL	_AddHeaders
; index start address is: 8 (W4)
	MOV.B	W0, W4
;Process_data.c,224 :: 		dataSend[index++] = AlgorithmTypeParametr - 2;
	MOV	#66, W2
	ADD	W14, W2, W2
	ZE	W0, W0
	ADD	W2, W0, W1
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	ZE	[W0], W0
	DEC2	W0
	MOV.B	W0, [W1]
	ADD.B	W4, #1, W0
; index end address is: 8 (W4)
;Process_data.c,226 :: 		index = AddHeaders(P_SENSOR_BIST,1,dataSend,index);
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_AddHeaders
; index start address is: 4 (W2)
	MOV.B	W0, W2
;Process_data.c,227 :: 		dataSend[index++] = SensorBist;
	MOV	#66, W1
	ADD	W14, W1, W1
	ZE	W0, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_SensorBist), W0
	MOV.B	[W0], [W1]
; index start address is: 8 (W4)
	ADD.B	W2, #1, W4
; index end address is: 4 (W2)
;Process_data.c,230 :: 		lenData = lenParams();
	CALL	_lenParams
; lenData start address is: 4 (W2)
	MOV.B	W0, W2
;Process_data.c,231 :: 		if(lenData)
	CP0.B	W0
	BRA NZ	L__sendStatus72
	GOTO	L__sendStatus39
L__sendStatus72:
;Process_data.c,233 :: 		index = AddHeaders(P_PARAMS,lenData*2,dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ZE	W2, W0
	SL	W0, #1, W0
	MOV.B	W4, W13
; index end address is: 8 (W4)
	MOV	W1, W12
	MOV.B	W0, W11
	MOV.B	#11, W10
	CALL	_AddHeaders
; index start address is: 8 (W4)
	MOV.B	W0, W4
; i end address is: 6 (W3)
; lenData end address is: 4 (W2)
; index end address is: 8 (W4)
	MOV.B	W3, W5
	MOV.B	W2, W3
;Process_data.c,234 :: 		for(;i< lenData;i++)
L_sendStatus36:
; index start address is: 8 (W4)
; lenData start address is: 6 (W3)
; i start address is: 10 (W5)
	CP.B	W5, W3
	BRA LTU	L__sendStatus73
	GOTO	L_sendStatus37
L__sendStatus73:
;Process_data.c,236 :: 		index =  Int2Array(ParamsIn[i], dataSend,  index);
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
;Process_data.c,234 :: 		for(;i< lenData;i++)
	INC.B	W5
;Process_data.c,237 :: 		}
; lenData end address is: 6 (W3)
; i end address is: 10 (W5)
	GOTO	L_sendStatus36
L_sendStatus37:
;Process_data.c,238 :: 		}
	MOV.B	W4, W2
	GOTO	L_sendStatus35
; index end address is: 8 (W4)
L__sendStatus39:
;Process_data.c,231 :: 		if(lenData)
	MOV.B	W4, W2
;Process_data.c,238 :: 		}
L_sendStatus35:
;Process_data.c,240 :: 		index = addStringData(&cS.networkName,P_NET_NAME,dataSend,index);
; index start address is: 4 (W2)
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	#36, W0
	ADD	W14, W0, W0
	MOV.B	W2, W13
; index end address is: 4 (W2)
	MOV	W1, W12
	MOV.B	#12, W11
	MOV	W0, W10
	CALL	_addStringData
;Process_data.c,241 :: 		index = addStringData(&cS.networkPassword,P_NET_PASS,dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#42, W1
	ADD	W14, W1, W1
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#13, W11
	MOV	W1, W10
	CALL	_addStringData
;Process_data.c,242 :: 		index = addStringData(&cS.networkPort,P_NET_PORT,dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#48, W1
	ADD	W14, W1, W1
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#14, W11
	MOV	W1, W10
	CALL	_addStringData
;Process_data.c,243 :: 		index = addStringData(&cS.networkServerIp,P_NET_IP,dataSend,index);
	MOV	#66, W2
	ADD	W14, W2, W2
	MOV	#54, W1
	ADD	W14, W1, W1
	MOV.B	W0, W13
	MOV	W2, W12
	MOV.B	#15, W11
	MOV	W1, W10
	CALL	_addStringData
;Process_data.c,245 :: 		WIFI_Send_One_Array_Not_Wait_To_OK(dataSend,index);
	MOV	#66, W1
	ADD	W14, W1, W1
	ZE	W0, W11
	MOV	W1, W10
	CALL	_WIFI_Send_One_Array_Not_Wait_To_OK
;Process_data.c,249 :: 		}
L_end_sendStatus:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _sendStatus

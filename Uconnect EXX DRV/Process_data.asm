
_setHeaders:

;Process_data.c,20 :: 		uint_16 setHeaders(char* header, char* buffer, uint_16 index)
;Process_data.c,22 :: 		header[H_TYPE_DATA] = (uint_8) buffer[index];
	ADD	W11, W12, W0
	MOV.B	[W0], [W10]
;Process_data.c,23 :: 		header[H_LENGTH_DATA] = (uint_8) buffer[index+1];
	ADD	W10, #1, W1
	ADD	W12, #1, W0
	ADD	W11, W0, W0
	MOV.B	[W0], [W1]
;Process_data.c,25 :: 		return index + LENGTH_HEADERS_CMD ;
	ADD	W12, #2, W0
;Process_data.c,26 :: 		}
L_end_setHeaders:
	RETURN
; end of _setHeaders

_setData:

;Process_data.c,28 :: 		uint_16 setData(char* datap, char* header, char* buffer, uint_16 index)
;Process_data.c,30 :: 		uint_16 i = 0;
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
;Process_data.c,31 :: 		for(;i < header[H_LENGTH_DATA];i++)
L_setData0:
; i start address is: 4 (W2)
	ADD	W11, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W2, W0
	BRA LTU	L__setData20
	GOTO	L_setData1
L__setData20:
;Process_data.c,33 :: 		datap[i] = buffer[index];
	ADD	W10, W2, W1
	ADD	W12, W13, W0
	MOV.B	[W0], [W1]
;Process_data.c,34 :: 		index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Process_data.c,31 :: 		for(;i < header[H_LENGTH_DATA];i++)
	INC	W2
;Process_data.c,35 :: 		}
	GOTO	L_setData0
L_setData1:
;Process_data.c,36 :: 		datap[i] = '\0';
	ADD	W10, W2, W1
; i end address is: 4 (W2)
	CLR	W0
	MOV.B	W0, [W1]
;Process_data.c,37 :: 		return index;
	MOV	W13, W0
;Process_data.c,38 :: 		}
L_end_setData:
	RETURN
; end of _setData

_insertParamsToParamsIn:

;Process_data.c,40 :: 		void insertParamsToParamsIn(char* datap,uint_8 len)
;Process_data.c,42 :: 		uint_8 i = 0;
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
;Process_data.c,44 :: 		for(;i < len;i += 2)
L_insertParamsToParamsIn3:
; i start address is: 6 (W3)
	CP.B	W3, W11
	BRA LTU	L__insertParamsToParamsIn22
	GOTO	L_insertParamsToParamsIn4
L__insertParamsToParamsIn22:
;Process_data.c,46 :: 		value = CombineSignedHighLow((uint_8) datap[i],(uint_8) datap[i+1]);
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
;Process_data.c,47 :: 		if(value != -1)
	MOV	#65535, W1
	CP	W0, W1
	BRA NZ	L__insertParamsToParamsIn23
	GOTO	L_insertParamsToParamsIn6
L__insertParamsToParamsIn23:
;Process_data.c,49 :: 		ParamsIn[i/2] = value;
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
;Process_data.c,44 :: 		for(;i < len;i += 2)
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

_parssData:
	LNK	#108

;Process_data.c,53 :: 		void parssData(char* buffer,int bufferLength)
;Process_data.c,57 :: 		uint_16 i = 0;
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+102]
;Process_data.c,58 :: 		uint_8 t = 0;
;Process_data.c,60 :: 		initConfigSensor(&cS);
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_initConfigSensor
	POP.D	W10
;Process_data.c,62 :: 		while(i < bufferLength)
L_parssData7:
	MOV	#102, W0
	ADD	W14, W0, W0
	CP	W11, [W0]
	BRA GTU	L__parssData25
	GOTO	L_parssData8
L__parssData25:
;Process_data.c,64 :: 		i = setHeaders(HEADERS,buffer,i);
	ADD	W14, #0, W0
	PUSH.D	W10
	MOV	[W14+102], W12
	MOV	W10, W11
	MOV	W0, W10
	CALL	_setHeaders
	POP.D	W10
;Process_data.c,65 :: 		i = setData(DATA,HEADERS,buffer,i);
	ADD	W14, #0, W2
	ADD	W14, #2, W1
	PUSH.D	W10
	MOV	W0, W13
	MOV	W10, W12
	MOV	W2, W11
	MOV	W1, W10
	CALL	_setData
	POP.D	W10
	MOV	W0, [W14+102]
;Process_data.c,66 :: 		switch (HEADERS[H_TYPE_DATA])
	ADD	W14, #0, W0
	MOV	W0, [W14+106]
	GOTO	L_parssData9
;Process_data.c,68 :: 		case P_ID_SENSOR:
L_parssData11:
;Process_data.c,69 :: 		ID_SENSOR = (uint_8) DATA[0];
	ADD	W14, #2, W2
	MOV.B	[W2], W1
	MOV	#lo_addr(_ID_SENSOR), W0
	MOV.B	W1, [W0]
;Process_data.c,70 :: 		saveInEEpromPropertyConfig(&cS.idS,(uint_8)DATA[0]);
	MOV	#42, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	ZE	[W2], W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,71 :: 		break;
	GOTO	L_parssData10
;Process_data.c,72 :: 		case P_ALGO_SELECTED:
L_parssData12:
;Process_data.c,73 :: 		ALGO_SELECTED = (uint_8) DATA[0];
	ADD	W14, #2, W2
	MOV.B	[W2], W1
	MOV	#lo_addr(_ALGO_SELECTED), W0
	MOV.B	W1, [W0]
;Process_data.c,74 :: 		saveInEEpromPropertyConfig(&cS.algoSelected,(uint_8)DATA[0]);
	MOV	#66, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	ZE	[W2], W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,75 :: 		break;
	GOTO	L_parssData10
;Process_data.c,76 :: 		case P_NET_NAME:
L_parssData13:
;Process_data.c,77 :: 		saveInEEpromPropertyConfig(&cS.networkName,(uint_8)DATA);
	ADD	W14, #2, W1
	MOV	#78, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	ZE	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,78 :: 		break;
	GOTO	L_parssData10
;Process_data.c,79 :: 		case P_NET_PASS:
L_parssData14:
;Process_data.c,80 :: 		saveInEEpromPropertyConfig(&cS.networkPassword,(uint_8)DATA);
	ADD	W14, #2, W1
	MOV	#84, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	ZE	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,81 :: 		break;
	GOTO	L_parssData10
;Process_data.c,82 :: 		case P_NET_PORT:
L_parssData15:
;Process_data.c,83 :: 		saveInEEpromPropertyConfig(&cS.networkPort,(uint_8)DATA);
	ADD	W14, #2, W1
	MOV	#90, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	ZE	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,84 :: 		break;
	GOTO	L_parssData10
;Process_data.c,85 :: 		case P_NET_IP:
L_parssData16:
;Process_data.c,86 :: 		saveInEEpromPropertyConfig(&cS.networkServerIp,(uint_8)DATA);
	ADD	W14, #2, W1
	MOV	#96, W0
	ADD	W14, W0, W0
	PUSH.D	W10
	ZE	W1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,87 :: 		break;
	GOTO	L_parssData10
;Process_data.c,88 :: 		case P_PARAMS:
L_parssData17:
;Process_data.c,89 :: 		insertParamsToParamsIn(DATA,HEADERS[H_LENGTH_DATA]);
	ADD	W14, #0, W0
	ADD	W0, #1, W1
	ADD	W14, #2, W0
	PUSH.D	W10
	MOV.B	[W1], W11
	MOV	W0, W10
	CALL	_insertParamsToParamsIn
;Process_data.c,90 :: 		saveInEEpromPropertyConfig(&cS.paramsIn,ParamsIn);
	MOV	#72, W0
	ADD	W14, W0, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP.D	W10
;Process_data.c,91 :: 		break;
	GOTO	L_parssData10
;Process_data.c,93 :: 		}
L_parssData9:
	MOV	[W14+106], W1
	MOV.B	[W1], W0
	CP.B	W0, #13
	BRA NZ	L__parssData26
	GOTO	L_parssData11
L__parssData26:
	MOV.B	[W1], W0
	CP.B	W0, #7
	BRA NZ	L__parssData27
	GOTO	L_parssData12
L__parssData27:
	MOV.B	[W1], W0
	CP.B	W0, #9
	BRA NZ	L__parssData28
	GOTO	L_parssData13
L__parssData28:
	MOV.B	[W1], W0
	CP.B	W0, #10
	BRA NZ	L__parssData29
	GOTO	L_parssData14
L__parssData29:
	MOV.B	[W1], W0
	CP.B	W0, #11
	BRA NZ	L__parssData30
	GOTO	L_parssData15
L__parssData30:
	MOV.B	[W1], W0
	CP.B	W0, #12
	BRA NZ	L__parssData31
	GOTO	L_parssData16
L__parssData31:
	MOV.B	[W1], W0
	CP.B	W0, #8
	BRA NZ	L__parssData32
	GOTO	L_parssData17
L__parssData32:
L_parssData10:
;Process_data.c,95 :: 		}
	GOTO	L_parssData7
L_parssData8:
;Process_data.c,96 :: 		}
L_end_parssData:
	POP	W13
	POP	W12
	ULNK
	RETURN
; end of _parssData

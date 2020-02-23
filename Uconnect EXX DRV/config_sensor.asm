
_setAddressPropertyC:

;config_sensor.c,24 :: 		uint_8 endPropertyAddress)
;config_sensor.c,27 :: 		propertySens->address = address;
	MOV	W11, [W10]
;config_sensor.c,28 :: 		propertySens->typeMem = sizePerItem;
	ADD	W10, #4, W0
	MOV.B	W12, [W0]
;config_sensor.c,29 :: 		endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
	CP0.B	W13
	BRA NZ	L__setAddressPropertyC15
	GOTO	L_setAddressPropertyC0
L__setAddressPropertyC15:
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	MOV.B	W13, W2
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
	GOTO	L_setAddressPropertyC1
L_setAddressPropertyC0:
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	MOV.B	W12, W2
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
L_setAddressPropertyC1:
;config_sensor.c,30 :: 		propertySens->endAddress = address + endAddress;
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	ADD	W10, #2, W1
	ZE	W2, W0
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
	ADD	W11, W0, W0
	MOV	W0, [W1]
;config_sensor.c,31 :: 		return propertySens->endAddress;
	ADD	W10, #2, W0
	MOV	[W0], W0
;config_sensor.c,32 :: 		}
L_end_setAddressPropertyC:
	RETURN
; end of _setAddressPropertyC

_initConfigSensor:

;config_sensor.c,35 :: 		void initConfigSensor(ConfigSensor *confSensor)
;config_sensor.c,39 :: 		i = setAddressPropertyC(&confSensor->idS, START_MEM, C_UCHAR, 0);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV.B	#1, W12
	MOV	#40, W11
	CALL	_setAddressPropertyC
;config_sensor.c,41 :: 		i = setAddressPropertyC(&confSensor->algoSelected, i, C_UCHAR, 0);
	ADD	W10, #24, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,43 :: 		i = setAddressPropertyC(&confSensor->pointerLeaser, i, C_UCHAR, 0);
	ADD	W10, #6, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,45 :: 		i = setAddressPropertyC(&confSensor->transmitedToGatway, i, C_UCHAR, 0);
	ADD	W10, #12, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,47 :: 		i = setAddressPropertyC(&confSensor->transmitRowData, i, C_UCHAR, 0);
	MOV	#60, W1
	ADD	W10, W1, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,49 :: 		i = setAddressPropertyC(&confSensor->sensorBist, i, C_UCHAR, 0);
	ADD	W10, #18, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,51 :: 		i = setAddressPropertyC(&confSensor->paramsIn, i, C_16INT, LENGTH_PARAMS_IN * 2);
	ADD	W10, #30, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#2, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,53 :: 		i = setAddressPropertyC(&confSensor->networkName, i, C_UCHAR, LENGTH_NAME_NET);
	MOV	#36, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,55 :: 		i = setAddressPropertyC(&confSensor->networkPassword, i, C_UCHAR, LENGTH_PASSWORD_NET);
	MOV	#42, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,57 :: 		i = setAddressPropertyC(&confSensor->networkPort, i, C_UCHAR, LENGTH_PORT_NET);
	MOV	#48, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#8, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,59 :: 		i = setAddressPropertyC(&confSensor->networkServerIp, i, C_UCHAR, LENGTH_SERVER_IP);
	MOV	#54, W1
	ADD	W10, W1, W1
	MOV.B	#20, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
;config_sensor.c,61 :: 		}
L_end_initConfigSensor:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initConfigSensor

_readEEpromRawData:
	LNK	#2

;config_sensor.c,63 :: 		void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index)
;config_sensor.c,65 :: 		uint_8 i =0;
;config_sensor.c,67 :: 		for (i = propertySens->address; i < propertySens->endAddress;i++)
	MOV	[W10], W0
; i start address is: 4 (W2)
	MOV.B	W0, W2
; i end address is: 4 (W2)
L_readEEpromRawData2:
; i start address is: 4 (W2)
	ADD	W10, #2, W0
	MOV	[W0], W1
	ZE	W2, W0
	CP	W0, W1
	BRA LTU	L__readEEpromRawData18
	GOTO	L_readEEpromRawData3
L__readEEpromRawData18:
;config_sensor.c,70 :: 		dest[index++] = GetProperty(i);
	ZE	W12, W0
	ADD	W11, W0, W0
	MOV	W0, [W14+0]
	PUSH	W2
	PUSH	W12
	PUSH.D	W10
	ZE	W2, W10
	CALL	_GetProperty
	POP.D	W10
	POP	W12
	POP	W2
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
	ADD.B	W12, #1, W0
	MOV.B	W0, W12
;config_sensor.c,67 :: 		for (i = propertySens->address; i < propertySens->endAddress;i++)
	INC.B	W2
;config_sensor.c,72 :: 		}
; i end address is: 4 (W2)
	GOTO	L_readEEpromRawData2
L_readEEpromRawData3:
;config_sensor.c,73 :: 		PrintOut(PrintHandler, "\rdest %s, ", dest);
	PUSH	W12
	PUSH.D	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_1_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
	POP.D	W10
	POP	W12
;config_sensor.c,76 :: 		}
L_end_readEEpromRawData:
	ULNK
	RETURN
; end of _readEEpromRawData

_saveInEEpromPropertyConfig:
	LNK	#2

;config_sensor.c,79 :: 		void saveInEEpromPropertyConfig(propertySensor *propertySens, void *value)
;config_sensor.c,83 :: 		uint_8 *tmp = (uint_8 *) value;
	MOV	W11, [W14+0]
;config_sensor.c,84 :: 		for (i = propertySens->address; i < propertySens->endAddress; i++)
	MOV	[W10], W0
; i start address is: 4 (W2)
	MOV	W0, W2
; i end address is: 4 (W2)
L_saveInEEpromPropertyConfig5:
; i start address is: 4 (W2)
	ADD	W10, #2, W0
	MOV	[W0], W0
	CP	W2, W0
	BRA LTU	L__saveInEEpromPropertyConfig20
	GOTO	L_saveInEEpromPropertyConfig6
L__saveInEEpromPropertyConfig20:
;config_sensor.c,86 :: 		MemWrt(i, *tmp);
	MOV	[W14+0], W0
	PUSH	W2
	PUSH.D	W10
	MOV.B	[W0], W11
	MOV	W2, W10
	CALL	_MemWrt
	POP.D	W10
	POP	W2
;config_sensor.c,87 :: 		++tmp;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,84 :: 		for (i = propertySens->address; i < propertySens->endAddress; i++)
; i start address is: 2 (W1)
	ADD	W2, #1, W1
; i end address is: 4 (W2)
;config_sensor.c,88 :: 		}
	MOV	W1, W2
; i end address is: 2 (W1)
	GOTO	L_saveInEEpromPropertyConfig5
L_saveInEEpromPropertyConfig6:
;config_sensor.c,90 :: 		}
L_end_saveInEEpromPropertyConfig:
	ULNK
	RETURN
; end of _saveInEEpromPropertyConfig

_saveDefultConfig:

;config_sensor.c,92 :: 		void saveDefultConfig(ConfigSensor *confSensor)
;config_sensor.c,95 :: 		saveInEEpromPropertyConfig(&confSensor->idS, &EndUnitID);
	PUSH	W10
	PUSH	W11
	PUSH	W10
	MOV	#lo_addr(_EndUnitID), W11
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,96 :: 		saveInEEpromPropertyConfig(&confSensor->algoSelected, &AlgorithmTypeParametr);
	ADD	W10, #24, W0
	PUSH	W10
	MOV	#lo_addr(_AlgorithmTypeParametr), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,97 :: 		saveInEEpromPropertyConfig(&confSensor->pointerLeaser, &PointerLeaser_Enable);
	ADD	W10, #6, W0
	PUSH	W10
	MOV	#lo_addr(_PointerLeaser_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,98 :: 		saveInEEpromPropertyConfig(&confSensor->transmitRowData, &RawDataTX_Enable);
	MOV	#60, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_RawDataTX_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,99 :: 		saveInEEpromPropertyConfig(&confSensor->transmitedToGatway, &PlcDataTX_Enable);
	ADD	W10, #12, W0
	PUSH	W10
	MOV	#lo_addr(_PlcDataTX_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,100 :: 		saveInEEpromPropertyConfig(&confSensor->sensorBist, &SensorBist);
	ADD	W10, #18, W0
	PUSH	W10
	MOV	#lo_addr(_SensorBist), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,101 :: 		saveInEEpromPropertyConfig(&confSensor->paramsIn, paramsDefult);
	ADD	W10, #30, W0
	PUSH	W10
	MOV	#lo_addr(_paramsDefult), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,102 :: 		saveInEEpromPropertyConfig(&confSensor->networkName, "Ravtech-Public\0");
	MOV	#36, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(?lstr2_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,103 :: 		saveInEEpromPropertyConfig(&confSensor->networkPassword, "@ravTech!\0");
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(?lstr3_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,104 :: 		saveInEEpromPropertyConfig(&confSensor->networkPort, "9875\0");
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(?lstr4_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,105 :: 		saveInEEpromPropertyConfig(&confSensor->networkServerIp, "192.168.16.118\0");
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	#lo_addr(?lstr5_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;config_sensor.c,107 :: 		}
L_end_saveDefultConfig:
	POP	W11
	POP	W10
	RETURN
; end of _saveDefultConfig

_isFirstProgrammin:

;config_sensor.c,111 :: 		char isFirstProgrammin()
;config_sensor.c,113 :: 		return GetProperty(0);
	PUSH	W10
	CLR	W10
	CALL	_GetProperty
;config_sensor.c,114 :: 		}
;config_sensor.c,113 :: 		return GetProperty(0);
;config_sensor.c,114 :: 		}
L_end_isFirstProgrammin:
	POP	W10
	RETURN
; end of _isFirstProgrammin

_setFirstProgmmanigToFalse:

;config_sensor.c,116 :: 		char setFirstProgmmanigToFalse()
;config_sensor.c,118 :: 		MemWrt(0, 0);
	PUSH	W10
	PUSH	W11
	CLR	W11
	CLR	W10
	CALL	_MemWrt
;config_sensor.c,119 :: 		}
L_end_setFirstProgmmanigToFalse:
	POP	W11
	POP	W10
	RETURN
; end of _setFirstProgmmanigToFalse

_Enable_VZ_Pointer:

;config_sensor.c,121 :: 		void Enable_VZ_Pointer(char mode)
;config_sensor.c,123 :: 		Read_Write_MCP23S17_IO(EN_LASER, mode);
	PUSH	W10
	PUSH	W11
	MOV.B	W10, W11
	MOV.B	#7, W10
	CALL	_Read_Write_MCP23S17_IO
;config_sensor.c,124 :: 		}
L_end_Enable_VZ_Pointer:
	POP	W11
	POP	W10
	RETURN
; end of _Enable_VZ_Pointer

_readFromMemProperty:
	LNK	#6

;config_sensor.c,127 :: 		void readFromMemProperty(propertySensor *propertySens, void *dest)
;config_sensor.c,131 :: 		uint_8 *tmp = (uint_8 *) dest;
	MOV	W11, [W14+2]
;config_sensor.c,132 :: 		int_16 *tmpI = (int_16 *) dest;
	MOV	W11, [W14+4]
;config_sensor.c,134 :: 		for (i = propertySens->address; i < propertySens->endAddress;)
	MOV	[W10], W0
	MOV	W0, [W14+0]
L_readFromMemProperty8:
	ADD	W10, #2, W0
	MOV	[W0], W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GTU	L__readFromMemProperty26
	GOTO	L_readFromMemProperty9
L__readFromMemProperty26:
;config_sensor.c,136 :: 		if (propertySens->typeMem == C_16INT)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__readFromMemProperty27
	GOTO	L_readFromMemProperty11
L__readFromMemProperty27:
;config_sensor.c,138 :: 		*tmpI = GetSignedIntProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetSignedIntProperty
	POP.D	W10
	MOV	[W14+4], W1
	MOV	W0, [W1]
;config_sensor.c,139 :: 		i += 2;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #2, [W0]
;config_sensor.c,140 :: 		++tmpI;
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #2, [W0]
;config_sensor.c,141 :: 		}
L_readFromMemProperty11:
;config_sensor.c,142 :: 		if (propertySens->typeMem == C_UCHAR)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__readFromMemProperty28
	GOTO	L_readFromMemProperty12
L__readFromMemProperty28:
;config_sensor.c,144 :: 		*tmp = GetProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetProperty
	POP.D	W10
	MOV	[W14+2], W1
	MOV.B	W0, [W1]
;config_sensor.c,145 :: 		++tmp;
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
;config_sensor.c,146 :: 		++i;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,147 :: 		}
L_readFromMemProperty12:
;config_sensor.c,148 :: 		}
	GOTO	L_readFromMemProperty8
L_readFromMemProperty9:
;config_sensor.c,151 :: 		}
L_end_readFromMemProperty:
	ULNK
	RETURN
; end of _readFromMemProperty

_BildStringWifi:

;config_sensor.c,153 :: 		void BildStringWifi(char *name, char *pass, char *ip, char *port)
;config_sensor.c,156 :: 		PrintOut(PrintHandler, "\rname %s, pass %s, ip %s, port %s;\n", name, pass, ip, port);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_6_config_sensor), W1
	MOV	#lo_addr(_PrintHandler), W0
	PUSH.D	W12
	PUSH.D	W10
	PUSH	W13
	PUSH	W12
	PUSH	W11
	PUSH	W10
	PUSH	W1
	PUSH	W0
	CALL	_PrintOut
	SUB	#12, W15
	POP.D	W10
	POP.D	W12
;config_sensor.c,157 :: 		strcpy(CWJAP_String, "AT+CWJAP=\"");
	PUSH.D	W10
	MOV	#lo_addr(?lstr7_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcpy
	POP.D	W10
;config_sensor.c,158 :: 		strcat(CWJAP_String, name);
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,159 :: 		strcat(CWJAP_String, "\",\"");
	MOV	#lo_addr(?lstr8_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
	POP	W11
;config_sensor.c,160 :: 		strcat(CWJAP_String, pass);
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,161 :: 		strcat(CWJAP_String, "\"\r\n");
	MOV	#lo_addr(?lstr9_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,162 :: 		strcpy(CIPSTART_String, "AT+CIPSTART=\"TCP\",\"");
	MOV	#lo_addr(?lstr10_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcpy
;config_sensor.c,163 :: 		strcat(CIPSTART_String, ip);
	MOV	W12, W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,164 :: 		strcat(CIPSTART_String, "\",");
	MOV	#lo_addr(?lstr11_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,165 :: 		strcat(CIPSTART_String, port);
	MOV	W13, W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,166 :: 		strcat(CIPSTART_String, "\r\n");
	MOV	#lo_addr(?lstr12_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,167 :: 		PrintOut(PrintHandler, "NET %s %s ", CWJAP_String, CIPSTART_String);
	MOV	#lo_addr(_CIPSTART_String), W0
	PUSH	W0
	MOV	#lo_addr(_CWJAP_String), W0
	PUSH	W0
	MOV	#lo_addr(?lstr_13_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#8, W15
;config_sensor.c,168 :: 		}
L_end_BildStringWifi:
	POP	W11
	POP	W10
	RETURN
; end of _BildStringWifi

_LoadALLSchem:

;config_sensor.c,170 :: 		void LoadALLSchem(ConfigSensor *cS)
;config_sensor.c,172 :: 		LoadUnitId(cs);
	PUSH	W10
	CALL	_LoadUnitId
	POP	W10
;config_sensor.c,173 :: 		LoadAlgoSelected(cs);
	PUSH	W10
	CALL	_LoadAlgoSelected
	POP	W10
;config_sensor.c,174 :: 		LoadPointerLeaser(cs);
	PUSH	W10
	CALL	_LoadPointerLeaser
	POP	W10
;config_sensor.c,175 :: 		LoadParamsIn(cs);
	PUSH	W10
	CALL	_LoadParamsIn
	POP	W10
;config_sensor.c,176 :: 		LoadWifi(cs);
	PUSH	W10
	CALL	_LoadWifi
	POP	W10
;config_sensor.c,177 :: 		LoadTransmitedToGatway(cs);
	CALL	_LoadTransmitedToGatway
;config_sensor.c,179 :: 		}
L_end_LoadALLSchem:
	RETURN
; end of _LoadALLSchem

_initConfig:
	LNK	#66

;config_sensor.c,181 :: 		void initConfig()
;config_sensor.c,183 :: 		uint_8 firstProgramm = 0;
	PUSH	W10
;config_sensor.c,187 :: 		initConfigSensor(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_initConfigSensor
;config_sensor.c,190 :: 		firstProgramm = isFirstProgrammin();
	CALL	_isFirstProgrammin
;config_sensor.c,195 :: 		saveDefultConfig(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_saveDefultConfig
;config_sensor.c,196 :: 		setFirstProgmmanigToFalse();
	CALL	_setFirstProgmmanigToFalse
;config_sensor.c,198 :: 		LoadALLSchem(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_LoadALLSchem
;config_sensor.c,201 :: 		}
L_end_initConfig:
	POP	W10
	ULNK
	RETURN
; end of _initConfig

_LoadUnitId:

;config_sensor.c,203 :: 		void LoadUnitId(ConfigSensor *cS)
;config_sensor.c,205 :: 		readFromMemProperty(&cS->idS, &EndUnitID);
	PUSH	W11
	MOV	#lo_addr(_EndUnitID), W11
	CALL	_readFromMemProperty
;config_sensor.c,206 :: 		}
L_end_LoadUnitId:
	POP	W11
	RETURN
; end of _LoadUnitId

_LoadAlgoSelected:

;config_sensor.c,208 :: 		void LoadAlgoSelected(ConfigSensor *cS)
;config_sensor.c,210 :: 		readFromMemProperty(&cS->algoSelected, &AlgorithmTypeParametr);
	PUSH	W10
	PUSH	W11
	ADD	W10, #24, W0
	MOV	#lo_addr(_AlgorithmTypeParametr), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,212 :: 		}
L_end_LoadAlgoSelected:
	POP	W11
	POP	W10
	RETURN
; end of _LoadAlgoSelected

_LoadPointerLeaser:

;config_sensor.c,214 :: 		void LoadPointerLeaser(ConfigSensor *cS)
;config_sensor.c,216 :: 		readFromMemProperty(&cS->pointerLeaser, &PointerLeaser_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #6, W0
	MOV	#lo_addr(_PointerLeaser_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,217 :: 		Enable_VZ_Pointer(PointerLeaser_Enable);
	MOV	#lo_addr(_PointerLeaser_Enable), W0
	MOV.B	[W0], W10
	CALL	_Enable_VZ_Pointer
;config_sensor.c,218 :: 		}
L_end_LoadPointerLeaser:
	POP	W11
	POP	W10
	RETURN
; end of _LoadPointerLeaser

_LoadParamsIn:

;config_sensor.c,220 :: 		void LoadParamsIn(ConfigSensor *cS)
;config_sensor.c,222 :: 		uint_8 i = 0;
	PUSH	W10
	PUSH	W11
;config_sensor.c,223 :: 		readFromMemProperty(&cS->paramsIn, &ParamsIn);
	ADD	W10, #30, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,224 :: 		}
L_end_LoadParamsIn:
	POP	W11
	POP	W10
	RETURN
; end of _LoadParamsIn

_LoadWifi:
	LNK	#88

;config_sensor.c,226 :: 		void LoadWifi(ConfigSensor *cS)
;config_sensor.c,233 :: 		readFromMemProperty(&cS->networkName, &name_net);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W14, #0, W1
	MOV	#36, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,234 :: 		readFromMemProperty(&cS->networkPassword, &password_net);
	ADD	W14, #30, W1
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,235 :: 		readFromMemProperty(&cS->networkPort, &port_net);
	MOV	#60, W1
	ADD	W14, W1, W1
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,236 :: 		readFromMemProperty(&cS->networkServerIp, &server_ip_net);
	MOV	#68, W1
	ADD	W14, W1, W1
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,237 :: 		BildStringWifi(name_net, password_net, server_ip_net, port_net);
	MOV	#60, W3
	ADD	W14, W3, W3
	MOV	#68, W2
	ADD	W14, W2, W2
	ADD	W14, #30, W1
	ADD	W14, #0, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_BildStringWifi
;config_sensor.c,238 :: 		ConnectingToWifiNet();
	CALL	_ConnectingToWifiNet
;config_sensor.c,241 :: 		}
L_end_LoadWifi:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _LoadWifi

_LoadTransmitedToGatway:

;config_sensor.c,245 :: 		void LoadTransmitedToGatway(ConfigSensor *cS)
;config_sensor.c,247 :: 		readFromMemProperty(&cS->transmitedToGatway, &PlcDataTX_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #12, W0
	MOV	#lo_addr(_PlcDataTX_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,248 :: 		}
L_end_LoadTransmitedToGatway:
	POP	W11
	POP	W10
	RETURN
; end of _LoadTransmitedToGatway

_LoadSensorBist:

;config_sensor.c,250 :: 		void LoadSensorBist(ConfigSensor *cS)
;config_sensor.c,252 :: 		readFromMemProperty(&cS->sensorBist, &SensorBist);
	PUSH	W10
	PUSH	W11
	ADD	W10, #18, W0
	MOV	#lo_addr(_SensorBist), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,253 :: 		PrintOut(PrintHandler, "\rSensorBist %d",SensorBist);
	MOV	#lo_addr(_SensorBist), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_14_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;config_sensor.c,254 :: 		}
L_end_LoadSensorBist:
	POP	W11
	POP	W10
	RETURN
; end of _LoadSensorBist

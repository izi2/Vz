
_setAddressPropertyC:

;config_sensor.c,30 :: 		uint_8 endPropertyAddress)
;config_sensor.c,33 :: 		propertySens->address = address;
	MOV	W11, [W10]
;config_sensor.c,34 :: 		propertySens->typeMem = sizePerItem;
	ADD	W10, #4, W0
	MOV.B	W12, [W0]
;config_sensor.c,35 :: 		endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
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
;config_sensor.c,36 :: 		propertySens->endAddress = address + endAddress;
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	ADD	W10, #2, W1
	ZE	W2, W0
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
	ADD	W11, W0, W0
	MOV	W0, [W1]
;config_sensor.c,37 :: 		return propertySens->endAddress;
	ADD	W10, #2, W0
	MOV	[W0], W0
;config_sensor.c,38 :: 		}
L_end_setAddressPropertyC:
	RETURN
; end of _setAddressPropertyC

_initConfigSensor:

;config_sensor.c,40 :: 		void initConfigSensor(ConfigSensor *confSensor)
;config_sensor.c,44 :: 		i = setAddressPropertyC(&confSensor->idS, START_MEM, C_UCHAR, 0);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV.B	#1, W12
	MOV	#40, W11
	CALL	_setAddressPropertyC
;config_sensor.c,46 :: 		i = setAddressPropertyC(&confSensor->algoSelected, i, C_UCHAR, 0);
	ADD	W10, #24, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,48 :: 		i = setAddressPropertyC(&confSensor->pointerLeaser, i, C_UCHAR, 0);
	ADD	W10, #6, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,50 :: 		i = setAddressPropertyC(&confSensor->transmitedToGatway, i, C_UCHAR, 0);
	ADD	W10, #12, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,52 :: 		i = setAddressPropertyC(&confSensor->transmitRowData, i, C_UCHAR, 0);
	MOV	#60, W1
	ADD	W10, W1, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,54 :: 		i = setAddressPropertyC(&confSensor->sensorBist, i, C_UCHAR, 0);
	ADD	W10, #18, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,56 :: 		i = setAddressPropertyC(&confSensor->paramsIn, i, C_16INT, LENGTH_PARAMS_IN * 2);
	ADD	W10, #30, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#2, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,58 :: 		i = setAddressPropertyC(&confSensor->networkName, i, C_UCHAR, LENGTH_NAME_NET);
	MOV	#36, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,60 :: 		i = setAddressPropertyC(&confSensor->networkPassword, i, C_UCHAR, LENGTH_PASSWORD_NET);
	MOV	#42, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,62 :: 		i = setAddressPropertyC(&confSensor->networkPort, i, C_UCHAR, LENGTH_PORT_NET);
	MOV	#48, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#8, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,64 :: 		i = setAddressPropertyC(&confSensor->networkServerIp, i, C_UCHAR, LENGTH_SERVER_IP);
	MOV	#54, W1
	ADD	W10, W1, W1
	MOV.B	#20, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
;config_sensor.c,66 :: 		}
L_end_initConfigSensor:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initConfigSensor

_readEEpromRawData:
	LNK	#2

;config_sensor.c,68 :: 		void readEEpromRawData(propertySensor *propertySens, char *dest,uint_8 index)
;config_sensor.c,70 :: 		uint_8 i =0;
;config_sensor.c,72 :: 		for (i = propertySens->address; i < propertySens->endAddress;i++)
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
;config_sensor.c,75 :: 		dest[index++] = GetProperty(i);
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
;config_sensor.c,72 :: 		for (i = propertySens->address; i < propertySens->endAddress;i++)
	INC.B	W2
;config_sensor.c,77 :: 		}
; i end address is: 4 (W2)
	GOTO	L_readEEpromRawData2
L_readEEpromRawData3:
;config_sensor.c,78 :: 		PrintOut(PrintHandler, "\rdest %s, ", dest);
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
;config_sensor.c,81 :: 		}
L_end_readEEpromRawData:
	ULNK
	RETURN
; end of _readEEpromRawData

_saveInEEpromPropertyConfig:
	LNK	#2

;config_sensor.c,84 :: 		void saveInEEpromPropertyConfig(propertySensor *propertySens, void *value)
;config_sensor.c,88 :: 		uint_8 *tmp = (uint_8 *) value;
	MOV	W11, [W14+0]
;config_sensor.c,89 :: 		for (i = propertySens->address; i < propertySens->endAddress; i++)
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
;config_sensor.c,91 :: 		MemWrt(i, *tmp);
	MOV	[W14+0], W0
	PUSH	W2
	PUSH.D	W10
	MOV.B	[W0], W11
	MOV	W2, W10
	CALL	_MemWrt
	POP.D	W10
	POP	W2
;config_sensor.c,92 :: 		++tmp;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,89 :: 		for (i = propertySens->address; i < propertySens->endAddress; i++)
; i start address is: 2 (W1)
	ADD	W2, #1, W1
; i end address is: 4 (W2)
;config_sensor.c,93 :: 		}
	MOV	W1, W2
; i end address is: 2 (W1)
	GOTO	L_saveInEEpromPropertyConfig5
L_saveInEEpromPropertyConfig6:
;config_sensor.c,95 :: 		}
L_end_saveInEEpromPropertyConfig:
	ULNK
	RETURN
; end of _saveInEEpromPropertyConfig

_saveDefultConfig:

;config_sensor.c,97 :: 		void saveDefultConfig(ConfigSensor *confSensor)
;config_sensor.c,100 :: 		saveInEEpromPropertyConfig(&confSensor->idS, &EndUnitID);
	PUSH	W10
	PUSH	W11
	PUSH	W10
	MOV	#lo_addr(_EndUnitID), W11
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,101 :: 		saveInEEpromPropertyConfig(&confSensor->algoSelected, &AlgorithmTypeParametr);
	ADD	W10, #24, W0
	PUSH	W10
	MOV	#lo_addr(_AlgorithmTypeParametr), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,102 :: 		saveInEEpromPropertyConfig(&confSensor->pointerLeaser, &PointerLeaser_Enable);
	ADD	W10, #6, W0
	PUSH	W10
	MOV	#lo_addr(_PointerLeaser_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,103 :: 		saveInEEpromPropertyConfig(&confSensor->transmitRowData, &RawDataTX_Enable);
	MOV	#60, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_RawDataTX_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,104 :: 		saveInEEpromPropertyConfig(&confSensor->transmitedToGatway, &PlcDataTX_Enable);
	ADD	W10, #12, W0
	PUSH	W10
	MOV	#lo_addr(_PlcDataTX_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,105 :: 		saveInEEpromPropertyConfig(&confSensor->sensorBist, &SensorBist);
	ADD	W10, #18, W0
	PUSH	W10
	MOV	#lo_addr(_SensorBist), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,106 :: 		saveInEEpromPropertyConfig(&confSensor->paramsIn, paramsDefult);
	ADD	W10, #30, W0
	PUSH	W10
	MOV	#lo_addr(_paramsDefult), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,107 :: 		saveInEEpromPropertyConfig(&confSensor->networkName, &NET_NAME_DEFULT);
	MOV	#36, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_NET_NAME_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,108 :: 		saveInEEpromPropertyConfig(&confSensor->networkPassword, &NET_PASS_DEFULT);
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_NET_PASS_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,109 :: 		saveInEEpromPropertyConfig(&confSensor->networkPort, &NET_PORT_DEFULT);
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_NET_PORT_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,110 :: 		saveInEEpromPropertyConfig(&confSensor->networkServerIp,&NET_SERVER_IP_DEFULT );
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	#lo_addr(_NET_SERVER_IP_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;config_sensor.c,112 :: 		}
L_end_saveDefultConfig:
	POP	W11
	POP	W10
	RETURN
; end of _saveDefultConfig

_isFirstProgrammin:

;config_sensor.c,116 :: 		char isFirstProgrammin()
;config_sensor.c,118 :: 		return GetProperty(0);
	PUSH	W10
	CLR	W10
	CALL	_GetProperty
;config_sensor.c,119 :: 		}
;config_sensor.c,118 :: 		return GetProperty(0);
;config_sensor.c,119 :: 		}
L_end_isFirstProgrammin:
	POP	W10
	RETURN
; end of _isFirstProgrammin

_setFirstProgmmanigToFalse:

;config_sensor.c,121 :: 		char setFirstProgmmanigToFalse()
;config_sensor.c,123 :: 		MemWrt(0, 0);
	PUSH	W10
	PUSH	W11
	CLR	W11
	CLR	W10
	CALL	_MemWrt
;config_sensor.c,124 :: 		}
L_end_setFirstProgmmanigToFalse:
	POP	W11
	POP	W10
	RETURN
; end of _setFirstProgmmanigToFalse

_Enable_VZ_Pointer:

;config_sensor.c,126 :: 		void Enable_VZ_Pointer(char mode)
;config_sensor.c,128 :: 		Read_Write_MCP23S17_IO(EN_LASER, mode);
	PUSH	W10
	PUSH	W11
	MOV.B	W10, W11
	MOV.B	#7, W10
	CALL	_Read_Write_MCP23S17_IO
;config_sensor.c,129 :: 		}
L_end_Enable_VZ_Pointer:
	POP	W11
	POP	W10
	RETURN
; end of _Enable_VZ_Pointer

_readFromMemProperty:
	LNK	#6

;config_sensor.c,132 :: 		void readFromMemProperty(propertySensor *propertySens, void *dest)
;config_sensor.c,136 :: 		uint_8 *tmp = (uint_8 *) dest;
	MOV	W11, [W14+2]
;config_sensor.c,137 :: 		int_16 *tmpI = (int_16 *) dest;
	MOV	W11, [W14+4]
;config_sensor.c,139 :: 		for (i = propertySens->address; i < propertySens->endAddress;)
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
;config_sensor.c,141 :: 		if (propertySens->typeMem == C_16INT)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__readFromMemProperty27
	GOTO	L_readFromMemProperty11
L__readFromMemProperty27:
;config_sensor.c,143 :: 		*tmpI = GetSignedIntProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetSignedIntProperty
	POP.D	W10
	MOV	[W14+4], W1
	MOV	W0, [W1]
;config_sensor.c,144 :: 		i += 2;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #2, [W0]
;config_sensor.c,145 :: 		++tmpI;
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #2, [W0]
;config_sensor.c,146 :: 		}
L_readFromMemProperty11:
;config_sensor.c,147 :: 		if (propertySens->typeMem == C_UCHAR)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__readFromMemProperty28
	GOTO	L_readFromMemProperty12
L__readFromMemProperty28:
;config_sensor.c,149 :: 		*tmp = GetProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetProperty
	POP.D	W10
	MOV	[W14+2], W1
	MOV.B	W0, [W1]
;config_sensor.c,150 :: 		++tmp;
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
;config_sensor.c,151 :: 		++i;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,152 :: 		}
L_readFromMemProperty12:
;config_sensor.c,153 :: 		}
	GOTO	L_readFromMemProperty8
L_readFromMemProperty9:
;config_sensor.c,156 :: 		}
L_end_readFromMemProperty:
	ULNK
	RETURN
; end of _readFromMemProperty

_BildStringWifi:

;config_sensor.c,158 :: 		void BildStringWifi(char *name, char *pass, char *ip, char *port)
;config_sensor.c,161 :: 		PrintOut(PrintHandler, "\rname %s, pass %s, ip %s, port %s;\n", name, pass, ip, port);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_2_config_sensor), W1
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
;config_sensor.c,162 :: 		strcpy(CWJAP_String, "AT+CWJAP=\"");
	PUSH.D	W10
	MOV	#lo_addr(?lstr3_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcpy
	POP.D	W10
;config_sensor.c,163 :: 		strcat(CWJAP_String, name);
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,164 :: 		strcat(CWJAP_String, "\",\"");
	MOV	#lo_addr(?lstr4_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
	POP	W11
;config_sensor.c,165 :: 		strcat(CWJAP_String, pass);
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,166 :: 		strcat(CWJAP_String, "\"\r\n");
	MOV	#lo_addr(?lstr5_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,167 :: 		strcpy(CIPSTART_String, "AT+CIPSTART=\"TCP\",\"");
	MOV	#lo_addr(?lstr6_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcpy
;config_sensor.c,168 :: 		strcat(CIPSTART_String, ip);
	MOV	W12, W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,169 :: 		strcat(CIPSTART_String, "\",");
	MOV	#lo_addr(?lstr7_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,170 :: 		strcat(CIPSTART_String, port);
	MOV	W13, W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,171 :: 		strcat(CIPSTART_String, "\r\n");
	MOV	#lo_addr(?lstr8_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,172 :: 		PrintOut(PrintHandler, "NET %s %s ", CWJAP_String, CIPSTART_String);
	MOV	#lo_addr(_CIPSTART_String), W0
	PUSH	W0
	MOV	#lo_addr(_CWJAP_String), W0
	PUSH	W0
	MOV	#lo_addr(?lstr_9_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#8, W15
;config_sensor.c,173 :: 		}
L_end_BildStringWifi:
	POP	W11
	POP	W10
	RETURN
; end of _BildStringWifi

_LoadALLSchem:

;config_sensor.c,175 :: 		void LoadALLSchem(ConfigSensor *cS)
;config_sensor.c,177 :: 		LoadUnitId(cs);
	PUSH	W10
	CALL	_LoadUnitId
	POP	W10
;config_sensor.c,178 :: 		LoadAlgoSelected(cs);
	PUSH	W10
	CALL	_LoadAlgoSelected
	POP	W10
;config_sensor.c,179 :: 		LoadPointerLeaser(cs);
	PUSH	W10
	CALL	_LoadPointerLeaser
	POP	W10
;config_sensor.c,180 :: 		LoadParamsIn(cs);
	PUSH	W10
	CALL	_LoadParamsIn
	POP	W10
;config_sensor.c,181 :: 		LoadWifi(cs);
	PUSH	W10
	CALL	_LoadWifi
	POP	W10
;config_sensor.c,182 :: 		LoadTransmitedToGatway(cs);
	PUSH	W10
	CALL	_LoadTransmitedToGatway
	POP	W10
;config_sensor.c,183 :: 		LoadSensorBist(cS);
	CALL	_LoadSensorBist
;config_sensor.c,185 :: 		}
L_end_LoadALLSchem:
	RETURN
; end of _LoadALLSchem

_initConfig:
	LNK	#66

;config_sensor.c,187 :: 		void initConfig()
;config_sensor.c,189 :: 		uint_8 firstProgramm = 0;
	PUSH	W10
;config_sensor.c,193 :: 		initConfigSensor(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_initConfigSensor
;config_sensor.c,196 :: 		firstProgramm = isFirstProgrammin();
	CALL	_isFirstProgrammin
;config_sensor.c,201 :: 		saveDefultConfig(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_saveDefultConfig
;config_sensor.c,202 :: 		setFirstProgmmanigToFalse();
	CALL	_setFirstProgmmanigToFalse
;config_sensor.c,204 :: 		LoadALLSchem(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_LoadALLSchem
;config_sensor.c,207 :: 		}
L_end_initConfig:
	POP	W10
	ULNK
	RETURN
; end of _initConfig

_LoadUnitId:

;config_sensor.c,209 :: 		void LoadUnitId(ConfigSensor *cS)
;config_sensor.c,211 :: 		readFromMemProperty(&cS->idS, &EndUnitID);
	PUSH	W11
	MOV	#lo_addr(_EndUnitID), W11
	CALL	_readFromMemProperty
;config_sensor.c,212 :: 		}
L_end_LoadUnitId:
	POP	W11
	RETURN
; end of _LoadUnitId

_LoadAlgoSelected:

;config_sensor.c,214 :: 		void LoadAlgoSelected(ConfigSensor *cS)
;config_sensor.c,216 :: 		readFromMemProperty(&cS->algoSelected, &AlgorithmTypeParametr);
	PUSH	W10
	PUSH	W11
	ADD	W10, #24, W0
	MOV	#lo_addr(_AlgorithmTypeParametr), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,218 :: 		}
L_end_LoadAlgoSelected:
	POP	W11
	POP	W10
	RETURN
; end of _LoadAlgoSelected

_LoadPointerLeaser:

;config_sensor.c,220 :: 		void LoadPointerLeaser(ConfigSensor *cS)
;config_sensor.c,222 :: 		readFromMemProperty(&cS->pointerLeaser, &PointerLeaser_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #6, W0
	MOV	#lo_addr(_PointerLeaser_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,223 :: 		Enable_VZ_Pointer(PointerLeaser_Enable);
	MOV	#lo_addr(_PointerLeaser_Enable), W0
	MOV.B	[W0], W10
	CALL	_Enable_VZ_Pointer
;config_sensor.c,224 :: 		}
L_end_LoadPointerLeaser:
	POP	W11
	POP	W10
	RETURN
; end of _LoadPointerLeaser

_LoadParamsIn:

;config_sensor.c,226 :: 		void LoadParamsIn(ConfigSensor *cS)
;config_sensor.c,228 :: 		uint_8 i = 0;
	PUSH	W10
	PUSH	W11
;config_sensor.c,229 :: 		readFromMemProperty(&cS->paramsIn, &ParamsIn);
	ADD	W10, #30, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,230 :: 		}
L_end_LoadParamsIn:
	POP	W11
	POP	W10
	RETURN
; end of _LoadParamsIn

_LoadWifi:
	LNK	#88

;config_sensor.c,232 :: 		void LoadWifi(ConfigSensor *cS)
;config_sensor.c,239 :: 		readFromMemProperty(&cS->networkName, &name_net);
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
;config_sensor.c,240 :: 		readFromMemProperty(&cS->networkPassword, &password_net);
	ADD	W14, #30, W1
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,241 :: 		readFromMemProperty(&cS->networkPort, &port_net);
	MOV	#60, W1
	ADD	W14, W1, W1
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,242 :: 		readFromMemProperty(&cS->networkServerIp, &server_ip_net);
	MOV	#68, W1
	ADD	W14, W1, W1
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,243 :: 		BildStringWifi(name_net, password_net, server_ip_net, port_net);
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
;config_sensor.c,244 :: 		ConnectingToWifiNet();
	CALL	_ConnectingToWifiNet
;config_sensor.c,247 :: 		}
L_end_LoadWifi:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _LoadWifi

_LoadTransmitedToGatway:

;config_sensor.c,251 :: 		void LoadTransmitedToGatway(ConfigSensor *cS)
;config_sensor.c,253 :: 		readFromMemProperty(&cS->transmitedToGatway, &PlcDataTX_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #12, W0
	MOV	#lo_addr(_PlcDataTX_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,254 :: 		}
L_end_LoadTransmitedToGatway:
	POP	W11
	POP	W10
	RETURN
; end of _LoadTransmitedToGatway

_LoadSensorBist:

;config_sensor.c,256 :: 		void LoadSensorBist(ConfigSensor *cS)
;config_sensor.c,258 :: 		readFromMemProperty(&cS->sensorBist, &SensorBist);
	PUSH	W10
	PUSH	W11
	ADD	W10, #18, W0
	MOV	#lo_addr(_SensorBist), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,259 :: 		Init_VZ_Sensor(SensorBist);
	MOV	#lo_addr(_SensorBist), W0
	MOV.B	[W0], W10
	CALL	_Init_VZ_Sensor
;config_sensor.c,260 :: 		PrintOut(PrintHandler, "\rSensorBist %d",SensorBist);
	MOV	#lo_addr(_SensorBist), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_10_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;config_sensor.c,261 :: 		}
L_end_LoadSensorBist:
	POP	W11
	POP	W10
	RETURN
; end of _LoadSensorBist

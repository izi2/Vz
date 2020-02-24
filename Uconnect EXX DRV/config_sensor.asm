
_setAddressPropertyC:

;config_sensor.c,35 :: 		uint_8 endPropertyAddress)
;config_sensor.c,38 :: 		propertySens->address = address;
	MOV	W11, [W10]
;config_sensor.c,39 :: 		propertySens->typeMem = sizePerItem;
	ADD	W10, #4, W0
	MOV.B	W12, [W0]
;config_sensor.c,40 :: 		endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
	CP0.B	W13
	BRA NZ	L__setAddressPropertyC18
	GOTO	L_setAddressPropertyC0
L__setAddressPropertyC18:
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	MOV.B	W13, W2
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
	GOTO	L_setAddressPropertyC1
L_setAddressPropertyC0:
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	MOV.B	W12, W2
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
L_setAddressPropertyC1:
;config_sensor.c,41 :: 		propertySens->endAddress = address + endAddress;
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	ADD	W10, #2, W1
	ZE	W2, W0
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
	ADD	W11, W0, W0
	MOV	W0, [W1]
;config_sensor.c,42 :: 		return propertySens->endAddress;
	ADD	W10, #2, W0
	MOV	[W0], W0
;config_sensor.c,43 :: 		}
L_end_setAddressPropertyC:
	RETURN
; end of _setAddressPropertyC

_initConfigSensor:

;config_sensor.c,45 :: 		void initConfigSensor(ConfigSensor *confSensor)
;config_sensor.c,49 :: 		i = setAddressPropertyC(&confSensor->idS, START_MEM, C_UCHAR, 0);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV.B	#1, W12
	MOV	#40, W11
	CALL	_setAddressPropertyC
;config_sensor.c,51 :: 		i = setAddressPropertyC(&confSensor->algoSelected, i, C_UCHAR, 0);
	ADD	W10, #24, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,53 :: 		i = setAddressPropertyC(&confSensor->pointerLeaser, i, C_UCHAR, 0);
	ADD	W10, #6, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,55 :: 		i = setAddressPropertyC(&confSensor->transmitedToGatway, i, C_UCHAR, 0);
	ADD	W10, #12, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,57 :: 		i = setAddressPropertyC(&confSensor->transmitRowData, i, C_UCHAR, 0);
	MOV	#60, W1
	ADD	W10, W1, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,59 :: 		i = setAddressPropertyC(&confSensor->sensorBist, i, C_UCHAR, 0);
	ADD	W10, #18, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,61 :: 		i = setAddressPropertyC(&confSensor->paramsIn, i, C_16INT, LENGTH_PARAMS_IN * 2);
	ADD	W10, #30, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#2, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,63 :: 		i = setAddressPropertyC(&confSensor->networkName, i, C_UCHAR, LENGTH_NAME_NET);
	MOV	#36, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,65 :: 		i = setAddressPropertyC(&confSensor->networkPassword, i, C_UCHAR, LENGTH_PASSWORD_NET);
	MOV	#42, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,67 :: 		i = setAddressPropertyC(&confSensor->networkPort, i, C_UCHAR, LENGTH_PORT_NET);
	MOV	#48, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#8, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,69 :: 		i = setAddressPropertyC(&confSensor->networkServerIp, i, C_UCHAR, LENGTH_SERVER_IP);
	MOV	#54, W1
	ADD	W10, W1, W1
	MOV.B	#20, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
;config_sensor.c,71 :: 		}
L_end_initConfigSensor:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initConfigSensor

_saveInEEpromPropertyConfig:
	LNK	#2

;config_sensor.c,89 :: 		void saveInEEpromPropertyConfig(propertySensor *propertySens, void *value)
;config_sensor.c,93 :: 		uint_8 *tmp = (uint_8 *) value;
	MOV	W11, [W14+0]
;config_sensor.c,94 :: 		for (i = propertySens->address; i < propertySens->endAddress; i++)
	MOV	[W10], W0
; i start address is: 4 (W2)
	MOV	W0, W2
; i end address is: 4 (W2)
L_saveInEEpromPropertyConfig2:
; i start address is: 4 (W2)
	ADD	W10, #2, W0
	MOV	[W0], W0
	CP	W2, W0
	BRA LTU	L__saveInEEpromPropertyConfig21
	GOTO	L_saveInEEpromPropertyConfig3
L__saveInEEpromPropertyConfig21:
;config_sensor.c,96 :: 		MemWrt(i, *tmp);
	MOV	[W14+0], W0
	PUSH	W2
	PUSH.D	W10
	MOV.B	[W0], W11
	MOV	W2, W10
	CALL	_MemWrt
	POP.D	W10
	POP	W2
;config_sensor.c,97 :: 		++tmp;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,94 :: 		for (i = propertySens->address; i < propertySens->endAddress; i++)
; i start address is: 2 (W1)
	ADD	W2, #1, W1
; i end address is: 4 (W2)
;config_sensor.c,98 :: 		}
	MOV	W1, W2
; i end address is: 2 (W1)
	GOTO	L_saveInEEpromPropertyConfig2
L_saveInEEpromPropertyConfig3:
;config_sensor.c,100 :: 		}
L_end_saveInEEpromPropertyConfig:
	ULNK
	RETURN
; end of _saveInEEpromPropertyConfig

_saveDefultConfig:
	LNK	#2

;config_sensor.c,102 :: 		void saveDefultConfig(ConfigSensor *confSensor)
;config_sensor.c,104 :: 		int_16 defultParams = getDefultParams();
	PUSH	W10
	PUSH	W11
	CALL	_getDefultParams
	MOV	W0, [W14+0]
;config_sensor.c,105 :: 		saveInEEpromPropertyConfig(&confSensor->idS, &EndUnitID);
	PUSH	W10
	MOV	#lo_addr(_EndUnitID), W11
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,106 :: 		saveInEEpromPropertyConfig(&confSensor->algoSelected, &AlgorithmTypeParametr);
	ADD	W10, #24, W0
	PUSH	W10
	MOV	#lo_addr(_AlgorithmTypeParametr), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,107 :: 		saveInEEpromPropertyConfig(&confSensor->pointerLeaser, &PointerLeaser_Enable);
	ADD	W10, #6, W0
	PUSH	W10
	MOV	#lo_addr(_PointerLeaser_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,108 :: 		saveInEEpromPropertyConfig(&confSensor->transmitRowData, &RawDataTX_Enable);
	MOV	#60, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_RawDataTX_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,109 :: 		saveInEEpromPropertyConfig(&confSensor->transmitedToGatway, &PlcDataTX_Enable);
	ADD	W10, #12, W0
	PUSH	W10
	MOV	#lo_addr(_PlcDataTX_Enable), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,110 :: 		saveInEEpromPropertyConfig(&confSensor->sensorBist, &SensorBist);
	ADD	W10, #18, W0
	PUSH	W10
	MOV	#lo_addr(_SensorBist), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,111 :: 		saveInEEpromPropertyConfig(&confSensor->paramsIn,defultParams );
	ADD	W10, #30, W0
	PUSH	W10
	MOV	[W14+0], W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,112 :: 		saveInEEpromPropertyConfig(&confSensor->networkName, &NET_NAME_DEFULT);
	MOV	#36, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_NET_NAME_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,113 :: 		saveInEEpromPropertyConfig(&confSensor->networkPassword, &NET_PASS_DEFULT);
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_NET_PASS_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,114 :: 		saveInEEpromPropertyConfig(&confSensor->networkPort, &NET_PORT_DEFULT);
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(_NET_PORT_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,115 :: 		saveInEEpromPropertyConfig(&confSensor->networkServerIp, &NET_SERVER_IP_DEFULT);
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	#lo_addr(_NET_SERVER_IP_DEFULT), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;config_sensor.c,117 :: 		}
L_end_saveDefultConfig:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _saveDefultConfig

_isFirstProgrammin:

;config_sensor.c,120 :: 		char isFirstProgrammin()
;config_sensor.c,122 :: 		return GetProperty(0);
	PUSH	W10
	CLR	W10
	CALL	_GetProperty
;config_sensor.c,123 :: 		}
;config_sensor.c,122 :: 		return GetProperty(0);
;config_sensor.c,123 :: 		}
L_end_isFirstProgrammin:
	POP	W10
	RETURN
; end of _isFirstProgrammin

_setFirstProgmmanigToFalse:

;config_sensor.c,125 :: 		char setFirstProgmmanigToFalse()
;config_sensor.c,127 :: 		MemWrt(0, 0);
	PUSH	W10
	PUSH	W11
	CLR	W11
	CLR	W10
	CALL	_MemWrt
;config_sensor.c,128 :: 		}
L_end_setFirstProgmmanigToFalse:
	POP	W11
	POP	W10
	RETURN
; end of _setFirstProgmmanigToFalse

_Enable_VZ_Pointer:

;config_sensor.c,130 :: 		void Enable_VZ_Pointer(char mode)
;config_sensor.c,132 :: 		Read_Write_MCP23S17_IO(EN_LASER, mode);
	PUSH	W10
	PUSH	W11
	MOV.B	W10, W11
	MOV.B	#7, W10
	CALL	_Read_Write_MCP23S17_IO
;config_sensor.c,133 :: 		}
L_end_Enable_VZ_Pointer:
	POP	W11
	POP	W10
	RETURN
; end of _Enable_VZ_Pointer

_readFromMemProperty:
	LNK	#6

;config_sensor.c,136 :: 		void readFromMemProperty(propertySensor *propertySens, void *dest)
;config_sensor.c,140 :: 		uint_8 *tmp = (uint_8 *) dest;
	MOV	W11, [W14+2]
;config_sensor.c,141 :: 		int_16 *tmpI = (int_16 *) dest;
	MOV	W11, [W14+4]
;config_sensor.c,143 :: 		for (i = propertySens->address; i < propertySens->endAddress;)
	MOV	[W10], W0
	MOV	W0, [W14+0]
L_readFromMemProperty5:
	ADD	W10, #2, W0
	MOV	[W0], W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GTU	L__readFromMemProperty27
	GOTO	L_readFromMemProperty6
L__readFromMemProperty27:
;config_sensor.c,145 :: 		if (propertySens->typeMem == C_16INT)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__readFromMemProperty28
	GOTO	L_readFromMemProperty8
L__readFromMemProperty28:
;config_sensor.c,147 :: 		*tmpI = GetSignedIntProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetSignedIntProperty
	POP.D	W10
	MOV	[W14+4], W1
	MOV	W0, [W1]
;config_sensor.c,148 :: 		i += 2;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #2, [W0]
;config_sensor.c,149 :: 		++tmpI;
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #2, [W0]
;config_sensor.c,150 :: 		}
L_readFromMemProperty8:
;config_sensor.c,151 :: 		if (propertySens->typeMem == C_UCHAR)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__readFromMemProperty29
	GOTO	L_readFromMemProperty9
L__readFromMemProperty29:
;config_sensor.c,153 :: 		*tmp = GetProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetProperty
	POP.D	W10
	MOV	[W14+2], W1
	MOV.B	W0, [W1]
;config_sensor.c,154 :: 		++tmp;
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
;config_sensor.c,155 :: 		++i;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,156 :: 		}
L_readFromMemProperty9:
;config_sensor.c,157 :: 		}
	GOTO	L_readFromMemProperty5
L_readFromMemProperty6:
;config_sensor.c,160 :: 		}
L_end_readFromMemProperty:
	ULNK
	RETURN
; end of _readFromMemProperty

_BildStringWifi:

;config_sensor.c,162 :: 		void BildStringWifi(char *name, char *pass, char *ip, char *port)
;config_sensor.c,165 :: 		PrintOut(PrintHandler, "\rname %s, pass %s, ip %s, port %s;\n", name, pass, ip, port);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr_1_config_sensor), W1
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
;config_sensor.c,166 :: 		strcpy(CWJAP_String, "AT+CWJAP=\"");
	PUSH.D	W10
	MOV	#lo_addr(?lstr2_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcpy
	POP.D	W10
;config_sensor.c,167 :: 		strcat(CWJAP_String, name);
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,168 :: 		strcat(CWJAP_String, "\",\"");
	MOV	#lo_addr(?lstr3_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
	POP	W11
;config_sensor.c,169 :: 		strcat(CWJAP_String, pass);
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,170 :: 		strcat(CWJAP_String, "\"\r\n");
	MOV	#lo_addr(?lstr4_config_sensor), W11
	MOV	#lo_addr(_CWJAP_String), W10
	CALL	_strcat
;config_sensor.c,171 :: 		strcpy(CIPSTART_String, "AT+CIPSTART=\"TCP\",\"");
	MOV	#lo_addr(?lstr5_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcpy
;config_sensor.c,172 :: 		strcat(CIPSTART_String, ip);
	MOV	W12, W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,173 :: 		strcat(CIPSTART_String, "\",");
	MOV	#lo_addr(?lstr6_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,174 :: 		strcat(CIPSTART_String, port);
	MOV	W13, W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,175 :: 		strcat(CIPSTART_String, "\r\n");
	MOV	#lo_addr(?lstr7_config_sensor), W11
	MOV	#lo_addr(_CIPSTART_String), W10
	CALL	_strcat
;config_sensor.c,176 :: 		PrintOut(PrintHandler, "NET %s %s ", CWJAP_String, CIPSTART_String);
	MOV	#lo_addr(_CIPSTART_String), W0
	PUSH	W0
	MOV	#lo_addr(_CWJAP_String), W0
	PUSH	W0
	MOV	#lo_addr(?lstr_8_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#8, W15
;config_sensor.c,177 :: 		}
L_end_BildStringWifi:
	POP	W11
	POP	W10
	RETURN
; end of _BildStringWifi

_LoadALLSchem:

;config_sensor.c,179 :: 		void LoadALLSchem(ConfigSensor *cS)
;config_sensor.c,181 :: 		LoadUnitId(cs);
	PUSH	W10
	CALL	_LoadUnitId
	POP	W10
;config_sensor.c,182 :: 		LoadAlgoSelected(cs);
	PUSH	W10
	CALL	_LoadAlgoSelected
	POP	W10
;config_sensor.c,183 :: 		LoadPointerLeaser(cs);
	PUSH	W10
	CALL	_LoadPointerLeaser
	POP	W10
;config_sensor.c,184 :: 		LoadParamsIn(cs);
	PUSH	W10
	CALL	_LoadParamsIn
	POP	W10
;config_sensor.c,185 :: 		LoadWifi(cs);
	PUSH	W10
	CALL	_LoadWifi
	POP	W10
;config_sensor.c,186 :: 		LoadTransmitedToGatway(cs);
	PUSH	W10
	CALL	_LoadTransmitedToGatway
	POP	W10
;config_sensor.c,187 :: 		LoadSensorBist(cS);
	CALL	_LoadSensorBist
;config_sensor.c,189 :: 		}
L_end_LoadALLSchem:
	RETURN
; end of _LoadALLSchem

_initConfig:
	LNK	#66

;config_sensor.c,191 :: 		void initConfig()
;config_sensor.c,193 :: 		uint_8 firstProgramm = 0;
	PUSH	W10
;config_sensor.c,197 :: 		initConfigSensor(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_initConfigSensor
;config_sensor.c,200 :: 		firstProgramm = isFirstProgrammin();
	CALL	_isFirstProgrammin
;config_sensor.c,203 :: 		if (firstProgramm)
	CP0.B	W0
	BRA NZ	L__initConfig33
	GOTO	L_initConfig10
L__initConfig33:
;config_sensor.c,205 :: 		saveDefultConfig(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_saveDefultConfig
;config_sensor.c,206 :: 		setFirstProgmmanigToFalse();
	CALL	_setFirstProgmmanigToFalse
;config_sensor.c,207 :: 		}
L_initConfig10:
;config_sensor.c,208 :: 		LoadALLSchem(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_LoadALLSchem
;config_sensor.c,211 :: 		}
L_end_initConfig:
	POP	W10
	ULNK
	RETURN
; end of _initConfig

_LoadUnitId:

;config_sensor.c,213 :: 		void LoadUnitId(ConfigSensor *cS)
;config_sensor.c,215 :: 		readFromMemProperty(&cS->idS, &EndUnitID);
	PUSH	W11
	MOV	#lo_addr(_EndUnitID), W11
	CALL	_readFromMemProperty
;config_sensor.c,216 :: 		}
L_end_LoadUnitId:
	POP	W11
	RETURN
; end of _LoadUnitId

_getDefultParams:

;config_sensor.c,218 :: 		int_16 * getDefultParams()
;config_sensor.c,220 :: 		int_16 * defultParams = &paramsAlgo2Defult;
; defultParams start address is: 2 (W1)
	MOV	#lo_addr(_paramsAlgo2Defult), W1
;config_sensor.c,221 :: 		switch (AlgorithmTypeParametr)
	GOTO	L_getDefultParams11
; defultParams end address is: 2 (W1)
;config_sensor.c,223 :: 		case Algo_2:
L_getDefultParams13:
;config_sensor.c,224 :: 		return paramsAlgo2Defult;
	MOV	#lo_addr(_paramsAlgo2Defult), W0
	GOTO	L_end_getDefultParams
;config_sensor.c,225 :: 		case Algo_3_4:
L_getDefultParams14:
;config_sensor.c,226 :: 		return paramsAlgo3_4Defult;
	MOV	#lo_addr(_paramsAlgo3_4Defult), W0
	GOTO	L_end_getDefultParams
;config_sensor.c,227 :: 		case Algo_5:
L_getDefultParams15:
;config_sensor.c,228 :: 		return paramsAlgo5Defult;
	MOV	#lo_addr(_paramsAlgo5Defult), W0
	GOTO	L_end_getDefultParams
;config_sensor.c,229 :: 		default:
L_getDefultParams16:
;config_sensor.c,230 :: 		return defultParams;
; defultParams start address is: 2 (W1)
	MOV	W1, W0
; defultParams end address is: 2 (W1)
	GOTO	L_end_getDefultParams
;config_sensor.c,231 :: 		}
L_getDefultParams11:
; defultParams start address is: 2 (W1)
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__getDefultParams36
	GOTO	L_getDefultParams13
L__getDefultParams36:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__getDefultParams37
	GOTO	L_getDefultParams14
L__getDefultParams37:
	MOV	#lo_addr(_AlgorithmTypeParametr), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__getDefultParams38
	GOTO	L_getDefultParams15
L__getDefultParams38:
	GOTO	L_getDefultParams16
; defultParams end address is: 2 (W1)
;config_sensor.c,232 :: 		}
L_end_getDefultParams:
	RETURN
; end of _getDefultParams

_LoadAlgoSelected:

;config_sensor.c,234 :: 		void LoadAlgoSelected(ConfigSensor *cS)
;config_sensor.c,236 :: 		readFromMemProperty(&cS->algoSelected, &AlgorithmTypeParametr);
	PUSH	W10
	PUSH	W11
	ADD	W10, #24, W0
	MOV	#lo_addr(_AlgorithmTypeParametr), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,238 :: 		}
L_end_LoadAlgoSelected:
	POP	W11
	POP	W10
	RETURN
; end of _LoadAlgoSelected

_LoadPointerLeaser:

;config_sensor.c,240 :: 		void LoadPointerLeaser(ConfigSensor *cS)
;config_sensor.c,242 :: 		readFromMemProperty(&cS->pointerLeaser, &PointerLeaser_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #6, W0
	MOV	#lo_addr(_PointerLeaser_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,243 :: 		Enable_VZ_Pointer(PointerLeaser_Enable);
	MOV	#lo_addr(_PointerLeaser_Enable), W0
	MOV.B	[W0], W10
	CALL	_Enable_VZ_Pointer
;config_sensor.c,244 :: 		}
L_end_LoadPointerLeaser:
	POP	W11
	POP	W10
	RETURN
; end of _LoadPointerLeaser

_LoadParamsIn:

;config_sensor.c,246 :: 		void LoadParamsIn(ConfigSensor *cS)
;config_sensor.c,248 :: 		readFromMemProperty(&cS->paramsIn, &ParamsIn);
	PUSH	W10
	PUSH	W11
	ADD	W10, #30, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,249 :: 		}
L_end_LoadParamsIn:
	POP	W11
	POP	W10
	RETURN
; end of _LoadParamsIn

_LoadWifi:
	LNK	#88

;config_sensor.c,251 :: 		void LoadWifi(ConfigSensor *cS)
;config_sensor.c,258 :: 		readFromMemProperty(&cS->networkName, name_net);
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
;config_sensor.c,259 :: 		readFromMemProperty(&cS->networkPassword, password_net);
	ADD	W14, #30, W1
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,260 :: 		readFromMemProperty(&cS->networkPort, port_net);
	MOV	#60, W1
	ADD	W14, W1, W1
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
	POP	W10
;config_sensor.c,261 :: 		readFromMemProperty(&cS->networkServerIp, server_ip_net);
	MOV	#68, W1
	ADD	W14, W1, W1
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,262 :: 		BildStringWifi(name_net, password_net, server_ip_net, port_net);
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
;config_sensor.c,263 :: 		ConnectingToWifiNet();
	CALL	_ConnectingToWifiNet
;config_sensor.c,266 :: 		}
L_end_LoadWifi:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _LoadWifi

_LoadTransmitedToGatway:

;config_sensor.c,269 :: 		void LoadTransmitedToGatway(ConfigSensor *cS)
;config_sensor.c,271 :: 		readFromMemProperty(&cS->transmitedToGatway, &PlcDataTX_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #12, W0
	MOV	#lo_addr(_PlcDataTX_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,272 :: 		}
L_end_LoadTransmitedToGatway:
	POP	W11
	POP	W10
	RETURN
; end of _LoadTransmitedToGatway

_LoadTransmitedRawDataToGatway:

;config_sensor.c,274 :: 		void LoadTransmitedRawDataToGatway(ConfigSensor *cS)
;config_sensor.c,276 :: 		readFromMemProperty(&cS->transmitedToGatway, &RawDataTX_Enable);
	PUSH	W10
	PUSH	W11
	ADD	W10, #12, W0
	MOV	#lo_addr(_RawDataTX_Enable), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,277 :: 		}
L_end_LoadTransmitedRawDataToGatway:
	POP	W11
	POP	W10
	RETURN
; end of _LoadTransmitedRawDataToGatway

_LoadSensorBist:

;config_sensor.c,279 :: 		void LoadSensorBist(ConfigSensor *cS)
;config_sensor.c,281 :: 		readFromMemProperty(&cS->sensorBist, &SensorBist);
	PUSH	W10
	PUSH	W11
	ADD	W10, #18, W0
	MOV	#lo_addr(_SensorBist), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,282 :: 		Init_VZ_Sensor(SensorBist);
	MOV	#lo_addr(_SensorBist), W0
	MOV.B	[W0], W10
	CALL	_Init_VZ_Sensor
;config_sensor.c,283 :: 		PrintOut(PrintHandler, "\rSensorBist %d", SensorBist);
	MOV	#lo_addr(_SensorBist), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_9_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;config_sensor.c,284 :: 		}
L_end_LoadSensorBist:
	POP	W11
	POP	W10
	RETURN
; end of _LoadSensorBist

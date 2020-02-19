
_setAddressPropertyC:

;config_sensor.c,18 :: 		Mem_AddressType setAddressPropertyC(propertySensor* propertySens,Mem_AddressType address,uint_8 sizePerItem,uint_8 endPropertyAddress)
;config_sensor.c,21 :: 		propertySens->address = address;
	MOV	W11, [W10]
;config_sensor.c,22 :: 		propertySens->typeMem = sizePerItem;
	ADD	W10, #4, W0
	MOV.B	W12, [W0]
;config_sensor.c,23 :: 		endAddress = endPropertyAddress ? endPropertyAddress : sizePerItem;
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
;config_sensor.c,24 :: 		propertySens->endAddress = address + endAddress;
; ?FLOC___setAddressPropertyC?T7 start address is: 4 (W2)
	ADD	W10, #2, W1
	ZE	W2, W0
; ?FLOC___setAddressPropertyC?T7 end address is: 4 (W2)
	ADD	W11, W0, W0
	MOV	W0, [W1]
;config_sensor.c,25 :: 		return propertySens->endAddress;
	ADD	W10, #2, W0
	MOV	[W0], W0
;config_sensor.c,26 :: 		}
L_end_setAddressPropertyC:
	RETURN
; end of _setAddressPropertyC

_initConfigSensor:

;config_sensor.c,29 :: 		void initConfigSensor(ConfigSensor * confSensor)
;config_sensor.c,33 :: 		i = setAddressPropertyC(&confSensor->idS,START_MEM,C_UCHAR,0);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV.B	#1, W12
	MOV	#40, W11
	CALL	_setAddressPropertyC
;config_sensor.c,35 :: 		i = setAddressPropertyC(&confSensor->algoSelected,i,C_UCHAR,0);
	ADD	W10, #24, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,37 :: 		i = setAddressPropertyC(&confSensor->pointerLeaser,i,C_UCHAR,0);
	ADD	W10, #6, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,39 :: 		i = setAddressPropertyC(&confSensor->sensorBist,i,C_UCHAR,0);
	ADD	W10, #18, W1
	PUSH	W10
	CLR	W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,41 :: 		i = setAddressPropertyC(&confSensor->paramsIn,i,C_16INT,LENGTH_PARAMS_IN*2);
	ADD	W10, #30, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#2, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,43 :: 		i = setAddressPropertyC(&confSensor->networkName,i,C_UCHAR,LENGTH_NAME_NET);
	MOV	#36, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,45 :: 		i = setAddressPropertyC(&confSensor->networkPassword,i,C_UCHAR,LENGTH_PASSWORD_NET);
	MOV	#42, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#30, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,47 :: 		i = setAddressPropertyC(&confSensor->networkPort,i,C_UCHAR,LENGTH_PORT_NET);
	MOV	#48, W1
	ADD	W10, W1, W1
	PUSH	W10
	MOV.B	#8, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
	POP	W10
;config_sensor.c,49 :: 		i = setAddressPropertyC(&confSensor->networkServerIp,i,C_UCHAR,LENGTH_SERVER_IP);
	MOV	#54, W1
	ADD	W10, W1, W1
	MOV.B	#20, W13
	MOV.B	#1, W12
	MOV	W0, W11
	MOV	W1, W10
	CALL	_setAddressPropertyC
;config_sensor.c,51 :: 		}
L_end_initConfigSensor:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initConfigSensor

_saveInEEpromPropertyConfig:
	LNK	#2

;config_sensor.c,54 :: 		void saveInEEpromPropertyConfig(propertySensor* propertySens, void* value)
;config_sensor.c,57 :: 		char * tmp = (char *) value;
	MOV	W11, [W14+0]
;config_sensor.c,58 :: 		for(i=propertySens->address; i < propertySens->endAddress; i++)
	MOV	[W10], W0
; i start address is: 4 (W2)
	MOV	W0, W2
; i end address is: 4 (W2)
L_saveInEEpromPropertyConfig2:
; i start address is: 4 (W2)
	ADD	W10, #2, W0
	MOV	[W0], W0
	CP	W2, W0
	BRA LTU	L__saveInEEpromPropertyConfig18
	GOTO	L_saveInEEpromPropertyConfig3
L__saveInEEpromPropertyConfig18:
;config_sensor.c,60 :: 		MemWrt(i,*tmp);
	MOV	[W14+0], W0
	PUSH	W2
	PUSH.D	W10
	MOV.B	[W0], W11
	MOV	W2, W10
	CALL	_MemWrt
	POP.D	W10
	POP	W2
;config_sensor.c,61 :: 		++tmp;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,58 :: 		for(i=propertySens->address; i < propertySens->endAddress; i++)
; i start address is: 2 (W1)
	ADD	W2, #1, W1
; i end address is: 4 (W2)
;config_sensor.c,62 :: 		}
	MOV	W1, W2
; i end address is: 2 (W1)
	GOTO	L_saveInEEpromPropertyConfig2
L_saveInEEpromPropertyConfig3:
;config_sensor.c,64 :: 		}
L_end_saveInEEpromPropertyConfig:
	ULNK
	RETURN
; end of _saveInEEpromPropertyConfig

_saveDefultConfig:

;config_sensor.c,66 :: 		void saveDefultConfig(ConfigSensor * confSensor)
;config_sensor.c,68 :: 		saveInEEpromPropertyConfig(&confSensor->idS,0);
	PUSH	W10
	PUSH	W11
	PUSH	W10
	CLR	W11
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,69 :: 		saveInEEpromPropertyConfig(&confSensor->algoSelected,Algorithm_2);
	ADD	W10, #24, W0
	PUSH	W10
	CLR	W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,70 :: 		saveInEEpromPropertyConfig(&confSensor->pointerLeaser,1);
	ADD	W10, #6, W0
	PUSH	W10
	MOV	#1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,71 :: 		saveInEEpromPropertyConfig(&confSensor->sensorBist,1);
	ADD	W10, #18, W0
	PUSH	W10
	MOV	#1, W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,72 :: 		saveInEEpromPropertyConfig(&confSensor->paramsIn,paramsDefult);
	ADD	W10, #30, W0
	PUSH	W10
	MOV	#lo_addr(_paramsDefult), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,73 :: 		saveInEEpromPropertyConfig(&confSensor->networkName,"Ravtech-Public\0");
	MOV	#36, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(?lstr1_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,74 :: 		saveInEEpromPropertyConfig(&confSensor->networkPassword,"@ravTech!\0");
	MOV	#42, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(?lstr2_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,75 :: 		saveInEEpromPropertyConfig(&confSensor->networkPort,"9875\0");
	MOV	#48, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	#lo_addr(?lstr3_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
	POP	W10
;config_sensor.c,76 :: 		saveInEEpromPropertyConfig(&confSensor->networkServerIp,"192.168.1.25\0");
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV	#lo_addr(?lstr4_config_sensor), W11
	MOV	W0, W10
	CALL	_saveInEEpromPropertyConfig
;config_sensor.c,78 :: 		}
L_end_saveDefultConfig:
	POP	W11
	POP	W10
	RETURN
; end of _saveDefultConfig

_isFirstProgrammin:

;config_sensor.c,80 :: 		char isFirstProgrammin()
;config_sensor.c,82 :: 		return  GetProperty(0);
	PUSH	W10
	CLR	W10
	CALL	_GetProperty
;config_sensor.c,83 :: 		}
;config_sensor.c,82 :: 		return  GetProperty(0);
;config_sensor.c,83 :: 		}
L_end_isFirstProgrammin:
	POP	W10
	RETURN
; end of _isFirstProgrammin

_setFirstProgmmanigToFalse:

;config_sensor.c,85 :: 		char setFirstProgmmanigToFalse()
;config_sensor.c,87 :: 		MemWrt(0,0);
	PUSH	W10
	PUSH	W11
	CLR	W11
	CLR	W10
	CALL	_MemWrt
;config_sensor.c,88 :: 		}
L_end_setFirstProgmmanigToFalse:
	POP	W11
	POP	W10
	RETURN
; end of _setFirstProgmmanigToFalse

_readFromMemProperty:
	LNK	#6

;config_sensor.c,91 :: 		void readFromMemProperty(propertySensor* propertySens,void* dest)
;config_sensor.c,95 :: 		uint_8 * tmp = (uint_8 *) dest;
	MOV	W11, [W14+2]
;config_sensor.c,96 :: 		int_16 * tmpI = (int_16 *) dest;
	MOV	W11, [W14+4]
;config_sensor.c,98 :: 		for(i=propertySens->address; i< propertySens->endAddress;)
	MOV	[W10], W0
	MOV	W0, [W14+0]
L_readFromMemProperty5:
	ADD	W10, #2, W0
	MOV	[W0], W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GTU	L__readFromMemProperty23
	GOTO	L_readFromMemProperty6
L__readFromMemProperty23:
;config_sensor.c,100 :: 		if(propertySens->typeMem == C_16INT)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__readFromMemProperty24
	GOTO	L_readFromMemProperty8
L__readFromMemProperty24:
;config_sensor.c,102 :: 		*tmpI = GetSignedIntProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetSignedIntProperty
	POP.D	W10
	MOV	[W14+4], W1
	MOV	W0, [W1]
;config_sensor.c,103 :: 		i += 2;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #2, [W0]
;config_sensor.c,104 :: 		++tmpI;
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #2, [W0]
;config_sensor.c,105 :: 		}
L_readFromMemProperty8:
;config_sensor.c,106 :: 		if(propertySens->typeMem == C_UCHAR)
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__readFromMemProperty25
	GOTO	L_readFromMemProperty9
L__readFromMemProperty25:
;config_sensor.c,108 :: 		*tmp = GetProperty(i);
	PUSH.D	W10
	MOV	[W14+0], W10
	CALL	_GetProperty
	POP.D	W10
	MOV	[W14+2], W1
	MOV.B	W0, [W1]
;config_sensor.c,109 :: 		++tmp;
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
;config_sensor.c,110 :: 		++i;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;config_sensor.c,112 :: 		}
L_readFromMemProperty9:
;config_sensor.c,114 :: 		}
	GOTO	L_readFromMemProperty5
L_readFromMemProperty6:
;config_sensor.c,115 :: 		}
L_end_readFromMemProperty:
	ULNK
	RETURN
; end of _readFromMemProperty

_conectionToServer:

;config_sensor.c,117 :: 		void conectionToServer(char* name, char* pass, char* ip, char* port)
;config_sensor.c,119 :: 		PrintOut(PrintHandler,"\rname %s, pass %s, ip %s, port %s;\n",name,pass,ip,port);
	MOV	#lo_addr(?lstr_5_config_sensor), W1
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W13
	PUSH	W12
	PUSH	W11
	PUSH	W10
	PUSH	W1
	PUSH	W0
	CALL	_PrintOut
	SUB	#12, W15
;config_sensor.c,120 :: 		}
L_end_conectionToServer:
	RETURN
; end of _conectionToServer

_initConfig:
	LNK	#150

;config_sensor.c,122 :: 		void initConfig()
;config_sensor.c,124 :: 		uint_8 firstProgramm = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;config_sensor.c,131 :: 		initConfigSensor(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_initConfigSensor
;config_sensor.c,134 :: 		firstProgramm = isFirstProgrammin();
	CALL	_isFirstProgrammin
	MOV.B	W0, [W14+148]
;config_sensor.c,136 :: 		if(firstProgramm)
	CP0.B	W0
	BRA NZ	L__initConfig28
	GOTO	L_initConfig10
L__initConfig28:
;config_sensor.c,138 :: 		saveDefultConfig(&cS);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_saveDefultConfig
;config_sensor.c,139 :: 		setFirstProgmmanigToFalse();
	CALL	_setFirstProgmmanigToFalse
;config_sensor.c,140 :: 		}
L_initConfig10:
;config_sensor.c,141 :: 		readFromMemProperty(&cS.idS,&ID_SENSOR);
	ADD	W14, #0, W0
	MOV	#lo_addr(_ID_SENSOR), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,142 :: 		readFromMemProperty(&cS.algoSelected,&ALGO_SELECTED);
	ADD	W14, #24, W0
	MOV	#lo_addr(_ALGO_SELECTED), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,143 :: 		readFromMemProperty(&cS.pointerLeaser,&POINTER_LEASER);
	ADD	W14, #6, W0
	MOV	#lo_addr(_POINTER_LEASER), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,144 :: 		readFromMemProperty(&cS.paramsIn,&ParamsIn);
	ADD	W14, #30, W0
	MOV	#lo_addr(_ParamsIn), W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,145 :: 		readFromMemProperty(&cS.networkName,&name_net);
	MOV	#60, W1
	ADD	W14, W1, W1
	MOV	#36, W0
	ADD	W14, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,146 :: 		readFromMemProperty(&cS.networkPassword,&password_net);
	MOV	#90, W1
	ADD	W14, W1, W1
	MOV	#42, W0
	ADD	W14, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,147 :: 		readFromMemProperty(&cS.networkPort,&port_net);
	MOV	#120, W1
	ADD	W14, W1, W1
	MOV	#48, W0
	ADD	W14, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,148 :: 		readFromMemProperty(&cS.networkServerIp,&server_ip_net);
	MOV	#128, W1
	ADD	W14, W1, W1
	MOV	#54, W0
	ADD	W14, W0, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_readFromMemProperty
;config_sensor.c,149 :: 		for(;firstProgramm < 8;firstProgramm++){
L_initConfig11:
	MOV.B	[W14+148], W0
	CP.B	W0, #8
	BRA LTU	L__initConfig29
	GOTO	L_initConfig12
L__initConfig29:
;config_sensor.c,150 :: 		PrintOut(PrintHandler,"\rParamsIn %d;\n",ParamsIn[firstProgramm]);
	MOV	#148, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_ParamsIn), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_6_config_sensor), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;config_sensor.c,149 :: 		for(;firstProgramm < 8;firstProgramm++){
	MOV.B	[W14+148], W1
	MOV	#148, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
;config_sensor.c,151 :: 		}
	GOTO	L_initConfig11
L_initConfig12:
;config_sensor.c,152 :: 		conectionToServer(name_net,password_net,server_ip_net,port_net);
	MOV	#120, W3
	ADD	W14, W3, W3
	MOV	#128, W2
	ADD	W14, W2, W2
	MOV	#90, W1
	ADD	W14, W1, W1
	MOV	#60, W0
	ADD	W14, W0, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_conectionToServer
;config_sensor.c,154 :: 		}
L_end_initConfig:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _initConfig

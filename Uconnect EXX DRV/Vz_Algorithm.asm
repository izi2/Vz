
_Vz_Algorithm_5:
	LNK	#38

;Vz_Algorithm.c,19 :: 		void Vz_Algorithm_5(void)
;Vz_Algorithm.c,25 :: 		int SPC = ParamsIn[SPC5];
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
; SPC start address is: 14 (W7)
	MOV	_ParamsIn, W7
;Vz_Algorithm.c,26 :: 		int Yv_th = ParamsIn[Yv_th5]               ;
; Yv_th start address is: 12 (W6)
	MOV	_ParamsIn+2, W6
;Vz_Algorithm.c,27 :: 		int FilterLength = ParamsIn[FilterLength5];
; FilterLength start address is: 16 (W8)
	MOV	_ParamsIn+4, W8
;Vz_Algorithm.c,28 :: 		int FilterLengthShort = ParamsIn[FilterLengthShort5];
	MOV	_ParamsIn+6, W0
	MOV	W0, [W14+0]
;Vz_Algorithm.c,29 :: 		int SwitchN = ParamsIn[SwitchN5]                     ;
; SwitchN start address is: 10 (W5)
	MOV	_ParamsIn+8, W5
;Vz_Algorithm.c,30 :: 		int alpha = ParamsIn[alpha5]                          ;
; alpha start address is: 18 (W9)
	MOV	_ParamsIn+10, W9
;Vz_Algorithm.c,31 :: 		static int DToBelt = ParamsIn[DToBelt5]                ;
	MOV	_ParamsIn+12, W0
	MOV	W0, Vz_Algorithm_5_DToBelt_L0
;Vz_Algorithm.c,32 :: 		int Error2_th = ParamsIn[Error2_th5]                    ;
; Error2_th start address is: 6 (W3)
	MOV	_ParamsIn+14, W3
;Vz_Algorithm.c,33 :: 		int Error2_N = ParamsIn[Error2_N5]                       ;
; Error2_N start address is: 8 (W4)
	MOV	_ParamsIn+16, W4
;Vz_Algorithm.c,72 :: 		ResetAlgoParametrsOutBuffer();
	CALL	_ResetAlgoParametrsOutBuffer
;Vz_Algorithm.c,73 :: 		OpticDataGetFrame_DistanceOnly();
	PUSH	W4
	PUSH	W3
	PUSH	W9
	PUSH	W5
	PUSH	W8
	PUSH.D	W6
	CALL	_OpticDataGetFrame_DistanceOnly
	POP.D	W6
	POP	W8
	POP	W5
	POP	W9
	POP	W3
	POP	W4
;Vz_Algorithm.c,75 :: 		SPCC=SPC/60;
	MOV	#60, W2
	REPEAT	#17
	DIV.S	W7, W2
; SPC end address is: 14 (W7)
; SPCC start address is: 14 (W7)
	MOV	W0, W7
;Vz_Algorithm.c,76 :: 		FilterDelta=FilterLength-FilterLengthShort-1;
	ADD	W14, #0, W0
	SUB	W8, [W0], W0
; FilterDelta start address is: 20 (W10)
	SUB	W0, #1, W10
;Vz_Algorithm.c,77 :: 		if(SwitchN==0) SwitchN=(FilterDelta+1)/2;
	CP	W5, #0
	BRA Z	L__Vz_Algorithm_5139
	GOTO	L__Vz_Algorithm_5133
L__Vz_Algorithm_5139:
; SwitchN end address is: 10 (W5)
	ADD	W10, #1, W0
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W0, W2
; SwitchN start address is: 10 (W5)
	MOV	W0, W5
; SwitchN end address is: 10 (W5)
	GOTO	L_Vz_Algorithm_50
L__Vz_Algorithm_5133:
L_Vz_Algorithm_50:
;Vz_Algorithm.c,78 :: 		if(DIpoint==0) DIpoint=DToBelt;
; SwitchN start address is: 10 (W5)
	MOV	Vz_Algorithm_5_DIpoint_L0, W0
	CP	W0, #0
	BRA Z	L__Vz_Algorithm_5140
	GOTO	L_Vz_Algorithm_51
L__Vz_Algorithm_5140:
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	MOV	W0, Vz_Algorithm_5_DIpoint_L0
L_Vz_Algorithm_51:
;Vz_Algorithm.c,80 :: 		Y=0;
; Y start address is: 26 (W13)
	CLR	W13
;Vz_Algorithm.c,81 :: 		for(k=0;k<60;k++) Y+=Vz_Sensor_Distance_Buffer_int[k]/60;
	CLR	W0
	MOV	W0, [W14+2]
; Yv_th end address is: 12 (W6)
; FilterLength end address is: 16 (W8)
; Y end address is: 26 (W13)
; Error2_th end address is: 6 (W3)
; alpha end address is: 18 (W9)
; Error2_N end address is: 8 (W4)
; SPCC end address is: 14 (W7)
; FilterDelta end address is: 20 (W10)
; SwitchN end address is: 10 (W5)
	MOV	W13, W11
	MOV	W8, W13
	MOV	W6, W8
L_Vz_Algorithm_52:
; Y start address is: 22 (W11)
; SwitchN start address is: 10 (W5)
; FilterDelta start address is: 20 (W10)
; SPCC start address is: 14 (W7)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 6 (W3)
; alpha start address is: 18 (W9)
; FilterLength start address is: 26 (W13)
; Yv_th start address is: 16 (W8)
	MOV	#60, W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_5141
	GOTO	L_Vz_Algorithm_53
L__Vz_Algorithm_5141:
	MOV	[W14+2], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Distance_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	#60, W2
	REPEAT	#17
	DIV.S	W0, W2
; Y start address is: 4 (W2)
	ADD	W11, W0, W2
; Y end address is: 22 (W11)
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
; Y end address is: 4 (W2)
	MOV	W2, W11
	GOTO	L_Vz_Algorithm_52
L_Vz_Algorithm_53:
;Vz_Algorithm.c,82 :: 		FilterBuffer[PointerIndex]=Y;
; Y start address is: 22 (W11)
	MOV	Vz_Algorithm_5_PointerIndex_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_5_FilterBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	W11, [W0]
; Y end address is: 22 (W11)
;Vz_Algorithm.c,83 :: 		k=0;Yf=0;Yfs=0;
	CLR	W0
	MOV	W0, [W14+4]
; Yfs start address is: 24 (W12)
	CLR	W12
;Vz_Algorithm.c,84 :: 		for(j=0;j<FilterLength;j++)
; j start address is: 4 (W2)
	CLR	W2
; Error2_th end address is: 6 (W3)
; Yv_th end address is: 16 (W8)
; j end address is: 4 (W2)
; Yfs end address is: 24 (W12)
; FilterLength end address is: 26 (W13)
; alpha end address is: 18 (W9)
; Error2_N end address is: 8 (W4)
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	MOV	W8, W11
	MOV	W3, W8
	MOV	W2, W6
L_Vz_Algorithm_55:
; j start address is: 12 (W6)
; Yfs start address is: 24 (W12)
; Yv_th start address is: 22 (W11)
; FilterLength start address is: 26 (W13)
; alpha start address is: 18 (W9)
; Error2_th start address is: 16 (W8)
; Error2_N start address is: 8 (W4)
; SPCC start address is: 14 (W7)
; FilterDelta start address is: 20 (W10)
; FilterDelta end address is: 20 (W10)
; SwitchN start address is: 10 (W5)
	CP	W6, W13
	BRA LT	L__Vz_Algorithm_5142
	GOTO	L_Vz_Algorithm_56
L__Vz_Algorithm_5142:
; FilterDelta end address is: 20 (W10)
;Vz_Algorithm.c,86 :: 		if((PointerIndex+j)>(FilterLength-1)) k=PointerIndex+j-FilterLength;
; FilterDelta start address is: 20 (W10)
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	ADD	W6, [W0], W1
	SUB	W13, #1, W0
	CP	W1, W0
	BRA GT	L__Vz_Algorithm_5143
	GOTO	L_Vz_Algorithm_58
L__Vz_Algorithm_5143:
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	ADD	W6, [W0], W1
	ADD	W14, #2, W0
	SUB	W1, W13, [W0]
	GOTO	L_Vz_Algorithm_59
L_Vz_Algorithm_58:
;Vz_Algorithm.c,87 :: 		else k=PointerIndex+j;
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W1
	ADD	W14, #2, W0
	ADD	W6, [W1], [W0]
L_Vz_Algorithm_59:
;Vz_Algorithm.c,88 :: 		Yf+=FilterBuffer[k]/FilterLength;
	MOV	[W14+2], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_5_FilterBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	REPEAT	#17
	DIV.S	W0, W13
	MOV	W0, W2
	ADD	W14, #4, W1
	ADD	W14, #4, W0
	ADD	W2, [W1], [W0]
;Vz_Algorithm.c,89 :: 		if(j>FilterDelta) Yfs+=FilterBuffer[k]/FilterLengthShort;
	CP	W6, W10
	BRA GT	L__Vz_Algorithm_5144
	GOTO	L__Vz_Algorithm_5134
L__Vz_Algorithm_5144:
	MOV	[W14+2], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_5_FilterBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	[W14+0], W2
	REPEAT	#17
	DIV.S	W0, W2
; Yfs start address is: 0 (W0)
	ADD	W12, W0, W0
; Yfs end address is: 24 (W12)
; Yfs end address is: 0 (W0)
	GOTO	L_Vz_Algorithm_510
L__Vz_Algorithm_5134:
	MOV	W12, W0
L_Vz_Algorithm_510:
;Vz_Algorithm.c,84 :: 		for(j=0;j<FilterLength;j++)
; Yfs start address is: 0 (W0)
; j start address is: 2 (W1)
	ADD	W6, #1, W1
; j end address is: 12 (W6)
;Vz_Algorithm.c,90 :: 		}
; FilterDelta end address is: 20 (W10)
; Yfs end address is: 0 (W0)
; j end address is: 2 (W1)
	MOV	W0, W12
	MOV	W1, W6
	GOTO	L_Vz_Algorithm_55
L_Vz_Algorithm_56:
;Vz_Algorithm.c,91 :: 		PointerIndex++;
; Yfs start address is: 24 (W12)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,92 :: 		if(PointerIndex>=FilterLength)  PointerIndex=0;
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	CP	W13, [W0]
	BRA LE	L__Vz_Algorithm_5145
	GOTO	L_Vz_Algorithm_511
L__Vz_Algorithm_5145:
; FilterLength end address is: 26 (W13)
	CLR	W0
	MOV	W0, Vz_Algorithm_5_PointerIndex_L0
L_Vz_Algorithm_511:
;Vz_Algorithm.c,93 :: 		dC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,94 :: 		switch (ST)
	GOTO	L_Vz_Algorithm_512
; alpha end address is: 18 (W9)
;Vz_Algorithm.c,96 :: 		case    2:
L_Vz_Algorithm_514:
;Vz_Algorithm.c,97 :: 		if(Yfs<(DToBelt-Yv_th))
	MOV	#lo_addr(Vz_Algorithm_5_DToBelt_L0), W0
	SUBR	W11, [W0], W0
; Yv_th end address is: 22 (W11)
	CP	W12, W0
	BRA LT	L__Vz_Algorithm_5146
	GOTO	L_Vz_Algorithm_515
L__Vz_Algorithm_5146:
; Yfs end address is: 24 (W12)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
;Vz_Algorithm.c,99 :: 		C0++;C1=0;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C1_L0
;Vz_Algorithm.c,100 :: 		if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
	ADD	W5, W7, W1
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_5147
	GOTO	L_Vz_Algorithm_516
L__Vz_Algorithm_5147:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#1, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_516:
;Vz_Algorithm.c,101 :: 		}
	GOTO	L_Vz_Algorithm_517
L_Vz_Algorithm_515:
;Vz_Algorithm.c,102 :: 		else if(Yfs>(Error2_th*(DToBelt/10)))
; SwitchN start address is: 10 (W5)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; Yfs start address is: 24 (W12)
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MUL.SS	W8, W0, W0
; Error2_th end address is: 16 (W8)
	CP	W12, W0
	BRA GT	L__Vz_Algorithm_5148
	GOTO	L_Vz_Algorithm_518
L__Vz_Algorithm_5148:
; Yfs end address is: 24 (W12)
;Vz_Algorithm.c,104 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,105 :: 		if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	MUL.SS	W4, W5, W2
; Error2_N end address is: 8 (W4)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_5149
	GOTO	L_Vz_Algorithm_519
L__Vz_Algorithm_5149:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_519:
;Vz_Algorithm.c,106 :: 		}
	GOTO	L_Vz_Algorithm_520
L_Vz_Algorithm_518:
;Vz_Algorithm.c,109 :: 		C1++;C0=0;
; SwitchN start address is: 10 (W5)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C0_L0
;Vz_Algorithm.c,110 :: 		if(C1>SwitchN)
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_5150
	GOTO	L_Vz_Algorithm_521
L__Vz_Algorithm_5150:
; SwitchN end address is: 10 (W5)
;Vz_Algorithm.c,112 :: 		ST=1;C2=0;UIpoint=0;dC=0;
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_5_ST_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C2_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_UIpoint_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_dC_L0
;Vz_Algorithm.c,113 :: 		}
L_Vz_Algorithm_521:
;Vz_Algorithm.c,114 :: 		}
L_Vz_Algorithm_520:
L_Vz_Algorithm_517:
;Vz_Algorithm.c,115 :: 		break;
	GOTO	L_Vz_Algorithm_513
;Vz_Algorithm.c,116 :: 		case    0:
L_Vz_Algorithm_522:
;Vz_Algorithm.c,117 :: 		if(Yfs<(DToBelt-Yv_th))
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; alpha start address is: 18 (W9)
; Yv_th start address is: 22 (W11)
; Yfs start address is: 24 (W12)
	MOV	#lo_addr(Vz_Algorithm_5_DToBelt_L0), W0
	SUBR	W11, [W0], W0
; Yv_th end address is: 22 (W11)
	CP	W12, W0
	BRA LT	L__Vz_Algorithm_5151
	GOTO	L_Vz_Algorithm_523
L__Vz_Algorithm_5151:
; Yfs end address is: 24 (W12)
; alpha end address is: 18 (W9)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
;Vz_Algorithm.c,119 :: 		C0++;C1=0;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C1_L0
;Vz_Algorithm.c,120 :: 		if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
	ADD	W5, W7, W1
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_5152
	GOTO	L_Vz_Algorithm_524
L__Vz_Algorithm_5152:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#1, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_524:
;Vz_Algorithm.c,121 :: 		if((DToBelt-Yf)>(DToBelt-DIpoint))
	MOV	Vz_Algorithm_5_DToBelt_L0, W1
	ADD	W14, #4, W0
	SUB	W1, [W0], W2
	MOV	Vz_Algorithm_5_DToBelt_L0, W1
	MOV	#lo_addr(Vz_Algorithm_5_DIpoint_L0), W0
	SUB	W1, [W0], W0
	CP	W2, W0
	BRA GT	L__Vz_Algorithm_5153
	GOTO	L_Vz_Algorithm_525
L__Vz_Algorithm_5153:
;Vz_Algorithm.c,123 :: 		DIpoint=Yf;DXpoint=dC;
	MOV	[W14+4], W0
	MOV	W0, Vz_Algorithm_5_DIpoint_L0
	MOV	Vz_Algorithm_5_dC_L0, W0
	MOV	W0, Vz_Algorithm_5_DXpoint_L0
;Vz_Algorithm.c,124 :: 		}
L_Vz_Algorithm_525:
;Vz_Algorithm.c,125 :: 		}
	GOTO	L_Vz_Algorithm_526
L_Vz_Algorithm_523:
;Vz_Algorithm.c,126 :: 		else if(Yfs>(Error2_th*(DToBelt/10)))
; SwitchN start address is: 10 (W5)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; alpha start address is: 18 (W9)
; Yfs start address is: 24 (W12)
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MUL.SS	W8, W0, W0
; Error2_th end address is: 16 (W8)
	CP	W12, W0
	BRA GT	L__Vz_Algorithm_5154
	GOTO	L_Vz_Algorithm_527
L__Vz_Algorithm_5154:
; Yfs end address is: 24 (W12)
; alpha end address is: 18 (W9)
;Vz_Algorithm.c,128 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,129 :: 		if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	MUL.SS	W4, W5, W2
; Error2_N end address is: 8 (W4)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_5155
	GOTO	L_Vz_Algorithm_528
L__Vz_Algorithm_5155:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_528:
;Vz_Algorithm.c,130 :: 		}
	GOTO	L_Vz_Algorithm_529
L_Vz_Algorithm_527:
;Vz_Algorithm.c,133 :: 		C1++;C0=0;
; SwitchN start address is: 10 (W5)
; alpha start address is: 18 (W9)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C0_L0
;Vz_Algorithm.c,134 :: 		if(C1>SwitchN)
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_5156
	GOTO	L_Vz_Algorithm_530
L__Vz_Algorithm_5156:
; SwitchN end address is: 10 (W5)
;Vz_Algorithm.c,136 :: 		ST=1;
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_5_ST_L0
;Vz_Algorithm.c,137 :: 		C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C2_L0
;Vz_Algorithm.c,139 :: 		DeltaT=DXpoint+DXpointLast;
	MOV	Vz_Algorithm_5_DXpoint_L0, W2
	MOV	#lo_addr(Vz_Algorithm_5_DXpointLast_L0), W1
	MOV	#lo_addr(Vz_Algorithm_5_DeltaT_L0), W0
	ADD	W2, [W1], [W0]
;Vz_Algorithm.c,140 :: 		DXpointLast=dC-DXpoint;
	MOV	Vz_Algorithm_5_dC_L0, W2
	MOV	#lo_addr(Vz_Algorithm_5_DXpoint_L0), W1
	MOV	#lo_addr(Vz_Algorithm_5_DXpointLast_L0), W0
	SUB	W2, [W1], [W0]
;Vz_Algorithm.c,141 :: 		ChBHight=DToBelt-DIpoint;
	MOV	Vz_Algorithm_5_DToBelt_L0, W2
	MOV	#lo_addr(Vz_Algorithm_5_DIpoint_L0), W1
	MOV	#lo_addr(Vz_Algorithm_5_ChBHight_L0), W0
	SUB	W2, [W1], [W0]
;Vz_Algorithm.c,142 :: 		DToBelt=(int)((float)(((float)((10000.0-(float)alpha)*(float)DToBelt)+(float)((float)alpha*(float)UIpoint))/10000.0));
	MOV	W9, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
; alpha end address is: 18 (W9)
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	#16384, W0
	MOV	#17948, W1
	MOV	[W14+34], W2
	MOV	[W14+36], W3
	CALL	__Sub_FP
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	MOV.D	W0, W2
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	MOV	W2, [W14+34]
	MOV	W3, [W14+36]
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	Vz_Algorithm_5_UIpoint_L0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	MOV	[W14+34], W2
	MOV	[W14+36], W3
	CALL	__AddSub_FP
	MOV	#16384, W2
	MOV	#17948, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, Vz_Algorithm_5_DToBelt_L0
;Vz_Algorithm.c,147 :: 		Algo_Parametrs_Out_Buffer[0]=TRUE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;Vz_Algorithm.c,148 :: 		Algo_Parametrs_Out_Buffer[1]=(DeltaT&0xFF00)>>8;Algo_Parametrs_Out_Buffer[2]=(DeltaT&0x00FF);
	MOV	Vz_Algorithm_5_DeltaT_L0, W2
	MOV	#65280, W1
	AND	W2, W1, W1
	LSR	W1, #8, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+1), W1
	MOV.B	W2, [W1]
	MOV	Vz_Algorithm_5_DeltaT_L0, W3
	MOV.B	#255, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+2), W1
	AND.B	W3, W2, [W1]
;Vz_Algorithm.c,149 :: 		Algo_Parametrs_Out_Buffer[3]=(ChBHight&0xFF00)>>8;Algo_Parametrs_Out_Buffer[4]=(ChBHight&0x00FF);
	MOV	Vz_Algorithm_5_ChBHight_L0, W2
	MOV	#65280, W1
	AND	W2, W1, W1
	LSR	W1, #8, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+3), W1
	MOV.B	W2, [W1]
	MOV	Vz_Algorithm_5_ChBHight_L0, W3
	MOV.B	#255, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+4), W1
	AND.B	W3, W2, [W1]
;Vz_Algorithm.c,150 :: 		Algo_Parametrs_Out_Buffer[9]=(DToBelt&0xFF00)>>8;Algo_Parametrs_Out_Buffer[10]=(DToBelt&0x00FF);
	MOV	#65280, W1
	AND	W0, W1, W1
	LSR	W1, #8, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+9), W1
	MOV.B	W2, [W1]
	MOV.B	#255, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+10), W1
	AND.B	W0, W2, [W1]
;Vz_Algorithm.c,151 :: 		dC=0;UIpoint=0;DIpoint=DToBelt;
	CLR	W1
	MOV	W1, Vz_Algorithm_5_dC_L0
	CLR	W1
	MOV	W1, Vz_Algorithm_5_UIpoint_L0
	MOV	W0, Vz_Algorithm_5_DIpoint_L0
;Vz_Algorithm.c,153 :: 		}
L_Vz_Algorithm_530:
;Vz_Algorithm.c,154 :: 		}
L_Vz_Algorithm_529:
L_Vz_Algorithm_526:
;Vz_Algorithm.c,155 :: 		break;
	GOTO	L_Vz_Algorithm_513
;Vz_Algorithm.c,156 :: 		case    1:
L_Vz_Algorithm_531:
;Vz_Algorithm.c,157 :: 		if(Yfs<(DToBelt-Yv_th))
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; Yv_th start address is: 22 (W11)
; Yfs start address is: 24 (W12)
	MOV	#lo_addr(Vz_Algorithm_5_DToBelt_L0), W0
	SUBR	W11, [W0], W0
; Yv_th end address is: 22 (W11)
	CP	W12, W0
	BRA LT	L__Vz_Algorithm_5157
	GOTO	L_Vz_Algorithm_532
L__Vz_Algorithm_5157:
; Yfs end address is: 24 (W12)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
; SPCC end address is: 14 (W7)
;Vz_Algorithm.c,159 :: 		C0++;C1=0;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C1_L0
;Vz_Algorithm.c,160 :: 		if(C0>SwitchN)
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_5158
	GOTO	L_Vz_Algorithm_533
L__Vz_Algorithm_5158:
; SwitchN end address is: 10 (W5)
;Vz_Algorithm.c,162 :: 		ST=0;C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_5_ST_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C2_L0
;Vz_Algorithm.c,163 :: 		}
L_Vz_Algorithm_533:
;Vz_Algorithm.c,165 :: 		}
	GOTO	L_Vz_Algorithm_534
L_Vz_Algorithm_532:
;Vz_Algorithm.c,166 :: 		else if(Yfs>(Error2_th*(DToBelt/10)))
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; Yfs start address is: 24 (W12)
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MUL.SS	W8, W0, W0
; Error2_th end address is: 16 (W8)
	CP	W12, W0
	BRA GT	L__Vz_Algorithm_5159
	GOTO	L_Vz_Algorithm_535
L__Vz_Algorithm_5159:
; Yfs end address is: 24 (W12)
; SPCC end address is: 14 (W7)
;Vz_Algorithm.c,168 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,169 :: 		if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	MUL.SS	W4, W5, W2
; Error2_N end address is: 8 (W4)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_5160
	GOTO	L_Vz_Algorithm_536
L__Vz_Algorithm_5160:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_536:
;Vz_Algorithm.c,170 :: 		}
	GOTO	L_Vz_Algorithm_537
L_Vz_Algorithm_535:
;Vz_Algorithm.c,173 :: 		C1++;C0=0;
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C0_L0
;Vz_Algorithm.c,174 :: 		if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	ADD	W5, W7, W0
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	CP	W0, #0
	BRA LT	L__Vz_Algorithm_5161
	GOTO	L_Vz_Algorithm_538
L__Vz_Algorithm_5161:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_538:
;Vz_Algorithm.c,175 :: 		if(Yf>UIpoint) {UIpoint=Yf;UXpoint=dC;}
	MOV	[W14+4], W1
	MOV	#lo_addr(Vz_Algorithm_5_UIpoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_5162
	GOTO	L_Vz_Algorithm_539
L__Vz_Algorithm_5162:
	MOV	[W14+4], W0
	MOV	W0, Vz_Algorithm_5_UIpoint_L0
L_Vz_Algorithm_539:
;Vz_Algorithm.c,176 :: 		}
L_Vz_Algorithm_537:
L_Vz_Algorithm_534:
;Vz_Algorithm.c,177 :: 		break;
	GOTO	L_Vz_Algorithm_513
;Vz_Algorithm.c,178 :: 		}//switch (ST)
L_Vz_Algorithm_512:
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; alpha start address is: 18 (W9)
; Yv_th start address is: 22 (W11)
; Yfs start address is: 24 (W12)
	MOV	Vz_Algorithm_5_ST_L0, W0
	CP	W0, #2
	BRA NZ	L__Vz_Algorithm_5163
	GOTO	L_Vz_Algorithm_514
L__Vz_Algorithm_5163:
	MOV	Vz_Algorithm_5_ST_L0, W0
	CP	W0, #0
	BRA NZ	L__Vz_Algorithm_5164
	GOTO	L_Vz_Algorithm_522
L__Vz_Algorithm_5164:
; alpha end address is: 18 (W9)
	MOV	Vz_Algorithm_5_ST_L0, W0
	CP	W0, #1
	BRA NZ	L__Vz_Algorithm_5165
	GOTO	L_Vz_Algorithm_531
L__Vz_Algorithm_5165:
; Yfs end address is: 24 (W12)
; Yv_th end address is: 22 (W11)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
L_Vz_Algorithm_513:
;Vz_Algorithm.c,179 :: 		}
L_end_Vz_Algorithm_5:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Vz_Algorithm_5

_uError_Algo5:
	LNK	#0

;Vz_Algorithm.c,181 :: 		void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode)
; ErorCode start address is: 4 (W2)
	MOV.B	[W14-8], W2
;Vz_Algorithm.c,190 :: 		Algo_Parametrs_Out_Buffer[0]=TRUE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,191 :: 		Algo_Parametrs_Out_Buffer[5]=0;Algo_Parametrs_Out_Buffer[6]=ST;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+5), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+6), W0
	MOV.B	W10, [W0]
;Vz_Algorithm.c,192 :: 		Algo_Parametrs_Out_Buffer[7]=0;Algo_Parametrs_Out_Buffer[8]=ErorCode;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+7), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+8), W0
	MOV.B	W2, [W0]
; ErorCode end address is: 4 (W2)
;Vz_Algorithm.c,193 :: 		*ST=2;*dC=0;*C0=0;*C1=0;
	MOV.B	#2, W0
	MOV.B	W0, [W10]
	CLR	W0
	MOV	W0, [W11]
	CLR	W0
	MOV	W0, [W12]
	CLR	W0
	MOV	W0, [W13]
;Vz_Algorithm.c,194 :: 		}
L_end_uError_Algo5:
	ULNK
	RETURN
; end of _uError_Algo5

_Vz_Algorithm_3_4:
	LNK	#36

;Vz_Algorithm.c,196 :: 		void Vz_Algorithm_3_4(void) // Pressure detector  Vertical
;Vz_Algorithm.c,204 :: 		int SPC = ParamsIn[SPC3_4];
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	_ParamsIn, W0
	MOV	W0, [W14+0]
;Vz_Algorithm.c,205 :: 		int Yv_thUp = ParamsIn[Yv_thUp3_4];
	MOV	_ParamsIn+2, W0
	MOV	W0, [W14+2]
;Vz_Algorithm.c,206 :: 		int Yv_thDn = ParamsIn[Yv_thDn3_4] ;
	MOV	_ParamsIn+4, W0
	MOV	W0, [W14+4]
;Vz_Algorithm.c,207 :: 		int SwitchN = ParamsIn[SwitchN3_4]  ;
	MOV	_ParamsIn+6, W0
	MOV	W0, [W14+6]
;Vz_Algorithm.c,208 :: 		int MaxNBeforeSmPeak = ParamsIn[MaxNBeforeSmPeak3_4] ;
	MOV	_ParamsIn+8, W0
	MOV	W0, [W14+8]
;Vz_Algorithm.c,209 :: 		int alpha = ParamsIn[alpha3_4]                        ;
	MOV	_ParamsIn+10, W0
	MOV	W0, [W14+10]
;Vz_Algorithm.c,210 :: 		int FilterLength = ParamsIn[FilterLength3_4]           ;
	MOV	_ParamsIn+12, W0
	MOV	W0, [W14+12]
;Vz_Algorithm.c,211 :: 		static int AveResultT = ParamsIn[AveResultTIn3_4]       ;
	MOV	_ParamsIn+14, W0
	MOV	W0, Vz_Algorithm_3_4_AveResultT_L0
;Vz_Algorithm.c,232 :: 		char NoSmallPeak=0;         //Parametr OUT
;Vz_Algorithm.c,255 :: 		ResetAlgoParametrsOutBuffer();
	CALL	_ResetAlgoParametrsOutBuffer
;Vz_Algorithm.c,256 :: 		OpticDataGetFrame_VelocityOnly();
	CALL	_OpticDataGetFrame_VelocityOnly
;Vz_Algorithm.c,260 :: 		for(k=0;k<60;k++)
	CLR	W0
	MOV.B	W0, [W14+16]
L_Vz_Algorithm_3_440:
	MOV.B	[W14+16], W1
	MOV.B	#60, W0
	CP.B	W1, W0
	BRA LTU	L__Vz_Algorithm_3_4168
	GOTO	L_Vz_Algorithm_3_441
L__Vz_Algorithm_3_4168:
;Vz_Algorithm.c,262 :: 		Y=(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140);
	ADD	W14, #16, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+32]
	MOV	[W0], W0
	MOV	#140, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	[W14+32], W0
	MOV	W1, [W14+28]
	MOV	[W0], W0
	MOV	#140, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV	[W14+28], W0
	MUL.SS	W0, W2, W2
	MOV	[W14+32], W0
	MOV	W2, [W14+28]
	MOV	[W0], W0
	MOV	#140, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV	[W14+28], W0
	MUL.SS	W0, W2, W2
; Y start address is: 2 (W1)
	MOV	W2, W1
;Vz_Algorithm.c,263 :: 		if(Y<Yv_thDn)
	ADD	W14, #4, W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_3_4169
	GOTO	L_Vz_Algorithm_3_443
L__Vz_Algorithm_3_4169:
; Y end address is: 2 (W1)
;Vz_Algorithm.c,265 :: 		a=0;
	CLR	W0
	MOV.B	W0, [W14+17]
;Vz_Algorithm.c,266 :: 		C0++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,267 :: 		}
	GOTO	L_Vz_Algorithm_3_444
L_Vz_Algorithm_3_443:
;Vz_Algorithm.c,268 :: 		else if(Y>Yv_thUp)
; Y start address is: 2 (W1)
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4170
	GOTO	L_Vz_Algorithm_3_445
L__Vz_Algorithm_3_4170:
; Y end address is: 2 (W1)
;Vz_Algorithm.c,270 :: 		a=2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+17]
;Vz_Algorithm.c,271 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,272 :: 		}
	GOTO	L_Vz_Algorithm_3_446
L_Vz_Algorithm_3_445:
;Vz_Algorithm.c,275 :: 		a=1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+17]
;Vz_Algorithm.c,276 :: 		C1++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,277 :: 		}
L_Vz_Algorithm_3_446:
L_Vz_Algorithm_3_444:
;Vz_Algorithm.c,278 :: 		dC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,279 :: 		switch (ST)
	GOTO	L_Vz_Algorithm_3_447
;Vz_Algorithm.c,281 :: 		case    0:
L_Vz_Algorithm_3_449:
;Vz_Algorithm.c,282 :: 		if(a==0)
	MOV.B	[W14+17], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4171
	GOTO	L_Vz_Algorithm_3_450
L__Vz_Algorithm_3_4171:
;Vz_Algorithm.c,284 :: 		C2=2;
	MOV	#2, W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,285 :: 		if(C0>(SwitchN+10)) {ST=2;tC=0;dC=1;C0=0;C1=0;}
	MOV	[W14+6], W0
	ADD	W0, #10, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4172
	GOTO	L_Vz_Algorithm_3_451
L__Vz_Algorithm_3_4172:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_3_4_dC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
L_Vz_Algorithm_3_451:
;Vz_Algorithm.c,286 :: 		}//if(a==0)
	GOTO	L_Vz_Algorithm_3_452
L_Vz_Algorithm_3_450:
;Vz_Algorithm.c,287 :: 		else if(a==2)
	MOV.B	[W14+17], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4173
	GOTO	L_Vz_Algorithm_3_453
L__Vz_Algorithm_3_4173:
;Vz_Algorithm.c,289 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,290 :: 		if(C2>(SwitchN+SPC)) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	[W14+6], W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4174
	GOTO	L_Vz_Algorithm_3_454
L__Vz_Algorithm_3_4174:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_454:
;Vz_Algorithm.c,291 :: 		}//else if(a==2)
L_Vz_Algorithm_3_453:
L_Vz_Algorithm_3_452:
;Vz_Algorithm.c,293 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,295 :: 		case    1:
L_Vz_Algorithm_3_455:
;Vz_Algorithm.c,296 :: 		if(a==0)
	MOV.B	[W14+17], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4175
	GOTO	L_Vz_Algorithm_3_456
L__Vz_Algorithm_3_4175:
;Vz_Algorithm.c,298 :: 		C2=2;
	MOV	#2, W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,299 :: 		if(C0>SwitchN) {ST=2;tC=0;dC=1;C0=0;C1=0;}
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4176
	GOTO	L_Vz_Algorithm_3_457
L__Vz_Algorithm_3_4176:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_3_4_dC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
L_Vz_Algorithm_3_457:
;Vz_Algorithm.c,300 :: 		} //if(a==0)
	GOTO	L_Vz_Algorithm_3_458
L_Vz_Algorithm_3_456:
;Vz_Algorithm.c,301 :: 		else if(a==2)
	MOV.B	[W14+17], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4177
	GOTO	L_Vz_Algorithm_3_459
L__Vz_Algorithm_3_4177:
;Vz_Algorithm.c,303 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,304 :: 		if(C2>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4178
	GOTO	L_Vz_Algorithm_3_460
L__Vz_Algorithm_3_4178:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_460:
;Vz_Algorithm.c,305 :: 		}//else if(a==0)
L_Vz_Algorithm_3_459:
L_Vz_Algorithm_3_458:
;Vz_Algorithm.c,306 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,307 :: 		case    2:
L_Vz_Algorithm_3_461:
;Vz_Algorithm.c,309 :: 		if(tC<PeakBuffer_MaxLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA LT	L__Vz_Algorithm_3_4179
	GOTO	L_Vz_Algorithm_3_462
L__Vz_Algorithm_3_4179:
;Vz_Algorithm.c,311 :: 		PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
	MOV	Vz_Algorithm_3_4_tC_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W2
	ADD	W14, #16, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W2]
;Vz_Algorithm.c,312 :: 		if(tC>FilterLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	ADD	W14, #12, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4180
	GOTO	L_Vz_Algorithm_3_463
L__Vz_Algorithm_3_4180:
;Vz_Algorithm.c,314 :: 		PeakBufferTag=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_PeakBufferTag_L0
;Vz_Algorithm.c,315 :: 		for(i=0;i<FilterLength;i++)
	CLR	W0
	MOV.B	W0, [W14+18]
L_Vz_Algorithm_3_464:
	ADD	W14, #18, W0
	ZE	[W0], W1
	ADD	W14, #12, W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4181
	GOTO	L_Vz_Algorithm_3_465
L__Vz_Algorithm_3_4181:
;Vz_Algorithm.c,317 :: 		PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
	ADD	W14, #18, W0
	ZE	[W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUBR	W1, [W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, W10
	CALL	_abs
	MOV	[W14+12], W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBufferTag_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,315 :: 		for(i=0;i<FilterLength;i++)
	MOV.B	[W14+18], W1
	ADD	W14, #18, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,318 :: 		}
	GOTO	L_Vz_Algorithm_3_464
L_Vz_Algorithm_3_465:
;Vz_Algorithm.c,319 :: 		if(PeakBufferTag>DIpoint)
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4182
	GOTO	L_Vz_Algorithm_3_467
L__Vz_Algorithm_3_4182:
;Vz_Algorithm.c,321 :: 		DIpoint=PeakBufferTag;
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W0
	MOV	W0, Vz_Algorithm_3_4_DIpoint_L0
;Vz_Algorithm.c,322 :: 		DXpoint=tC-(FilterLength/2);
	MOV	[W14+12], W3
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W3, W2
	MOV	W0, W2
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W1
	MOV	#lo_addr(Vz_Algorithm_3_4_DXpoint_L0), W0
	SUBR	W2, [W1], [W0]
;Vz_Algorithm.c,323 :: 		}
L_Vz_Algorithm_3_467:
;Vz_Algorithm.c,324 :: 		}
L_Vz_Algorithm_3_463:
;Vz_Algorithm.c,325 :: 		}
	GOTO	L_Vz_Algorithm_3_468
L_Vz_Algorithm_3_462:
;Vz_Algorithm.c,326 :: 		else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_468:
;Vz_Algorithm.c,328 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,329 :: 		if(a==1)
	MOV.B	[W14+17], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4183
	GOTO	L_Vz_Algorithm_3_469
L__Vz_Algorithm_3_4183:
;Vz_Algorithm.c,331 :: 		C2=2;
	MOV	#2, W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,332 :: 		if(C1>SwitchN)
	MOV	Vz_Algorithm_3_4_C1_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4184
	GOTO	L_Vz_Algorithm_3_470
L__Vz_Algorithm_3_4184:
;Vz_Algorithm.c,334 :: 		ST=3;tC=0;C0=0;C1=0;
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,335 :: 		}
L_Vz_Algorithm_3_470:
;Vz_Algorithm.c,336 :: 		}//if(a==1)
	GOTO	L_Vz_Algorithm_3_471
L_Vz_Algorithm_3_469:
;Vz_Algorithm.c,337 :: 		else if(a==2)
	MOV.B	[W14+17], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4185
	GOTO	L_Vz_Algorithm_3_472
L__Vz_Algorithm_3_4185:
;Vz_Algorithm.c,339 :: 		C1=1;
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,340 :: 		if(C2>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4186
	GOTO	L_Vz_Algorithm_3_473
L__Vz_Algorithm_3_4186:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_473:
;Vz_Algorithm.c,341 :: 		}//else if(a==2)
L_Vz_Algorithm_3_472:
L_Vz_Algorithm_3_471:
;Vz_Algorithm.c,342 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,343 :: 		case    3:
L_Vz_Algorithm_3_474:
;Vz_Algorithm.c,344 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,345 :: 		if((a==1)&&(tC>MaxNBeforeSmPeak))
	MOV.B	[W14+17], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4187
	GOTO	L__Vz_Algorithm_3_4137
L__Vz_Algorithm_3_4187:
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	ADD	W14, #8, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4188
	GOTO	L__Vz_Algorithm_3_4136
L__Vz_Algorithm_3_4188:
L__Vz_Algorithm_3_4135:
;Vz_Algorithm.c,352 :: 		Algo_Parametrs_Out_Buffer[0]=TRUE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,353 :: 		Algo_Parametrs_Out_Buffer[5]=0;Algo_Parametrs_Out_Buffer[6]=NoSmallPeak;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+5), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+6), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,354 :: 		ST=5;tC=0;C1=0;C2=0;
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,345 :: 		if((a==1)&&(tC>MaxNBeforeSmPeak))
L__Vz_Algorithm_3_4137:
L__Vz_Algorithm_3_4136:
;Vz_Algorithm.c,356 :: 		if(a==2)
	MOV.B	[W14+17], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4189
	GOTO	L_Vz_Algorithm_3_478
L__Vz_Algorithm_3_4189:
;Vz_Algorithm.c,358 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,359 :: 		if(C2>SwitchN) {ST=4;tC=0;C0=0;C2=0;NoSmallPeak=0;}
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4190
	GOTO	L_Vz_Algorithm_3_479
L__Vz_Algorithm_3_4190:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
L_Vz_Algorithm_3_479:
;Vz_Algorithm.c,360 :: 		}
	GOTO	L_Vz_Algorithm_3_480
L_Vz_Algorithm_3_478:
;Vz_Algorithm.c,361 :: 		else if(a==0)
	MOV.B	[W14+17], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4191
	GOTO	L_Vz_Algorithm_3_481
L__Vz_Algorithm_3_4191:
;Vz_Algorithm.c,363 :: 		C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,364 :: 		if(C0>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4192
	GOTO	L_Vz_Algorithm_3_482
L__Vz_Algorithm_3_4192:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_482:
;Vz_Algorithm.c,365 :: 		}
L_Vz_Algorithm_3_481:
L_Vz_Algorithm_3_480:
;Vz_Algorithm.c,366 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,367 :: 		case    4:
L_Vz_Algorithm_3_483:
;Vz_Algorithm.c,369 :: 		if(tC<PeakBuffer_MaxLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA LT	L__Vz_Algorithm_3_4193
	GOTO	L_Vz_Algorithm_3_484
L__Vz_Algorithm_3_4193:
;Vz_Algorithm.c,371 :: 		PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
	MOV	Vz_Algorithm_3_4_tC_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W2
	ADD	W14, #16, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W2]
;Vz_Algorithm.c,372 :: 		if(tC>FilterLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	ADD	W14, #12, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4194
	GOTO	L_Vz_Algorithm_3_485
L__Vz_Algorithm_3_4194:
;Vz_Algorithm.c,374 :: 		PeakBufferTag=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_PeakBufferTag_L0
;Vz_Algorithm.c,375 :: 		for(i=0;i<FilterLength;i++)
	CLR	W0
	MOV.B	W0, [W14+18]
L_Vz_Algorithm_3_486:
	ADD	W14, #18, W0
	ZE	[W0], W1
	ADD	W14, #12, W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4195
	GOTO	L_Vz_Algorithm_3_487
L__Vz_Algorithm_3_4195:
;Vz_Algorithm.c,377 :: 		PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
	ADD	W14, #18, W0
	ZE	[W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUBR	W1, [W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, W10
	CALL	_abs
	MOV	[W14+12], W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBufferTag_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,375 :: 		for(i=0;i<FilterLength;i++)
	MOV.B	[W14+18], W1
	ADD	W14, #18, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,378 :: 		}
	GOTO	L_Vz_Algorithm_3_486
L_Vz_Algorithm_3_487:
;Vz_Algorithm.c,379 :: 		if(PeakBufferTag>U1Ipoint)
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4196
	GOTO	L_Vz_Algorithm_3_489
L__Vz_Algorithm_3_4196:
;Vz_Algorithm.c,381 :: 		U1Ipoint=PeakBufferTag;
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W0
	MOV	W0, Vz_Algorithm_3_4_U1Ipoint_L0
;Vz_Algorithm.c,383 :: 		}
L_Vz_Algorithm_3_489:
;Vz_Algorithm.c,384 :: 		}
L_Vz_Algorithm_3_485:
;Vz_Algorithm.c,385 :: 		}
	GOTO	L_Vz_Algorithm_3_490
L_Vz_Algorithm_3_484:
;Vz_Algorithm.c,386 :: 		else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_490:
;Vz_Algorithm.c,388 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,389 :: 		if(a==1)
	MOV.B	[W14+17], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4197
	GOTO	L_Vz_Algorithm_3_491
L__Vz_Algorithm_3_4197:
;Vz_Algorithm.c,391 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,392 :: 		if(C1>SwitchN) {ST=5;tC=0;C1=0;C2=0;}
	MOV	Vz_Algorithm_3_4_C1_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4198
	GOTO	L_Vz_Algorithm_3_492
L__Vz_Algorithm_3_4198:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
L_Vz_Algorithm_3_492:
;Vz_Algorithm.c,393 :: 		}
	GOTO	L_Vz_Algorithm_3_493
L_Vz_Algorithm_3_491:
;Vz_Algorithm.c,394 :: 		else if(a==0)
	MOV.B	[W14+17], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4199
	GOTO	L_Vz_Algorithm_3_494
L__Vz_Algorithm_3_4199:
;Vz_Algorithm.c,396 :: 		C1=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,397 :: 		if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4200
	GOTO	L_Vz_Algorithm_3_495
L__Vz_Algorithm_3_4200:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_495:
;Vz_Algorithm.c,398 :: 		}
L_Vz_Algorithm_3_494:
L_Vz_Algorithm_3_493:
;Vz_Algorithm.c,399 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,400 :: 		case    5:
L_Vz_Algorithm_3_496:
;Vz_Algorithm.c,401 :: 		if(a==2)
	MOV.B	[W14+17], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4201
	GOTO	L_Vz_Algorithm_3_497
L__Vz_Algorithm_3_4201:
;Vz_Algorithm.c,403 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,404 :: 		if(C2>SwitchN) {ST=6;tC=0;C1=0;C2=0;}
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4202
	GOTO	L_Vz_Algorithm_3_498
L__Vz_Algorithm_3_4202:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
L_Vz_Algorithm_3_498:
;Vz_Algorithm.c,405 :: 		}
	GOTO	L_Vz_Algorithm_3_499
L_Vz_Algorithm_3_497:
;Vz_Algorithm.c,406 :: 		else if(a==0)
	MOV.B	[W14+17], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4203
	GOTO	L_Vz_Algorithm_3_4100
L__Vz_Algorithm_3_4203:
;Vz_Algorithm.c,408 :: 		C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,409 :: 		if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4204
	GOTO	L_Vz_Algorithm_3_4101
L__Vz_Algorithm_3_4204:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_4101:
;Vz_Algorithm.c,410 :: 		}
L_Vz_Algorithm_3_4100:
L_Vz_Algorithm_3_499:
;Vz_Algorithm.c,411 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,412 :: 		case    6:
L_Vz_Algorithm_3_4102:
;Vz_Algorithm.c,414 :: 		if(tC<PeakBuffer_MaxLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA LT	L__Vz_Algorithm_3_4205
	GOTO	L_Vz_Algorithm_3_4103
L__Vz_Algorithm_3_4205:
;Vz_Algorithm.c,416 :: 		PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
	MOV	Vz_Algorithm_3_4_tC_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W2
	ADD	W14, #16, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W2]
;Vz_Algorithm.c,417 :: 		if(tC>FilterLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	ADD	W14, #12, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4206
	GOTO	L_Vz_Algorithm_3_4104
L__Vz_Algorithm_3_4206:
;Vz_Algorithm.c,419 :: 		PeakBufferTag=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_PeakBufferTag_L0
;Vz_Algorithm.c,420 :: 		for(i=0;i<FilterLength;i++)
	CLR	W0
	MOV.B	W0, [W14+18]
L_Vz_Algorithm_3_4105:
	ADD	W14, #18, W0
	ZE	[W0], W1
	ADD	W14, #12, W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4207
	GOTO	L_Vz_Algorithm_3_4106
L__Vz_Algorithm_3_4207:
;Vz_Algorithm.c,422 :: 		PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
	ADD	W14, #18, W0
	ZE	[W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUBR	W1, [W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, W10
	CALL	_abs
	MOV	[W14+12], W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBufferTag_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,420 :: 		for(i=0;i<FilterLength;i++)
	MOV.B	[W14+18], W1
	ADD	W14, #18, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,423 :: 		}
	GOTO	L_Vz_Algorithm_3_4105
L_Vz_Algorithm_3_4106:
;Vz_Algorithm.c,424 :: 		if(PeakBufferTag>U2Ipoint)
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4208
	GOTO	L_Vz_Algorithm_3_4108
L__Vz_Algorithm_3_4208:
;Vz_Algorithm.c,426 :: 		U2Ipoint=PeakBufferTag;
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W0
	MOV	W0, Vz_Algorithm_3_4_U2Ipoint_L0
;Vz_Algorithm.c,427 :: 		U2Xpoint=tC-(FilterLength/2);
	MOV	[W14+12], W3
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W3, W2
	MOV	W0, W2
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Xpoint_L0), W0
	SUBR	W2, [W1], [W0]
;Vz_Algorithm.c,428 :: 		}
L_Vz_Algorithm_3_4108:
;Vz_Algorithm.c,429 :: 		}
L_Vz_Algorithm_3_4104:
;Vz_Algorithm.c,430 :: 		}
	GOTO	L_Vz_Algorithm_3_4109
L_Vz_Algorithm_3_4103:
;Vz_Algorithm.c,431 :: 		else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_4109:
;Vz_Algorithm.c,433 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,434 :: 		if(a==1)
	MOV.B	[W14+17], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4209
	GOTO	L_Vz_Algorithm_3_4110
L__Vz_Algorithm_3_4209:
;Vz_Algorithm.c,436 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,437 :: 		if(C1>SwitchN)
	MOV	Vz_Algorithm_3_4_C1_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4210
	GOTO	L_Vz_Algorithm_3_4111
L__Vz_Algorithm_3_4210:
;Vz_Algorithm.c,440 :: 		ResultT=dC-tC+U2Xpoint-DXpoint;
	MOV	Vz_Algorithm_3_4_dC_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUB	W1, [W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Xpoint_L0), W0
	ADD	W1, [W0], W2
	MOV	#lo_addr(Vz_Algorithm_3_4_DXpoint_L0), W1
	ADD	W14, #14, W0
	SUB	W2, [W1], [W0]
;Vz_Algorithm.c,441 :: 		AveResultT=(int)((float)(((float)((10000.0-(float)alpha)*(float)AveResultT)+(float)((float)alpha*(float)ResultT))/10000.0));
	MOV	[W14+10], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, [W14+32]
	MOV	W1, [W14+34]
	MOV	#16384, W0
	MOV	#17948, W1
	MOV	[W14+32], W2
	MOV	[W14+34], W3
	CALL	__Sub_FP
	MOV	W0, [W14+28]
	MOV	W1, [W14+30]
	MOV	Vz_Algorithm_3_4_AveResultT_L0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+28], W2
	MOV	[W14+30], W3
	CALL	__Mul_FP
	MOV.D	W0, W2
	MOV	[W14+32], W0
	MOV	[W14+34], W1
	MOV	W2, [W14+32]
	MOV	W3, [W14+34]
	MOV	W0, [W14+28]
	MOV	W1, [W14+30]
	MOV	[W14+14], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+28], W2
	MOV	[W14+30], W3
	CALL	__Mul_FP
	MOV	[W14+32], W2
	MOV	[W14+34], W3
	CALL	__AddSub_FP
	MOV	#16384, W2
	MOV	#17948, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, Vz_Algorithm_3_4_AveResultT_L0
;Vz_Algorithm.c,446 :: 		Algo_Parametrs_Out_Buffer[0]=TRUE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;Vz_Algorithm.c,447 :: 		Algo_Parametrs_Out_Buffer[3]=(ResultT&0xFF00)>>8;Algo_Parametrs_Out_Buffer[4]=(ResultT&0x00FF);
	MOV	[W14+14], W2
	MOV	#65280, W1
	AND	W2, W1, W1
	LSR	W1, #8, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+3), W1
	MOV.B	W2, [W1]
	MOV.B	[W14+14], W3
	MOV.B	#255, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+4), W1
	AND.B	W3, W2, [W1]
;Vz_Algorithm.c,448 :: 		Algo_Parametrs_Out_Buffer[1]=(AveResultT&0xFF00)>>8;Algo_Parametrs_Out_Buffer[2]=(AveResultT&0x00FF);
	MOV	#65280, W1
	AND	W0, W1, W1
	LSR	W1, #8, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+1), W1
	MOV.B	W2, [W1]
	MOV.B	#255, W2
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+2), W1
	AND.B	W0, W2, [W1]
;Vz_Algorithm.c,449 :: 		Algo_Parametrs_Out_Buffer[7]=(U1Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[8]=(U1Ipoint&0x00FF);
	MOV	Vz_Algorithm_3_4_U1Ipoint_L0, W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+7), W0
	MOV.B	W1, [W0]
	MOV	Vz_Algorithm_3_4_U1Ipoint_L0, W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+8), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,450 :: 		Algo_Parametrs_Out_Buffer[9]=(U2Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[10]=(U2Ipoint&0x00FF);
	MOV	Vz_Algorithm_3_4_U2Ipoint_L0, W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+9), W0
	MOV.B	W1, [W0]
	MOV	Vz_Algorithm_3_4_U2Ipoint_L0, W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+10), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,451 :: 		Algo_Parametrs_Out_Buffer[11]=(DIpoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[12]=(DIpoint&0x00FF);
	MOV	Vz_Algorithm_3_4_DIpoint_L0, W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+11), W0
	MOV.B	W1, [W0]
	MOV	Vz_Algorithm_3_4_DIpoint_L0, W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+12), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,452 :: 		Algo_Parametrs_Out_Buffer[13]=(AveU1Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[15]=(AveU1Ipoint&0x00FF);
	MOV	Vz_Algorithm_3_4_AveU1Ipoint_L0, W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+13), W0
	MOV.B	W1, [W0]
	MOV	Vz_Algorithm_3_4_AveU1Ipoint_L0, W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+15), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,453 :: 		Algo_Parametrs_Out_Buffer[15]=(AveU2Ipoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[16]=(AveU2Ipoint&0x00FF);
	MOV	Vz_Algorithm_3_4_AveU2Ipoint_L0, W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+15), W0
	MOV.B	W1, [W0]
	MOV	Vz_Algorithm_3_4_AveU2Ipoint_L0, W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+16), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,454 :: 		Algo_Parametrs_Out_Buffer[17]=(AveDIpoint&0xFF00)>>8;Algo_Parametrs_Out_Buffer[18]=(AveDIpoint&0x00FF);
	MOV	Vz_Algorithm_3_4_AveDIpoint_L0, W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+17), W0
	MOV.B	W1, [W0]
	MOV	Vz_Algorithm_3_4_AveDIpoint_L0, W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+18), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,456 :: 		U1Ipoint=0;DIpoint=0;U2Ipoint=0;ST=1;tC=0;C1=0;C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_U1Ipoint_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_DIpoint_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_U2Ipoint_L0
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,457 :: 		}
L_Vz_Algorithm_3_4111:
;Vz_Algorithm.c,458 :: 		}
	GOTO	L_Vz_Algorithm_3_4112
L_Vz_Algorithm_3_4110:
;Vz_Algorithm.c,459 :: 		else if(a==0)
	MOV.B	[W14+17], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4211
	GOTO	L_Vz_Algorithm_3_4113
L__Vz_Algorithm_3_4211:
;Vz_Algorithm.c,461 :: 		C1=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,462 :: 		if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4212
	GOTO	L_Vz_Algorithm_3_4114
L__Vz_Algorithm_3_4212:
	ADD	W14, #17, W0
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W13
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W12
	MOV	W0, W11
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W10
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	PUSH	W0
	CALL	_uError_Algo_3_4
	SUB	#12, W15
L_Vz_Algorithm_3_4114:
;Vz_Algorithm.c,463 :: 		}
L_Vz_Algorithm_3_4113:
L_Vz_Algorithm_3_4112:
;Vz_Algorithm.c,464 :: 		break;
	GOTO	L_Vz_Algorithm_3_448
;Vz_Algorithm.c,465 :: 		}
L_Vz_Algorithm_3_447:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Vz_Algorithm_3_4213
	GOTO	L_Vz_Algorithm_3_449
L__Vz_Algorithm_3_4213:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Vz_Algorithm_3_4214
	GOTO	L_Vz_Algorithm_3_455
L__Vz_Algorithm_3_4214:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Vz_Algorithm_3_4215
	GOTO	L_Vz_Algorithm_3_461
L__Vz_Algorithm_3_4215:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__Vz_Algorithm_3_4216
	GOTO	L_Vz_Algorithm_3_474
L__Vz_Algorithm_3_4216:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__Vz_Algorithm_3_4217
	GOTO	L_Vz_Algorithm_3_483
L__Vz_Algorithm_3_4217:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__Vz_Algorithm_3_4218
	GOTO	L_Vz_Algorithm_3_496
L__Vz_Algorithm_3_4218:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Vz_Algorithm_3_4219
	GOTO	L_Vz_Algorithm_3_4102
L__Vz_Algorithm_3_4219:
L_Vz_Algorithm_3_448:
;Vz_Algorithm.c,260 :: 		for(k=0;k<60;k++)
	MOV.B	[W14+16], W1
	ADD	W14, #16, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,466 :: 		}//for(k=0;k<60;k++)
	GOTO	L_Vz_Algorithm_3_440
L_Vz_Algorithm_3_441:
;Vz_Algorithm.c,467 :: 		}
L_end_Vz_Algorithm_3_4:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Vz_Algorithm_3_4

_uError_Algo_3_4:
	LNK	#0

;Vz_Algorithm.c,469 :: 		void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint)
; C0 start address is: 4 (W2)
	MOV	[W14-8], W2
; C1 start address is: 6 (W3)
	MOV	[W14-10], W3
; C2 start address is: 8 (W4)
	MOV	[W14-12], W4
; U1Ipoint start address is: 10 (W5)
	MOV	[W14-14], W5
; U2Ipoint start address is: 12 (W6)
	MOV	[W14-16], W6
; DIpoint start address is: 14 (W7)
	MOV	[W14-18], W7
;Vz_Algorithm.c,476 :: 		Algo_Parametrs_Out_Buffer[0]=TRUE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,477 :: 		Algo_Parametrs_Out_Buffer[19]=0; Algo_Parametrs_Out_Buffer[20]=ST;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+19), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+20), W0
	MOV.B	W10, [W0]
;Vz_Algorithm.c,478 :: 		Algo_Parametrs_Out_Buffer[21]=a;Algo_Parametrs_Out_Buffer[22]=a;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+21), W0
	MOV.B	W11, [W0]
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+22), W0
	MOV.B	W11, [W0]
;Vz_Algorithm.c,479 :: 		*ST=0;*tC=0;*dC=0;*C0=0;*C1=0;*C2=0;*U1Ipoint=0;*U2Ipoint=0;*DIpoint=0;
	CLR	W0
	MOV.B	W0, [W10]
	CLR	W0
	MOV	W0, [W12]
	CLR	W0
	MOV	W0, [W13]
	CLR	W0
	MOV	W0, [W2]
; C0 end address is: 4 (W2)
	CLR	W0
	MOV	W0, [W3]
; C1 end address is: 6 (W3)
	CLR	W0
	MOV	W0, [W4]
; C2 end address is: 8 (W4)
	CLR	W0
	MOV	W0, [W5]
; U1Ipoint end address is: 10 (W5)
	CLR	W0
	MOV	W0, [W6]
; U2Ipoint end address is: 12 (W6)
	CLR	W0
	MOV	W0, [W7]
; DIpoint end address is: 14 (W7)
;Vz_Algorithm.c,480 :: 		}
L_end_uError_Algo_3_4:
	ULNK
	RETURN
; end of _uError_Algo_3_4

_Vz_Algorithm_2:
	LNK	#16

;Vz_Algorithm.c,482 :: 		void Vz_Algorithm_2(void)//Motion detector
;Vz_Algorithm.c,488 :: 		int SPC = ParamsIn[SPC2]  ;
	MOV	_ParamsIn, W0
	MOV	W0, [W14+0]
;Vz_Algorithm.c,489 :: 		int Yv_th = ParamsIn[Yv_th2];
	MOV	_ParamsIn+2, W0
	MOV	W0, [W14+2]
;Vz_Algorithm.c,490 :: 		int minStartN = ParamsIn[minStartN2];
	MOV	_ParamsIn+4, W0
	MOV	W0, [W14+4]
;Vz_Algorithm.c,491 :: 		int minStopN = ParamsIn[minStopN2]   ;
	MOV	_ParamsIn+6, W0
	MOV	W0, [W14+6]
;Vz_Algorithm.c,492 :: 		int minResult = ParamsIn[minResult2]  ;
	MOV	_ParamsIn+8, W0
	MOV	W0, [W14+8]
;Vz_Algorithm.c,509 :: 		ResetAlgoParametrsOutBuffer();
	CALL	_ResetAlgoParametrsOutBuffer
;Vz_Algorithm.c,510 :: 		OpticDataGetFrame_VelocityOnly();
	CALL	_OpticDataGetFrame_VelocityOnly
;Vz_Algorithm.c,511 :: 		MaxNBeforeStop=SPC/4;
	MOV	[W14+0], W0
	MOV	#4, W2
	REPEAT	#17
	DIV.S	W0, W2
; MaxNBeforeStop start address is: 10 (W5)
	MOV	W0, W5
;Vz_Algorithm.c,512 :: 		for(k=0;k<60;k++)
; k start address is: 18 (W9)
	CLR	W9
; k end address is: 18 (W9)
	MOV.B	W9, W4
L_Vz_Algorithm_2115:
; k start address is: 8 (W4)
; MaxNBeforeStop start address is: 10 (W5)
; MaxNBeforeStop end address is: 10 (W5)
	MOV.B	#60, W0
	CP.B	W4, W0
	BRA LTU	L__Vz_Algorithm_2222
	GOTO	L_Vz_Algorithm_2116
L__Vz_Algorithm_2222:
; MaxNBeforeStop end address is: 10 (W5)
;Vz_Algorithm.c,514 :: 		Y=(Vz_Sensor_Velocity_Buffer_int[k]/256)*(Vz_Sensor_Velocity_Buffer_int[k]/256);
; MaxNBeforeStop start address is: 10 (W5)
	ZE	W4, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+14]
	MOV	[W0], W0
	MOV	#256, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	[W14+14], W0
	MOV	W1, [W14+14]
	MOV	[W0], W0
	MOV	#256, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV	[W14+14], W0
	MUL.SS	W0, W2, W0
; Y start address is: 4 (W2)
	MOV	W0, W2
;Vz_Algorithm.c,515 :: 		switch (ST)
	GOTO	L_Vz_Algorithm_2118
;Vz_Algorithm.c,517 :: 		case    1:
L_Vz_Algorithm_2120:
;Vz_Algorithm.c,518 :: 		cCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_cCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,519 :: 		if(Y>Yv_th)
	ADD	W14, #2, W0
	CP	W2, [W0]
	BRA GT	L__Vz_Algorithm_2223
	GOTO	L_Vz_Algorithm_2121
L__Vz_Algorithm_2223:
; Y end address is: 4 (W2)
;Vz_Algorithm.c,521 :: 		upCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_upCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,522 :: 		if(upCounter>minStopN) dnCounter=0;
	MOV	Vz_Algorithm_2_upCounter_L0, W1
	ADD	W14, #6, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2224
	GOTO	L_Vz_Algorithm_2122
L__Vz_Algorithm_2224:
	CLR	W0
	MOV	W0, Vz_Algorithm_2_dnCounter_L0
L_Vz_Algorithm_2122:
;Vz_Algorithm.c,523 :: 		}
	GOTO	L_Vz_Algorithm_2123
L_Vz_Algorithm_2121:
;Vz_Algorithm.c,526 :: 		if(dnCounter>MaxNBeforeStop)
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_2225
	GOTO	L_Vz_Algorithm_2124
L__Vz_Algorithm_2225:
;Vz_Algorithm.c,528 :: 		ST=0;
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W1
	CLR	W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,529 :: 		Res=cCounter-dnCounter;
	MOV	Vz_Algorithm_2_cCounter_L0, W1
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	SUB	W1, [W0], W1
	MOV	W1, [W14+10]
;Vz_Algorithm.c,530 :: 		if(Res>minResult)
	ADD	W14, #8, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2226
	GOTO	L_Vz_Algorithm_2125
L__Vz_Algorithm_2226:
;Vz_Algorithm.c,537 :: 		Algo_Parametrs_Out_Buffer[0]=TRUE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,538 :: 		Algo_Parametrs_Out_Buffer[1]=(Result&0xFF00)>>8;Algo_Parametrs_Out_Buffer[2]=(Result&0x00FF);
	MOV	[W14+10], W1
	MOV	#65280, W0
	AND	W1, W0, W0
	LSR	W0, #8, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+1), W0
	MOV.B	W1, [W0]
	MOV.B	[W14+10], W2
	MOV.B	#255, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer+2), W0
	AND.B	W2, W1, [W0]
;Vz_Algorithm.c,539 :: 		}//if(Res>minResult)
L_Vz_Algorithm_2125:
;Vz_Algorithm.c,540 :: 		cCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_cCounter_L0
;Vz_Algorithm.c,541 :: 		}//if(dnCounter>MaxNBeforeStop)
L_Vz_Algorithm_2124:
;Vz_Algorithm.c,542 :: 		dnCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,543 :: 		upCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_upCounter_L0
;Vz_Algorithm.c,544 :: 		}//if(Y>Yv_th)
L_Vz_Algorithm_2123:
;Vz_Algorithm.c,545 :: 		break;
	GOTO	L_Vz_Algorithm_2119
;Vz_Algorithm.c,547 :: 		case    0:
L_Vz_Algorithm_2126:
;Vz_Algorithm.c,548 :: 		if(Y>Yv_th)
; Y start address is: 4 (W2)
	ADD	W14, #2, W0
	CP	W2, [W0]
	BRA GT	L__Vz_Algorithm_2227
	GOTO	L_Vz_Algorithm_2127
L__Vz_Algorithm_2227:
; Y end address is: 4 (W2)
;Vz_Algorithm.c,550 :: 		if(upCounter>minStartN) ST=1;
	MOV	Vz_Algorithm_2_upCounter_L0, W1
	ADD	W14, #4, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2228
	GOTO	L_Vz_Algorithm_2128
L__Vz_Algorithm_2228:
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_Vz_Algorithm_2128:
;Vz_Algorithm.c,551 :: 		upCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_upCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,552 :: 		dnCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_dnCounter_L0
;Vz_Algorithm.c,553 :: 		}//if(Y>Yv_th)
	GOTO	L_Vz_Algorithm_2129
L_Vz_Algorithm_2127:
;Vz_Algorithm.c,556 :: 		dnCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,557 :: 		upCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_upCounter_L0
;Vz_Algorithm.c,558 :: 		}
L_Vz_Algorithm_2129:
;Vz_Algorithm.c,559 :: 		break;
	GOTO	L_Vz_Algorithm_2119
;Vz_Algorithm.c,560 :: 		}
L_Vz_Algorithm_2118:
; Y start address is: 4 (W2)
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Vz_Algorithm_2229
	GOTO	L_Vz_Algorithm_2120
L__Vz_Algorithm_2229:
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Vz_Algorithm_2230
	GOTO	L_Vz_Algorithm_2126
L__Vz_Algorithm_2230:
; Y end address is: 4 (W2)
L_Vz_Algorithm_2119:
;Vz_Algorithm.c,512 :: 		for(k=0;k<60;k++)
; k start address is: 18 (W9)
	ADD.B	W4, #1, W9
; k end address is: 8 (W4)
;Vz_Algorithm.c,561 :: 		}//for(k=0;k<60;k++)
; MaxNBeforeStop end address is: 10 (W5)
; k end address is: 18 (W9)
	MOV.B	W9, W4
	GOTO	L_Vz_Algorithm_2115
L_Vz_Algorithm_2116:
;Vz_Algorithm.c,562 :: 		}
L_end_Vz_Algorithm_2:
	ULNK
	RETURN
; end of _Vz_Algorithm_2

_ResetAlgoParametrsOutBuffer:

;Vz_Algorithm.c,564 :: 		void ResetAlgoParametrsOutBuffer(void)
;Vz_Algorithm.c,568 :: 		Algo_Parametrs_Out_Buffer[0]=FALSE;
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W1
	CLR	W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,569 :: 		for(i=1;i<Algo_Parametrs_Out_Buffer_Length;i++) Algo_Parametrs_Out_Buffer[i]=0xFF;
; i start address is: 4 (W2)
	MOV.B	#1, W2
; i end address is: 4 (W2)
L_ResetAlgoParametrsOutBuffer130:
; i start address is: 4 (W2)
	CP.B	W2, #23
	BRA LTU	L__ResetAlgoParametrsOutBuffer232
	GOTO	L_ResetAlgoParametrsOutBuffer131
L__ResetAlgoParametrsOutBuffer232:
	ZE	W2, W1
	MOV	#lo_addr(_Algo_Parametrs_Out_Buffer), W0
	ADD	W0, W1, W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_ResetAlgoParametrsOutBuffer130
L_ResetAlgoParametrsOutBuffer131:
;Vz_Algorithm.c,570 :: 		}
L_end_ResetAlgoParametrsOutBuffer:
	RETURN
; end of _ResetAlgoParametrsOutBuffer

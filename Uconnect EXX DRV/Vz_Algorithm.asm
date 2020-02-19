
_Vz_Algoritem_by_algo_select:

;Vz_Algorithm.c,16 :: 		void Vz_Algoritem_by_algo_select()
;Vz_Algorithm.c,18 :: 		switch (ALGO_SELECTED)
	GOTO	L_Vz_Algoritem_by_algo_select0
;Vz_Algorithm.c,20 :: 		case Algorithm_2:
L_Vz_Algoritem_by_algo_select2:
;Vz_Algorithm.c,21 :: 		Vz_Algorithm_2();
	CALL	_Vz_Algorithm_2
;Vz_Algorithm.c,22 :: 		break;
	GOTO	L_Vz_Algoritem_by_algo_select1
;Vz_Algorithm.c,23 :: 		case Algorithm_3_4:
L_Vz_Algoritem_by_algo_select3:
;Vz_Algorithm.c,24 :: 		Vz_Algorithm_3_4();
	CALL	_Vz_Algorithm_3_4
;Vz_Algorithm.c,25 :: 		break;
	GOTO	L_Vz_Algoritem_by_algo_select1
;Vz_Algorithm.c,26 :: 		case Algorithm_5:
L_Vz_Algoritem_by_algo_select4:
;Vz_Algorithm.c,27 :: 		Vz_Algorithm_5();
	CALL	_Vz_Algorithm_5
;Vz_Algorithm.c,28 :: 		break;
	GOTO	L_Vz_Algoritem_by_algo_select1
;Vz_Algorithm.c,29 :: 		}
L_Vz_Algoritem_by_algo_select0:
	MOV	#lo_addr(_ALGO_SELECTED), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Vz_Algoritem_by_algo_select141
	GOTO	L_Vz_Algoritem_by_algo_select2
L__Vz_Algoritem_by_algo_select141:
	MOV	#lo_addr(_ALGO_SELECTED), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Vz_Algoritem_by_algo_select142
	GOTO	L_Vz_Algoritem_by_algo_select3
L__Vz_Algoritem_by_algo_select142:
	MOV	#lo_addr(_ALGO_SELECTED), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Vz_Algoritem_by_algo_select143
	GOTO	L_Vz_Algoritem_by_algo_select4
L__Vz_Algoritem_by_algo_select143:
L_Vz_Algoritem_by_algo_select1:
;Vz_Algorithm.c,30 :: 		}
L_end_Vz_Algoritem_by_algo_select:
	RETURN
; end of _Vz_Algoritem_by_algo_select

_Vz_Algorithm_5:
	LNK	#138

;Vz_Algorithm.c,31 :: 		void Vz_Algorithm_5(void)
;Vz_Algorithm.c,54 :: 		int SPC=8000;               //Parametr IN
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
; SPC start address is: 14 (W7)
	MOV	#8000, W7
;Vz_Algorithm.c,55 :: 		int Yv_th=1700;             //Parametr IN
; Yv_th start address is: 12 (W6)
	MOV	#1700, W6
;Vz_Algorithm.c,56 :: 		int FilterLength=30;        //Parametr IN
; FilterLength start address is: 16 (W8)
	MOV	#30, W8
;Vz_Algorithm.c,57 :: 		int FilterLengthShort=18;   //Parametr IN
	MOV	#18, W0
	MOV	W0, [W14+104]
;Vz_Algorithm.c,58 :: 		int SwitchN=0;              //Parametr IN
; SwitchN start address is: 10 (W5)
	CLR	W5
;Vz_Algorithm.c,59 :: 		int alpha=500;              //Parametr IN
; alpha start address is: 18 (W9)
	MOV	#500, W9
;Vz_Algorithm.c,61 :: 		int Error2_th=12;           //Parametr IN
; Error2_th start address is: 6 (W3)
	MOV	#12, W3
;Vz_Algorithm.c,62 :: 		int Error2_N=5;             //Parametr IN
; Error2_N start address is: 8 (W4)
	MOV	#5, W4
;Vz_Algorithm.c,85 :: 		OpticDataGetFrame_DistanceOnly();
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
;Vz_Algorithm.c,87 :: 		SPCC=SPC/60;
	MOV	#60, W2
	REPEAT	#17
	DIV.S	W7, W2
; SPC end address is: 14 (W7)
; SPCC start address is: 14 (W7)
	MOV	W0, W7
;Vz_Algorithm.c,88 :: 		FilterDelta=FilterLength-FilterLengthShort-1;
	MOV	#104, W0
	ADD	W14, W0, W0
	SUB	W8, [W0], W0
; FilterDelta start address is: 20 (W10)
	SUB	W0, #1, W10
;Vz_Algorithm.c,89 :: 		if(SwitchN==0) SwitchN=(FilterDelta+1)/2;
	CP	W5, #0
	BRA Z	L__Vz_Algorithm_5145
	GOTO	L__Vz_Algorithm_5138
L__Vz_Algorithm_5145:
; SwitchN end address is: 10 (W5)
	ADD	W10, #1, W0
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W0, W2
; SwitchN start address is: 10 (W5)
	MOV	W0, W5
; SwitchN end address is: 10 (W5)
	GOTO	L_Vz_Algorithm_55
L__Vz_Algorithm_5138:
L_Vz_Algorithm_55:
;Vz_Algorithm.c,90 :: 		if(DIpoint==0) DIpoint=DToBelt;
; SwitchN start address is: 10 (W5)
	MOV	Vz_Algorithm_5_DIpoint_L0, W0
	CP	W0, #0
	BRA Z	L__Vz_Algorithm_5146
	GOTO	L_Vz_Algorithm_56
L__Vz_Algorithm_5146:
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	MOV	W0, Vz_Algorithm_5_DIpoint_L0
L_Vz_Algorithm_56:
;Vz_Algorithm.c,92 :: 		Y=0;
; Y start address is: 26 (W13)
	CLR	W13
;Vz_Algorithm.c,93 :: 		for(k=0;k<60;k++) Y+=Vz_Sensor_Distance_Buffer_int[k]/60;
	CLR	W0
	MOV	W0, [W14+100]
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
L_Vz_Algorithm_57:
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
	MOV	#100, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_5147
	GOTO	L_Vz_Algorithm_58
L__Vz_Algorithm_5147:
	MOV	[W14+100], W0
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
	MOV	[W14+100], W1
	MOV	#100, W0
	ADD	W14, W0, W0
	ADD	W1, #1, [W0]
; Y end address is: 4 (W2)
	MOV	W2, W11
	GOTO	L_Vz_Algorithm_57
L_Vz_Algorithm_58:
;Vz_Algorithm.c,94 :: 		FilterBuffer[PointerIndex]=Y;
; Y start address is: 22 (W11)
	MOV	Vz_Algorithm_5_PointerIndex_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_5_FilterBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	W11, [W0]
; Y end address is: 22 (W11)
;Vz_Algorithm.c,95 :: 		k=0;Yf=0;Yfs=0;
	CLR	W0
	MOV	W0, [W14+102]
; Yfs start address is: 24 (W12)
	CLR	W12
;Vz_Algorithm.c,96 :: 		for(j=0;j<FilterLength;j++)
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
L_Vz_Algorithm_510:
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
	BRA LT	L__Vz_Algorithm_5148
	GOTO	L_Vz_Algorithm_511
L__Vz_Algorithm_5148:
; FilterDelta end address is: 20 (W10)
;Vz_Algorithm.c,98 :: 		if((PointerIndex+j)>(FilterLength-1)) k=PointerIndex+j-FilterLength;
; FilterDelta start address is: 20 (W10)
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	ADD	W6, [W0], W1
	SUB	W13, #1, W0
	CP	W1, W0
	BRA GT	L__Vz_Algorithm_5149
	GOTO	L_Vz_Algorithm_513
L__Vz_Algorithm_5149:
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	ADD	W6, [W0], W1
	MOV	#100, W0
	ADD	W14, W0, W0
	SUB	W1, W13, [W0]
	GOTO	L_Vz_Algorithm_514
L_Vz_Algorithm_513:
;Vz_Algorithm.c,99 :: 		else k=PointerIndex+j;
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W1
	MOV	#100, W0
	ADD	W14, W0, W0
	ADD	W6, [W1], [W0]
L_Vz_Algorithm_514:
;Vz_Algorithm.c,100 :: 		Yf+=FilterBuffer[k]/FilterLength;
	MOV	[W14+100], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_5_FilterBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	REPEAT	#17
	DIV.S	W0, W13
	MOV	W0, W2
	MOV	#102, W1
	ADD	W14, W1, W1
	MOV	#102, W0
	ADD	W14, W0, W0
	ADD	W2, [W1], [W0]
;Vz_Algorithm.c,101 :: 		if(j>FilterDelta) Yfs+=FilterBuffer[k]/FilterLengthShort;
	CP	W6, W10
	BRA GT	L__Vz_Algorithm_5150
	GOTO	L__Vz_Algorithm_5139
L__Vz_Algorithm_5150:
	MOV	[W14+100], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_5_FilterBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	[W14+104], W2
	REPEAT	#17
	DIV.S	W0, W2
; Yfs start address is: 0 (W0)
	ADD	W12, W0, W0
; Yfs end address is: 24 (W12)
; Yfs end address is: 0 (W0)
	GOTO	L_Vz_Algorithm_515
L__Vz_Algorithm_5139:
	MOV	W12, W0
L_Vz_Algorithm_515:
;Vz_Algorithm.c,96 :: 		for(j=0;j<FilterLength;j++)
; Yfs start address is: 0 (W0)
; j start address is: 2 (W1)
	ADD	W6, #1, W1
; j end address is: 12 (W6)
;Vz_Algorithm.c,102 :: 		}
; FilterDelta end address is: 20 (W10)
; Yfs end address is: 0 (W0)
; j end address is: 2 (W1)
	MOV	W0, W12
	MOV	W1, W6
	GOTO	L_Vz_Algorithm_510
L_Vz_Algorithm_511:
;Vz_Algorithm.c,103 :: 		PointerIndex++;
; Yfs start address is: 24 (W12)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,104 :: 		if(PointerIndex>=FilterLength)  PointerIndex=0;
	MOV	#lo_addr(Vz_Algorithm_5_PointerIndex_L0), W0
	CP	W13, [W0]
	BRA LE	L__Vz_Algorithm_5151
	GOTO	L_Vz_Algorithm_516
L__Vz_Algorithm_5151:
; FilterLength end address is: 26 (W13)
	CLR	W0
	MOV	W0, Vz_Algorithm_5_PointerIndex_L0
L_Vz_Algorithm_516:
;Vz_Algorithm.c,105 :: 		dC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,106 :: 		switch (ST)
	GOTO	L_Vz_Algorithm_517
; alpha end address is: 18 (W9)
;Vz_Algorithm.c,108 :: 		case    2:
L_Vz_Algorithm_519:
;Vz_Algorithm.c,109 :: 		if(Yfs<(DToBelt-Yv_th))
	MOV	#lo_addr(Vz_Algorithm_5_DToBelt_L0), W0
	SUBR	W11, [W0], W0
; Yv_th end address is: 22 (W11)
	CP	W12, W0
	BRA LT	L__Vz_Algorithm_5152
	GOTO	L_Vz_Algorithm_520
L__Vz_Algorithm_5152:
; Yfs end address is: 24 (W12)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
;Vz_Algorithm.c,111 :: 		C0++;C1=0;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C1_L0
;Vz_Algorithm.c,112 :: 		if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
	ADD	W5, W7, W1
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_5153
	GOTO	L_Vz_Algorithm_521
L__Vz_Algorithm_5153:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#1, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_521:
;Vz_Algorithm.c,113 :: 		}
	GOTO	L_Vz_Algorithm_522
L_Vz_Algorithm_520:
;Vz_Algorithm.c,114 :: 		else if(Yfs>(Error2_th*(DToBelt/10)))
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
	BRA GT	L__Vz_Algorithm_5154
	GOTO	L_Vz_Algorithm_523
L__Vz_Algorithm_5154:
; Yfs end address is: 24 (W12)
;Vz_Algorithm.c,116 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,117 :: 		if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	MUL.SS	W4, W5, W2
; Error2_N end address is: 8 (W4)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_5155
	GOTO	L_Vz_Algorithm_524
L__Vz_Algorithm_5155:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_524:
;Vz_Algorithm.c,118 :: 		}
	GOTO	L_Vz_Algorithm_525
L_Vz_Algorithm_523:
;Vz_Algorithm.c,121 :: 		C1++;C0=0;
; SwitchN start address is: 10 (W5)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C0_L0
;Vz_Algorithm.c,122 :: 		if(C1>SwitchN)
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_5156
	GOTO	L_Vz_Algorithm_526
L__Vz_Algorithm_5156:
; SwitchN end address is: 10 (W5)
;Vz_Algorithm.c,124 :: 		ST=1;C2=0;UIpoint=0;dC=0;
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_5_ST_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C2_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_UIpoint_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_dC_L0
;Vz_Algorithm.c,125 :: 		}
L_Vz_Algorithm_526:
;Vz_Algorithm.c,126 :: 		}
L_Vz_Algorithm_525:
L_Vz_Algorithm_522:
;Vz_Algorithm.c,127 :: 		break;
	GOTO	L_Vz_Algorithm_518
;Vz_Algorithm.c,128 :: 		case    0:
L_Vz_Algorithm_527:
;Vz_Algorithm.c,129 :: 		if(Yfs<(DToBelt-Yv_th))
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
	BRA LT	L__Vz_Algorithm_5157
	GOTO	L_Vz_Algorithm_528
L__Vz_Algorithm_5157:
; Yfs end address is: 24 (W12)
; alpha end address is: 18 (W9)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
;Vz_Algorithm.c,131 :: 		C0++;C1=0;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C1_L0
;Vz_Algorithm.c,132 :: 		if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
	ADD	W5, W7, W1
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_5158
	GOTO	L_Vz_Algorithm_529
L__Vz_Algorithm_5158:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#1, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_529:
;Vz_Algorithm.c,133 :: 		if((DToBelt-Yf)>(DToBelt-DIpoint))
	MOV	Vz_Algorithm_5_DToBelt_L0, W1
	MOV	#102, W0
	ADD	W14, W0, W0
	SUB	W1, [W0], W2
	MOV	Vz_Algorithm_5_DToBelt_L0, W1
	MOV	#lo_addr(Vz_Algorithm_5_DIpoint_L0), W0
	SUB	W1, [W0], W0
	CP	W2, W0
	BRA GT	L__Vz_Algorithm_5159
	GOTO	L_Vz_Algorithm_530
L__Vz_Algorithm_5159:
;Vz_Algorithm.c,135 :: 		DIpoint=Yf;DXpoint=dC;
	MOV	[W14+102], W0
	MOV	W0, Vz_Algorithm_5_DIpoint_L0
	MOV	Vz_Algorithm_5_dC_L0, W0
	MOV	W0, Vz_Algorithm_5_DXpoint_L0
;Vz_Algorithm.c,136 :: 		}
L_Vz_Algorithm_530:
;Vz_Algorithm.c,137 :: 		}
	GOTO	L_Vz_Algorithm_531
L_Vz_Algorithm_528:
;Vz_Algorithm.c,138 :: 		else if(Yfs>(Error2_th*(DToBelt/10)))
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
	BRA GT	L__Vz_Algorithm_5160
	GOTO	L_Vz_Algorithm_532
L__Vz_Algorithm_5160:
; Yfs end address is: 24 (W12)
; alpha end address is: 18 (W9)
;Vz_Algorithm.c,140 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,141 :: 		if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	MUL.SS	W4, W5, W2
; Error2_N end address is: 8 (W4)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_5161
	GOTO	L_Vz_Algorithm_533
L__Vz_Algorithm_5161:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_533:
;Vz_Algorithm.c,142 :: 		}
	GOTO	L_Vz_Algorithm_534
L_Vz_Algorithm_532:
;Vz_Algorithm.c,145 :: 		C1++;C0=0;
; SwitchN start address is: 10 (W5)
; alpha start address is: 18 (W9)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C0_L0
;Vz_Algorithm.c,146 :: 		if(C1>SwitchN)
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_5162
	GOTO	L_Vz_Algorithm_535
L__Vz_Algorithm_5162:
; SwitchN end address is: 10 (W5)
;Vz_Algorithm.c,148 :: 		ST=1;
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_5_ST_L0
;Vz_Algorithm.c,149 :: 		C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C2_L0
;Vz_Algorithm.c,151 :: 		DeltaT=DXpoint+DXpointLast;
	MOV	Vz_Algorithm_5_DXpoint_L0, W2
	MOV	#lo_addr(Vz_Algorithm_5_DXpointLast_L0), W1
	MOV	#lo_addr(Vz_Algorithm_5_DeltaT_L0), W0
	ADD	W2, [W1], [W0]
;Vz_Algorithm.c,152 :: 		DXpointLast=dC-DXpoint;
	MOV	Vz_Algorithm_5_dC_L0, W2
	MOV	#lo_addr(Vz_Algorithm_5_DXpoint_L0), W1
	MOV	#lo_addr(Vz_Algorithm_5_DXpointLast_L0), W0
	SUB	W2, [W1], [W0]
;Vz_Algorithm.c,153 :: 		ChBHight=DToBelt-DIpoint;
	MOV	Vz_Algorithm_5_DToBelt_L0, W2
	MOV	#lo_addr(Vz_Algorithm_5_DIpoint_L0), W1
	MOV	#lo_addr(Vz_Algorithm_5_ChBHight_L0), W0
	SUB	W2, [W1], [W0]
;Vz_Algorithm.c,154 :: 		DToBelt=(int)((float)(((float)((10000.0-(float)alpha)*(float)DToBelt)+(float)((float)alpha*(float)UIpoint))/10000.0));
	MOV	W9, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
; alpha end address is: 18 (W9)
	MOV	W0, [W14+134]
	MOV	W1, [W14+136]
	MOV	#16384, W0
	MOV	#17948, W1
	MOV	[W14+134], W2
	MOV	[W14+136], W3
	CALL	__Sub_FP
	MOV	W0, [W14+130]
	MOV	W1, [W14+132]
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+130], W2
	MOV	[W14+132], W3
	CALL	__Mul_FP
	MOV.D	W0, W2
	MOV	[W14+134], W0
	MOV	[W14+136], W1
	MOV	W2, [W14+134]
	MOV	W3, [W14+136]
	MOV	W0, [W14+130]
	MOV	W1, [W14+132]
	MOV	Vz_Algorithm_5_UIpoint_L0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+130], W2
	MOV	[W14+132], W3
	CALL	__Mul_FP
	MOV	[W14+134], W2
	MOV	[W14+136], W3
	CALL	__AddSub_FP
	MOV	#16384, W2
	MOV	#17948, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, Vz_Algorithm_5_DToBelt_L0
;Vz_Algorithm.c,156 :: 		sprintf(txt,"%d,%d,%d\n",DeltaT,ChBHight,DToBelt);
	ADD	W14, #0, W1
	PUSH	W0
	MOV	#lo_addr(Vz_Algorithm_5_ChBHight_L0), W0
	PUSH	[W0]
	MOV	#lo_addr(Vz_Algorithm_5_DeltaT_L0), W0
	PUSH	[W0]
	MOV	#lo_addr(?lstr_1_Vz_Algorithm), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#10, W15
;Vz_Algorithm.c,157 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
;Vz_Algorithm.c,159 :: 		dC=0;UIpoint=0;DIpoint=DToBelt;
	CLR	W0
	MOV	W0, Vz_Algorithm_5_dC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_UIpoint_L0
	MOV	Vz_Algorithm_5_DToBelt_L0, W0
	MOV	W0, Vz_Algorithm_5_DIpoint_L0
;Vz_Algorithm.c,161 :: 		}
L_Vz_Algorithm_535:
;Vz_Algorithm.c,162 :: 		}
L_Vz_Algorithm_534:
L_Vz_Algorithm_531:
;Vz_Algorithm.c,163 :: 		break;
	GOTO	L_Vz_Algorithm_518
;Vz_Algorithm.c,164 :: 		case    1:
L_Vz_Algorithm_536:
;Vz_Algorithm.c,165 :: 		if(Yfs<(DToBelt-Yv_th))
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
	BRA LT	L__Vz_Algorithm_5163
	GOTO	L_Vz_Algorithm_537
L__Vz_Algorithm_5163:
; Yfs end address is: 24 (W12)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
; SPCC end address is: 14 (W7)
;Vz_Algorithm.c,167 :: 		C0++;C1=0;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C1_L0
;Vz_Algorithm.c,168 :: 		if(C0>SwitchN)
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W0
	CP	W5, [W0]
	BRA LT	L__Vz_Algorithm_5164
	GOTO	L_Vz_Algorithm_538
L__Vz_Algorithm_5164:
; SwitchN end address is: 10 (W5)
;Vz_Algorithm.c,170 :: 		ST=0;C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_5_ST_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C2_L0
;Vz_Algorithm.c,171 :: 		}
L_Vz_Algorithm_538:
;Vz_Algorithm.c,173 :: 		}
	GOTO	L_Vz_Algorithm_539
L_Vz_Algorithm_537:
;Vz_Algorithm.c,174 :: 		else if(Yfs>(Error2_th*(DToBelt/10)))
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
	BRA GT	L__Vz_Algorithm_5165
	GOTO	L_Vz_Algorithm_540
L__Vz_Algorithm_5165:
; Yfs end address is: 24 (W12)
; SPCC end address is: 14 (W7)
;Vz_Algorithm.c,176 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,177 :: 		if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	MUL.SS	W4, W5, W2
; Error2_N end address is: 8 (W4)
; SwitchN end address is: 10 (W5)
	MOV	#lo_addr(Vz_Algorithm_5_C2_L0), W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_5166
	GOTO	L_Vz_Algorithm_541
L__Vz_Algorithm_5166:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_541:
;Vz_Algorithm.c,178 :: 		}
	GOTO	L_Vz_Algorithm_542
L_Vz_Algorithm_540:
;Vz_Algorithm.c,181 :: 		C1++;C0=0;
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W0
	ADD	W1, [W0], [W0]
	CLR	W0
	MOV	W0, Vz_Algorithm_5_C0_L0
;Vz_Algorithm.c,182 :: 		if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,2);
	ADD	W5, W7, W0
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
	CP	W0, #0
	BRA LT	L__Vz_Algorithm_5167
	GOTO	L_Vz_Algorithm_543
L__Vz_Algorithm_5167:
	MOV	#lo_addr(Vz_Algorithm_5_C1_L0), W13
	MOV	#lo_addr(Vz_Algorithm_5_C0_L0), W12
	MOV	#lo_addr(Vz_Algorithm_5_dC_L0), W11
	MOV	#lo_addr(Vz_Algorithm_5_ST_L0), W10
	MOV	#2, W0
	PUSH	W0
	CALL	_uError_Algo5
	SUB	#2, W15
L_Vz_Algorithm_543:
;Vz_Algorithm.c,183 :: 		if(Yf>UIpoint) {UIpoint=Yf;UXpoint=dC;}
	MOV	[W14+102], W1
	MOV	#lo_addr(Vz_Algorithm_5_UIpoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_5168
	GOTO	L_Vz_Algorithm_544
L__Vz_Algorithm_5168:
	MOV	[W14+102], W0
	MOV	W0, Vz_Algorithm_5_UIpoint_L0
L_Vz_Algorithm_544:
;Vz_Algorithm.c,184 :: 		}
L_Vz_Algorithm_542:
L_Vz_Algorithm_539:
;Vz_Algorithm.c,185 :: 		break;
	GOTO	L_Vz_Algorithm_518
;Vz_Algorithm.c,186 :: 		}//switch (ST)
L_Vz_Algorithm_517:
; SwitchN start address is: 10 (W5)
; SPCC start address is: 14 (W7)
; Error2_N start address is: 8 (W4)
; Error2_th start address is: 16 (W8)
; alpha start address is: 18 (W9)
; Yv_th start address is: 22 (W11)
; Yfs start address is: 24 (W12)
	MOV	Vz_Algorithm_5_ST_L0, W0
	CP	W0, #2
	BRA NZ	L__Vz_Algorithm_5169
	GOTO	L_Vz_Algorithm_519
L__Vz_Algorithm_5169:
	MOV	Vz_Algorithm_5_ST_L0, W0
	CP	W0, #0
	BRA NZ	L__Vz_Algorithm_5170
	GOTO	L_Vz_Algorithm_527
L__Vz_Algorithm_5170:
; alpha end address is: 18 (W9)
	MOV	Vz_Algorithm_5_ST_L0, W0
	CP	W0, #1
	BRA NZ	L__Vz_Algorithm_5171
	GOTO	L_Vz_Algorithm_536
L__Vz_Algorithm_5171:
; Yfs end address is: 24 (W12)
; Yv_th end address is: 22 (W11)
; Error2_th end address is: 16 (W8)
; Error2_N end address is: 8 (W4)
; SPCC end address is: 14 (W7)
; SwitchN end address is: 10 (W5)
L_Vz_Algorithm_518:
;Vz_Algorithm.c,187 :: 		}
L_end_Vz_Algorithm_5:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Vz_Algorithm_5

_uError_Algo5:
	LNK	#100

;Vz_Algorithm.c,189 :: 		void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode)
; ErorCode start address is: 0 (W0)
	MOV.B	[W14-8], W0
;Vz_Algorithm.c,195 :: 		sprintf(txt,"uError:ST-%d;a-%d;Code-%d;\n",(int)ST,(int)a,(int)ErorCode);
	ZE	W0, W3
; ErorCode end address is: 0 (W0)
	ADD	W14, #0, W2
	CLR	W1
	MOV	#lo_addr(?lstr_2_Vz_Algorithm), W0
	PUSH.D	W12
	PUSH.D	W10
	PUSH	W3
	PUSH	W1
	PUSH	W10
	PUSH	W0
	PUSH	W2
	CALL	_sprintf
	SUB	#10, W15
;Vz_Algorithm.c,196 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
	POP.D	W10
	POP.D	W12
;Vz_Algorithm.c,198 :: 		*ST=2;*dC=0;*C0=0;*C1=0;
	MOV.B	#2, W0
	MOV.B	W0, [W10]
	CLR	W0
	MOV	W0, [W11]
	CLR	W0
	MOV	W0, [W12]
	CLR	W0
	MOV	W0, [W13]
;Vz_Algorithm.c,199 :: 		}
L_end_uError_Algo5:
	ULNK
	RETURN
; end of _uError_Algo5

_Vz_Algorithm_3_4:
	LNK	#138

;Vz_Algorithm.c,201 :: 		void Vz_Algorithm_3_4(void) // Pressure detector  Vertical
;Vz_Algorithm.c,227 :: 		int SPC=8000;               //Parametr IN
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#106, W1
	ADD	W14, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSVz_Algorithm_3_4_SPC_L0), W0
	REPEAT	#6
	MOV	[W0++], [W1++]
	MOV.B	[W0++], [W1++]
;Vz_Algorithm.c,228 :: 		int Yv_thUp=3000;           //Parametr IN
;Vz_Algorithm.c,229 :: 		int Yv_thDn=-3000;          //Parametr IN
;Vz_Algorithm.c,230 :: 		int SwitchN=10;             //Parametr IN
;Vz_Algorithm.c,231 :: 		int MaxNBeforeSmPeak=400;   //Parametr IN
;Vz_Algorithm.c,232 :: 		int alpha=5000;             //Parametr IN
;Vz_Algorithm.c,233 :: 		int FilterLength=9;         //Parametr IN
;Vz_Algorithm.c,237 :: 		char NoSmallPeak=0;         //Parametr OUT
;Vz_Algorithm.c,261 :: 		OpticDataGetFrame_VelocityOnly();
	CALL	_OpticDataGetFrame_VelocityOnly
;Vz_Algorithm.c,265 :: 		for(k=0;k<60;k++)
	CLR	W0
	MOV.B	W0, [W14+102]
L_Vz_Algorithm_3_445:
	MOV.B	[W14+102], W1
	MOV.B	#60, W0
	CP.B	W1, W0
	BRA LTU	L__Vz_Algorithm_3_4174
	GOTO	L_Vz_Algorithm_3_446
L__Vz_Algorithm_3_4174:
;Vz_Algorithm.c,267 :: 		Y=(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140);
	MOV	#102, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+134]
	MOV	[W0], W0
	MOV	#140, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	[W14+134], W0
	MOV	W1, [W14+130]
	MOV	[W0], W0
	MOV	#140, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV	[W14+130], W0
	MUL.SS	W0, W2, W2
	MOV	[W14+134], W0
	MOV	W2, [W14+130]
	MOV	[W0], W0
	MOV	#140, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV	[W14+130], W0
	MUL.SS	W0, W2, W2
; Y start address is: 2 (W1)
	MOV	W2, W1
;Vz_Algorithm.c,268 :: 		if(Y<Yv_thDn)
	MOV	#110, W0
	ADD	W14, W0, W0
	CP	W2, [W0]
	BRA LT	L__Vz_Algorithm_3_4175
	GOTO	L_Vz_Algorithm_3_448
L__Vz_Algorithm_3_4175:
; Y end address is: 2 (W1)
;Vz_Algorithm.c,270 :: 		a=0;
	CLR	W0
	MOV.B	W0, [W14+103]
;Vz_Algorithm.c,271 :: 		C0++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,272 :: 		}
	GOTO	L_Vz_Algorithm_3_449
L_Vz_Algorithm_3_448:
;Vz_Algorithm.c,273 :: 		else if(Y>Yv_thUp)
; Y start address is: 2 (W1)
	MOV	#108, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4176
	GOTO	L_Vz_Algorithm_3_450
L__Vz_Algorithm_3_4176:
; Y end address is: 2 (W1)
;Vz_Algorithm.c,275 :: 		a=2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+103]
;Vz_Algorithm.c,276 :: 		C2++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,277 :: 		}
	GOTO	L_Vz_Algorithm_3_451
L_Vz_Algorithm_3_450:
;Vz_Algorithm.c,280 :: 		a=1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+103]
;Vz_Algorithm.c,281 :: 		C1++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C1_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,282 :: 		}
L_Vz_Algorithm_3_451:
L_Vz_Algorithm_3_449:
;Vz_Algorithm.c,283 :: 		dC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_dC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,284 :: 		switch (ST)
	GOTO	L_Vz_Algorithm_3_452
;Vz_Algorithm.c,286 :: 		case    0:
L_Vz_Algorithm_3_454:
;Vz_Algorithm.c,287 :: 		if(a==0)
	MOV.B	[W14+103], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4177
	GOTO	L_Vz_Algorithm_3_455
L__Vz_Algorithm_3_4177:
;Vz_Algorithm.c,289 :: 		C2=2;
	MOV	#2, W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,290 :: 		if(C0>(SwitchN+10)) {ST=2;tC=0;dC=1;C0=0;C1=0;}
	MOV	[W14+112], W0
	ADD	W0, #10, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C0_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4178
	GOTO	L_Vz_Algorithm_3_456
L__Vz_Algorithm_3_4178:
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
L_Vz_Algorithm_3_456:
;Vz_Algorithm.c,291 :: 		}//if(a==0)
	GOTO	L_Vz_Algorithm_3_457
L_Vz_Algorithm_3_455:
;Vz_Algorithm.c,292 :: 		else if(a==2)
	MOV.B	[W14+103], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4179
	GOTO	L_Vz_Algorithm_3_458
L__Vz_Algorithm_3_4179:
;Vz_Algorithm.c,294 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,295 :: 		if(C2>(SwitchN+SPC)) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	[W14+112], W1
	MOV	#106, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_C2_L0), W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4180
	GOTO	L_Vz_Algorithm_3_459
L__Vz_Algorithm_3_4180:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_459:
;Vz_Algorithm.c,296 :: 		}//else if(a==2)
L_Vz_Algorithm_3_458:
L_Vz_Algorithm_3_457:
;Vz_Algorithm.c,298 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,300 :: 		case    1:
L_Vz_Algorithm_3_460:
;Vz_Algorithm.c,301 :: 		if(a==0)
	MOV.B	[W14+103], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4181
	GOTO	L_Vz_Algorithm_3_461
L__Vz_Algorithm_3_4181:
;Vz_Algorithm.c,303 :: 		C2=2;
	MOV	#2, W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,304 :: 		if(C0>SwitchN) {ST=2;tC=0;dC=1;C0=0;C1=0;}
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4182
	GOTO	L_Vz_Algorithm_3_462
L__Vz_Algorithm_3_4182:
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
L_Vz_Algorithm_3_462:
;Vz_Algorithm.c,305 :: 		} //if(a==0)
	GOTO	L_Vz_Algorithm_3_463
L_Vz_Algorithm_3_461:
;Vz_Algorithm.c,306 :: 		else if(a==2)
	MOV.B	[W14+103], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4183
	GOTO	L_Vz_Algorithm_3_464
L__Vz_Algorithm_3_4183:
;Vz_Algorithm.c,308 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,309 :: 		if(C2>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4184
	GOTO	L_Vz_Algorithm_3_465
L__Vz_Algorithm_3_4184:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_465:
;Vz_Algorithm.c,310 :: 		}//else if(a==0)
L_Vz_Algorithm_3_464:
L_Vz_Algorithm_3_463:
;Vz_Algorithm.c,311 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,312 :: 		case    2:
L_Vz_Algorithm_3_466:
;Vz_Algorithm.c,314 :: 		if(tC<PeakBuffer_MaxLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA LT	L__Vz_Algorithm_3_4185
	GOTO	L_Vz_Algorithm_3_467
L__Vz_Algorithm_3_4185:
;Vz_Algorithm.c,316 :: 		PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
	MOV	Vz_Algorithm_3_4_tC_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W2
	MOV	#102, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W2]
;Vz_Algorithm.c,317 :: 		if(tC>FilterLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#118, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4186
	GOTO	L_Vz_Algorithm_3_468
L__Vz_Algorithm_3_4186:
;Vz_Algorithm.c,319 :: 		PeakBufferTag=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_PeakBufferTag_L0
;Vz_Algorithm.c,320 :: 		for(i=0;i<FilterLength;i++)
	CLR	W0
	MOV.B	W0, [W14+104]
L_Vz_Algorithm_3_469:
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W1
	MOV	#118, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4187
	GOTO	L_Vz_Algorithm_3_470
L__Vz_Algorithm_3_4187:
;Vz_Algorithm.c,322 :: 		PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUBR	W1, [W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, W10
	CALL	_abs
	MOV	[W14+118], W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBufferTag_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,320 :: 		for(i=0;i<FilterLength;i++)
	MOV.B	[W14+104], W1
	MOV	#104, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,323 :: 		}
	GOTO	L_Vz_Algorithm_3_469
L_Vz_Algorithm_3_470:
;Vz_Algorithm.c,324 :: 		if(PeakBufferTag>DIpoint)
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4188
	GOTO	L_Vz_Algorithm_3_472
L__Vz_Algorithm_3_4188:
;Vz_Algorithm.c,326 :: 		DIpoint=PeakBufferTag;
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W0
	MOV	W0, Vz_Algorithm_3_4_DIpoint_L0
;Vz_Algorithm.c,327 :: 		DXpoint=tC-(FilterLength/2);
	MOV	[W14+118], W3
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W3, W2
	MOV	W0, W2
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W1
	MOV	#lo_addr(Vz_Algorithm_3_4_DXpoint_L0), W0
	SUBR	W2, [W1], [W0]
;Vz_Algorithm.c,328 :: 		}
L_Vz_Algorithm_3_472:
;Vz_Algorithm.c,329 :: 		}
L_Vz_Algorithm_3_468:
;Vz_Algorithm.c,330 :: 		}
	GOTO	L_Vz_Algorithm_3_473
L_Vz_Algorithm_3_467:
;Vz_Algorithm.c,331 :: 		else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	#103, W0
	ADD	W14, W0, W0
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
;Vz_Algorithm.c,333 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,334 :: 		if(a==1)
	MOV.B	[W14+103], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4189
	GOTO	L_Vz_Algorithm_3_474
L__Vz_Algorithm_3_4189:
;Vz_Algorithm.c,336 :: 		C2=2;
	MOV	#2, W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,337 :: 		if(C1>SwitchN)
	MOV	Vz_Algorithm_3_4_C1_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4190
	GOTO	L_Vz_Algorithm_3_475
L__Vz_Algorithm_3_4190:
;Vz_Algorithm.c,339 :: 		ST=3;tC=0;C0=0;C1=0;
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,340 :: 		}
L_Vz_Algorithm_3_475:
;Vz_Algorithm.c,341 :: 		}//if(a==1)
	GOTO	L_Vz_Algorithm_3_476
L_Vz_Algorithm_3_474:
;Vz_Algorithm.c,342 :: 		else if(a==2)
	MOV.B	[W14+103], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4191
	GOTO	L_Vz_Algorithm_3_477
L__Vz_Algorithm_3_4191:
;Vz_Algorithm.c,344 :: 		C1=1;
	MOV	#1, W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,345 :: 		if(C2>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4192
	GOTO	L_Vz_Algorithm_3_478
L__Vz_Algorithm_3_4192:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_478:
;Vz_Algorithm.c,346 :: 		}//else if(a==2)
L_Vz_Algorithm_3_477:
L_Vz_Algorithm_3_476:
;Vz_Algorithm.c,347 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,348 :: 		case    3:
L_Vz_Algorithm_3_479:
;Vz_Algorithm.c,349 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,350 :: 		if((a==1)&&(tC>MaxNBeforeSmPeak))
	MOV.B	[W14+103], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4193
	GOTO	L__Vz_Algorithm_3_4137
L__Vz_Algorithm_3_4193:
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#114, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4194
	GOTO	L__Vz_Algorithm_3_4136
L__Vz_Algorithm_3_4194:
L__Vz_Algorithm_3_4135:
;Vz_Algorithm.c,353 :: 		sprintf(txt,"NSP %d\n",(int)NoSmallPeak);
	MOV	#120, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	ADD	W14, #0, W1
	PUSH	W0
	MOV	#lo_addr(?lstr_3_Vz_Algorithm), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
;Vz_Algorithm.c,354 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
;Vz_Algorithm.c,356 :: 		NoSmallPeak=1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+120]
;Vz_Algorithm.c,357 :: 		ST=5;tC=0;C1=0;C2=0;
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,350 :: 		if((a==1)&&(tC>MaxNBeforeSmPeak))
L__Vz_Algorithm_3_4137:
L__Vz_Algorithm_3_4136:
;Vz_Algorithm.c,359 :: 		if(a==2)
	MOV.B	[W14+103], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4195
	GOTO	L_Vz_Algorithm_3_483
L__Vz_Algorithm_3_4195:
;Vz_Algorithm.c,361 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,362 :: 		if(C2>SwitchN) {ST=4;tC=0;C0=0;C2=0;NoSmallPeak=0;}
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4196
	GOTO	L_Vz_Algorithm_3_484
L__Vz_Algorithm_3_4196:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
	CLR	W0
	MOV.B	W0, [W14+120]
L_Vz_Algorithm_3_484:
;Vz_Algorithm.c,363 :: 		}
	GOTO	L_Vz_Algorithm_3_485
L_Vz_Algorithm_3_483:
;Vz_Algorithm.c,364 :: 		else if(a==0)
	MOV.B	[W14+103], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4197
	GOTO	L_Vz_Algorithm_3_486
L__Vz_Algorithm_3_4197:
;Vz_Algorithm.c,366 :: 		C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,367 :: 		if(C0>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4198
	GOTO	L_Vz_Algorithm_3_487
L__Vz_Algorithm_3_4198:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_487:
;Vz_Algorithm.c,368 :: 		}
L_Vz_Algorithm_3_486:
L_Vz_Algorithm_3_485:
;Vz_Algorithm.c,369 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,370 :: 		case    4:
L_Vz_Algorithm_3_488:
;Vz_Algorithm.c,372 :: 		if(tC<PeakBuffer_MaxLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA LT	L__Vz_Algorithm_3_4199
	GOTO	L_Vz_Algorithm_3_489
L__Vz_Algorithm_3_4199:
;Vz_Algorithm.c,374 :: 		PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
	MOV	Vz_Algorithm_3_4_tC_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W2
	MOV	#102, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W2]
;Vz_Algorithm.c,375 :: 		if(tC>FilterLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#118, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4200
	GOTO	L_Vz_Algorithm_3_490
L__Vz_Algorithm_3_4200:
;Vz_Algorithm.c,377 :: 		PeakBufferTag=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_PeakBufferTag_L0
;Vz_Algorithm.c,378 :: 		for(i=0;i<FilterLength;i++)
	CLR	W0
	MOV.B	W0, [W14+104]
L_Vz_Algorithm_3_491:
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W1
	MOV	#118, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4201
	GOTO	L_Vz_Algorithm_3_492
L__Vz_Algorithm_3_4201:
;Vz_Algorithm.c,380 :: 		PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUBR	W1, [W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, W10
	CALL	_abs
	MOV	[W14+118], W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBufferTag_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,378 :: 		for(i=0;i<FilterLength;i++)
	MOV.B	[W14+104], W1
	MOV	#104, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,381 :: 		}
	GOTO	L_Vz_Algorithm_3_491
L_Vz_Algorithm_3_492:
;Vz_Algorithm.c,382 :: 		if(PeakBufferTag>U1Ipoint)
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4202
	GOTO	L_Vz_Algorithm_3_494
L__Vz_Algorithm_3_4202:
;Vz_Algorithm.c,384 :: 		U1Ipoint=PeakBufferTag;
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W0
	MOV	W0, Vz_Algorithm_3_4_U1Ipoint_L0
;Vz_Algorithm.c,386 :: 		}
L_Vz_Algorithm_3_494:
;Vz_Algorithm.c,387 :: 		}
L_Vz_Algorithm_3_490:
;Vz_Algorithm.c,388 :: 		}
	GOTO	L_Vz_Algorithm_3_495
L_Vz_Algorithm_3_489:
;Vz_Algorithm.c,389 :: 		else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	#103, W0
	ADD	W14, W0, W0
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
;Vz_Algorithm.c,391 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,392 :: 		if(a==1)
	MOV.B	[W14+103], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4203
	GOTO	L_Vz_Algorithm_3_496
L__Vz_Algorithm_3_4203:
;Vz_Algorithm.c,394 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,395 :: 		if(C1>SwitchN) {ST=5;tC=0;C1=0;C2=0;}
	MOV	Vz_Algorithm_3_4_C1_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4204
	GOTO	L_Vz_Algorithm_3_497
L__Vz_Algorithm_3_4204:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
L_Vz_Algorithm_3_497:
;Vz_Algorithm.c,396 :: 		}
	GOTO	L_Vz_Algorithm_3_498
L_Vz_Algorithm_3_496:
;Vz_Algorithm.c,397 :: 		else if(a==0)
	MOV.B	[W14+103], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4205
	GOTO	L_Vz_Algorithm_3_499
L__Vz_Algorithm_3_4205:
;Vz_Algorithm.c,399 :: 		C1=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,400 :: 		if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4206
	GOTO	L_Vz_Algorithm_3_4100
L__Vz_Algorithm_3_4206:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_4100:
;Vz_Algorithm.c,401 :: 		}
L_Vz_Algorithm_3_499:
L_Vz_Algorithm_3_498:
;Vz_Algorithm.c,402 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,403 :: 		case    5:
L_Vz_Algorithm_3_4101:
;Vz_Algorithm.c,404 :: 		if(a==2)
	MOV.B	[W14+103], W0
	CP.B	W0, #2
	BRA Z	L__Vz_Algorithm_3_4207
	GOTO	L_Vz_Algorithm_3_4102
L__Vz_Algorithm_3_4207:
;Vz_Algorithm.c,406 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,407 :: 		if(C2>SwitchN) {ST=6;tC=0;C1=0;C2=0;}
	MOV	Vz_Algorithm_3_4_C2_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4208
	GOTO	L_Vz_Algorithm_3_4103
L__Vz_Algorithm_3_4208:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_tC_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
L_Vz_Algorithm_3_4103:
;Vz_Algorithm.c,408 :: 		}
	GOTO	L_Vz_Algorithm_3_4104
L_Vz_Algorithm_3_4102:
;Vz_Algorithm.c,409 :: 		else if(a==0)
	MOV.B	[W14+103], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4209
	GOTO	L_Vz_Algorithm_3_4105
L__Vz_Algorithm_3_4209:
;Vz_Algorithm.c,411 :: 		C2=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C2_L0
;Vz_Algorithm.c,412 :: 		if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4210
	GOTO	L_Vz_Algorithm_3_4106
L__Vz_Algorithm_3_4210:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_4106:
;Vz_Algorithm.c,413 :: 		}
L_Vz_Algorithm_3_4105:
L_Vz_Algorithm_3_4104:
;Vz_Algorithm.c,414 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,415 :: 		case    6:
L_Vz_Algorithm_3_4107:
;Vz_Algorithm.c,417 :: 		if(tC<PeakBuffer_MaxLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA LT	L__Vz_Algorithm_3_4211
	GOTO	L_Vz_Algorithm_3_4108
L__Vz_Algorithm_3_4211:
;Vz_Algorithm.c,419 :: 		PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
	MOV	Vz_Algorithm_3_4_tC_L0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W2
	MOV	#102, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W2]
;Vz_Algorithm.c,420 :: 		if(tC>FilterLength)
	MOV	Vz_Algorithm_3_4_tC_L0, W1
	MOV	#118, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4212
	GOTO	L_Vz_Algorithm_3_4109
L__Vz_Algorithm_3_4212:
;Vz_Algorithm.c,422 :: 		PeakBufferTag=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_PeakBufferTag_L0
;Vz_Algorithm.c,423 :: 		for(i=0;i<FilterLength;i++)
	CLR	W0
	MOV.B	W0, [W14+104]
L_Vz_Algorithm_3_4110:
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W1
	MOV	#118, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA LT	L__Vz_Algorithm_3_4213
	GOTO	L_Vz_Algorithm_3_4111
L__Vz_Algorithm_3_4213:
;Vz_Algorithm.c,425 :: 		PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUBR	W1, [W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBuffer_L0), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, W10
	CALL	_abs
	MOV	[W14+118], W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_PeakBufferTag_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,423 :: 		for(i=0;i<FilterLength;i++)
	MOV.B	[W14+104], W1
	MOV	#104, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,426 :: 		}
	GOTO	L_Vz_Algorithm_3_4110
L_Vz_Algorithm_3_4111:
;Vz_Algorithm.c,427 :: 		if(PeakBufferTag>U2Ipoint)
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4214
	GOTO	L_Vz_Algorithm_3_4113
L__Vz_Algorithm_3_4214:
;Vz_Algorithm.c,429 :: 		U2Ipoint=PeakBufferTag;
	MOV	Vz_Algorithm_3_4_PeakBufferTag_L0, W0
	MOV	W0, Vz_Algorithm_3_4_U2Ipoint_L0
;Vz_Algorithm.c,430 :: 		U2Xpoint=tC-(FilterLength/2);
	MOV	[W14+118], W3
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W3, W2
	MOV	W0, W2
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Xpoint_L0), W0
	SUBR	W2, [W1], [W0]
;Vz_Algorithm.c,431 :: 		}
L_Vz_Algorithm_3_4113:
;Vz_Algorithm.c,432 :: 		}
L_Vz_Algorithm_3_4109:
;Vz_Algorithm.c,433 :: 		}
	GOTO	L_Vz_Algorithm_3_4114
L_Vz_Algorithm_3_4108:
;Vz_Algorithm.c,434 :: 		else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
	MOV	#103, W0
	ADD	W14, W0, W0
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
;Vz_Algorithm.c,436 :: 		tC++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,437 :: 		if(a==1)
	MOV.B	[W14+103], W0
	CP.B	W0, #1
	BRA Z	L__Vz_Algorithm_3_4215
	GOTO	L_Vz_Algorithm_3_4115
L__Vz_Algorithm_3_4215:
;Vz_Algorithm.c,439 :: 		C0=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C0_L0
;Vz_Algorithm.c,440 :: 		if(C1>SwitchN)
	MOV	Vz_Algorithm_3_4_C1_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4216
	GOTO	L_Vz_Algorithm_3_4116
L__Vz_Algorithm_3_4216:
;Vz_Algorithm.c,443 :: 		ResultT=dC-tC+U2Xpoint-DXpoint;
	MOV	Vz_Algorithm_3_4_dC_L0, W1
	MOV	#lo_addr(Vz_Algorithm_3_4_tC_L0), W0
	SUB	W1, [W0], W1
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Xpoint_L0), W0
	ADD	W1, [W0], W2
	MOV	#lo_addr(Vz_Algorithm_3_4_DXpoint_L0), W1
	MOV	#100, W0
	ADD	W14, W0, W0
	SUB	W2, [W1], [W0]
;Vz_Algorithm.c,444 :: 		AveResultT=(int)((float)(((float)((10000.0-(float)alpha)*(float)AveResultT)+(float)((float)alpha*(float)ResultT))/10000.0));
	MOV	[W14+116], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, [W14+134]
	MOV	W1, [W14+136]
	MOV	#16384, W0
	MOV	#17948, W1
	MOV	[W14+134], W2
	MOV	[W14+136], W3
	CALL	__Sub_FP
	MOV	W0, [W14+130]
	MOV	W1, [W14+132]
	MOV	Vz_Algorithm_3_4_AveResultT_L0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+130], W2
	MOV	[W14+132], W3
	CALL	__Mul_FP
	MOV.D	W0, W2
	MOV	[W14+134], W0
	MOV	[W14+136], W1
	MOV	W2, [W14+134]
	MOV	W3, [W14+136]
	MOV	W0, [W14+130]
	MOV	W1, [W14+132]
	MOV	[W14+100], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+130], W2
	MOV	[W14+132], W3
	CALL	__Mul_FP
	MOV	[W14+134], W2
	MOV	[W14+136], W3
	CALL	__AddSub_FP
	MOV	#16384, W2
	MOV	#17948, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, Vz_Algorithm_3_4_AveResultT_L0
;Vz_Algorithm.c,446 :: 		sprintf(txt,"%d,%d,%d,%d,%d\n",ResultT,AveResultT,U1Ipoint,U2Ipoint,DIpoint);
	ADD	W14, #0, W2
	MOV	#lo_addr(Vz_Algorithm_3_4_DIpoint_L0), W1
	PUSH	[W1]
	MOV	#lo_addr(Vz_Algorithm_3_4_U2Ipoint_L0), W1
	PUSH	[W1]
	MOV	#lo_addr(Vz_Algorithm_3_4_U1Ipoint_L0), W1
	PUSH	[W1]
	PUSH	W0
	MOV	#100, W0
	ADD	W14, W0, W0
	PUSH	[W0]
	MOV	#lo_addr(?lstr_4_Vz_Algorithm), W0
	PUSH	W0
	PUSH	W2
	CALL	_sprintf
	SUB	#14, W15
;Vz_Algorithm.c,447 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
;Vz_Algorithm.c,450 :: 		U1Ipoint=0;DIpoint=0;U2Ipoint=0;ST=1;tC=0;C1=0;C2=0;
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
;Vz_Algorithm.c,451 :: 		}
L_Vz_Algorithm_3_4116:
;Vz_Algorithm.c,452 :: 		}
	GOTO	L_Vz_Algorithm_3_4117
L_Vz_Algorithm_3_4115:
;Vz_Algorithm.c,453 :: 		else if(a==0)
	MOV.B	[W14+103], W0
	CP.B	W0, #0
	BRA Z	L__Vz_Algorithm_3_4217
	GOTO	L_Vz_Algorithm_3_4118
L__Vz_Algorithm_3_4217:
;Vz_Algorithm.c,455 :: 		C1=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_3_4_C1_L0
;Vz_Algorithm.c,456 :: 		if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
	MOV	Vz_Algorithm_3_4_C0_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_3_4218
	GOTO	L_Vz_Algorithm_3_4119
L__Vz_Algorithm_3_4218:
	MOV	#103, W0
	ADD	W14, W0, W0
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
L_Vz_Algorithm_3_4119:
;Vz_Algorithm.c,457 :: 		}
L_Vz_Algorithm_3_4118:
L_Vz_Algorithm_3_4117:
;Vz_Algorithm.c,458 :: 		break;
	GOTO	L_Vz_Algorithm_3_453
;Vz_Algorithm.c,459 :: 		}
L_Vz_Algorithm_3_452:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Vz_Algorithm_3_4219
	GOTO	L_Vz_Algorithm_3_454
L__Vz_Algorithm_3_4219:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Vz_Algorithm_3_4220
	GOTO	L_Vz_Algorithm_3_460
L__Vz_Algorithm_3_4220:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Vz_Algorithm_3_4221
	GOTO	L_Vz_Algorithm_3_466
L__Vz_Algorithm_3_4221:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__Vz_Algorithm_3_4222
	GOTO	L_Vz_Algorithm_3_479
L__Vz_Algorithm_3_4222:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__Vz_Algorithm_3_4223
	GOTO	L_Vz_Algorithm_3_488
L__Vz_Algorithm_3_4223:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__Vz_Algorithm_3_4224
	GOTO	L_Vz_Algorithm_3_4101
L__Vz_Algorithm_3_4224:
	MOV	#lo_addr(Vz_Algorithm_3_4_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Vz_Algorithm_3_4225
	GOTO	L_Vz_Algorithm_3_4107
L__Vz_Algorithm_3_4225:
L_Vz_Algorithm_3_453:
;Vz_Algorithm.c,265 :: 		for(k=0;k<60;k++)
	MOV.B	[W14+102], W1
	MOV	#102, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,460 :: 		}//for(k=0;k<60;k++)
	GOTO	L_Vz_Algorithm_3_445
L_Vz_Algorithm_3_446:
;Vz_Algorithm.c,461 :: 		}
L_end_Vz_Algorithm_3_4:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Vz_Algorithm_3_4

_uError_Algo_3_4:
	LNK	#50

;Vz_Algorithm.c,463 :: 		void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint)
	MOV	[W14-8], W0
	MOV	W0, [W14-8]
	MOV	[W14-10], W0
	MOV	W0, [W14-10]
	MOV	[W14-12], W0
	MOV	W0, [W14-12]
	MOV	[W14-14], W0
	MOV	W0, [W14-14]
	MOV	[W14-16], W0
	MOV	W0, [W14-16]
	MOV	[W14-18], W0
	MOV	W0, [W14-18]
;Vz_Algorithm.c,467 :: 		sprintf(txt,"Error: ST-%d;a-%d\n",(int)ST,(int)a);
	ADD	W14, #0, W1
	MOV	#lo_addr(?lstr_5_Vz_Algorithm), W0
	PUSH.D	W12
	PUSH	W10
	PUSH	W11
	PUSH	W10
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#8, W15
;Vz_Algorithm.c,468 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
	POP	W10
	POP.D	W12
;Vz_Algorithm.c,470 :: 		*ST=0;*tC=0;*dC=0;*C0=0;*C1=0;*C2=0;*U1Ipoint=0;*U2Ipoint=0;*DIpoint=0;
	CLR	W0
	MOV.B	W0, [W10]
	CLR	W0
	MOV	W0, [W12]
	CLR	W0
	MOV	W0, [W13]
	MOV	[W14-8], W1
	CLR	W0
	MOV	W0, [W1]
	MOV	[W14-10], W1
	CLR	W0
	MOV	W0, [W1]
	MOV	[W14-12], W1
	CLR	W0
	MOV	W0, [W1]
	MOV	[W14-14], W1
	CLR	W0
	MOV	W0, [W1]
	MOV	[W14-16], W1
	CLR	W0
	MOV	W0, [W1]
	MOV	[W14-18], W1
	CLR	W0
	MOV	W0, [W1]
;Vz_Algorithm.c,471 :: 		}
L_end_uError_Algo_3_4:
	ULNK
	RETURN
; end of _uError_Algo_3_4

_Vz_Algorithm_2:
	LNK	#120

;Vz_Algorithm.c,473 :: 		void Vz_Algorithm_2(void)//Motion detector
;Vz_Algorithm.c,485 :: 		int SPC=4000;               //Parametr IN
	PUSH	W10
	MOV	#106, W1
	ADD	W14, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSVz_Algorithm_2_SPC_L0), W0
	REPEAT	#4
	MOV	[W0++], [W1++]
;Vz_Algorithm.c,486 :: 		int Yv_th=2000;             //Parametr IN
;Vz_Algorithm.c,487 :: 		int minStartN=10;           //Parametr IN
;Vz_Algorithm.c,488 :: 		int minStopN=10;            //Parametr IN
;Vz_Algorithm.c,490 :: 		int minResult=200;          //Parametr IN
;Vz_Algorithm.c,501 :: 		OpticDataGetFrame_VelocityOnly();
	CALL	_OpticDataGetFrame_VelocityOnly
;Vz_Algorithm.c,502 :: 		MaxNBeforeStop=SPC/4;
	MOV	[W14+106], W0
	MOV	#4, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, [W14+100]
;Vz_Algorithm.c,503 :: 		for(k=0;k<60;k++)
	CLR	W0
	MOV.B	W0, [W14+104]
L_Vz_Algorithm_2120:
	MOV.B	[W14+104], W1
	MOV.B	#60, W0
	CP.B	W1, W0
	BRA LTU	L__Vz_Algorithm_2228
	GOTO	L_Vz_Algorithm_2121
L__Vz_Algorithm_2228:
;Vz_Algorithm.c,505 :: 		Y=(Vz_Sensor_Velocity_Buffer_int[k]/256)*(Vz_Sensor_Velocity_Buffer_int[k]/256);
	MOV	#104, W0
	ADD	W14, W0, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Vz_Sensor_Velocity_Buffer_int), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+118]
	MOV	[W0], W0
	MOV	#256, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W1
	MOV	[W14+118], W0
	MOV	W1, [W14+118]
	MOV	[W0], W0
	MOV	#256, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV	[W14+118], W0
	MUL.SS	W0, W2, W0
; Y start address is: 4 (W2)
	MOV	W0, W2
;Vz_Algorithm.c,506 :: 		switch (ST)
	GOTO	L_Vz_Algorithm_2123
;Vz_Algorithm.c,508 :: 		case    1:
L_Vz_Algorithm_2125:
;Vz_Algorithm.c,509 :: 		cCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_cCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,510 :: 		if(Y>Yv_th)
	MOV	#108, W0
	ADD	W14, W0, W0
	CP	W2, [W0]
	BRA GT	L__Vz_Algorithm_2229
	GOTO	L_Vz_Algorithm_2126
L__Vz_Algorithm_2229:
; Y end address is: 4 (W2)
;Vz_Algorithm.c,512 :: 		upCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_upCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,513 :: 		if(upCounter>minStopN) dnCounter=0;
	MOV	Vz_Algorithm_2_upCounter_L0, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2230
	GOTO	L_Vz_Algorithm_2127
L__Vz_Algorithm_2230:
	CLR	W0
	MOV	W0, Vz_Algorithm_2_dnCounter_L0
L_Vz_Algorithm_2127:
;Vz_Algorithm.c,514 :: 		}
	GOTO	L_Vz_Algorithm_2128
L_Vz_Algorithm_2126:
;Vz_Algorithm.c,517 :: 		if(dnCounter>MaxNBeforeStop)
	MOV	Vz_Algorithm_2_dnCounter_L0, W1
	MOV	#100, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2231
	GOTO	L_Vz_Algorithm_2129
L__Vz_Algorithm_2231:
;Vz_Algorithm.c,519 :: 		ST=0;
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W1
	CLR	W0
	MOV.B	W0, [W1]
;Vz_Algorithm.c,520 :: 		Res=cCounter-dnCounter;
	MOV	Vz_Algorithm_2_cCounter_L0, W1
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	SUB	W1, [W0], W1
	MOV	W1, [W14+102]
;Vz_Algorithm.c,521 :: 		if(Res>minResult)
	MOV	#114, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2232
	GOTO	L_Vz_Algorithm_2130
L__Vz_Algorithm_2232:
;Vz_Algorithm.c,525 :: 		sprintf(txt,"%d\n",Res);
	ADD	W14, #0, W1
	MOV	#102, W0
	ADD	W14, W0, W0
	PUSH	[W0]
	MOV	#lo_addr(?lstr_6_Vz_Algorithm), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
;Vz_Algorithm.c,526 :: 		Pseudo_Uart2_Write_Text(txt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Pseudo_Uart2_Write_Text
;Vz_Algorithm.c,528 :: 		}//if(Res>minResult)
L_Vz_Algorithm_2130:
;Vz_Algorithm.c,529 :: 		cCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_cCounter_L0
;Vz_Algorithm.c,530 :: 		}//if(dnCounter>MaxNBeforeStop)
L_Vz_Algorithm_2129:
;Vz_Algorithm.c,531 :: 		dnCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,532 :: 		upCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_upCounter_L0
;Vz_Algorithm.c,533 :: 		}//if(Y>Yv_th)
L_Vz_Algorithm_2128:
;Vz_Algorithm.c,534 :: 		break;
	GOTO	L_Vz_Algorithm_2124
;Vz_Algorithm.c,536 :: 		case    0:
L_Vz_Algorithm_2131:
;Vz_Algorithm.c,537 :: 		if(Y>Yv_th)
; Y start address is: 4 (W2)
	MOV	#108, W0
	ADD	W14, W0, W0
	CP	W2, [W0]
	BRA GT	L__Vz_Algorithm_2233
	GOTO	L_Vz_Algorithm_2132
L__Vz_Algorithm_2233:
; Y end address is: 4 (W2)
;Vz_Algorithm.c,539 :: 		if(upCounter>minStartN) ST=1;
	MOV	Vz_Algorithm_2_upCounter_L0, W1
	MOV	#110, W0
	ADD	W14, W0, W0
	CP	W1, [W0]
	BRA GT	L__Vz_Algorithm_2234
	GOTO	L_Vz_Algorithm_2133
L__Vz_Algorithm_2234:
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_Vz_Algorithm_2133:
;Vz_Algorithm.c,540 :: 		upCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_upCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,541 :: 		dnCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_dnCounter_L0
;Vz_Algorithm.c,542 :: 		}//if(Y>Yv_th)
	GOTO	L_Vz_Algorithm_2134
L_Vz_Algorithm_2132:
;Vz_Algorithm.c,545 :: 		dnCounter++;
	MOV	#1, W1
	MOV	#lo_addr(Vz_Algorithm_2_dnCounter_L0), W0
	ADD	W1, [W0], [W0]
;Vz_Algorithm.c,546 :: 		upCounter=0;
	CLR	W0
	MOV	W0, Vz_Algorithm_2_upCounter_L0
;Vz_Algorithm.c,547 :: 		}
L_Vz_Algorithm_2134:
;Vz_Algorithm.c,548 :: 		break;
	GOTO	L_Vz_Algorithm_2124
;Vz_Algorithm.c,549 :: 		}
L_Vz_Algorithm_2123:
; Y start address is: 4 (W2)
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Vz_Algorithm_2235
	GOTO	L_Vz_Algorithm_2125
L__Vz_Algorithm_2235:
	MOV	#lo_addr(Vz_Algorithm_2_ST_L0), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Vz_Algorithm_2236
	GOTO	L_Vz_Algorithm_2131
L__Vz_Algorithm_2236:
; Y end address is: 4 (W2)
L_Vz_Algorithm_2124:
;Vz_Algorithm.c,503 :: 		for(k=0;k<60;k++)
	MOV.B	[W14+104], W1
	MOV	#104, W0
	ADD	W14, W0, W0
	ADD.B	W1, #1, [W0]
;Vz_Algorithm.c,550 :: 		}//for(k=0;k<60;k++)
	GOTO	L_Vz_Algorithm_2120
L_Vz_Algorithm_2121:
;Vz_Algorithm.c,551 :: 		}
L_end_Vz_Algorithm_2:
	POP	W10
	ULNK
	RETURN
; end of _Vz_Algorithm_2

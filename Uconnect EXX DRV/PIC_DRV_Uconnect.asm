
_BoardInit:

;PIC_DRV_Uconnect.c,7 :: 		void BoardInit (void)
;PIC_DRV_Uconnect.c,9 :: 		OSCCON=0x3300;    //32MHZ
	PUSH	W10
	PUSH	W11
	MOV	#13056, W0
	MOV	WREG, OSCCON
;PIC_DRV_Uconnect.c,10 :: 		CLKDIV = 0x3120;  //32MHZ
	MOV	#12576, W0
	MOV	WREG, CLKDIV
;PIC_DRV_Uconnect.c,13 :: 		OSCTUN = 0x0000;
	CLR	OSCTUN
;PIC_DRV_Uconnect.c,14 :: 		REFOCONL = 0x0000;
	CLR	REFOCONL
;PIC_DRV_Uconnect.c,15 :: 		REFOCONH = 0x0000;
	CLR	REFOCONH
;PIC_DRV_Uconnect.c,16 :: 		REFOTRIML = 0x0000;
	CLR	REFOTRIML
;PIC_DRV_Uconnect.c,17 :: 		DCOTUN = 0x0000;
	CLR	DCOTUN
;PIC_DRV_Uconnect.c,18 :: 		DCOCON = 0x0700;
	MOV	#1792, W0
	MOV	WREG, DCOCON
;PIC_DRV_Uconnect.c,19 :: 		OSCDIV = 0x0000;
	CLR	OSCDIV
;PIC_DRV_Uconnect.c,20 :: 		OSCFDIV = 0x0000;
	CLR	OSCFDIV
;PIC_DRV_Uconnect.c,21 :: 		RCON = 0x0000;
	CLR	RCON
;PIC_DRV_Uconnect.c,25 :: 		IOCPDB = 0x0000;
	CLR	IOCPDB
;PIC_DRV_Uconnect.c,26 :: 		IOCPDC = 0x0000;
	CLR	IOCPDC
;PIC_DRV_Uconnect.c,27 :: 		IOCPDD = 0x0000;
	CLR	IOCPDD
;PIC_DRV_Uconnect.c,28 :: 		IOCPDE = 0x0000;
	CLR	IOCPDE
;PIC_DRV_Uconnect.c,29 :: 		IOCPDF = 0x0000;
	CLR	IOCPDF
;PIC_DRV_Uconnect.c,30 :: 		IOCPDG = 0x0000;
	CLR	IOCPDG
;PIC_DRV_Uconnect.c,31 :: 		IOCPUB = 0x0000;
	CLR	IOCPUB
;PIC_DRV_Uconnect.c,32 :: 		IOCPUC = 0x0000;
	CLR	IOCPUC
;PIC_DRV_Uconnect.c,33 :: 		IOCPUD = 0x0000;
	CLR	IOCPUD
;PIC_DRV_Uconnect.c,34 :: 		IOCPUE = 0x0000;
	CLR	IOCPUE
;PIC_DRV_Uconnect.c,35 :: 		IOCPUF = 0x0000;
	CLR	IOCPUF
;PIC_DRV_Uconnect.c,36 :: 		IOCPUG = 0x0000;
	CLR	IOCPUG
;PIC_DRV_Uconnect.c,40 :: 		ODCB = 0x0000;
	CLR	ODCB
;PIC_DRV_Uconnect.c,41 :: 		ODCC = 0x0000;
	CLR	ODCC
;PIC_DRV_Uconnect.c,42 :: 		ODCD = 0x0000;
	CLR	ODCD
;PIC_DRV_Uconnect.c,43 :: 		ODCE = 0x0000;
	CLR	ODCE
;PIC_DRV_Uconnect.c,44 :: 		ODCF = 0x0000;
	CLR	ODCF
;PIC_DRV_Uconnect.c,45 :: 		ODCG = 0x0000;
	CLR	ODCG
;PIC_DRV_Uconnect.c,49 :: 		PMD1=0xFF80; //Uart1/2,SPI
	MOV	#65408, W0
	MOV	WREG, PMD1
;PIC_DRV_Uconnect.c,50 :: 		PMD2=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PMD2
;PIC_DRV_Uconnect.c,51 :: 		PMD3=0xFDFF;//RTC is enabled
	MOV	#65023, W0
	MOV	WREG, PMD3
;PIC_DRV_Uconnect.c,52 :: 		PMD4=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PMD4
;PIC_DRV_Uconnect.c,53 :: 		PMD5=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PMD5
;PIC_DRV_Uconnect.c,54 :: 		PMD6=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PMD6
;PIC_DRV_Uconnect.c,55 :: 		PMD7=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PMD7
;PIC_DRV_Uconnect.c,56 :: 		PMD8=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PMD8
;PIC_DRV_Uconnect.c,60 :: 		OSCCONL=OSCCONL&0xbf; // unlock PPS
	MOV	#191, W1
	MOV	#lo_addr(OSCCONL), W0
	AND	W1, [W0], [W0]
;PIC_DRV_Uconnect.c,62 :: 		RPOR12bits.RP25R = 0x0003;   //RD4->UART1:U1TX;
	MOV	#768, W0
	MOV	W0, W1
	MOV	#lo_addr(RPOR12bits), W0
	XOR	W1, [W0], W1
	MOV	#32512, W0
	AND	W1, W0, W1
	MOV	#lo_addr(RPOR12bits), W0
	XOR	W1, [W0], W1
	MOV	W1, RPOR12bits
;PIC_DRV_Uconnect.c,63 :: 		RPINR18bits.U1RXR = 0x0014;   //RD5->UART1:U1RX;
	MOV.B	#20, W0
	MOV.B	W0, W1
	MOV	#lo_addr(RPINR18bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(RPINR18bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(RPINR18bits), W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,64 :: 		RPOR8bits.RP17R = 0x0008;   //RF5->SPI1:SCK1OUT;
	MOV	#2048, W0
	MOV	W0, W1
	MOV	#lo_addr(RPOR8bits), W0
	XOR	W1, [W0], W1
	MOV	#32512, W0
	AND	W1, W0, W1
	MOV	#lo_addr(RPOR8bits), W0
	XOR	W1, [W0], W1
	MOV	W1, RPOR8bits
;PIC_DRV_Uconnect.c,65 :: 		RPOR15bits.RP30R = 0x0007;   //RF2->SPI1:SDO1;
	MOV.B	#7, W0
	MOV.B	W0, W1
	MOV	#lo_addr(RPOR15bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#127, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(RPOR15bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(RPOR15bits), W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,66 :: 		RPINR20bits.SDI1R = 0x0010;   //RF3->SPI1:SDI1;
	MOV.B	#16, W0
	MOV.B	W0, W1
	MOV	#lo_addr(RPINR20bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(RPINR20bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(RPINR20bits), W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,67 :: 		RPINR19bits.U2RXR = 0x000C;   //RD11->UART2:U2RX;
	MOV.B	#12, W0
	MOV.B	W0, W1
	MOV	#lo_addr(RPINR19bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(RPINR19bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(RPINR19bits), W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,68 :: 		RPOR1bits.RP3R = 0x0005;   //RD10->UART2:U2TX;
	MOV	#1280, W0
	MOV	W0, W1
	MOV	#lo_addr(RPOR1bits), W0
	XOR	W1, [W0], W1
	MOV	#32512, W0
	AND	W1, W0, W1
	MOV	#lo_addr(RPOR1bits), W0
	XOR	W1, [W0], W1
	MOV	W1, RPOR1bits
;PIC_DRV_Uconnect.c,70 :: 		OSCCONL=OSCCONL|0x40; // lock   PPS
	MOV	#64, W1
	MOV	#lo_addr(OSCCONL), W0
	IOR	W1, [W0], [W0]
;PIC_DRV_Uconnect.c,72 :: 		RST_MIKROBUS_MRXSTX5_Lat=0;
	BCLR.B	LATE, #5
;PIC_DRV_Uconnect.c,73 :: 		RST_MIKROBUS_MRXSTX5_Tris=OUTPUT;
	BCLR.B	TRISE, #5
;PIC_DRV_Uconnect.c,75 :: 		SW_LIGHT_SENSOR_Lat=0;
	BCLR.B	LATE, #6
;PIC_DRV_Uconnect.c,76 :: 		SW_LIGHT_SENSOR_Tris=OUTPUT;
	BCLR.B	TRISE, #6
;PIC_DRV_Uconnect.c,78 :: 		SW_PRE_STEP_UP_MIKROBUS_Lat=0;
	BCLR.B	LATE, #7
;PIC_DRV_Uconnect.c,79 :: 		SW_PRE_STEP_UP_MIKROBUS_Tris=OUTPUT;
	BCLR.B	TRISE, #7
;PIC_DRV_Uconnect.c,81 :: 		EN_STEP_UP_MIKROEBUS_Lat=0;
	BCLR.B	LATG, #6
;PIC_DRV_Uconnect.c,82 :: 		EN_STEP_UP_MIKROEBUS_Buff=DIGITAL;
	BCLR.B	ANSG, #6
;PIC_DRV_Uconnect.c,83 :: 		EN_STEP_UP_MIKROEBUS_Tris=OUTPUT;
	BCLR.B	TRISG, #6
;PIC_DRV_Uconnect.c,85 :: 		RTC_INT_Lat=0;
	BCLR.B	LATG, #7
;PIC_DRV_Uconnect.c,86 :: 		RTC_INT_Port=0;
	BCLR.B	PORTG, #7
;PIC_DRV_Uconnect.c,87 :: 		RTC_INT_Buff=DIGITAL;
	BCLR.B	ANSG, #7
;PIC_DRV_Uconnect.c,88 :: 		RTC_INT_Tris=OUTPUT;
	BCLR.B	TRISG, #7
;PIC_DRV_Uconnect.c,90 :: 		RG8_Lat=0;
	BCLR	LATG, #8
;PIC_DRV_Uconnect.c,91 :: 		RG8_Buff=DIGITAL;
	BCLR	ANSG, #8
;PIC_DRV_Uconnect.c,92 :: 		RG8_Tris=OUTPUT;
	BCLR	TRISG, #8
;PIC_DRV_Uconnect.c,94 :: 		EN_STEP_UP_TERMINAL_Lat=0;
	BCLR	LATG, #9
;PIC_DRV_Uconnect.c,95 :: 		EN_STEP_UP_TERMINAL_Buff=DIGITAL;
	BCLR	ANSG, #9
;PIC_DRV_Uconnect.c,96 :: 		EN_STEP_UP_TERMINAL_Tris =OUTPUT;
	BCLR	TRISG, #9
;PIC_DRV_Uconnect.c,98 :: 		AN_MIKROBUS_MTXSRX5_Lat=0;
	BCLR.B	LATB, #5
;PIC_DRV_Uconnect.c,99 :: 		AN_MIKROBUS_MTXSRX5_Buff=DIGITAL;
	BCLR.B	ANSB, #5
;PIC_DRV_Uconnect.c,100 :: 		AN_MIKROBUS_MTXSRX5_Tris=OUTPUT;
	BCLR.B	TRISB, #5
;PIC_DRV_Uconnect.c,101 :: 		AN_MIKROBUS_MTXSRX5_Port=0;
	BCLR.B	PORTB, #5
;PIC_DRV_Uconnect.c,103 :: 		CR123_VOLTAGE_SAMPLE_Lat=0;
	BCLR.B	LATB, #4
;PIC_DRV_Uconnect.c,104 :: 		CR123_VOLTAGE_SAMPLE_Buff=DIGITAL;
	BCLR.B	ANSB, #4
;PIC_DRV_Uconnect.c,105 :: 		CR123_VOLTAGE_SAMPLE_Tris=OUTPUT;
	BCLR.B	TRISB, #4
;PIC_DRV_Uconnect.c,107 :: 		SHD_Lat=0;
	BCLR.B	LATB, #3
;PIC_DRV_Uconnect.c,108 :: 		SHD_Buff=DIGITAL;
	BCLR.B	ANSB, #3
;PIC_DRV_Uconnect.c,109 :: 		SHD_Tris=OUTPUT;
	BCLR.B	TRISB, #3
;PIC_DRV_Uconnect.c,112 :: 		LIGHT_SENSOR_SAMPLE_Lat=0;
	BCLR.B	LATB, #2
;PIC_DRV_Uconnect.c,113 :: 		LIGHT_SENSOR_SAMPLE_Buff=DIGITAL;
	BCLR.B	ANSB, #2
;PIC_DRV_Uconnect.c,114 :: 		LIGHT_SENSOR_SAMPLE_Tris=OUTPUT;
	BCLR.B	TRISB, #2
;PIC_DRV_Uconnect.c,116 :: 		TMR3_IO1_MRXSTX3_EXT0_Lat=0;
	BCLR.B	LATB, #1
;PIC_DRV_Uconnect.c,117 :: 		TMR3_IO1_MRXSTX3_EXT0_Buff=DIGITAL;
	BCLR.B	ANSB, #1
;PIC_DRV_Uconnect.c,118 :: 		TMR3_IO1_MRXSTX3_EXT0_Port=0;
	BCLR.B	PORTB, #1
;PIC_DRV_Uconnect.c,119 :: 		TMR3_IO1_MRXSTX3_EXT0_Tris=OUTPUT;
	BCLR.B	TRISB, #1
;PIC_DRV_Uconnect.c,126 :: 		VREFF_Lat=0;
	BCLR.B	LATB, #0
;PIC_DRV_Uconnect.c,127 :: 		VREFF_Buff=DIGITAL;
	BCLR.B	ANSB, #0
;PIC_DRV_Uconnect.c,128 :: 		VREFF_Tris=OUTPUT;
	BCLR.B	TRISB, #0
;PIC_DRV_Uconnect.c,130 :: 		PGC_Lat=0;
	BCLR.B	LATB, #6
;PIC_DRV_Uconnect.c,131 :: 		PGC_Buff=DIGITAL;
	BCLR.B	ANSB, #6
;PIC_DRV_Uconnect.c,132 :: 		PGC_Tris=OUTPUT;
	BCLR.B	TRISB, #6
;PIC_DRV_Uconnect.c,134 :: 		PGD_Lat=0;
	BCLR.B	LATB, #7
;PIC_DRV_Uconnect.c,135 :: 		PGD_Buff=DIGITAL;
	BCLR.B	ANSB, #7
;PIC_DRV_Uconnect.c,136 :: 		PGD_Tris=OUTPUT;
	BCLR.B	TRISB, #7
;PIC_DRV_Uconnect.c,138 :: 		SW_PRE_STEP_UP_TERMINAL_Lat=0;
	BCLR	LATB, #8
;PIC_DRV_Uconnect.c,139 :: 		SW_PRE_STEP_UP_TERMINAL_Buff=DIGITAL;
	BCLR	ANSB, #8
;PIC_DRV_Uconnect.c,140 :: 		SW_PRE_STEP_UP_TERMINAL_Tris=OUTPUT;
	BCLR	TRISB, #8
;PIC_DRV_Uconnect.c,142 :: 		TEMP_AN_SAMPLE_Lat=0;
	BCLR	LATB, #9
;PIC_DRV_Uconnect.c,143 :: 		TEMP_AN_SAMPLE_Buff=DIGITAL;
	BCLR	ANSB, #9
;PIC_DRV_Uconnect.c,144 :: 		TEMP_AN_SAMPLE_Tris=OUTPUT;
	BCLR	TRISB, #9
;PIC_DRV_Uconnect.c,146 :: 		SW_URF_POWER_Lat=0;
	BCLR	LATB, #10
;PIC_DRV_Uconnect.c,147 :: 		SW_URF_POWER_Buff=DIGITAL;
	BCLR	ANSB, #10
;PIC_DRV_Uconnect.c,148 :: 		SW_URF_POWER_Tris=OUTPUT;
	BCLR	TRISB, #10
;PIC_DRV_Uconnect.c,150 :: 		USB_VOLTAGE_SAMPLE_Lat=0;
	BCLR	LATB, #11
;PIC_DRV_Uconnect.c,151 :: 		USB_VOLTAGE_SAMPLE_Buff=DIGITAL;
	BCLR	ANSB, #11
;PIC_DRV_Uconnect.c,152 :: 		USB_VOLTAGE_SAMPLE_Tris=OUTPUT;
	BCLR	TRISB, #11
;PIC_DRV_Uconnect.c,154 :: 		EN_BATTERY_BYPASS_Lat=0;
	BCLR	LATB, #12
;PIC_DRV_Uconnect.c,155 :: 		EN_BATTERY_BYPASS_Buff=DIGITAL;
	BCLR	ANSB, #12
;PIC_DRV_Uconnect.c,156 :: 		EN_BATTERY_BYPASS_Tris=OUTPUT;
	BCLR	TRISB, #12
;PIC_DRV_Uconnect.c,158 :: 		PIN_12V_VOLTAGE_SAMPLE_Lat=0;
	BCLR	LATB, #13
;PIC_DRV_Uconnect.c,159 :: 		PIN_12V_VOLTAGE_SAMPLE_Buff=DIGITAL;
	BCLR	ANSB, #13
;PIC_DRV_Uconnect.c,160 :: 		PIN_12V_VOLTAGE_SAMPLE_Tris=OUTPUT;
	BCLR	TRISB, #13
;PIC_DRV_Uconnect.c,162 :: 		LED_RED_Lat=ON;
	BSET	LATB, #14
;PIC_DRV_Uconnect.c,163 :: 		LED_RED_Buff=DIGITAL;
	BCLR	ANSB, #14
;PIC_DRV_Uconnect.c,164 :: 		LED_RED_Tris=OUTPUT;
	BCLR	TRISB, #14
;PIC_DRV_Uconnect.c,166 :: 		LED_GREEN_Lat=ON;
	BSET	LATB, #15
;PIC_DRV_Uconnect.c,167 :: 		LED_GREEN_Buff=DIGITAL;
	BCLR	ANSB, #15
;PIC_DRV_Uconnect.c,168 :: 		LED_GREEN_Tris=OUTPUT;
	BCLR	TRISB, #15
;PIC_DRV_Uconnect.c,170 :: 		CS_MIKROBUS_PWM7_Lat=0;
	BCLR.B	LATF, #4
;PIC_DRV_Uconnect.c,171 :: 		CS_MIKROBUS_PWM7_Tris=OUTPUT;
	BCLR.B	TRISF, #4
;PIC_DRV_Uconnect.c,173 :: 		PHY_SCK=0;
	BCLR.B	LATF, #5
;PIC_DRV_Uconnect.c,174 :: 		PHY_SCK_Tris=OUTPUT;
	BCLR.B	TRISF, #5
;PIC_DRV_Uconnect.c,175 :: 		PHY_SCK_PIN=0;
	BCLR.B	LATF, #5
;PIC_DRV_Uconnect.c,177 :: 		PHY_SDI=0;
	BCLR.B	PORTF, #3
;PIC_DRV_Uconnect.c,178 :: 		PHY_SDI_Tris=INPUT;
	BSET.B	TRISF, #3
;PIC_DRV_Uconnect.c,180 :: 		PHY_SDO=0;
	BCLR.B	LATF, #2
;PIC_DRV_Uconnect.c,181 :: 		PHY_SDO_Tris=OUTPUT;
	BCLR.B	TRISF, #2
;PIC_DRV_Uconnect.c,182 :: 		PHY_SDO_PIN=0;
	BCLR.B	LATF, #2
;PIC_DRV_Uconnect.c,184 :: 		INT_MIKROBUS_Lat=0;
	BCLR.B	LATF, #6
;PIC_DRV_Uconnect.c,185 :: 		INT_MIKROBUS_Port=0;
	BCLR.B	PORTF, #6
;PIC_DRV_Uconnect.c,186 :: 		INT_MIKROBUS_Tris=OUTPUT;
	BCLR.B	TRISF, #6
;PIC_DRV_Uconnect.c,188 :: 		SDA_Lat=0;
	BCLR.B	LATG, #3
;PIC_DRV_Uconnect.c,189 :: 		SDA_Port=0;
	BCLR.B	PORTG, #3
;PIC_DRV_Uconnect.c,190 :: 		SDA_Tris=OUTPUT;
	BCLR.B	TRISG, #3
;PIC_DRV_Uconnect.c,192 :: 		SCL_Lat=0;
	BCLR.B	LATG, #2
;PIC_DRV_Uconnect.c,193 :: 		SCL_Tris=OUTPUT;
	BCLR.B	TRISG, #2
;PIC_DRV_Uconnect.c,195 :: 		nIRQ_PIN=0;
	BCLR	PORTD, #8
;PIC_DRV_Uconnect.c,196 :: 		nIRQ_Tris=OUTPUT;
	BCLR	TRISD, #8
;PIC_DRV_Uconnect.c,198 :: 		PWM_MIKROBUS_Lat=0;
	BCLR	LATD, #9
;PIC_DRV_Uconnect.c,199 :: 		PWM_MIKROBUS_Port=0;
	BCLR	PORTD, #9
;PIC_DRV_Uconnect.c,200 :: 		PWM_MIKROBUS_Tris=OUTPUT;
	BCLR	TRISD, #9
;PIC_DRV_Uconnect.c,202 :: 		MTXSRX2_Lat=0;
	BCLR	LATD, #10
;PIC_DRV_Uconnect.c,203 :: 		MTXSRX2_Tris=OUTPUT;
	BCLR	TRISD, #10
;PIC_DRV_Uconnect.c,205 :: 		MRXSTX2_Lat=0;
	BCLR	LATD, #11
;PIC_DRV_Uconnect.c,206 :: 		MRXSTX2_Tris=INPUT;
	BSET	TRISD, #11
;PIC_DRV_Uconnect.c,208 :: 		RD0_Lat=0;
	BCLR.B	LATD, #0
;PIC_DRV_Uconnect.c,209 :: 		RDO_Tris=OUTPUT;
	BCLR.B	TRISD, #0
;PIC_DRV_Uconnect.c,211 :: 		POWER_TEMP_AN_Lat=0;
	BCLR.B	LATD, #1
;PIC_DRV_Uconnect.c,212 :: 		POWER_TEMP_AN_Tris=OUTPUT;
	BCLR.B	TRISD, #1
;PIC_DRV_Uconnect.c,214 :: 		SW_USB_VOLTAGE_Lat=0;
	BCLR.B	LATD, #2
;PIC_DRV_Uconnect.c,215 :: 		SW_USB_VOLTAGE_Tris=OUTPUT;
	BCLR.B	TRISD, #2
;PIC_DRV_Uconnect.c,217 :: 		SW_VREFF_Lat=0;
	BCLR.B	LATD, #3
;PIC_DRV_Uconnect.c,218 :: 		SW_VREFF_Tris=OUTPUT;
	BCLR.B	TRISD, #3
;PIC_DRV_Uconnect.c,220 :: 		MTXSRX1_Lat=0;
	BCLR.B	LATD, #4
;PIC_DRV_Uconnect.c,221 :: 		MTXSRX1_Tris=OUTPUT;
	BCLR.B	TRISD, #4
;PIC_DRV_Uconnect.c,223 :: 		MRXSTX1_Lat=0;
	BCLR.B	LATD, #5
;PIC_DRV_Uconnect.c,224 :: 		MRXSTX1_Tris=INPUT;
	BSET.B	TRISD, #5
;PIC_DRV_Uconnect.c,226 :: 		SW_12V_VOLTAGE_Lat=0;
	BCLR.B	LATD, #6
;PIC_DRV_Uconnect.c,227 :: 		SW_12V_VOLTAGE_Buff=DIGITAL;
	BCLR.B	ANSD, #6
;PIC_DRV_Uconnect.c,228 :: 		SW_12V_VOLTAGE_Tris=OUTPUT;
	BCLR.B	TRISD, #6
;PIC_DRV_Uconnect.c,230 :: 		CS_EEPROM_Lat=1;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,231 :: 		CS_EEPROM_Buff=DIGITAL;
	BCLR.B	ANSD, #7
;PIC_DRV_Uconnect.c,232 :: 		CS_EEPROM_Tris=OUTPUT;
	BCLR.B	TRISD, #7
;PIC_DRV_Uconnect.c,234 :: 		SW_CR123_VOLTAGE_Lat=0;
	BCLR.B	LATF, #0
;PIC_DRV_Uconnect.c,235 :: 		SW_CR123_VOLTAGE_Tris=OUTPUT;
	BCLR.B	TRISF, #0
;PIC_DRV_Uconnect.c,237 :: 		nSDN=0;
	BCLR.B	LATF, #1
;PIC_DRV_Uconnect.c,238 :: 		nSDN_Tris=OUTPUT;
	BCLR.B	TRISF, #1
;PIC_DRV_Uconnect.c,240 :: 		SW_VOC_Lat=0;
	BCLR.B	LATE, #0
;PIC_DRV_Uconnect.c,241 :: 		SW_VOC_Tris=OUTPUT;
	BCLR.B	TRISE, #0
;PIC_DRV_Uconnect.c,243 :: 		nSEL=0;
	BCLR.B	LATE, #1
;PIC_DRV_Uconnect.c,244 :: 		nSEL_Tris=OUTPUT;
	BCLR.B	TRISE, #1
;PIC_DRV_Uconnect.c,246 :: 		RE2_Lat=0;
	BCLR.B	LATE, #2
;PIC_DRV_Uconnect.c,247 :: 		RE2_Tris=OUTPUT;
	BCLR.B	TRISE, #2
;PIC_DRV_Uconnect.c,249 :: 		RE3_Lat=0;
	BCLR.B	LATE, #3
;PIC_DRV_Uconnect.c,250 :: 		RE3_Tris=OUTPUT;
	BCLR.B	TRISE, #3
;PIC_DRV_Uconnect.c,252 :: 		RE4_Lat=0;
	BCLR.B	LATE, #4
;PIC_DRV_Uconnect.c,253 :: 		RE4_Buff=DIGITAL;
	BCLR.B	ANSE, #4
;PIC_DRV_Uconnect.c,254 :: 		RE4_Tris=OUTPUT;
	BCLR.B	TRISE, #4
;PIC_DRV_Uconnect.c,256 :: 		RC13_Lat=0;
	BCLR	LATC, #13
;PIC_DRV_Uconnect.c,257 :: 		RC13_Buff=DIGITAL;
	BCLR	ANSC, #13
;PIC_DRV_Uconnect.c,258 :: 		RC13_Tris=OUTPUT;
	BCLR	TRISC, #13
;PIC_DRV_Uconnect.c,260 :: 		RC14_Lat=0;
	BCLR	LATC, #14
;PIC_DRV_Uconnect.c,261 :: 		RC14_Buff=DIGITAL;
	BCLR	ANSC, #14
;PIC_DRV_Uconnect.c,262 :: 		RC14_Tris=OUTPUT;
	BCLR	TRISC, #14
;PIC_DRV_Uconnect.c,263 :: 		RCON.SWDTEN=ON;
	BSET.B	RCON, #5
;PIC_DRV_Uconnect.c,264 :: 		ADC1_Init_Advanced(_ADC_12bit, _ADC_EXTERNAL_VREFH | _ADC_INTERNAL_VREFL);
	MOV	#16384, W11
	MOV	#1, W10
	CALL	_ADC1_Init_Advanced
;PIC_DRV_Uconnect.c,265 :: 		AD1CON3=0x0503;
	MOV	#1283, W0
	MOV	WREG, AD1CON3
;PIC_DRV_Uconnect.c,266 :: 		UART2_Init(57600);
	MOV	#57600, W10
	MOV	#0, W11
	CALL	_UART2_Init
;PIC_DRV_Uconnect.c,267 :: 		UART1_Init(2000000);
	MOV	#33920, W10
	MOV	#30, W11
	CALL	_UART1_Init
;PIC_DRV_Uconnect.c,268 :: 		Delay_ms(100);
	MOV	#9, W8
	MOV	#9047, W7
L_BoardInit0:
	DEC	W7
	BRA NZ	L_BoardInit0
	DEC	W8
	BRA NZ	L_BoardInit0
;PIC_DRV_Uconnect.c,269 :: 		PrintOut(PrintHandler,"\rBoard Initialization...");
	MOV	#lo_addr(?lstr_1_PIC_DRV_Uconnect), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#4, W15
;PIC_DRV_Uconnect.c,270 :: 		Uart2_RX_Int_En=0;
	BCLR	IEC1bits, #14
;PIC_DRV_Uconnect.c,271 :: 		ESP_RX_Int_En=0;
	BCLR	IEC0bits, #11
;PIC_DRV_Uconnect.c,272 :: 		}
L_end_BoardInit:
	POP	W11
	POP	W10
	RETURN
; end of _BoardInit

_Terminal_PowerOut_Enable:

;PIC_DRV_Uconnect.c,275 :: 		void Terminal_PowerOut_Enable(char mode,unsigned int delay_ms_value)
;PIC_DRV_Uconnect.c,278 :: 		switch ( mode)
	GOTO	L_Terminal_PowerOut_Enable2
;PIC_DRV_Uconnect.c,280 :: 		case    ON:
L_Terminal_PowerOut_Enable4:
;PIC_DRV_Uconnect.c,281 :: 		SW_PRE_STEP_UP_TERMINAL_Lat=ON;
	BSET	LATB, #8
;PIC_DRV_Uconnect.c,282 :: 		for(i=0;i<delay_ms_value;i++) Delay_ms(1);
; i start address is: 0 (W0)
	CLR	W0
; i end address is: 0 (W0)
L_Terminal_PowerOut_Enable5:
; i start address is: 0 (W0)
	CP	W0, W11
	BRA LTU	L__Terminal_PowerOut_Enable117
	GOTO	L_Terminal_PowerOut_Enable6
L__Terminal_PowerOut_Enable117:
	MOV	#5333, W7
L_Terminal_PowerOut_Enable8:
	DEC	W7
	BRA NZ	L_Terminal_PowerOut_Enable8
	NOP
	INC	W0
; i end address is: 0 (W0)
	GOTO	L_Terminal_PowerOut_Enable5
L_Terminal_PowerOut_Enable6:
;PIC_DRV_Uconnect.c,283 :: 		break;
	GOTO	L_Terminal_PowerOut_Enable3
;PIC_DRV_Uconnect.c,284 :: 		case    OFF:
L_Terminal_PowerOut_Enable10:
;PIC_DRV_Uconnect.c,285 :: 		SW_PRE_STEP_UP_TERMINAL_Lat=OFF;
	BCLR	LATB, #8
;PIC_DRV_Uconnect.c,286 :: 		break;
	GOTO	L_Terminal_PowerOut_Enable3
;PIC_DRV_Uconnect.c,287 :: 		}
L_Terminal_PowerOut_Enable2:
	CP.B	W10, #1
	BRA NZ	L__Terminal_PowerOut_Enable118
	GOTO	L_Terminal_PowerOut_Enable4
L__Terminal_PowerOut_Enable118:
	CP.B	W10, #0
	BRA NZ	L__Terminal_PowerOut_Enable119
	GOTO	L_Terminal_PowerOut_Enable10
L__Terminal_PowerOut_Enable119:
L_Terminal_PowerOut_Enable3:
;PIC_DRV_Uconnect.c,288 :: 		}
L_end_Terminal_PowerOut_Enable:
	RETURN
; end of _Terminal_PowerOut_Enable

_Mikrobus_PowerOut_Enable:

;PIC_DRV_Uconnect.c,290 :: 		void Mikrobus_PowerOut_Enable(char mode,unsigned int delay_ms_value)
;PIC_DRV_Uconnect.c,293 :: 		switch ( mode)
	GOTO	L_Mikrobus_PowerOut_Enable11
;PIC_DRV_Uconnect.c,295 :: 		case    ON:
L_Mikrobus_PowerOut_Enable13:
;PIC_DRV_Uconnect.c,296 :: 		SW_PRE_STEP_UP_MIKROBUS_Lat=ON;
	BSET.B	LATE, #7
;PIC_DRV_Uconnect.c,297 :: 		for(i=0;i<delay_ms_value;i++) Delay_ms(1);
; i start address is: 0 (W0)
	CLR	W0
; i end address is: 0 (W0)
L_Mikrobus_PowerOut_Enable14:
; i start address is: 0 (W0)
	CP	W0, W11
	BRA LTU	L__Mikrobus_PowerOut_Enable121
	GOTO	L_Mikrobus_PowerOut_Enable15
L__Mikrobus_PowerOut_Enable121:
	MOV	#5333, W7
L_Mikrobus_PowerOut_Enable17:
	DEC	W7
	BRA NZ	L_Mikrobus_PowerOut_Enable17
	NOP
	INC	W0
; i end address is: 0 (W0)
	GOTO	L_Mikrobus_PowerOut_Enable14
L_Mikrobus_PowerOut_Enable15:
;PIC_DRV_Uconnect.c,298 :: 		break;
	GOTO	L_Mikrobus_PowerOut_Enable12
;PIC_DRV_Uconnect.c,299 :: 		case    OFF:
L_Mikrobus_PowerOut_Enable19:
;PIC_DRV_Uconnect.c,300 :: 		SW_PRE_STEP_UP_MIKROBUS_Lat=OFF;
	BCLR.B	LATE, #7
;PIC_DRV_Uconnect.c,301 :: 		break;
	GOTO	L_Mikrobus_PowerOut_Enable12
;PIC_DRV_Uconnect.c,302 :: 		}
L_Mikrobus_PowerOut_Enable11:
	CP.B	W10, #1
	BRA NZ	L__Mikrobus_PowerOut_Enable122
	GOTO	L_Mikrobus_PowerOut_Enable13
L__Mikrobus_PowerOut_Enable122:
	CP.B	W10, #0
	BRA NZ	L__Mikrobus_PowerOut_Enable123
	GOTO	L_Mikrobus_PowerOut_Enable19
L__Mikrobus_PowerOut_Enable123:
L_Mikrobus_PowerOut_Enable12:
;PIC_DRV_Uconnect.c,303 :: 		}
L_end_Mikrobus_PowerOut_Enable:
	RETURN
; end of _Mikrobus_PowerOut_Enable

_PrintHandler:

;PIC_DRV_Uconnect.c,305 :: 		void PrintHandler(char c)
;PIC_DRV_Uconnect.c,307 :: 		UART2_Write(c);
	ZE	W10, W10
	CALL	_UART2_Write
;PIC_DRV_Uconnect.c,308 :: 		}
L_end_PrintHandler:
	RETURN
; end of _PrintHandler

_Read_SHD_PIN:
	LNK	#4

;PIC_DRV_Uconnect.c,310 :: 		char Read_SHD_PIN(void)
;PIC_DRV_Uconnect.c,312 :: 		char cTemp=0;
	PUSH	W10
;PIC_DRV_Uconnect.c,314 :: 		VREFF_Buff=ANALOG;
	BSET.B	ANSB, #0
;PIC_DRV_Uconnect.c,315 :: 		VREFF_Tris=INPUT;
	BSET.B	TRISB, #0
;PIC_DRV_Uconnect.c,316 :: 		SW_VREFF_Lat=ON;
	BSET.B	LATD, #3
;PIC_DRV_Uconnect.c,317 :: 		SHD_Tris=INPUT;
	BSET.B	TRISB, #3
;PIC_DRV_Uconnect.c,318 :: 		SHD_Buff=ANALOG;
	BSET.B	ANSB, #3
;PIC_DRV_Uconnect.c,319 :: 		Delay_us(1000);
	MOV	#5333, W7
L_Read_SHD_PIN20:
	DEC	W7
	BRA NZ	L_Read_SHD_PIN20
	NOP
;PIC_DRV_Uconnect.c,320 :: 		ADC_Sampling=((float)ADC1_Get_Sample(3)+(float)ADC1_Get_Sample(3))/2;
	MOV	#3, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#3, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__AddSub_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,321 :: 		VIN=((ADC_Sampling*Vref)/4095);
	MOV	#4719, W2
	MOV	#16387, W3
	CALL	__Mul_FP
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,322 :: 		SW_VREFF_Lat=OFF;
	BCLR.B	LATD, #3
;PIC_DRV_Uconnect.c,323 :: 		VREFF_Buff=DIGITAL;
	BCLR.B	ANSB, #0
;PIC_DRV_Uconnect.c,324 :: 		VREFF_Tris=OUTPUT;
	BCLR.B	TRISB, #0
;PIC_DRV_Uconnect.c,325 :: 		SHD_Tris=OUTPUT;
	BCLR.B	TRISB, #3
;PIC_DRV_Uconnect.c,326 :: 		SHD_Buff=DIGITAL;
	BCLR.B	ANSB, #3
;PIC_DRV_Uconnect.c,327 :: 		if(VIN>1) return 1;
	MOV	#0, W2
	MOV	#16256, W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__Read_SHD_PIN126
	INC.B	W0
L__Read_SHD_PIN126:
	CP0.B	W0
	BRA NZ	L__Read_SHD_PIN127
	GOTO	L_Read_SHD_PIN22
L__Read_SHD_PIN127:
	MOV.B	#1, W0
	GOTO	L_end_Read_SHD_PIN
L_Read_SHD_PIN22:
;PIC_DRV_Uconnect.c,328 :: 		else return 0;
	CLR	W0
;PIC_DRV_Uconnect.c,329 :: 		}
;PIC_DRV_Uconnect.c,328 :: 		else return 0;
;PIC_DRV_Uconnect.c,329 :: 		}
L_end_Read_SHD_PIN:
	POP	W10
	ULNK
	RETURN
; end of _Read_SHD_PIN

_LED_Activation:

;PIC_DRV_Uconnect.c,331 :: 		void LED_Activation(char color,char mode)
;PIC_DRV_Uconnect.c,333 :: 		switch ( mode)
	GOTO	L_LED_Activation24
;PIC_DRV_Uconnect.c,335 :: 		case    LED_ON:
L_LED_Activation26:
;PIC_DRV_Uconnect.c,336 :: 		if(color==LED_RED) LED_RED_Lat=0;
	CP.B	W10, #3
	BRA Z	L__LED_Activation129
	GOTO	L_LED_Activation27
L__LED_Activation129:
	BCLR	LATB, #14
	GOTO	L_LED_Activation28
L_LED_Activation27:
;PIC_DRV_Uconnect.c,337 :: 		else LED_GREEN_Lat=0;
	BCLR	LATB, #15
L_LED_Activation28:
;PIC_DRV_Uconnect.c,338 :: 		break;
	GOTO	L_LED_Activation25
;PIC_DRV_Uconnect.c,339 :: 		case    LED_OFF:
L_LED_Activation29:
;PIC_DRV_Uconnect.c,340 :: 		if(color==LED_RED) LED_RED_Lat=1;
	CP.B	W10, #3
	BRA Z	L__LED_Activation130
	GOTO	L_LED_Activation30
L__LED_Activation130:
	BSET	LATB, #14
	GOTO	L_LED_Activation31
L_LED_Activation30:
;PIC_DRV_Uconnect.c,341 :: 		else LED_GREEN_Lat=1;
	BSET	LATB, #15
L_LED_Activation31:
;PIC_DRV_Uconnect.c,342 :: 		break;
	GOTO	L_LED_Activation25
;PIC_DRV_Uconnect.c,343 :: 		case    LED_NOT:
L_LED_Activation32:
;PIC_DRV_Uconnect.c,344 :: 		if(color==LED_RED) LED_RED_Lat^=1;
	CP.B	W10, #3
	BRA Z	L__LED_Activation131
	GOTO	L_LED_Activation33
L__LED_Activation131:
	BTG	LATB, #14
	GOTO	L_LED_Activation34
L_LED_Activation33:
;PIC_DRV_Uconnect.c,345 :: 		else LED_GREEN_Lat^=1;
	BTG	LATB, #15
L_LED_Activation34:
;PIC_DRV_Uconnect.c,346 :: 		break;
	GOTO	L_LED_Activation25
;PIC_DRV_Uconnect.c,347 :: 		}
L_LED_Activation24:
	CP.B	W11, #0
	BRA NZ	L__LED_Activation132
	GOTO	L_LED_Activation26
L__LED_Activation132:
	CP.B	W11, #1
	BRA NZ	L__LED_Activation133
	GOTO	L_LED_Activation29
L__LED_Activation133:
	CP.B	W11, #2
	BRA NZ	L__LED_Activation134
	GOTO	L_LED_Activation32
L__LED_Activation134:
L_LED_Activation25:
;PIC_DRV_Uconnect.c,348 :: 		}
L_end_LED_Activation:
	RETURN
; end of _LED_Activation

_GetBatteryVoltage:
	LNK	#4

;PIC_DRV_Uconnect.c,350 :: 		float GetBatteryVoltage(void)
;PIC_DRV_Uconnect.c,354 :: 		VREFF_Buff=ANALOG;
	PUSH	W10
	BSET.B	ANSB, #0
;PIC_DRV_Uconnect.c,355 :: 		VREFF_Tris=INPUT;
	BSET.B	TRISB, #0
;PIC_DRV_Uconnect.c,356 :: 		SW_VREFF_Lat=ON;
	BSET.B	LATD, #3
;PIC_DRV_Uconnect.c,357 :: 		CR123_VOLTAGE_SAMPLE_Buff=ANALOG;
	BSET.B	ANSB, #4
;PIC_DRV_Uconnect.c,358 :: 		CR123_VOLTAGE_SAMPLE_Tris=INPUT;
	BSET.B	TRISB, #4
;PIC_DRV_Uconnect.c,359 :: 		SW_CR123_VOLTAGE_Lat=ON;
	BSET.B	LATF, #0
;PIC_DRV_Uconnect.c,360 :: 		Delay_us(350);
	MOV	#1866, W7
L_GetBatteryVoltage35:
	DEC	W7
	BRA NZ	L_GetBatteryVoltage35
	NOP
	NOP
;PIC_DRV_Uconnect.c,361 :: 		ADC1_Get_Sample(4);// must to do
	MOV	#4, W10
	CALL	_ADC1_Get_Sample
;PIC_DRV_Uconnect.c,362 :: 		ADC_Sampling=((float)ADC1_Get_Sample(4)+(float)ADC1_Get_Sample(4))/2;
	MOV	#4, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#4, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__AddSub_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,363 :: 		VIN=((ADC_Sampling*Vref)/4095)*Vbatt_ResistorsFactor;
	MOV	#4719, W2
	MOV	#16387, W3
	CALL	__Mul_FP
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
	MOV	#57147, W2
	MOV	#16319, W3
	CALL	__Mul_FP
;PIC_DRV_Uconnect.c,364 :: 		SW_VREFF_Lat=OFF;
	BCLR.B	LATD, #3
;PIC_DRV_Uconnect.c,365 :: 		VREFF_Buff=DIGITAL;
	BCLR.B	ANSB, #0
;PIC_DRV_Uconnect.c,366 :: 		VREFF_Tris=OUTPUT;
	BCLR.B	TRISB, #0
;PIC_DRV_Uconnect.c,367 :: 		SW_CR123_VOLTAGE_Lat=OFF;
	BCLR.B	LATF, #0
;PIC_DRV_Uconnect.c,368 :: 		CR123_VOLTAGE_SAMPLE_Buff=DIGITAL;
	BCLR.B	ANSB, #4
;PIC_DRV_Uconnect.c,369 :: 		CR123_VOLTAGE_SAMPLE_Tris=OUTPUT;
	BCLR.B	TRISB, #4
;PIC_DRV_Uconnect.c,370 :: 		CR123_VOLTAGE_SAMPLE_Lat=OFF;
	BCLR.B	LATB, #4
;PIC_DRV_Uconnect.c,371 :: 		return VIN;
;PIC_DRV_Uconnect.c,372 :: 		}
;PIC_DRV_Uconnect.c,371 :: 		return VIN;
;PIC_DRV_Uconnect.c,372 :: 		}
L_end_GetBatteryVoltage:
	POP	W10
	ULNK
	RETURN
; end of _GetBatteryVoltage

_Get12VInputVoltage:
	LNK	#4

;PIC_DRV_Uconnect.c,374 :: 		float Get12VInputVoltage(void)
;PIC_DRV_Uconnect.c,378 :: 		VREFF_Buff=ANALOG;
	PUSH	W10
	BSET.B	ANSB, #0
;PIC_DRV_Uconnect.c,379 :: 		VREFF_Tris=INPUT;
	BSET.B	TRISB, #0
;PIC_DRV_Uconnect.c,380 :: 		SW_VREFF_Lat=ON;
	BSET.B	LATD, #3
;PIC_DRV_Uconnect.c,381 :: 		PIN_12V_VOLTAGE_SAMPLE_Buff=ANALOG;
	BSET	ANSB, #13
;PIC_DRV_Uconnect.c,382 :: 		PIN_12V_VOLTAGE_SAMPLE_Tris=INPUT;
	BSET	TRISB, #13
;PIC_DRV_Uconnect.c,383 :: 		SW_12V_VOLTAGE_Lat=ON;
	BSET.B	LATD, #6
;PIC_DRV_Uconnect.c,384 :: 		Delay_us(350);
	MOV	#1866, W7
L_Get12VInputVoltage37:
	DEC	W7
	BRA NZ	L_Get12VInputVoltage37
	NOP
	NOP
;PIC_DRV_Uconnect.c,385 :: 		ADC1_Get_Sample(13);// must to do
	MOV	#13, W10
	CALL	_ADC1_Get_Sample
;PIC_DRV_Uconnect.c,386 :: 		ADC_Sampling=((float)ADC1_Get_Sample(13)+(float)ADC1_Get_Sample(13))/2;
	MOV	#13, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#13, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__AddSub_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,387 :: 		VIN=((ADC_Sampling*Vref)/4095)*VIN_ResistorsFactor;
	MOV	#4719, W2
	MOV	#16387, W3
	CALL	__Mul_FP
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
	MOV	#15792, W2
	MOV	#16768, W3
	CALL	__Mul_FP
;PIC_DRV_Uconnect.c,388 :: 		SW_VREFF_Lat=OFF;
	BCLR.B	LATD, #3
;PIC_DRV_Uconnect.c,389 :: 		VREFF_Buff=DIGITAL;
	BCLR.B	ANSB, #0
;PIC_DRV_Uconnect.c,390 :: 		VREFF_Tris=OUTPUT;
	BCLR.B	TRISB, #0
;PIC_DRV_Uconnect.c,391 :: 		SW_12V_VOLTAGE_Lat=OFF;
	BCLR.B	LATD, #6
;PIC_DRV_Uconnect.c,392 :: 		PIN_12V_VOLTAGE_SAMPLE_Buff=DIGITAL;
	BCLR	ANSB, #13
;PIC_DRV_Uconnect.c,393 :: 		PIN_12V_VOLTAGE_SAMPLE_Tris=OUTPUT;
	BCLR	TRISB, #13
;PIC_DRV_Uconnect.c,394 :: 		PIN_12V_VOLTAGE_SAMPLE_Lat=OFF;
	BCLR	LATB, #13
;PIC_DRV_Uconnect.c,395 :: 		return VIN;
;PIC_DRV_Uconnect.c,396 :: 		}
;PIC_DRV_Uconnect.c,395 :: 		return VIN;
;PIC_DRV_Uconnect.c,396 :: 		}
L_end_Get12VInputVoltage:
	POP	W10
	ULNK
	RETURN
; end of _Get12VInputVoltage

_Get4To20IoCurrent:

;PIC_DRV_Uconnect.c,398 :: 		float Get4To20IoCurrent(char IO_Num)
;PIC_DRV_Uconnect.c,400 :: 		return GetIoInputVoltage(IO_Num)/ResistorsShunt_4To20mA;
	CALL	_GetIoInputVoltage
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,401 :: 		}
L_end_Get4To20IoCurrent:
	RETURN
; end of _Get4To20IoCurrent

_GetIoInputVoltage:
	LNK	#8

;PIC_DRV_Uconnect.c,403 :: 		float GetIoInputVoltage (char IO_Num)
;PIC_DRV_Uconnect.c,406 :: 		VREFF_Buff=ANALOG;
	PUSH	W10
	BSET.B	ANSB, #0
;PIC_DRV_Uconnect.c,407 :: 		VREFF_Tris=INPUT;
	BSET.B	TRISB, #0
;PIC_DRV_Uconnect.c,408 :: 		SW_VREFF_Lat=ON;
	BSET.B	LATD, #3
;PIC_DRV_Uconnect.c,409 :: 		Delay_us(350);
	MOV	#1866, W7
L_GetIoInputVoltage39:
	DEC	W7
	BRA NZ	L_GetIoInputVoltage39
	NOP
	NOP
;PIC_DRV_Uconnect.c,410 :: 		if(IO_Num==1)
	CP.B	W10, #1
	BRA Z	L__GetIoInputVoltage139
	GOTO	L_GetIoInputVoltage41
L__GetIoInputVoltage139:
;PIC_DRV_Uconnect.c,412 :: 		TMR3_IO1_MRXSTX3_EXT0_Buff=ANALOG;
	BSET.B	ANSB, #1
;PIC_DRV_Uconnect.c,413 :: 		TMR3_IO1_MRXSTX3_EXT0_Tris=INPUT;
	BSET.B	TRISB, #1
;PIC_DRV_Uconnect.c,414 :: 		ADC1_Get_Sample(1);// must to do
	MOV	#1, W10
	CALL	_ADC1_Get_Sample
;PIC_DRV_Uconnect.c,415 :: 		ADC_Sampling=((float)ADC1_Get_Sample(1)+(float)ADC1_Get_Sample(1))/2;
	MOV	#1, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	#1, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+4], W2
	MOV	[W14+6], W3
	CALL	__AddSub_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Div_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;PIC_DRV_Uconnect.c,416 :: 		SW_VREFF_Lat=OFF;
	BCLR.B	LATD, #3
;PIC_DRV_Uconnect.c,417 :: 		VREFF_Buff=DIGITAL;
	BCLR.B	ANSB, #0
;PIC_DRV_Uconnect.c,418 :: 		VREFF_Tris=OUTPUT;
	BCLR.B	TRISB, #0
;PIC_DRV_Uconnect.c,419 :: 		TMR3_IO1_MRXSTX3_EXT0_Buff=DIGITAL;
	BCLR.B	ANSB, #1
;PIC_DRV_Uconnect.c,420 :: 		TMR3_IO1_MRXSTX3_EXT0_Tris=OUTPUT;
	BCLR.B	TRISB, #1
;PIC_DRV_Uconnect.c,421 :: 		TMR3_IO1_MRXSTX3_EXT0_Lat=OFF;
	BCLR.B	LATB, #1
;PIC_DRV_Uconnect.c,422 :: 		}
	GOTO	L_GetIoInputVoltage42
L_GetIoInputVoltage41:
;PIC_DRV_Uconnect.c,423 :: 		else if(IO_Num==2)
	CP.B	W10, #2
	BRA Z	L__GetIoInputVoltage140
	GOTO	L_GetIoInputVoltage43
L__GetIoInputVoltage140:
;PIC_DRV_Uconnect.c,435 :: 		}
L_GetIoInputVoltage43:
L_GetIoInputVoltage42:
;PIC_DRV_Uconnect.c,436 :: 		VIN=((ADC_Sampling*Vref)/4095);
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	MOV	#4719, W2
	MOV	#16387, W3
	CALL	__Mul_FP
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,437 :: 		return VIN;
;PIC_DRV_Uconnect.c,438 :: 		}
;PIC_DRV_Uconnect.c,437 :: 		return VIN;
;PIC_DRV_Uconnect.c,438 :: 		}
L_end_GetIoInputVoltage:
	POP	W10
	ULNK
	RETURN
; end of _GetIoInputVoltage

_SendAtCommand:

;PIC_DRV_Uconnect.c,441 :: 		void SendAtCommand(unsigned char *p)
;PIC_DRV_Uconnect.c,443 :: 		int i=0;
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
;PIC_DRV_Uconnect.c,444 :: 		while(p[i]!=0)
L_SendAtCommand44:
; i start address is: 2 (W1)
	ADD	W10, W1, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__SendAtCommand142
	GOTO	L_SendAtCommand45
L__SendAtCommand142:
;PIC_DRV_Uconnect.c,446 :: 		Uart1_Write(p[i]);
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;PIC_DRV_Uconnect.c,447 :: 		i++;
	INC	W1
;PIC_DRV_Uconnect.c,448 :: 		}
; i end address is: 2 (W1)
	GOTO	L_SendAtCommand44
L_SendAtCommand45:
;PIC_DRV_Uconnect.c,449 :: 		}//SendAtCommand
L_end_SendAtCommand:
	RETURN
; end of _SendAtCommand

_Get_RTCC_TimeStruct:
	LNK	#2

;PIC_DRV_Uconnect.c,458 :: 		void Get_RTCC_TimeStruct(TimeStruct *time_struct)
;PIC_DRV_Uconnect.c,461 :: 		dec = Bcd2Dec16(TIMEH);
	PUSH	W10
	MOV	TIMEH, W10
	CALL	_Bcd2Dec16
	POP	W10
; dec start address is: 6 (W3)
	MOV	W0, W3
;PIC_DRV_Uconnect.c,462 :: 		time_struct->hh = dec / 100;
	ADD	W10, #2, W1
	MOV	W1, [W14+0]
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	[W14+0], W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,463 :: 		time_struct->mn = dec % 100;
	ADD	W10, #1, W0
	MOV	W0, [W14+0]
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W3, W2
; dec end address is: 6 (W3)
	MOV	[W14+0], W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,464 :: 		dec = Bcd2Dec16(TIMEL);
	PUSH	W10
	MOV	TIMEL, W10
	CALL	_Bcd2Dec16
	POP	W10
;PIC_DRV_Uconnect.c,465 :: 		time_struct->ss = dec / 100;
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV.B	W0, [W10]
;PIC_DRV_Uconnect.c,466 :: 		dec = Bcd2Dec16(DATEL);
	PUSH	W10
	MOV	DATEL, W10
	CALL	_Bcd2Dec16
	POP	W10
; dec start address is: 6 (W3)
	MOV	W0, W3
;PIC_DRV_Uconnect.c,467 :: 		time_struct->md = dec / 100;
	ADD	W10, #3, W1
	MOV	W1, [W14+0]
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	[W14+0], W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,468 :: 		time_struct->wd = dec % 100;
	ADD	W10, #4, W0
	MOV	W0, [W14+0]
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W3, W2
; dec end address is: 6 (W3)
	MOV	[W14+0], W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,469 :: 		dec = Bcd2Dec16(DATEH);
	PUSH	W10
	MOV	DATEH, W10
	CALL	_Bcd2Dec16
	POP	W10
; dec start address is: 6 (W3)
	MOV	W0, W3
;PIC_DRV_Uconnect.c,470 :: 		time_struct->yy = dec / 100;
	ADD	W10, #6, W1
	MOV	W1, [W14+0]
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	[W14+0], W0
	MOV	W1, [W0]
;PIC_DRV_Uconnect.c,471 :: 		time_struct->mo = dec % 100;
	ADD	W10, #5, W0
	MOV	W0, [W14+0]
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W3, W2
; dec end address is: 6 (W3)
	MOV	[W14+0], W0
	MOV.B	W1, [W0]
;PIC_DRV_Uconnect.c,472 :: 		}
L_end_Get_RTCC_TimeStruct:
	ULNK
	RETURN
; end of _Get_RTCC_TimeStruct

_Set_RTCC_Time:
	LNK	#4

;PIC_DRV_Uconnect.c,475 :: 		void Set_RTCC_Time(TimeStruct *time_struct)
;PIC_DRV_Uconnect.c,490 :: 		RTCCON1Lbits.RTCEN = 0;
	BCLR	RTCCON1Lbits, #15
;PIC_DRV_Uconnect.c,491 :: 		RTCC_WRLOCK_BIT_CLEAR();
	CALL	_RTCC_WRLOCK_BIT_CLEAR
;PIC_DRV_Uconnect.c,492 :: 		TIMEH = ((time_struct->hh / 10) << 12) | ((time_struct->hh % 10) << 8) | ((time_struct->mn / 10) << 4) | (time_struct->mn % 10);
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #12, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	SL	W0, #8, W1
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
	ADD	W10, #1, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #4, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV	#lo_addr(TIMEH), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,493 :: 		TIMEL = ((time_struct->ss / 10) << 12) | ((time_struct->ss % 10) << 8);
	MOV.B	[W10], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #12, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	SL	W0, #8, W2
	MOV	#lo_addr(TIMEL), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,494 :: 		DATEL = ((time_struct->md / 10) << 12) | ((time_struct->md % 10) << 8) | ((time_struct->wd / 10) << 4) | (time_struct->wd % 10);
	ADD	W10, #3, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #12, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	SL	W0, #8, W1
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #4, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV	#lo_addr(DATEL), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,495 :: 		DATEH = ((time_struct->yy / 10) << 12) | ((time_struct->yy % 10) << 8) | ((time_struct->mo / 10) << 4) | (time_struct->mo % 10);
	ADD	W10, #6, W0
	MOV	[W0], W0
	MOV	W0, [W14+2]
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	SL	W0, #12, W0
	MOV	W0, [W14+0]
	MOV	#10, W2
	MOV	[W14+2], W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W0
	SL	W0, #8, W1
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
	ADD	W10, #5, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #4, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV	#lo_addr(DATEH), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,496 :: 		RTCCON1Lbits.RTCEN = 1;
	BSET	RTCCON1Lbits, #15
;PIC_DRV_Uconnect.c,497 :: 		RTCC_WRLOCK_BIT_SET();
	CALL	_RTCC_WRLOCK_BIT_SET
;PIC_DRV_Uconnect.c,498 :: 		}
L_end_Set_RTCC_Time:
	ULNK
	RETURN
; end of _Set_RTCC_Time

_Print_Time_RTCC:
	LNK	#12

;PIC_DRV_Uconnect.c,501 :: 		void Print_Time_RTCC(void)
;PIC_DRV_Uconnect.c,505 :: 		Get_RTCC_TimeStruct(&time_struct);
	PUSH	W10
	PUSH	W11
	ADD	W14, #4, W0
	MOV	W0, W10
	CALL	_Get_RTCC_TimeStruct
;PIC_DRV_Uconnect.c,506 :: 		GetDayOfWeekString(time_struct.wd, p);
	ADD	W14, #0, W0
	MOV	W0, W11
	MOV.B	[W14+8], W10
	CALL	_GetDayOfWeekString
;PIC_DRV_Uconnect.c,507 :: 		PrintOut(PrintHandler, "\r%.2d/%.2d/%.2d %.2d:%.2d:%.2d %s",(int) time_struct.md, (int) time_struct.mo, (int) time_struct.yy, (int) time_struct.hh, (int) time_struct.mn, (int) time_struct.ss, p);
	ADD	W14, #0, W6
	ADD	W14, #4, W0
	ZE	[W0], W5
	ADD	W14, #5, W0
	ZE	[W0], W4
	ADD	W14, #6, W0
	ZE	[W0], W3
	ADD	W14, #9, W0
	ZE	[W0], W2
	ADD	W14, #7, W0
	ZE	[W0], W1
	PUSH	W6
	PUSH	W5
	PUSH	W4
	PUSH	W3
	ADD	W14, #10, W0
	PUSH	[W0]
	PUSH	W2
	PUSH	W1
	MOV	#lo_addr(?lstr_2_PIC_DRV_Uconnect), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#18, W15
;PIC_DRV_Uconnect.c,508 :: 		}
L_end_Print_Time_RTCC:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Print_Time_RTCC

_RTCC_Initialize:

;PIC_DRV_Uconnect.c,510 :: 		void RTCC_Initialize(void)
;PIC_DRV_Uconnect.c,512 :: 		RTCCON1L.RTCEN = 0;
	BCLR	RTCCON1L, #15
;PIC_DRV_Uconnect.c,513 :: 		RTCC_WRLOCK_BIT_CLEAR();
	CALL	_RTCC_WRLOCK_BIT_CLEAR
;PIC_DRV_Uconnect.c,515 :: 		RTCCON1H = 0x8900;
	MOV	#35072, W0
	MOV	WREG, RTCCON1H
;PIC_DRV_Uconnect.c,516 :: 		RTCCON2L = 0x0001;
	MOV	#1, W0
	MOV	WREG, RTCCON2L
;PIC_DRV_Uconnect.c,517 :: 		RTCCON2H = 0x3C8B;
	MOV	#15499, W0
	MOV	WREG, RTCCON2H
;PIC_DRV_Uconnect.c,518 :: 		RTCCON3L = 0x0000;
	CLR	RTCCON3L
;PIC_DRV_Uconnect.c,519 :: 		RTCCON1L = 0x0000;
	CLR	RTCCON1L
;PIC_DRV_Uconnect.c,521 :: 		RTCCON1H.ALRMEN=OFF;
	BCLR	RTCCON1H, #15
;PIC_DRV_Uconnect.c,522 :: 		RTCC_WRLOCK_BIT_SET();
	CALL	_RTCC_WRLOCK_BIT_SET
;PIC_DRV_Uconnect.c,523 :: 		RTCC_INT_EN=ON;
	BSET	IEC3, #14
;PIC_DRV_Uconnect.c,524 :: 		RTCC_INT_FLAG=0;
	BCLR	IFS3, #14
;PIC_DRV_Uconnect.c,525 :: 		RTCCON1L.RTCEN = 1;
	BSET	RTCCON1L, #15
;PIC_DRV_Uconnect.c,526 :: 		}
L_end_RTCC_Initialize:
	RETURN
; end of _RTCC_Initialize

_RTCC_WRLOCK_BIT_SET:

;PIC_DRV_Uconnect.c,528 :: 		void RTCC_WRLOCK_BIT_SET(void)
;PIC_DRV_Uconnect.c,531 :: 		DISI #5
	DISI	#5
;PIC_DRV_Uconnect.c,532 :: 		MOV #0x55, W2
	MOV	#85, W2
;PIC_DRV_Uconnect.c,533 :: 		MOV W2, NVMKEY
	MOV	W2, NVMKEY
;PIC_DRV_Uconnect.c,534 :: 		MOV #0xAA, W3
	MOV	#170, W3
;PIC_DRV_Uconnect.c,535 :: 		MOV W3, NVMKEY
	MOV	W3, NVMKEY
;PIC_DRV_Uconnect.c,536 :: 		BSET RTCCON1L, #WRLOCK
	BSET	RTCCON1L, #11
;PIC_DRV_Uconnect.c,538 :: 		}
L_end_RTCC_WRLOCK_BIT_SET:
	RETURN
; end of _RTCC_WRLOCK_BIT_SET

_RTCC_WRLOCK_BIT_CLEAR:

;PIC_DRV_Uconnect.c,540 :: 		void RTCC_WRLOCK_BIT_CLEAR(void)
;PIC_DRV_Uconnect.c,543 :: 		DISI #5
	DISI	#5
;PIC_DRV_Uconnect.c,544 :: 		MOV #0x55, W2
	MOV	#85, W2
;PIC_DRV_Uconnect.c,545 :: 		MOV W2, NVMKEY
	MOV	W2, NVMKEY
;PIC_DRV_Uconnect.c,546 :: 		MOV #0xAA, W3
	MOV	#170, W3
;PIC_DRV_Uconnect.c,547 :: 		MOV W3, NVMKEY
	MOV	W3, NVMKEY
;PIC_DRV_Uconnect.c,548 :: 		BCLR RTCCON1L, #WRLOCK
	BCLR	RTCCON1L, #11
;PIC_DRV_Uconnect.c,550 :: 		}
L_end_RTCC_WRLOCK_BIT_CLEAR:
	RETURN
; end of _RTCC_WRLOCK_BIT_CLEAR

_Stop_RTCC:

;PIC_DRV_Uconnect.c,552 :: 		void Stop_RTCC(void)
;PIC_DRV_Uconnect.c,554 :: 		RTCCON1L.RTCEN = 0;
	BCLR	RTCCON1L, #15
;PIC_DRV_Uconnect.c,555 :: 		}
L_end_Stop_RTCC:
	RETURN
; end of _Stop_RTCC

_GetDayOfWeekString:

;PIC_DRV_Uconnect.c,557 :: 		void GetDayOfWeekString(char DayNum,char *str)
;PIC_DRV_Uconnect.c,559 :: 		switch (DayNum)
	PUSH	W10
	PUSH	W11
	GOTO	L_GetDayOfWeekString46
;PIC_DRV_Uconnect.c,561 :: 		case 0  :
L_GetDayOfWeekString48:
;PIC_DRV_Uconnect.c,562 :: 		strcpy(str,"SUN");
	MOV	W11, W10
	MOV	#lo_addr(?lstr3_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,563 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,564 :: 		case 1  :
L_GetDayOfWeekString49:
;PIC_DRV_Uconnect.c,565 :: 		strcpy(str,"MON");
	MOV	W11, W10
	MOV	#lo_addr(?lstr4_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,566 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,567 :: 		case 2  :
L_GetDayOfWeekString50:
;PIC_DRV_Uconnect.c,568 :: 		strcpy(str,"TUE");
	MOV	W11, W10
	MOV	#lo_addr(?lstr5_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,569 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,570 :: 		case 3  :
L_GetDayOfWeekString51:
;PIC_DRV_Uconnect.c,571 :: 		strcpy(str,"WED");
	MOV	W11, W10
	MOV	#lo_addr(?lstr6_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,572 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,573 :: 		case 4  :
L_GetDayOfWeekString52:
;PIC_DRV_Uconnect.c,574 :: 		strcpy(str,"THU");
	MOV	W11, W10
	MOV	#lo_addr(?lstr7_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,575 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,576 :: 		case 5  :
L_GetDayOfWeekString53:
;PIC_DRV_Uconnect.c,577 :: 		strcpy(str,"FRI");
	MOV	W11, W10
	MOV	#lo_addr(?lstr8_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,578 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,579 :: 		case 6  :
L_GetDayOfWeekString54:
;PIC_DRV_Uconnect.c,580 :: 		strcpy(str,"SAT");
	MOV	W11, W10
	MOV	#lo_addr(?lstr9_PIC_DRV_Uconnect), W11
	CALL	_strcpy
;PIC_DRV_Uconnect.c,581 :: 		break;
	GOTO	L_GetDayOfWeekString47
;PIC_DRV_Uconnect.c,582 :: 		}
L_GetDayOfWeekString46:
	CP.B	W10, #0
	BRA NZ	L__GetDayOfWeekString151
	GOTO	L_GetDayOfWeekString48
L__GetDayOfWeekString151:
	CP.B	W10, #1
	BRA NZ	L__GetDayOfWeekString152
	GOTO	L_GetDayOfWeekString49
L__GetDayOfWeekString152:
	CP.B	W10, #2
	BRA NZ	L__GetDayOfWeekString153
	GOTO	L_GetDayOfWeekString50
L__GetDayOfWeekString153:
	CP.B	W10, #3
	BRA NZ	L__GetDayOfWeekString154
	GOTO	L_GetDayOfWeekString51
L__GetDayOfWeekString154:
	CP.B	W10, #4
	BRA NZ	L__GetDayOfWeekString155
	GOTO	L_GetDayOfWeekString52
L__GetDayOfWeekString155:
	CP.B	W10, #5
	BRA NZ	L__GetDayOfWeekString156
	GOTO	L_GetDayOfWeekString53
L__GetDayOfWeekString156:
	CP.B	W10, #6
	BRA NZ	L__GetDayOfWeekString157
	GOTO	L_GetDayOfWeekString54
L__GetDayOfWeekString157:
L_GetDayOfWeekString47:
;PIC_DRV_Uconnect.c,583 :: 		}
L_end_GetDayOfWeekString:
	POP	W11
	POP	W10
	RETURN
; end of _GetDayOfWeekString

_Set_RTCC_Alarm_Time:
	LNK	#4

;PIC_DRV_Uconnect.c,585 :: 		void Set_RTCC_Alarm_Time(TimeStruct *time_struct)
;PIC_DRV_Uconnect.c,587 :: 		RTCCON1L.RTCEN = 0;
	BCLR	RTCCON1L, #15
;PIC_DRV_Uconnect.c,588 :: 		RTCC_WRLOCK_BIT_CLEAR();
	CALL	_RTCC_WRLOCK_BIT_CLEAR
;PIC_DRV_Uconnect.c,589 :: 		RTCCON1H.ALRMEN=OFF;
	BCLR	RTCCON1H, #15
;PIC_DRV_Uconnect.c,590 :: 		RTCC_INT_EN=OFF;
	BCLR	IEC3, #14
;PIC_DRV_Uconnect.c,591 :: 		RTCC_INT_FLAG=0;
	BCLR	IFS3, #14
;PIC_DRV_Uconnect.c,592 :: 		ALMTIMEH = ((time_struct->hh / 10) << 12) | ((time_struct->hh % 10) << 8) | ((time_struct->mn / 10) << 4) | (time_struct->mn % 10);
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #12, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	SL	W0, #8, W1
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
	ADD	W10, #1, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #4, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV	#lo_addr(ALMTIMEH), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,593 :: 		ALMTIMEL = ((time_struct->ss / 10) << 12) | ((time_struct->ss % 10) << 8);
	MOV.B	[W10], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #12, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	SL	W0, #8, W2
	MOV	#lo_addr(ALMTIMEL), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,594 :: 		ALMDATEL = ((time_struct->md / 10) << 12) | ((time_struct->md % 10) << 8) | ((time_struct->wd / 10) << 4) | (time_struct->wd % 10);
	ADD	W10, #3, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #12, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	SL	W0, #8, W1
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
	ADD	W10, #4, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #4, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV	#lo_addr(ALMDATEL), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,595 :: 		ALMDATEH = ((time_struct->yy / 10) << 12) | ((time_struct->yy % 10) << 8) | ((time_struct->mo / 10) << 4) | (time_struct->mo % 10);
	ADD	W10, #6, W0
	MOV	[W0], W0
	MOV	W0, [W14+2]
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	SL	W0, #12, W0
	MOV	W0, [W14+0]
	MOV	#10, W2
	MOV	[W14+2], W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W0
	SL	W0, #8, W1
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
	ADD	W10, #5, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	SL	W0, #4, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
	MOV.B	[W14+0], W0
	MOV	W1, [W14+0]
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV	#lo_addr(ALMDATEH), W1
	MOV	[W14+0], W0
	IOR	W0, W2, [W1]
;PIC_DRV_Uconnect.c,596 :: 		RTCCON1L.RTCEN = 1;
	BSET	RTCCON1L, #15
;PIC_DRV_Uconnect.c,597 :: 		RTCC_WRLOCK_BIT_SET();
	CALL	_RTCC_WRLOCK_BIT_SET
;PIC_DRV_Uconnect.c,598 :: 		RTCCON1H.ALRMEN=ON;
	BSET	RTCCON1H, #15
;PIC_DRV_Uconnect.c,599 :: 		RTCC_INT_EN=ON;
	BSET	IEC3, #14
;PIC_DRV_Uconnect.c,600 :: 		}
L_end_Set_RTCC_Alarm_Time:
	ULNK
	RETURN
; end of _Set_RTCC_Alarm_Time

_Set_RTCC_Alarm_In_Second:
	LNK	#8

;PIC_DRV_Uconnect.c,602 :: 		void Set_RTCC_Alarm_In_Second(long Second_Value)
;PIC_DRV_Uconnect.c,606 :: 		Get_RTCC_TimeStruct(&time_struct);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	PUSH.D	W10
	MOV	W0, W10
	CALL	_Get_RTCC_TimeStruct
;PIC_DRV_Uconnect.c,607 :: 		time_struct.yy+=2000;
	MOV	[W14+6], W1
	MOV	#2000, W0
	ADD	W1, W0, W0
	MOV	W0, [W14+6]
;PIC_DRV_Uconnect.c,608 :: 		lTemp = Time_dateToEpoch(&time_struct)+Second_Value;
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Time_dateToEpoch
	POP.D	W10
	ADD	W0, W10, W2
	ADDC	W1, W11, W3
;PIC_DRV_Uconnect.c,609 :: 		Time_epochToDate(lTemp,&time_struct);
	ADD	W14, #0, W0
	MOV	W0, W12
	MOV.D	W2, W10
	CALL	_Time_epochToDate
;PIC_DRV_Uconnect.c,610 :: 		time_struct.yy-=2000;
	MOV	[W14+6], W1
	MOV	#2000, W0
	SUB	W1, W0, W0
	MOV	W0, [W14+6]
;PIC_DRV_Uconnect.c,611 :: 		Set_RTCC_Alarm_Time(&time_struct);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_Set_RTCC_Alarm_Time
;PIC_DRV_Uconnect.c,612 :: 		}
L_end_Set_RTCC_Alarm_In_Second:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Set_RTCC_Alarm_In_Second

_Init_ExtEeprom:

;PIC_DRV_Uconnect.c,619 :: 		void Init_ExtEeprom(void)
;PIC_DRV_Uconnect.c,621 :: 		CS_EEPROM_Lat=ON;
	PUSH	W10
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,622 :: 		Delay_ms(10);
	MOV	#53333, W7
L_Init_ExtEeprom55:
	DEC	W7
	BRA NZ	L_Init_ExtEeprom55
	NOP
;PIC_DRV_Uconnect.c,623 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,624 :: 		SPI1_Write(0x06);        //opcode write eneble
	MOV	#6, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,625 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,626 :: 		while(!CheckIfExtEepromIsReady());
L_Init_ExtEeprom57:
	CALL	_CheckIfExtEepromIsReady
	CP0.B	W0
	BRA Z	L__Init_ExtEeprom161
	GOTO	L_Init_ExtEeprom58
L__Init_ExtEeprom161:
	GOTO	L_Init_ExtEeprom57
L_Init_ExtEeprom58:
;PIC_DRV_Uconnect.c,627 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,628 :: 		SPI1_Write(0x01);        //opcode Write Status Register "WRSR"
	MOV	#1, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,629 :: 		SPI1_Write(0x02);    //WPEN=0;IPL=0;LIP=0;BP1=0;BP0=0;WEL=1;
	MOV	#2, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,630 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,631 :: 		}
L_end_Init_ExtEeprom:
	POP	W10
	RETURN
; end of _Init_ExtEeprom

_CheckIfExtEepromIsReady:

;PIC_DRV_Uconnect.c,633 :: 		char CheckIfExtEepromIsReady(void)
;PIC_DRV_Uconnect.c,636 :: 		CS_EEPROM_Lat=OFF;
	PUSH	W10
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,637 :: 		SPI1_Write(0x05);        //opcode Read Status Register "RDSR"
	MOV	#5, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,638 :: 		cTemp=SPI1_Read(0x00);
	CLR	W10
	CALL	_SPI1_Read
;PIC_DRV_Uconnect.c,639 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,640 :: 		if(!(cTemp&0x01)) return 1;
	BTSC	W0, #0
	GOTO	L_CheckIfExtEepromIsReady59
	MOV.B	#1, W0
	GOTO	L_end_CheckIfExtEepromIsReady
L_CheckIfExtEepromIsReady59:
;PIC_DRV_Uconnect.c,641 :: 		else return 0;
	CLR	W0
;PIC_DRV_Uconnect.c,642 :: 		}
;PIC_DRV_Uconnect.c,641 :: 		else return 0;
;PIC_DRV_Uconnect.c,642 :: 		}
L_end_CheckIfExtEepromIsReady:
	POP	W10
	RETURN
; end of _CheckIfExtEepromIsReady

_ExtEeprom_WriteByte:

;PIC_DRV_Uconnect.c,644 :: 		void ExtEeprom_WriteByte(unsigned int Address,char DataByte)
;PIC_DRV_Uconnect.c,646 :: 		while(!CheckIfExtEepromIsReady());
L_ExtEeprom_WriteByte61:
	CALL	_CheckIfExtEepromIsReady
	CP0.B	W0
	BRA Z	L__ExtEeprom_WriteByte164
	GOTO	L_ExtEeprom_WriteByte62
L__ExtEeprom_WriteByte164:
	GOTO	L_ExtEeprom_WriteByte61
L_ExtEeprom_WriteByte62:
;PIC_DRV_Uconnect.c,647 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,648 :: 		SPI1_Write(0x06);        //opcode write eneble
	PUSH	W10
	MOV	#6, W10
	CALL	_SPI1_Write
	POP	W10
;PIC_DRV_Uconnect.c,649 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,650 :: 		while(!CheckIfExtEepromIsReady());
L_ExtEeprom_WriteByte63:
	CALL	_CheckIfExtEepromIsReady
	CP0.B	W0
	BRA Z	L__ExtEeprom_WriteByte165
	GOTO	L_ExtEeprom_WriteByte64
L__ExtEeprom_WriteByte165:
	GOTO	L_ExtEeprom_WriteByte63
L_ExtEeprom_WriteByte64:
;PIC_DRV_Uconnect.c,651 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,652 :: 		SPI1_Write(0x02);        //opcode write
	PUSH	W10
	MOV	#2, W10
	CALL	_SPI1_Write
	POP	W10
;PIC_DRV_Uconnect.c,653 :: 		SPI1_Write((Address&0xFF00)>>8);
	MOV	#65280, W0
	AND	W10, W0, W0
	LSR	W0, #8, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SPI1_Write
	POP	W10
;PIC_DRV_Uconnect.c,654 :: 		SPI1_Write(Address&0x00FF);
	MOV	#255, W0
	AND	W10, W0, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,655 :: 		SPI1_Write(DataByte);
	ZE	W11, W10
	CALL	_SPI1_Write
	POP	W10
;PIC_DRV_Uconnect.c,656 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,657 :: 		Delay_ms(5);
	MOV	#26666, W7
L_ExtEeprom_WriteByte65:
	DEC	W7
	BRA NZ	L_ExtEeprom_WriteByte65
	NOP
	NOP
;PIC_DRV_Uconnect.c,658 :: 		}
L_end_ExtEeprom_WriteByte:
	RETURN
; end of _ExtEeprom_WriteByte

_ExtEeprom_ReadByte:

;PIC_DRV_Uconnect.c,660 :: 		char ExtEeprom_ReadByte(unsigned int Address)
;PIC_DRV_Uconnect.c,663 :: 		while(!CheckIfExtEepromIsReady());
L_ExtEeprom_ReadByte67:
	CALL	_CheckIfExtEepromIsReady
	CP0.B	W0
	BRA Z	L__ExtEeprom_ReadByte167
	GOTO	L_ExtEeprom_ReadByte68
L__ExtEeprom_ReadByte167:
	GOTO	L_ExtEeprom_ReadByte67
L_ExtEeprom_ReadByte68:
;PIC_DRV_Uconnect.c,664 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,665 :: 		SPI1_Write(0x03);        //opcode read
	PUSH	W10
	MOV	#3, W10
	CALL	_SPI1_Write
	POP	W10
;PIC_DRV_Uconnect.c,666 :: 		SPI1_Write((Address&0xFF00)>>8);
	MOV	#65280, W0
	AND	W10, W0, W0
	LSR	W0, #8, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SPI1_Write
	POP	W10
;PIC_DRV_Uconnect.c,667 :: 		SPI1_Write(Address&0x00FF);
	MOV	#255, W0
	AND	W10, W0, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,668 :: 		cTemp=SPI1_Read(0x00);
	CLR	W10
	CALL	_SPI1_Read
	POP	W10
;PIC_DRV_Uconnect.c,669 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,670 :: 		return cTemp;
;PIC_DRV_Uconnect.c,671 :: 		}
L_end_ExtEeprom_ReadByte:
	RETURN
; end of _ExtEeprom_ReadByte

_Delete_ExtEeprom:

;PIC_DRV_Uconnect.c,673 :: 		void Delete_ExtEeprom(void)
;PIC_DRV_Uconnect.c,675 :: 		char i,PageLength=128;
	PUSH	W10
; PageLength start address is: 0 (W0)
	MOV.B	#128, W0
;PIC_DRV_Uconnect.c,676 :: 		unsigned long k=0,EepromSize=65536;
; EepromSize start address is: 12 (W6)
	MOV	#0, W6
	MOV	#1, W7
;PIC_DRV_Uconnect.c,678 :: 		k=0;
; k start address is: 6 (W3)
	CLR	W3
	CLR	W4
; PageLength end address is: 0 (W0)
; EepromSize end address is: 12 (W6)
; k end address is: 6 (W3)
	MOV.B	W0, W1
;PIC_DRV_Uconnect.c,679 :: 		while(k<EepromSize)
L_Delete_ExtEeprom69:
; k start address is: 6 (W3)
; EepromSize start address is: 12 (W6)
; PageLength start address is: 2 (W1)
	CP	W3, W6
	CPB	W4, W7
	BRA LTU	L__Delete_ExtEeprom169
	GOTO	L_Delete_ExtEeprom70
L__Delete_ExtEeprom169:
; PageLength end address is: 2 (W1)
; EepromSize end address is: 12 (W6)
; k end address is: 6 (W3)
	MOV	W4, W5
	MOV	W3, W4
;PIC_DRV_Uconnect.c,681 :: 		while(!CheckIfExtEepromIsReady());
L_Delete_ExtEeprom71:
; PageLength start address is: 2 (W1)
; EepromSize start address is: 12 (W6)
; k start address is: 8 (W4)
	CALL	_CheckIfExtEepromIsReady
	CP0.B	W0
	BRA Z	L__Delete_ExtEeprom170
	GOTO	L_Delete_ExtEeprom72
L__Delete_ExtEeprom170:
	GOTO	L_Delete_ExtEeprom71
L_Delete_ExtEeprom72:
;PIC_DRV_Uconnect.c,682 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,683 :: 		SPI1_Write(0x06);        //opcode write eneble
	MOV	#6, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,684 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
; PageLength end address is: 2 (W1)
; k end address is: 8 (W4)
; EepromSize end address is: 12 (W6)
	MOV.B	W1, W8
;PIC_DRV_Uconnect.c,685 :: 		while(!CheckIfExtEepromIsReady());
L_Delete_ExtEeprom73:
; k start address is: 8 (W4)
; EepromSize start address is: 12 (W6)
; PageLength start address is: 16 (W8)
	CALL	_CheckIfExtEepromIsReady
	CP0.B	W0
	BRA Z	L__Delete_ExtEeprom171
	GOTO	L_Delete_ExtEeprom74
L__Delete_ExtEeprom171:
	GOTO	L_Delete_ExtEeprom73
L_Delete_ExtEeprom74:
;PIC_DRV_Uconnect.c,686 :: 		CS_EEPROM_Lat=OFF;
	BCLR.B	LATD, #7
;PIC_DRV_Uconnect.c,687 :: 		SPI1_Write(0x02);        //opcode write
	MOV	#2, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,688 :: 		SPI1_Write((k&0x0000FF00)>>8);
	MOV	#65280, W0
	MOV	#0, W1
	AND	W4, W0, W2
	AND	W5, W1, W3
	LSR	W2, #8, W0
	SL	W3, #8, W1
	IOR	W0, W1, W0
	LSR	W3, #8, W1
	MOV	W0, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,689 :: 		SPI1_Write(k&0x000000FF);
	MOV	#255, W0
	AND	W4, W0, W0
	MOV	W0, W10
	CALL	_SPI1_Write
;PIC_DRV_Uconnect.c,690 :: 		for(i=0;i<PageLength;i++) SPI1_Write(0x00);
; i start address is: 2 (W1)
	CLR	W1
; k end address is: 8 (W4)
; PageLength end address is: 16 (W8)
; EepromSize end address is: 12 (W6)
; i end address is: 2 (W1)
	MOV	W4, W3
	MOV	W5, W4
	MOV.B	W8, W2
L_Delete_ExtEeprom75:
; i start address is: 2 (W1)
; PageLength start address is: 4 (W2)
; EepromSize start address is: 12 (W6)
; k start address is: 6 (W3)
	CP.B	W1, W2
	BRA LTU	L__Delete_ExtEeprom172
	GOTO	L_Delete_ExtEeprom76
L__Delete_ExtEeprom172:
	CLR	W10
	CALL	_SPI1_Write
	INC.B	W1
; i end address is: 2 (W1)
	GOTO	L_Delete_ExtEeprom75
L_Delete_ExtEeprom76:
;PIC_DRV_Uconnect.c,691 :: 		CS_EEPROM_Lat=ON;
	BSET.B	LATD, #7
;PIC_DRV_Uconnect.c,692 :: 		k+=PageLength;
	ZE	W2, W0
	CLR	W1
	ADD	W3, W0, W3
	ADDC	W4, W1, W4
;PIC_DRV_Uconnect.c,693 :: 		}
	MOV.B	W2, W1
; PageLength end address is: 4 (W2)
; EepromSize end address is: 12 (W6)
; k end address is: 6 (W3)
	GOTO	L_Delete_ExtEeprom69
L_Delete_ExtEeprom70:
;PIC_DRV_Uconnect.c,694 :: 		}
L_end_Delete_ExtEeprom:
	POP	W10
	RETURN
; end of _Delete_ExtEeprom

_GoToSleepMode:

;PIC_DRV_Uconnect.c,703 :: 		void GoToSleepMode(void)
;PIC_DRV_Uconnect.c,706 :: 		U2MD_bit=1;  //UART2 Module Disable bit
	BSET	U2MD_bit, BitPos(U2MD_bit+0)
;PIC_DRV_Uconnect.c,707 :: 		SPI1MD_bit=1;//SPI1 Module  Disable bit
	BSET	SPI1MD_bit, BitPos(SPI1MD_bit+0)
;PIC_DRV_Uconnect.c,708 :: 		AD1MD_bit=1;//A/D Converter Module Disable bit
	BSET	AD1MD_bit, BitPos(AD1MD_bit+0)
;PIC_DRV_Uconnect.c,709 :: 		MTXSRX1_Tris=OUTPUT;
	BCLR.B	TRISD, #4
;PIC_DRV_Uconnect.c,710 :: 		MTXSRX1_Lat=OFF;
	BCLR.B	LATD, #4
;PIC_DRV_Uconnect.c,711 :: 		MRXSTX1_Tris=OUTPUT;
	BCLR.B	TRISD, #5
;PIC_DRV_Uconnect.c,712 :: 		MRXSTX1_Lat=OFF;
	BCLR.B	LATD, #5
;PIC_DRV_Uconnect.c,713 :: 		MTXSRX2_Tris=OUTPUT;
	BCLR	TRISD, #10
;PIC_DRV_Uconnect.c,714 :: 		MTXSRX2_Lat=OFF;
	BCLR	LATD, #10
;PIC_DRV_Uconnect.c,715 :: 		MRXSTX2_Tris=OUTPUT;
	BCLR	TRISD, #11
;PIC_DRV_Uconnect.c,716 :: 		MRXSTX2_Lat=OFF;
	BCLR	LATD, #11
;PIC_DRV_Uconnect.c,717 :: 		PHY_SCK_Tris=OUTPUT;
	BCLR.B	TRISF, #5
;PIC_DRV_Uconnect.c,718 :: 		PHY_SDI_Tris=OUTPUT;
	BCLR.B	TRISF, #3
;PIC_DRV_Uconnect.c,719 :: 		PHY_SDO_Tris=OUTPUT;
	BCLR.B	TRISF, #2
;PIC_DRV_Uconnect.c,720 :: 		PHY_SCK=0;
	BCLR.B	LATF, #5
;PIC_DRV_Uconnect.c,721 :: 		PHY_SDI_Lat=0;
	BCLR.B	LATF, #3
;PIC_DRV_Uconnect.c,722 :: 		PHY_SDO=0;
	BCLR.B	LATF, #2
;PIC_DRV_Uconnect.c,723 :: 		IOCPDB=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, IOCPDB
;PIC_DRV_Uconnect.c,724 :: 		IOCPDC=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, IOCPDC
;PIC_DRV_Uconnect.c,725 :: 		IOCPDD=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, IOCPDD
;PIC_DRV_Uconnect.c,726 :: 		IOCPDE=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, IOCPDE
;PIC_DRV_Uconnect.c,727 :: 		IOCPDF=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, IOCPDF
;PIC_DRV_Uconnect.c,728 :: 		IOCPDG=0xFFFF;
	MOV	#65535, W0
	MOV	WREG, IOCPDG
;PIC_DRV_Uconnect.c,729 :: 		RCON.SWDTEN=OFF;
	BCLR.B	RCON, #5
;PIC_DRV_Uconnect.c,730 :: 		OSCCON=0x5500;
	MOV	#21760, W0
	MOV	WREG, OSCCON
;PIC_DRV_Uconnect.c,731 :: 		asm { PWRSAV #0 }
	PWRSAV	#0
;PIC_DRV_Uconnect.c,732 :: 		}
L_end_GoToSleepMode:
	RETURN
; end of _GoToSleepMode

_WakeUpFromSleepMode:

;PIC_DRV_Uconnect.c,735 :: 		void WakeUpFromSleepMode(void)
;PIC_DRV_Uconnect.c,737 :: 		OSCCON=0x3300;
	PUSH	W10
	PUSH	W11
	MOV	#13056, W0
	MOV	WREG, OSCCON
;PIC_DRV_Uconnect.c,738 :: 		IOCPDB=0x0000;
	CLR	IOCPDB
;PIC_DRV_Uconnect.c,739 :: 		IOCPDC=0x0000;
	CLR	IOCPDC
;PIC_DRV_Uconnect.c,740 :: 		IOCPDD=0x0000;
	CLR	IOCPDD
;PIC_DRV_Uconnect.c,741 :: 		IOCPDE=0x0000;
	CLR	IOCPDE
;PIC_DRV_Uconnect.c,742 :: 		IOCPDF=0x0000;
	CLR	IOCPDF
;PIC_DRV_Uconnect.c,743 :: 		IOCPDG=0x0000;
	CLR	IOCPDG
;PIC_DRV_Uconnect.c,744 :: 		RCON.SWDTEN=ON;
	BSET.B	RCON, #5
;PIC_DRV_Uconnect.c,745 :: 		MTXSRX2_Tris=OUTPUT;
	BCLR	TRISD, #10
;PIC_DRV_Uconnect.c,746 :: 		MRXSTX2_Tris=INPUT;
	BSET	TRISD, #11
;PIC_DRV_Uconnect.c,747 :: 		U2MD_bit=0;  //UART2 Module Disable bit
	BCLR	U2MD_bit, BitPos(U2MD_bit+0)
;PIC_DRV_Uconnect.c,748 :: 		Uart2_Init(57600);
	MOV	#57600, W10
	MOV	#0, W11
	CALL	_UART2_Init
;PIC_DRV_Uconnect.c,749 :: 		SPI1MD_bit=0;//SPI1 Module  Disable bit
	BCLR	SPI1MD_bit, BitPos(SPI1MD_bit+0)
;PIC_DRV_Uconnect.c,750 :: 		PHY_SCK=0;
	BCLR.B	LATF, #5
;PIC_DRV_Uconnect.c,751 :: 		PHY_SCK_Tris=OUTPUT;
	BCLR.B	TRISF, #5
;PIC_DRV_Uconnect.c,752 :: 		PHY_SCK_PIN=0;
	BCLR.B	LATF, #5
;PIC_DRV_Uconnect.c,753 :: 		PHY_SDI=0;
	BCLR.B	PORTF, #3
;PIC_DRV_Uconnect.c,754 :: 		PHY_SDI_Tris=INPUT;
	BSET.B	TRISF, #3
;PIC_DRV_Uconnect.c,755 :: 		PHY_SDO=0;
	BCLR.B	LATF, #2
;PIC_DRV_Uconnect.c,756 :: 		PHY_SDO_Tris=OUTPUT;
	BCLR.B	TRISF, #2
;PIC_DRV_Uconnect.c,757 :: 		PHY_SDO_PIN=0;
	BCLR.B	LATF, #2
;PIC_DRV_Uconnect.c,758 :: 		SPI1_Init();
	CALL	_SPI1_Init
;PIC_DRV_Uconnect.c,759 :: 		AD1MD_bit=0;//A/D Converter Module Disable bit
	BCLR	AD1MD_bit, BitPos(AD1MD_bit+0)
;PIC_DRV_Uconnect.c,760 :: 		ADC1_Init_Advanced(_ADC_12bit, _ADC_EXTERNAL_VREFH | _ADC_INTERNAL_VREFL);
	MOV	#16384, W11
	MOV	#1, W10
	CALL	_ADC1_Init_Advanced
;PIC_DRV_Uconnect.c,761 :: 		AD1CON3=0x0503;
	MOV	#1283, W0
	MOV	WREG, AD1CON3
;PIC_DRV_Uconnect.c,762 :: 		Delay_ms(1);
	MOV	#5333, W7
L_WakeUpFromSleepMode78:
	DEC	W7
	BRA NZ	L_WakeUpFromSleepMode78
	NOP
;PIC_DRV_Uconnect.c,763 :: 		}
L_end_WakeUpFromSleepMode:
	POP	W11
	POP	W10
	RETURN
; end of _WakeUpFromSleepMode

_SPI1_Initialize_MCP:

;PIC_DRV_Uconnect.c,765 :: 		void SPI1_Initialize_MCP (void)
;PIC_DRV_Uconnect.c,767 :: 		SPI1CON1H = 0x0000;
	CLR	SPI1CON1H
;PIC_DRV_Uconnect.c,768 :: 		SPI1CON2L = 0x0000;
	CLR	SPI1CON2L
;PIC_DRV_Uconnect.c,769 :: 		SPI1STATL = 0x0000;
	CLR	SPI1STATL
;PIC_DRV_Uconnect.c,770 :: 		SPI1BRGL = 0x0001;  //4 MHz
	MOV	#1, W0
	MOV	WREG, SPI1BRGL
;PIC_DRV_Uconnect.c,773 :: 		SPI1IMSKL = 0x0000;
	CLR	SPI1IMSKL
;PIC_DRV_Uconnect.c,774 :: 		SPI1IMSKH = 0x0000;
	CLR	SPI1IMSKH
;PIC_DRV_Uconnect.c,775 :: 		SPI1URDTL = 0x0000;
	CLR	SPI1URDTL
;PIC_DRV_Uconnect.c,776 :: 		SPI1URDTH = 0x0000;
	CLR	SPI1URDTH
;PIC_DRV_Uconnect.c,777 :: 		SPI1CON1L = 0x8121;   //mode 0 8 bit
	MOV	#33057, W0
	MOV	WREG, SPI1CON1L
;PIC_DRV_Uconnect.c,778 :: 		}
L_end_SPI1_Initialize_MCP:
	RETURN
; end of _SPI1_Initialize_MCP

_Battery_Power_Boost_Activation:

;PIC_DRV_Uconnect.c,780 :: 		void Battery_Power_Boost_Activation(char mode)
;PIC_DRV_Uconnect.c,782 :: 		if(mode) EN_BATTERY_BYPASS_Lat=ON;
	CP0.B	W10
	BRA NZ	L__Battery_Power_Boost_Activation177
	GOTO	L_Battery_Power_Boost_Activation80
L__Battery_Power_Boost_Activation177:
	BSET	LATB, #12
	GOTO	L_Battery_Power_Boost_Activation81
L_Battery_Power_Boost_Activation80:
;PIC_DRV_Uconnect.c,783 :: 		else EN_BATTERY_BYPASS_Lat=OFF;
	BCLR	LATB, #12
L_Battery_Power_Boost_Activation81:
;PIC_DRV_Uconnect.c,784 :: 		}
L_end_Battery_Power_Boost_Activation:
	RETURN
; end of _Battery_Power_Boost_Activation

_CheckAndSwitchToBattery:
	LNK	#4

;PIC_DRV_Uconnect.c,786 :: 		void CheckAndSwitchToBattery(void)
;PIC_DRV_Uconnect.c,790 :: 		VREFF_Buff=ANALOG;
	PUSH	W10
	BSET.B	ANSB, #0
;PIC_DRV_Uconnect.c,791 :: 		VREFF_Tris=INPUT;
	BSET.B	TRISB, #0
;PIC_DRV_Uconnect.c,792 :: 		SW_VREFF_Lat=ON;
	BSET.B	LATD, #3
;PIC_DRV_Uconnect.c,793 :: 		PIN_12V_VOLTAGE_SAMPLE_Buff=ANALOG;
	BSET	ANSB, #13
;PIC_DRV_Uconnect.c,794 :: 		PIN_12V_VOLTAGE_SAMPLE_Tris=INPUT;
	BSET	TRISB, #13
;PIC_DRV_Uconnect.c,795 :: 		SW_12V_VOLTAGE_Lat=ON;
	BSET.B	LATD, #6
;PIC_DRV_Uconnect.c,796 :: 		ADC1_Get_Sample(13);// must to do
	MOV	#13, W10
	CALL	_ADC1_Get_Sample
;PIC_DRV_Uconnect.c,797 :: 		ADC_Sampling=((float)ADC1_Get_Sample(13)+(float)ADC1_Get_Sample(13))/2;
	MOV	#13, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#13, W10
	CALL	_ADC1_Get_Sample
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__AddSub_FP
	MOV	#0, W2
	MOV	#16384, W3
	CALL	__Div_FP
;PIC_DRV_Uconnect.c,798 :: 		VIN=((ADC_Sampling*Vref)/4095)*VIN_ResistorsFactor;
	MOV	#4719, W2
	MOV	#16387, W3
	CALL	__Mul_FP
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
	MOV	#15792, W2
	MOV	#16768, W3
	CALL	__Mul_FP
; VIN start address is: 4 (W2)
	MOV.D	W0, W2
;PIC_DRV_Uconnect.c,799 :: 		if((VIN<=4.5)&&(EN_BATTERY_BYPASS_Port==OFF)){Battery_Power_Boost_Activation(ON);}
	PUSH.D	W2
	MOV	#0, W2
	MOV	#16528, W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GT	L__CheckAndSwitchToBattery179
	INC.B	W0
L__CheckAndSwitchToBattery179:
	POP.D	W2
	CP0.B	W0
	BRA NZ	L__CheckAndSwitchToBattery180
	GOTO	L__CheckAndSwitchToBattery112
L__CheckAndSwitchToBattery180:
	BTSC	PORTB, #12
	GOTO	L__CheckAndSwitchToBattery111
; VIN end address is: 4 (W2)
L__CheckAndSwitchToBattery110:
	MOV.B	#1, W10
	CALL	_Battery_Power_Boost_Activation
	GOTO	L_CheckAndSwitchToBattery85
L__CheckAndSwitchToBattery112:
; VIN start address is: 4 (W2)
L__CheckAndSwitchToBattery111:
;PIC_DRV_Uconnect.c,800 :: 		else if ((VIN>4.5)&&(EN_BATTERY_BYPASS_Port==ON)) {Battery_Power_Boost_Activation(OFF);}
	MOV.D	W2, W0
	MOV	#0, W2
	MOV	#16528, W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__CheckAndSwitchToBattery181
	INC.B	W0
L__CheckAndSwitchToBattery181:
; VIN end address is: 4 (W2)
	CP0.B	W0
	BRA NZ	L__CheckAndSwitchToBattery182
	GOTO	L__CheckAndSwitchToBattery114
L__CheckAndSwitchToBattery182:
	BTSS	PORTB, #12
	GOTO	L__CheckAndSwitchToBattery113
L__CheckAndSwitchToBattery109:
	CLR	W10
	CALL	_Battery_Power_Boost_Activation
L__CheckAndSwitchToBattery114:
L__CheckAndSwitchToBattery113:
L_CheckAndSwitchToBattery85:
;PIC_DRV_Uconnect.c,801 :: 		}
L_end_CheckAndSwitchToBattery:
	POP	W10
	ULNK
	RETURN
; end of _CheckAndSwitchToBattery

_Pseudo_Uart1_Write_Byte:

;PIC_DRV_Uconnect.c,804 :: 		void Pseudo_Uart1_Write_Byte(char din)
;PIC_DRV_Uconnect.c,808 :: 		MTXSRX1_Lat=0;       //Start Bit
	BCLR.B	LATD, #4
;PIC_DRV_Uconnect.c,809 :: 		Delay_us(8);
	MOV	#42, W7
L_Pseudo_Uart1_Write_Byte89:
	DEC	W7
	BRA NZ	L_Pseudo_Uart1_Write_Byte89
	NOP
	NOP
;PIC_DRV_Uconnect.c,810 :: 		for(i=0;i<8;i++)
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_Pseudo_Uart1_Write_Byte91:
; i start address is: 2 (W1)
	CP.B	W1, #8
	BRA LTU	L__Pseudo_Uart1_Write_Byte184
	GOTO	L_Pseudo_Uart1_Write_Byte92
L__Pseudo_Uart1_Write_Byte184:
;PIC_DRV_Uconnect.c,812 :: 		MTXSRX1_Lat=din&0x01; //   this take 17us (all the loop) Approx
	ZE	W10, W0
	AND	W0, #1, W0
	BTSS	W0, #0
	BCLR.B	LATD, #4
	BTSC	W0, #0
	BSET.B	LATD, #4
;PIC_DRV_Uconnect.c,813 :: 		din>>=1;
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;PIC_DRV_Uconnect.c,814 :: 		Delay_us(8);
	MOV	#42, W7
L_Pseudo_Uart1_Write_Byte94:
	DEC	W7
	BRA NZ	L_Pseudo_Uart1_Write_Byte94
	NOP
	NOP
;PIC_DRV_Uconnect.c,810 :: 		for(i=0;i<8;i++)
	INC.B	W1
;PIC_DRV_Uconnect.c,815 :: 		}
; i end address is: 2 (W1)
	GOTO	L_Pseudo_Uart1_Write_Byte91
L_Pseudo_Uart1_Write_Byte92:
;PIC_DRV_Uconnect.c,816 :: 		MTXSRX1_Lat=1;       //Stop Bit
	BSET.B	LATD, #4
;PIC_DRV_Uconnect.c,817 :: 		Delay_us(8);
	MOV	#42, W7
L_Pseudo_Uart1_Write_Byte96:
	DEC	W7
	BRA NZ	L_Pseudo_Uart1_Write_Byte96
	NOP
	NOP
;PIC_DRV_Uconnect.c,818 :: 		}
L_end_Pseudo_Uart1_Write_Byte:
	RETURN
; end of _Pseudo_Uart1_Write_Byte

_Pseudo_Uart1_Write_Text:

;PIC_DRV_Uconnect.c,820 :: 		void Pseudo_Uart1_Write_Text(unsigned char *p)
;PIC_DRV_Uconnect.c,822 :: 		int i=0;
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
;PIC_DRV_Uconnect.c,823 :: 		while(p[i]!=0) Pseudo_Uart1_Write_Byte(p[i++]);
L_Pseudo_Uart1_Write_Text98:
; i start address is: 4 (W2)
	ADD	W10, W2, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Pseudo_Uart1_Write_Text186
	GOTO	L_Pseudo_Uart1_Write_Text99
L__Pseudo_Uart1_Write_Text186:
	ADD	W10, W2, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_Pseudo_Uart1_Write_Byte
	POP	W10
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_Pseudo_Uart1_Write_Text98
L_Pseudo_Uart1_Write_Text99:
;PIC_DRV_Uconnect.c,824 :: 		}
L_end_Pseudo_Uart1_Write_Text:
	RETURN
; end of _Pseudo_Uart1_Write_Text

_Pseudo_Uart1_Enable:

;PIC_DRV_Uconnect.c,826 :: 		void Pseudo_Uart1_Enable(char mode)
;PIC_DRV_Uconnect.c,828 :: 		MTXSRX1_Lat=0;
	PUSH	W10
	PUSH	W11
	BCLR.B	LATD, #4
;PIC_DRV_Uconnect.c,829 :: 		MTXSRX1_Tris=OUTPUT;
	BCLR.B	TRISD, #4
;PIC_DRV_Uconnect.c,831 :: 		MRXSTX1_Lat=0;
	BCLR.B	LATD, #5
;PIC_DRV_Uconnect.c,832 :: 		MRXSTX1_Tris=INPUT;
	BSET.B	TRISD, #5
;PIC_DRV_Uconnect.c,833 :: 		switch (mode)
	GOTO	L_Pseudo_Uart1_Enable100
;PIC_DRV_Uconnect.c,835 :: 		case 1  :
L_Pseudo_Uart1_Enable102:
;PIC_DRV_Uconnect.c,836 :: 		U1MD_bit=1;   //Disable
	BSET	U1MD_bit, BitPos(U1MD_bit+0)
;PIC_DRV_Uconnect.c,837 :: 		Delay_ms(10);
	MOV	#53333, W7
L_Pseudo_Uart1_Enable103:
	DEC	W7
	BRA NZ	L_Pseudo_Uart1_Enable103
	NOP
;PIC_DRV_Uconnect.c,838 :: 		break;
	GOTO	L_Pseudo_Uart1_Enable101
;PIC_DRV_Uconnect.c,839 :: 		case 0  :
L_Pseudo_Uart1_Enable105:
;PIC_DRV_Uconnect.c,840 :: 		U1MD_bit=0;  //Enable
	BCLR	U1MD_bit, BitPos(U1MD_bit+0)
;PIC_DRV_Uconnect.c,841 :: 		Uart1_Init(2000000);
	MOV	#33920, W10
	MOV	#30, W11
	CALL	_UART1_Init
;PIC_DRV_Uconnect.c,842 :: 		Delay_ms(100);
	MOV	#9, W8
	MOV	#9047, W7
L_Pseudo_Uart1_Enable106:
	DEC	W7
	BRA NZ	L_Pseudo_Uart1_Enable106
	DEC	W8
	BRA NZ	L_Pseudo_Uart1_Enable106
;PIC_DRV_Uconnect.c,843 :: 		break;
	GOTO	L_Pseudo_Uart1_Enable101
;PIC_DRV_Uconnect.c,845 :: 		}
L_Pseudo_Uart1_Enable100:
	CP.B	W10, #1
	BRA NZ	L__Pseudo_Uart1_Enable188
	GOTO	L_Pseudo_Uart1_Enable102
L__Pseudo_Uart1_Enable188:
	CP.B	W10, #0
	BRA NZ	L__Pseudo_Uart1_Enable189
	GOTO	L_Pseudo_Uart1_Enable105
L__Pseudo_Uart1_Enable189:
L_Pseudo_Uart1_Enable101:
;PIC_DRV_Uconnect.c,846 :: 		}
L_end_Pseudo_Uart1_Enable:
	POP	W11
	POP	W10
	RETURN
; end of _Pseudo_Uart1_Enable

_CheckRxDataFromInterruptUart2:

;PIC_DRV_Uconnect.c,848 :: 		void CheckRxDataFromInterruptUart2(void)
;PIC_DRV_Uconnect.c,850 :: 		int i=0;
;PIC_DRV_Uconnect.c,851 :: 		if(Uart2_Rx_Int_Flag)
	BTSS	IFS1bits, #14
	GOTO	L_CheckRxDataFromInterruptUart2108
;PIC_DRV_Uconnect.c,853 :: 		PrintOut(PrintHandler,"\rUart2 Intterupt Buffer:%s",UART2_RX_Interrupt_Buffer);
	MOV	#lo_addr(_UART2_RX_Interrupt_Buffer), W0
	PUSH	W0
	MOV	#lo_addr(?lstr_10_PIC_DRV_Uconnect), W0
	PUSH	W0
	MOV	#lo_addr(_PrintHandler), W0
	PUSH	W0
	CALL	_PrintOut
	SUB	#6, W15
;PIC_DRV_Uconnect.c,854 :: 		U2STAbits.OERR=0;
	BCLR.B	U2STAbits, #1
;PIC_DRV_Uconnect.c,855 :: 		Uart2_Rx_Int_Flag=0;
	BCLR	IFS1bits, #14
;PIC_DRV_Uconnect.c,856 :: 		Uart2_RX_Int_En=1;
	BSET	IEC1bits, #14
;PIC_DRV_Uconnect.c,857 :: 		}
L_CheckRxDataFromInterruptUart2108:
;PIC_DRV_Uconnect.c,858 :: 		}
L_end_CheckRxDataFromInterruptUart2:
	RETURN
; end of _CheckRxDataFromInterruptUart2

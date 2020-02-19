
_GetEepromControl:

;Config_File.c,11 :: 		void GetEepromControl(Mem_AddressType address, EepromControl *control)
;Config_File.c,13 :: 		if (address < Eeprom_Size)
	CP	W10, #0
	BRA LTU	L__GetEepromControl9
	GOTO	L_GetEepromControl0
L__GetEepromControl9:
;Config_File.c,15 :: 		control->num = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W11]
;Config_File.c,16 :: 		control->address = address;
	ADD	W11, #2, W0
	MOV	W10, [W0]
;Config_File.c,17 :: 		} else
	GOTO	L_GetEepromControl1
L_GetEepromControl0:
;Config_File.c,19 :: 		control->num = 2;
	MOV.B	#2, W0
	MOV.B	W0, [W11]
;Config_File.c,20 :: 		control->address = (Mem_AddressType) (address - Eeprom_Size);
	ADD	W11, #2, W0
	MOV	W10, [W0]
;Config_File.c,21 :: 		}
L_GetEepromControl1:
;Config_File.c,22 :: 		}
L_end_GetEepromControl:
	RETURN
; end of _GetEepromControl

_MemWrt:

;Config_File.c,24 :: 		void MemWrt(Mem_AddressType address,char m_data)
;Config_File.c,27 :: 		m_writer(address, m_data);//MEM[address] = _data;//
	MOV	_m_writer, W0
	CALL	W0
;Config_File.c,29 :: 		}
L_end_MemWrt:
	RETURN
; end of _MemWrt

_MemRd:

;Config_File.c,31 :: 		unsigned char MemRd(Mem_AddressType address)
;Config_File.c,34 :: 		return m_reader(address);//MEM[address];//
	MOV	_m_reader, W1
	CALL	W1
;Config_File.c,35 :: 		}
L_end_MemRd:
	RETURN
; end of _MemRd

_SetAddressProperty:

;Config_File.c,47 :: 		void SetAddressProperty(Mem_AddressType address, Mem_AddressType value)
;Config_File.c,50 :: 		SetIntProperty(address,value);
	CALL	_SetIntProperty
;Config_File.c,52 :: 		SetLongProperty(address,value);
L_SetAddressProperty3:
;Config_File.c,53 :: 		}
L_end_SetAddressProperty:
	RETURN
; end of _SetAddressProperty

_GetAddressProperty:

;Config_File.c,55 :: 		Mem_AddressType GetAddressProperty(Mem_AddressType address)
;Config_File.c,58 :: 		return GetIntProperty(address);
	CALL	_GetIntProperty
;Config_File.c,63 :: 		}
L_end_GetAddressProperty:
	RETURN
; end of _GetAddressProperty

_GetProperty:

;Config_File.c,69 :: 		unsigned char GetProperty(Mem_AddressType address)
;Config_File.c,71 :: 		return MemRd(address);;
	CALL	_MemRd
;Config_File.c,72 :: 		}
L_end_GetProperty:
	RETURN
; end of _GetProperty

_SetProperty:

;Config_File.c,79 :: 		Mem_AddressType SetProperty(Mem_AddressType address, uint_8 value)
;Config_File.c,81 :: 		MemWrt(address, value);
	PUSH	W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,82 :: 		return (Mem_AddressType) (address + 1);
	ADD	W10, #1, W0
;Config_File.c,83 :: 		}
L_end_SetProperty:
	RETURN
; end of _SetProperty

_SetIntProperty:
	LNK	#2

;Config_File.c,95 :: 		Mem_AddressType SetIntProperty(Mem_AddressType start_address, uint_16 value)
;Config_File.c,97 :: 		uint_8 high = Hi(value);
	PUSH	W11
	MOV	#lo_addr(W11), W0
	INC	W0
;Config_File.c,99 :: 		uint_8 low = Lo(value);
	MOV.B	W11, [W14+0]
;Config_File.c,101 :: 		MemWrt(start_address, high);
	PUSH	W10
	MOV.B	[W0], W11
	CALL	_MemWrt
	POP	W10
;Config_File.c,103 :: 		MemWrt(start_address + 1, low);
	ADD	W10, #1, W0
	PUSH	W10
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,105 :: 		return (Mem_AddressType) (start_address + 2);
	ADD	W10, #2, W0
;Config_File.c,106 :: 		}
;Config_File.c,105 :: 		return (Mem_AddressType) (start_address + 2);
;Config_File.c,106 :: 		}
L_end_SetIntProperty:
	POP	W11
	ULNK
	RETURN
; end of _SetIntProperty

_SetLongProperty:
	LNK	#4

;Config_File.c,113 :: 		Mem_AddressType SetLongProperty(Mem_AddressType start_address, uint_32 value)
;Config_File.c,115 :: 		uint_8 max_high = Highest(value);
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(W11), W2
	ADD	W2, #3, W1
;Config_File.c,117 :: 		uint_8 middle_high = Higher(value);
	ADD	W2, #2, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
;Config_File.c,119 :: 		uint_8 min_high = Hi(value);
	ADD	W2, #1, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;Config_File.c,121 :: 		uint_8 low = Lo(value);
	MOV.B	W11, [W14+2]
;Config_File.c,123 :: 		MemWrt(start_address, max_high);
	PUSH	W10
	MOV.B	[W1], W11
	CALL	_MemWrt
	POP	W10
;Config_File.c,125 :: 		MemWrt(start_address + 1, middle_high);
	ADD	W10, #1, W0
	PUSH	W10
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,127 :: 		MemWrt(start_address + 2, min_high);
	ADD	W10, #2, W0
	PUSH	W10
	MOV.B	[W14+1], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,129 :: 		MemWrt(start_address + 3, low);
	ADD	W10, #3, W0
	PUSH	W10
	MOV.B	[W14+2], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,131 :: 		return (Mem_AddressType) (start_address + 4);
	ADD	W10, #4, W0
;Config_File.c,132 :: 		}
;Config_File.c,131 :: 		return (Mem_AddressType) (start_address + 4);
;Config_File.c,132 :: 		}
L_end_SetLongProperty:
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _SetLongProperty

_SetLong3Property:
	LNK	#2

;Config_File.c,134 :: 		void SetLong3Property(Mem_AddressType start_address, uint_32 value)
;Config_File.c,136 :: 		uint_8 high = Higher(value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(W11), W0
	ADD	W0, #2, W1
;Config_File.c,138 :: 		uint_8 middle = Hi(value);
	INC	W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
;Config_File.c,140 :: 		uint_8 low = Lo(value);
	MOV.B	W11, [W14+1]
;Config_File.c,142 :: 		MemWrt(start_address, high);
	PUSH	W10
	MOV.B	[W1], W11
	CALL	_MemWrt
	POP	W10
;Config_File.c,144 :: 		MemWrt(start_address + 1, middle);
	ADD	W10, #1, W0
	PUSH	W10
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,146 :: 		MemWrt(start_address + 2, low);
	ADD	W10, #2, W0
	MOV.B	[W14+1], W11
	MOV	W0, W10
	CALL	_MemWrt
;Config_File.c,147 :: 		}
L_end_SetLong3Property:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SetLong3Property

_GetIntProperty:
	LNK	#2

;Config_File.c,155 :: 		uint_16 GetIntProperty(Mem_AddressType start_address)
;Config_File.c,157 :: 		uint_8 high = MemRd(start_address);
	PUSH	W10
	PUSH	W11
	PUSH	W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+0]
;Config_File.c,159 :: 		uint_8 low = MemRd(start_address + 1);
	ADD	W10, #1, W0
	MOV	W0, W10
	CALL	_MemRd
;Config_File.c,161 :: 		uint_16 value = CombineHighLow(high, low);
	MOV.B	W0, W11
	MOV.B	[W14+0], W10
	CALL	_CombineHighLow
;Config_File.c,163 :: 		return value;
;Config_File.c,164 :: 		}
;Config_File.c,163 :: 		return value;
;Config_File.c,164 :: 		}
L_end_GetIntProperty:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GetIntProperty

_GetSignedIntProperty:
	LNK	#2

;Config_File.c,172 :: 		int_16 GetSignedIntProperty(Mem_AddressType start_address)
;Config_File.c,174 :: 		uint_8 low = MemRd(start_address);
	PUSH	W10
	PUSH	W11
	PUSH	W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+0]
;Config_File.c,176 :: 		uint_8 high = MemRd(start_address + 1);
	ADD	W10, #1, W0
	MOV	W0, W10
	CALL	_MemRd
;Config_File.c,178 :: 		return CombineSignedHighLow(high,low);
	MOV.B	[W14+0], W11
	MOV.B	W0, W10
	CALL	_CombineSignedHighLow
;Config_File.c,179 :: 		}
;Config_File.c,178 :: 		return CombineSignedHighLow(high,low);
;Config_File.c,179 :: 		}
L_end_GetSignedIntProperty:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GetSignedIntProperty

_GetSignedLongProperty:
	LNK	#4

;Config_File.c,187 :: 		int_32 GetSignedLongProperty(Mem_AddressType address)
;Config_File.c,189 :: 		int_8 max_high = MemRd(address);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	PUSH	W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+0]
;Config_File.c,191 :: 		int_8 middle_h = MemRd(address + 1);
	ADD	W10, #1, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+1]
;Config_File.c,193 :: 		int_8 min_h = MemRd(address + 2);
	ADD	W10, #2, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+2]
;Config_File.c,195 :: 		int_8 low = MemRd(address + 3);
	ADD	W10, #3, W0
	MOV	W0, W10
	CALL	_MemRd
;Config_File.c,197 :: 		return CombineLongHighLow(max_high, middle_h, min_h, low);
	MOV.B	W0, W13
	MOV.B	[W14+2], W12
	MOV.B	[W14+1], W11
	MOV.B	[W14+0], W10
	CALL	_CombineLongHighLow
;Config_File.c,198 :: 		}
;Config_File.c,197 :: 		return CombineLongHighLow(max_high, middle_h, min_h, low);
;Config_File.c,198 :: 		}
L_end_GetSignedLongProperty:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GetSignedLongProperty

_GetLongProperty:
	LNK	#4

;Config_File.c,205 :: 		uint_32 GetLongProperty(Mem_AddressType address)
;Config_File.c,207 :: 		uint_8 max_high = MemRd(address);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	PUSH	W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+0]
;Config_File.c,209 :: 		uint_8 middle_h = MemRd((Mem_AddressType) (address + 1));
	ADD	W10, #1, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+1]
;Config_File.c,211 :: 		uint_8 min_h = MemRd((Mem_AddressType) (address + 2));
	ADD	W10, #2, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+2]
;Config_File.c,213 :: 		uint_8 low = MemRd((Mem_AddressType) (address + 3));
	ADD	W10, #3, W0
	MOV	W0, W10
	CALL	_MemRd
;Config_File.c,215 :: 		return CombineLongHighLow(max_high, middle_h, min_h, low);
	MOV.B	W0, W13
	MOV.B	[W14+2], W12
	MOV.B	[W14+1], W11
	MOV.B	[W14+0], W10
	CALL	_CombineLongHighLow
;Config_File.c,216 :: 		}
;Config_File.c,215 :: 		return CombineLongHighLow(max_high, middle_h, min_h, low);
;Config_File.c,216 :: 		}
L_end_GetLongProperty:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GetLongProperty

_GetLong3Property:
	LNK	#2

;Config_File.c,218 :: 		uint_32 GetLong3Property(Mem_AddressType address)
;Config_File.c,220 :: 		uint_8 high = MemRd(address);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+0]
;Config_File.c,222 :: 		uint_8 middle = MemRd((Mem_AddressType) (address + 1));
	ADD	W10, #1, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_MemRd
	POP	W10
	MOV.B	W0, [W14+1]
;Config_File.c,224 :: 		uint_8 low = MemRd((Mem_AddressType) (address + 2));
	ADD	W10, #2, W0
	MOV	W0, W10
	CALL	_MemRd
;Config_File.c,226 :: 		return CombineLong3HighLow(high, middle, low);
	MOV.B	W0, W12
	MOV.B	[W14+1], W11
	MOV.B	[W14+0], W10
	CALL	_CombineLong3HighLow
;Config_File.c,227 :: 		}
;Config_File.c,226 :: 		return CombineLong3HighLow(high, middle, low);
;Config_File.c,227 :: 		}
L_end_GetLong3Property:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GetLong3Property

_SetFloatProperty:

;Config_File.c,290 :: 		Mem_AddressType SetFloatProperty(Mem_AddressType address,float property)
;Config_File.c,292 :: 		int_32 value = (int_32) (property * (float)FLOAT_FACTORY);
	PUSH	W11
	PUSH	W12
	PUSH	W10
	MOV	W11, W0
	MOV	W12, W1
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	POP	W10
;Config_File.c,294 :: 		SetSignedLongProperty(address, value);
	PUSH	W10
	MOV	W0, W11
	MOV	W1, W12
	CALL	_SetSignedLongProperty
	POP	W10
;Config_File.c,295 :: 		return (Mem_AddressType) (address + 4);
	ADD	W10, #4, W0
;Config_File.c,296 :: 		}
;Config_File.c,295 :: 		return (Mem_AddressType) (address + 4);
;Config_File.c,296 :: 		}
L_end_SetFloatProperty:
	POP	W12
	POP	W11
	RETURN
; end of _SetFloatProperty

_GetFloatProperty:

;Config_File.c,304 :: 		float GetFloatProperty(const Mem_AddressType address)
;Config_File.c,306 :: 		int_32 property = GetSignedLongProperty(address);
	CALL	_GetSignedLongProperty
;Config_File.c,308 :: 		return (float) property / (float)FLOAT_FACTORY;
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
;Config_File.c,309 :: 		}
L_end_GetFloatProperty:
	RETURN
; end of _GetFloatProperty

_SetSignedLongProperty:
	LNK	#4

;Config_File.c,311 :: 		void SetSignedLongProperty(Mem_AddressType start_address,int_32 value)
;Config_File.c,313 :: 		int_8 max_high = Highest(value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(W11), W2
	ADD	W2, #3, W1
;Config_File.c,315 :: 		int_8 middle_high = Higher(value);
	ADD	W2, #2, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
;Config_File.c,317 :: 		int_8 min_high = Hi(value);
	ADD	W2, #1, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;Config_File.c,319 :: 		int_8 low = Lo(value);
	MOV.B	W11, [W14+2]
;Config_File.c,321 :: 		MemWrt(start_address, max_high);
	PUSH	W10
	MOV.B	[W1], W11
	CALL	_MemWrt
	POP	W10
;Config_File.c,323 :: 		MemWrt(start_address + 1, middle_high);
	ADD	W10, #1, W0
	PUSH	W10
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,325 :: 		MemWrt(start_address + 2, min_high);
	ADD	W10, #2, W0
	PUSH	W10
	MOV.B	[W14+1], W11
	MOV	W0, W10
	CALL	_MemWrt
	POP	W10
;Config_File.c,327 :: 		MemWrt(start_address + 3, low);
	ADD	W10, #3, W0
	MOV.B	[W14+2], W11
	MOV	W0, W10
	CALL	_MemWrt
;Config_File.c,328 :: 		}
L_end_SetSignedLongProperty:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SetSignedLongProperty

_ConfigFileInit:

;Config_File.c,338 :: 		void ConfigFileInit(Writer writer, Reader reader)
;Config_File.c,340 :: 		m_writer = writer;
	MOV	W10, _m_writer
;Config_File.c,341 :: 		m_reader = reader;
	MOV	W11, _m_reader
;Config_File.c,342 :: 		}
L_end_ConfigFileInit:
	RETURN
; end of _ConfigFileInit

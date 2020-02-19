
_Long2Array:

;Bitset.c,6 :: 		Mem_AddressType Long2Array(uint_32 to_convert, uint_8 *array, Mem_AddressType array_index)
;Bitset.c,8 :: 		array[array_index] = Highest(to_convert);
	ADD	W12, W13, W1
	MOV	#lo_addr(W10), W2
	ADD	W2, #3, W0
	MOV.B	[W0], [W1]
;Bitset.c,9 :: 		array_index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Bitset.c,11 :: 		array[array_index] = Higher(to_convert);
	ADD	W12, W13, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;Bitset.c,12 :: 		array_index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Bitset.c,14 :: 		array[array_index] = Hi(to_convert);
	ADD	W12, W13, W1
	ADD	W2, #1, W0
	MOV.B	[W0], [W1]
;Bitset.c,15 :: 		array_index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Bitset.c,17 :: 		array[array_index] = Lo(to_convert);
	ADD	W12, W13, W0
	MOV.B	W10, [W0]
;Bitset.c,18 :: 		array_index++;
	ADD	W13, #1, W0
	MOV	W0, W13
;Bitset.c,20 :: 		return array_index;
	MOV	W13, W0
;Bitset.c,21 :: 		}
L_end_Long2Array:
	RETURN
; end of _Long2Array

_Array2Float:
	LNK	#4

;Bitset.c,23 :: 		uint_16 Array2Float(uint_8 *array, float *aFloat, uint_16 array_index)
;Bitset.c,27 :: 		array_index = Array2SLong(array, &aLong, array_index);
	ADD	W14, #0, W0
	PUSH	W12
	PUSH	W11
	MOV	W0, W11
	CALL	_Array2SLong
	POP	W11
	POP	W12
	MOV	W0, W12
;Bitset.c,29 :: 		*aFloat = (float) aLong / (float) FLOAT_FACTORY;
	PUSH	W12
	PUSH	W11
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
	POP	W11
	POP	W12
	MOV.D	W0, [W11]
;Bitset.c,31 :: 		return  array_index;
	MOV	W12, W0
;Bitset.c,32 :: 		}
L_end_Array2Float:
	ULNK
	RETURN
; end of _Array2Float

_Float2Array:

;Bitset.c,34 :: 		Mem_AddressType Float2Array(float aFloat, uint_8 *array, uint_16 array_index)
;Bitset.c,36 :: 		int_32 float_Long = (int_32) (aFloat * (float) FLOAT_FACTORY);
	PUSH	W10
	PUSH	W11
	PUSH.D	W12
	MOV.D	W10, W0
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	POP.D	W12
;Bitset.c,37 :: 		return (Mem_AddressType) SLong2Array(float_Long, array, array_index);
	MOV	W13, W2
	CLR	W3
	MOV.D	W0, W10
	PUSH.D	W2
	CALL	_SLong2Array
	SUB	#4, W15
;Bitset.c,38 :: 		}
;Bitset.c,37 :: 		return (Mem_AddressType) SLong2Array(float_Long, array, array_index);
;Bitset.c,38 :: 		}
L_end_Float2Array:
	POP	W11
	POP	W10
	RETURN
; end of _Float2Array

_TinyFloat2Array:
	LNK	#0

;Bitset.c,40 :: 		Mem_AddressType TinyFloat2Array(float aFloat, uint_8 *array, uint_32 array_index)
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	[W14-10], W0
	MOV	[W14-8], W1
	MOV	W0, [W14-10]
	MOV	W1, [W14-8]
;Bitset.c,42 :: 		int_16 float_int = (int_16) (aFloat * (float) TINY_FLOAT_FACTORY);
	PUSH	W12
	MOV.D	W10, W0
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	POP	W12
;Bitset.c,43 :: 		return (Mem_AddressType) Int2Array(float_int, array, array_index);
	MOV	W12, W11
	MOV	[W14-10], W12
	MOV	[W14-8], W13
	MOV	W0, W10
	CALL	_Int2Array
;Bitset.c,44 :: 		}
;Bitset.c,43 :: 		return (Mem_AddressType) Int2Array(float_int, array, array_index);
;Bitset.c,44 :: 		}
L_end_TinyFloat2Array:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _TinyFloat2Array

_Array2TinyFloat:
	LNK	#2

;Bitset.c,46 :: 		Mem_AddressType Array2TinyFloat(uint_8 *array, float *aFloat, uint_32 array_index)
;Bitset.c,50 :: 		array_index = Array2Int(array, &aInt, array_index);
	ADD	W14, #0, W0
	PUSH.D	W12
	PUSH	W11
	MOV	W0, W11
	CALL	_Array2Int
	POP	W11
	POP.D	W12
	MOV.D	W0, W12
;Bitset.c,52 :: 		*aFloat = (float) aInt / (float) TINY_FLOAT_FACTORY;
	PUSH.D	W12
	PUSH	W11
	MOV	[W14+0], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	POP	W11
	POP.D	W12
	MOV.D	W0, [W11]
;Bitset.c,54 :: 		return (Mem_AddressType) array_index;
	MOV	W12, W0
;Bitset.c,55 :: 		}
L_end_Array2TinyFloat:
	ULNK
	RETURN
; end of _Array2TinyFloat

_SLong2Array:
	LNK	#0

;Bitset.c,58 :: 		uint_32 SLong2Array(int_32 aLong, uint_8 *array, uint_32 array_index)
; array_index start address is: 6 (W3)
	MOV	[W14-10], W3
	MOV	[W14-8], W4
;Bitset.c,60 :: 		array[array_index] = Highest(aLong);
	ADD	W12, W3, W1
	MOV	#lo_addr(W10), W2
	ADD	W2, #3, W0
	MOV.B	[W0], [W1]
;Bitset.c,61 :: 		array_index++;
	ADD	W3, #1, W3
	ADDC	W4, #0, W4
;Bitset.c,63 :: 		array[array_index] = Higher(aLong);
	ADD	W12, W3, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;Bitset.c,64 :: 		array_index++;
	ADD	W3, #1, W3
	ADDC	W4, #0, W4
;Bitset.c,66 :: 		array[array_index] = Hi(aLong);
	ADD	W12, W3, W1
	ADD	W2, #1, W0
	MOV.B	[W0], [W1]
;Bitset.c,67 :: 		array_index++;
; array_index start address is: 2 (W1)
	ADD	W3, #1, W1
	ADDC	W4, #0, W2
; array_index end address is: 6 (W3)
;Bitset.c,69 :: 		array[array_index] = Lo(aLong);
	ADD	W12, W1, W0
	MOV.B	W10, [W0]
;Bitset.c,70 :: 		array_index++;
; array_index start address is: 4 (W2)
	MOV	W2, W3
	MOV	W1, W2
; array_index end address is: 2 (W1)
	ADD	W2, #1, W2
	ADDC	W3, #0, W3
;Bitset.c,72 :: 		return array_index;
	MOV.D	W2, W0
; array_index end address is: 4 (W2)
;Bitset.c,73 :: 		}
L_end_SLong2Array:
	ULNK
	RETURN
; end of _SLong2Array

_SInt2Array:

;Bitset.c,75 :: 		Mem_AddressType SInt2Array(int_16 int16, uint_8 *array, uint_32 array_index)
;Bitset.c,78 :: 		array[array_index] = Hi(int16);
	ADD	W11, W12, W1
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], [W1]
;Bitset.c,79 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,81 :: 		array[array_index] = Lo(int16);
	ADD	W11, W12, W0
	MOV.B	W10, [W0]
;Bitset.c,82 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,84 :: 		return array_index;
	MOV	W12, W0
;Bitset.c,85 :: 		}
L_end_SInt2Array:
	RETURN
; end of _SInt2Array

_Array2SInt:

;Bitset.c,88 :: 		Mem_AddressType Array2SInt(uint_8 *array, int_16 *int16, uint_32 array_index)
;Bitset.c,90 :: 		Hi(*int16) = array[array_index];
	ADD	W11, #1, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,91 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,93 :: 		Lo(*int16) = array[array_index];
	ADD	W10, W12, W0
	MOV.B	[W0], [W11]
;Bitset.c,94 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,96 :: 		return array_index;
	MOV	W12, W0
;Bitset.c,97 :: 		}
L_end_Array2SInt:
	RETURN
; end of _Array2SInt

_Array2AddressType:

;Bitset.c,99 :: 		Mem_AddressType Array2AddressType(uint_8 *array, Mem_AddressType *value, uint_32 array_index)
;Bitset.c,102 :: 		return (Mem_AddressType) Array2Int(array, value, array_index);
	CALL	_Array2Int
;Bitset.c,107 :: 		}
L_end_Array2AddressType:
	RETURN
; end of _Array2AddressType

_Array2Long:

;Bitset.c,109 :: 		uint_16 Array2Long(uint_8 *array, uint_32 *to_convert, uint_16 array_index)
;Bitset.c,111 :: 		Highest(*to_convert) = array[array_index];
	ADD	W11, #3, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,112 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,114 :: 		Higher(*to_convert) = array[array_index];
	ADD	W11, #2, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,115 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,117 :: 		Hi(*to_convert) = array[array_index];
	ADD	W11, #1, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,118 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,120 :: 		Lo(*to_convert) = array[array_index];
	ADD	W10, W12, W0
	MOV.B	[W0], [W11]
;Bitset.c,121 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,123 :: 		return array_index;
	MOV	W12, W0
;Bitset.c,124 :: 		}
L_end_Array2Long:
	RETURN
; end of _Array2Long

_Array2SLong:

;Bitset.c,126 :: 		uint_16 Array2SLong(uint_8 *array, int_32 *aLong, uint_16 array_index)
;Bitset.c,128 :: 		Highest(*aLong) = array[array_index];
	ADD	W11, #3, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,129 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,131 :: 		Higher(*aLong) = array[array_index];
	ADD	W11, #2, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,132 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,134 :: 		Hi(*aLong) = array[array_index];
	ADD	W11, #1, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,135 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,137 :: 		Lo(*aLong) = array[array_index];
	ADD	W10, W12, W0
	MOV.B	[W0], [W11]
;Bitset.c,138 :: 		array_index++;
	ADD	W12, #1, W0
	MOV	W0, W12
;Bitset.c,140 :: 		return array_index;
	MOV	W12, W0
;Bitset.c,141 :: 		}
L_end_Array2SLong:
	RETURN
; end of _Array2SLong

_Int2Array:

;Bitset.c,143 :: 		uint_32 Int2Array(uint_16 anInt, uint_8 *array, uint_32 array_index)
;Bitset.c,145 :: 		array[array_index] = Hi(anInt);
	ADD	W11, W12, W1
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], [W1]
;Bitset.c,146 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,148 :: 		array[array_index] = Lo(anInt);
	ADD	W11, W12, W0
	MOV.B	W10, [W0]
;Bitset.c,149 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,151 :: 		return array_index;
	MOV.D	W12, W0
;Bitset.c,152 :: 		}
L_end_Int2Array:
	RETURN
; end of _Int2Array

_Array2Int:

;Bitset.c,154 :: 		uint_32 Array2Int(uint_8 *array, uint_16 *anInt, uint_32 array_index)
;Bitset.c,156 :: 		Hi(*anInt) = array[array_index];
	ADD	W11, #1, W1
	ADD	W10, W12, W0
	MOV.B	[W0], [W1]
;Bitset.c,157 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,159 :: 		Lo(*anInt) = array[array_index];
	ADD	W10, W12, W0
	MOV.B	[W0], [W11]
;Bitset.c,160 :: 		array_index++;
	ADD	W12, #1, W0
	ADDC	W13, #0, W1
	MOV.D	W0, W12
;Bitset.c,162 :: 		return array_index;
	MOV.D	W12, W0
;Bitset.c,163 :: 		}
L_end_Array2Int:
	RETURN
; end of _Array2Int

_GetLowHalfByte:

;Bitset.c,165 :: 		uint_8 GetLowHalfByte(char value)
;Bitset.c,167 :: 		return value & 0x0F;
	ZE	W10, W0
	AND	W0, #15, W0
;Bitset.c,168 :: 		}
L_end_GetLowHalfByte:
	RETURN
; end of _GetLowHalfByte

_GetHighHalfByte:

;Bitset.c,170 :: 		uint_8 GetHighHalfByte(char value)
;Bitset.c,172 :: 		return value & 0xF0;
	ZE	W10, W1
	MOV	#240, W0
	AND	W1, W0, W0
;Bitset.c,173 :: 		}
L_end_GetHighHalfByte:
	RETURN
; end of _GetHighHalfByte

_GetHigh:

;Bitset.c,175 :: 		char GetHigh(int value)
;Bitset.c,177 :: 		return Hi(value);
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], W0
;Bitset.c,178 :: 		}
L_end_GetHigh:
	RETURN
; end of _GetHigh

_GetMaxHigh:

;Bitset.c,180 :: 		char GetMaxHigh(uint_32 value)
;Bitset.c,182 :: 		return Highest(value);
	MOV	#lo_addr(W10), W0
	ADD	W0, #3, W0
	MOV.B	[W0], W0
;Bitset.c,183 :: 		}
L_end_GetMaxHigh:
	RETURN
; end of _GetMaxHigh

_GetMiddleHigh:

;Bitset.c,185 :: 		char GetMiddleHigh(uint_32 value)
;Bitset.c,187 :: 		return Higher(value);
	MOV	#lo_addr(W10), W0
	INC2	W0
	MOV.B	[W0], W0
;Bitset.c,188 :: 		}
L_end_GetMiddleHigh:
	RETURN
; end of _GetMiddleHigh

_GetMinHigh:

;Bitset.c,190 :: 		char GetMinHigh(uint_32 value)
;Bitset.c,192 :: 		return Hi(value);
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], W0
;Bitset.c,193 :: 		}
L_end_GetMinHigh:
	RETURN
; end of _GetMinHigh

_GetLongLow:

;Bitset.c,195 :: 		char GetLongLow(uint_32 value)
;Bitset.c,197 :: 		return Lo(value);
	MOV.B	W10, W0
;Bitset.c,198 :: 		}
L_end_GetLongLow:
	RETURN
; end of _GetLongLow

_GetLow:

;Bitset.c,200 :: 		char GetLow(uint_16 value)
;Bitset.c,202 :: 		return Lo(value);
	MOV.B	W10, W0
;Bitset.c,203 :: 		}
L_end_GetLow:
	RETURN
; end of _GetLow

_CombineSignedHighLow:

;Bitset.c,205 :: 		int_16 CombineSignedHighLow(uint_8 high, uint_8 low)
;Bitset.c,207 :: 		uint_16 t = high << 8 | low ;
	ZE	W10, W0
	SL	W0, #8, W1
	ZE	W11, W0
	IOR	W1, W0, W0
;Bitset.c,208 :: 		return (int_16) t;
;Bitset.c,209 :: 		}
L_end_CombineSignedHighLow:
	RETURN
; end of _CombineSignedHighLow

_CombineHighLow:

;Bitset.c,211 :: 		uint_16 CombineHighLow(uint_8 high, uint_8 low)
;Bitset.c,213 :: 		return (uint_16) (high << 8 | low);
	ZE	W10, W0
	SL	W0, #8, W1
	ZE	W11, W0
	IOR	W1, W0, W0
;Bitset.c,214 :: 		}
L_end_CombineHighLow:
	RETURN
; end of _CombineHighLow

_CombineLongHighLow:

;Bitset.c,216 :: 		uint_32 CombineLongHighLow(uint_8 max_high, uint_8 middle_high, uint_8 min_high, uint_8 low)
;Bitset.c,218 :: 		return (uint_32) ((uint_32) max_high << 24 | (uint_32) middle_high << 16 | (uint_32) min_high << 8 | low);
	ZE	W10, W0
	CLR	W1
	SL	W0, #8, W3
	CLR	W2
	ZE	W11, W0
	CLR	W1
	MOV	W0, W1
	CLR	W0
	IOR	W2, W0, W4
	IOR	W3, W1, W5
	ZE	W12, W2
	CLR	W3
	SL	W3, #8, W1
	LSR	W2, #8, W0
	IOR	W0, W1, W1
	SL	W2, #8, W0
	IOR	W4, W0, W2
	IOR	W5, W1, W3
	ZE	W13, W0
	CLR	W1
	IOR	W2, W0, W0
	IOR	W3, W1, W1
;Bitset.c,219 :: 		}
L_end_CombineLongHighLow:
	RETURN
; end of _CombineLongHighLow

_CombineLong3HighLow:

;Bitset.c,221 :: 		uint_32 CombineLong3HighLow(uint_8 high, uint_8 middle, uint_8 low)
;Bitset.c,223 :: 		return (int_32) ((int_32) high << 16 | (int_32) middle << 8 | low);
	ZE	W10, W0
	CLR	W1
	MOV	W0, W5
	CLR	W4
	ZE	W11, W2
	CLR	W3
	SL	W3, #8, W1
	LSR	W2, #8, W0
	IOR	W0, W1, W1
	SL	W2, #8, W0
	IOR	W4, W0, W2
	IOR	W5, W1, W3
	ZE	W12, W0
	CLR	W1
	IOR	W2, W0, W0
	IOR	W3, W1, W1
;Bitset.c,224 :: 		}
L_end_CombineLong3HighLow:
	RETURN
; end of _CombineLong3HighLow

_GetOnBitPosition:

;Bitset.c,230 :: 		int_8 GetOnBitPosition(uint_32 bits, uint_8 size_bits)
;Bitset.c,233 :: 		for (i = 0; i < size_bits; ++i)
; i start address is: 10 (W5)
	CLR	W5
; i end address is: 10 (W5)
L_GetOnBitPosition3:
; i start address is: 10 (W5)
	CP.B	W5, W12
	BRA LTU	L__GetOnBitPosition33
	GOTO	L_GetOnBitPosition4
L__GetOnBitPosition33:
;Bitset.c,235 :: 		if (bits & (uint_32) (1UL << i))
	ZE	W5, W4
	MOV	#1, W2
	MOV	#0, W3
	MOV.D	W2, W0
L__GetOnBitPosition34:
	DEC	W4, W4
	BRA LT	L__GetOnBitPosition35
	SL	W0, W0
	RLC	W1, W1
	BRA	L__GetOnBitPosition34
L__GetOnBitPosition35:
	AND	W10, W0, W0
	AND	W11, W1, W1
	IOR	W1, W0, W0
	BRA NZ	L__GetOnBitPosition36
	GOTO	L_GetOnBitPosition6
L__GetOnBitPosition36:
;Bitset.c,236 :: 		return i;
	MOV.B	W5, W0
; i end address is: 10 (W5)
	GOTO	L_end_GetOnBitPosition
L_GetOnBitPosition6:
;Bitset.c,233 :: 		for (i = 0; i < size_bits; ++i)
; i start address is: 10 (W5)
	INC.B	W5
;Bitset.c,237 :: 		}
; i end address is: 10 (W5)
	GOTO	L_GetOnBitPosition3
L_GetOnBitPosition4:
;Bitset.c,239 :: 		return NOT_FOUND;
	MOV.B	#255, W0
;Bitset.c,240 :: 		}
L_end_GetOnBitPosition:
	RETURN
; end of _GetOnBitPosition

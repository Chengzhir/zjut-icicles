	ORG 	0000H
	LJMP 	MAIN
	ORG		0100H
MAIN:
	MOV   	SP,#60H
	CLR		C
	MOV		DPTR,#2000H
	MOV		51H,#00H
	MOV		R1,#30H
	MOV 	R2,#04H
	MOV		R3,#04H
	LCALL 	BCD_ADD_BYTES
	SJMP $

BCD_ADD_BYTES:
	MOV 	A,#00H
	MOVC	A,@A+DPTR
	MOV 	R0,A
	MOV 	A,R3
	MOVC 	A,@A+DPTR
	ADDC 	A,R0
	DA 		A
	MOV 	@R1,A
	MOV		A,R1
	INC		A
	MOV		R1,A
	INC 	DPTR
	DJNZ 	R2,BCD_ADD_BYTES
	JC 		S2
	RET

S2:
	MOV 	@R1,#01H
	RET
	
	END
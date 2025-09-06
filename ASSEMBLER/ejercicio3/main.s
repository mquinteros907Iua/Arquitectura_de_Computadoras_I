	.data
	x: .dword 10
	y: .dword 5
	
	.text
	LDR X0,x
	LDR X1, y

	SUB X9, X0, XZR	//If x == 0
	CBNZ X9, else 
	ADD X1, X1, #1
	B endIf

	else:			//Else x != 0
	SUB X1, X1, #1

	endIf:

end:
infloop: B infloop

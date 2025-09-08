	.data
	i: .dword 0
	N: .dword 3
	a: .dword 2
	b: .dword 5
    	
	.text
	LDR X0,i
	LDR X1,N
	LDR X2,a
	LDR X3,b

	MOV X0, X1

	for_loop:
		CBZ X0, for_end //if(i == 0)
		ADD X2, X2, X3  //a = a + B
		SUB X0, X0, #1  //i--
	B for_loop
	
	for_end:
	STR X2, [X2]

infloop: B infloop

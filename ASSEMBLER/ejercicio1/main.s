	.data
	f: .dword 0
	g: .dword 2
	h: .dword 3

	.text
	LDR X0,f
	LDR X1,g
	LDR X2,h

	SUB X0,X2,#5
	ADD X0,X1,X1

end:
infloop: B infloop

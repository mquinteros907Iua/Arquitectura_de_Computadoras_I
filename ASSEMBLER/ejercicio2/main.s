	.data
	f: .dword 0
	a: .dword 2
	b: .dword 3
	c: .dword 4

	.text
	LDR X0,f
	LDR X1,a
	LDR X2,b
	LDR X3,c

	ADD X0,X1,X2
	ADD X0,X3,X0

end:
infloop: B infloop

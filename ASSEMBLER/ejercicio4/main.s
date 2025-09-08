//Para el siguiente enunciado en C, escriba el código ensamblador LEGv8 correspondiente.
//Variables: n=X0, sum=X1, val=X2
// while ( n > 0) {
// sum = sum + val ;
// n - -;
// }
	.data
	n: .word 2
	sum: .word 0 
	val: .word 2

	.text
	LDR X0, n
	LDR X1, sum
	LDR X2, val

	loop_star:
	CMP X0, 0 //Compara n mayor 0
	ADD X1, X1, X2 //sum = sum + val
	SUB X0, X0, #1 //n--
	B loop_star	

	loop_end: 
end:
infloop: B infloop

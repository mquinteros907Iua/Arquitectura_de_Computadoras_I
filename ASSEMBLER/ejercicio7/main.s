//Para la siguiente instrucción en C, escriba el código ensamblador LEGv8 correspondiente. Suponga
//que las variables i,j están asignadas a los registros X3 y X4, respectivamente. Suponga que las
//direcciones base de los arreglos A y B están en los registros X6 y X7, respectivamente.
//1 B [8] = A [i - j

	.data
	i: .dword 5
	j: .dword 10
    	

	.text


end:
infloop: B infloop

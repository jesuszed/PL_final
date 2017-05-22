_borrar;
_lugar(10,10);
escribir_cadena(' Factorial de un numero ');

_lugar(11,10);
escribir_cadena(' Introduce un numero entero ');
leer(N);

factorial := 1;

@ Algoritmo para factorial 

para i desde 2 hasta N paso 1 hacer
	factorial := factorial * i;
fin_para;

@ Se muestra el resultado

_lugar(15,10);
escribir_cadena(' El factorial de ');
escribir(N);
escribir_cadena(' es ');
escribir(factorial);

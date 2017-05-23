#
  Asignatura:    Procesadores de Lenguajes

  Titulación:    Ingeniería Informática
  Especialidad:  Computación
  Curso:         Tercero
  Cuatrimestre:  Segundo

  Departamento:  Informática y Análisis Numérico
  Centro:        Escuela Politécnica Superior de Córdoba
  Universidad de Córdoba
 
  Curso académico: 2016 - 2017

  Fichero de ejemplo de alumno para el intérprete de pseudocódigo en español: interprete.exe
#

@ Bienvenida


tarifa := 50;
tarifa_extra := 0;
sueldo := 0;
sueldo_mes := 0;
sueldo_extra := 0;
escribir_cadena('Introduce las Horas de Trabajo ==> ');
leer(horas);

si (horas <= 35)
 	entonces
 		sueldo := horas * tarifa;
si_no
	dif_horas := horas - 35;
	tarifa_extra := tarifa * 1.5;
	salario_extra := tarifa_extra * dif_horas;
	sueldo := 35 * tarifa; 
	sueldo := sueldo + salario_extra;

fin_si;

sueldo_mes := sueldo * 4;
impuesto := 0;

si (sueldo_mes > 20000)
	entonces
		impuesto := sueldo_mes * 0.20;
		salario_total := sueldo_mes - impuesto;
		escribir_cadena(' Tu sueldo al mes es: ');
		escribir(sueldo_mes);
		escribir_cadena('\nValor de Impuesto: ');
		escribir(impuesto);
		escribir_cadena('\nEl salario Neto es: ');
		escribir(salario_total);
si_no
	escribir_cadena('Tu sueldo Neto es: ');
	escribir(sueldo_mes);
fin_si;
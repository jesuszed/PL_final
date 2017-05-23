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

  Fichero de ejemplo nº 1 alumno para el intérprete de pseudocódigo en español: interprete.exe
#

@ Bienvenida


acierto := 6;
numero := 0;

mientras (numero <> acierto) hacer
  escribir_cadena('Adivina un numero del 1 al 10: ');
  leer(numero);
fin_mientras;
escribir_cadena('Acertaste¡¡¡');
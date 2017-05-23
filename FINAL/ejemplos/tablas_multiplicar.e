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


escrIbir_caDEna('Introduce el numero del que quieres calcular su tabla de multiplicar --> ');
LEER(numero);
para i desde 1 hasta 10 paso 1 hacer
  total := numero * i;
  escribir(total);
  escribir_cadena('\n');
fin_para;

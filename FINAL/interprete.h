#ifndef INTERPRETE_H
#define INTERPRETE_H

 /* ipe.h */

/* Analizador léxico */
int yylex();

/* Informa de la detección de un error sintáctico */
void yyerror(char *s);

/*  Escribe por pantalla información sobre un error sintáctico */
void warning(char *s, char *t);

/* Recuperacion de errores durante la ejecucion */
void execerror(char *s,char *t);

void init();

/* entrada en la tabla de simbolos */
typedef struct Symbol 
            { /* elementos de la tabla de simbolos */
	        char *nombre;
	        short tipo; /* NUMBER,VAR,FUNCION,INDEFINIDA,CONSTANTE */
            short subtipo; /* NUMBER, CADENA */
	        union {
                double val;      /* VAR, NUMBER, INDEFINIDA, CONSTANTE */
                char *cad;         /* CADENA */
                double (*ptr)(); /* FUNCION  */
		      } u;
                 struct Symbol *siguiente;
	     } Symbol;

/* Instala en la tabla de símbolos */
Symbol *install(), *lookup(), *installcadena();

char *emalloc(unsigned n);


typedef struct Datum { /* tipo de la pila del interprete */
                     short tipo; /* NUMBER,VAR,FUNCION,INDEFINIDA,CONSTANTE */
                     short subtipo; /* NUMBER, CADENA */
                     double val;
                     char *cad;
                     Symbol *sym;
                    } Datum;

/* Introduce un dato de la pila de valores */
void push(Datum d);

/* Saca un dato de la pila de valores */
extern Datum pop();
extern void pop2();

typedef void (*Inst)(); /* instruccion maquina */
#define STOP (Inst) 0

/* Vector de instrucciones */
extern Inst prog[];

/* NOVEDAD */
extern Inst* progp;

/* Función que inicializa el vector de instrucciones */
void initcode();

/* Función que inserta una instucción en el vector de instrucciones */
Inst *code(Inst f);

/* Función que ejecuta una función del vector de instrucciones */
void execute(Inst *p);

/**************************/
extern void assign();
extern void constpush();
extern void cadenapush();
void escribir();
void escribircadena();
void leercadena();
void concatenacion();
void eval();
void leervariable();

void funcion();
void funcion0();
void funcion1();
void funcion2();

void modulo();
void dividir();
void dividir_entero();
void multiplicar();
void sumar();
void restar();
void potencia();
void positivo();
void negativo();

void paracode();
void varpush();
void ifcode();
void whilecode();
void repetircode();
void mayor_que();

void mayor_igual();
void menor_igual();
void igual();
void menor_que();
void distinto();
void y_logico();
void o_logico();
void negacion();
void borrar();
void lugar();

#endif

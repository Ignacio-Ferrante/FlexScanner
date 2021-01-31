%{
#include <stdio.h>
#include "tokens.h"
%}

%option header-file = "scanner.h"
%option outfile = "scanner.c"
%option noinput
%option nounput

digito              [0-9]
letra               [[:alpha:]]
letraDigito         [[:alnum:]]
identificador       {letra}{letraDigito}*
asignacion          <-
comentario          ##.*$
digitoInvalido      [[:^digit:]]{-}[[:space:]]]
charDesconocido     [[:punct:]]{-}[{().,+\-*/;}{comentario}]
%%

[[:space:]]						                        ;
programa                                                return PROGRAMA;
fin-prog                                                return FIN_PROG;
leer                                                    return LEER;
escribir                                                return ESCRIBIR;
declarar                                                return DECLARAR;
"("							                            return '(';
")"							                            return ')';
";"                                                     return ';';
"."							                            return '.';
","							                            return ',';
"+"							                            return '+';
"-"							                            return '-';
"*"							                            return '*';
"/"							                            return '/';
{digito}+                                             	return CONSTANTE;
{identificador}	                                    	return IDENTIFICADOR;
{comentario}                                       	    //los elimina
{asignacion}	                                        		return ASIGNACION;
{identificador}{charDesconocido}({letraDigito}|{charDesconocido})*   printf("Error léxico: identificador inválido: %s\n",yytext);
{digito}{identificador}*                                printf("Error léxico: constante inválida : %s\n",yytext);
{charDesconocido}+                                      printf("Error léxico: cadena desconocida : %s\n",yytext);
%%



%{
#include <stdio.h>
#include "tokens.h"
%}

%option header-file = "scanner.h"
%option outfile = "scanner.c"
%option noinput
%option nounput

operador            [*/+-]
puntuacion          [\(\),;]
digito              [0-9]
letra               [[:alpha:]]
letraDigito         [[:alnum:]]
identificador       {letra}{letraDigito}*
asignacion          <-
inicioFin           programa|fin-prog
funcion             leer|escribir|declarar
comentario          ##.*$
digitoInvalido      [[:^digit:]]{-}[[:space:]]]
charDesconocido     [[:^alnum:]]{-}[[:space:]]{-}[[{puntuacion}{comentario}{operador}]]

%%

[[:space:]]						;
{inicioFin}                                           	|
{funcion}                                             	return PALABRA_RESERVADA;
{operador}                                            	|
{puntuacion}                                          	return CARACTER_VALIDO;
{digito}+                                             	return CONSTANTE;
{digito}+{digitoInvalido}+{digito}*	        	return CONSTANTE_INVALIDA;
{identificador}	                        	return IDENTIFICADOR;
{comentario}                                       	//los elimina
{identificador}{charDesconocido}+({letra}|{digito})*    return IDENTIFICADOR_INVALIDO;
{asignacion}	                                    	return ASIGNACION;
{charDesconocido}+		                     	return CADENA_DESCONOCIDA;


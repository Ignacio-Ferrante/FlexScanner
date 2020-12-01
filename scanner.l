%{
#include <stdio.h>
#include "tokens.h"
%}

%option header-file = "scanner.h"
%option outfile = "scanner.c"
%option noinput
%option nounput

operador                            ["*"/"+""-"]
puntuacion                          ["("")",;]
digito                              [0-9]
constante                           {digito}+
letra                               [a-zA-Z]
identificador                       {letra}[{letra}{digito}]+
asignacion                          <-
inicio-fin                          programa | fin-programa
funcion                             leer | escribir | declarar
comentario                          ##.*$
constanteInvalida                   [[:^digit:]]{-}[[:space:]]
cadenaDesconocida                   [[:^alnum:]]{-}[[:space:]]

%%

{inicio-fin}                                                |
{funcion}                                                   return PALABRA_RESERVADA;
{operador}                                                  |
{puntuacion}                                                return CARACTER_VALIDO;
{constante}                                                 return CONSTANTE;
{constante}{constanteInvalida}+{digito}?	                  return CONSTANTE_INVALIDA;
{identificador}	                                            return IDENTIFICADOR;
{identificador}{cadenaDesconocida}+{identificador}?         return IDENTIFICADOR_INVALIDO;
{asignacion}	                                              return ASIGNACION;
{comentario}                                                //los elimina
{cadenaDesconocida}+		                                    return CADENA_DESCONOCIDA;

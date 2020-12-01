%option header-file = "tokens.h"
%option outfile = "main.c"
%option noinput
%option nounput

operador [*/+-]
puntuacion [\(\),;]
digito [0-9]
constante {digito}+
letra [a-zA-Z]
identificador {letra}[{letra}{digito}]+
asignacion <-
inicio-fin programa | fin-programa
funcion leer | escribir | declarar
comentario ##.*\n

%%

{inicio-fin}|{funcion}          return PALABRA_RESERVADA;
{operador}|{puntuacion}         return CARACTER_VALIDO;
{constante}                     return CONSTANTE;
{identificador}	                return IDENTIFICADOR;
{asignacion}	                return ASIGNACION;
{letra}+{invalido}+             return IDENTIFICADOR_INVALIDO;
{digito}+.{digito}*		        return CONSTANTE_INVALIDA;
/*                            return CADENA_DESCONOCIDA;*/

/*enum token {FDT, PALABRA_RESERVADA, ASIGNACION, IDENTIFICADOR, CONSTANTE, OPERADOR, PUNTUACION, ERROR_LEXICO, CONSTANTE_INVALIDA, IDENTIFICADOR_INVALIDO};*/
*/

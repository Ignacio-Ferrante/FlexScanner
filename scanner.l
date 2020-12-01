%option header-file = "tokens.h"
%option outfile = "main.c"
%option noinput
%option nounput

operador-producto [*/]
operador-suma [+-]
puntuacion [\(\),;]
digito [0-9]
numero {digito}+
letra [a-zA-Z]
identificador {letra}[{letra}{digito}]+
asignacion <-
inicio-fin programa | fin-programa
funcion leer | escribir | declarar

%%

{prehex}{dighex}+                 return HEXA;
{nocero}{digdec}*{sufint}?        return DECIMAL;
{nocero}({digdec}|[a-z])*         printf("Error léxico ENTERO inválido: %s\n", yytext);
0{digoct}*                        return OCTAL;
{fracc}{expo}?{sufreal}?          |
{digdec}+{expo}{sufreal}?         return REAL;
{fracc}{inval}+{expo}?{sufreal}?  printf("Error léxico REAL inválido: %s\n", yytext);
.|\n                              ;

%%
código del usuario

/*enum token {INICIO_FIN, FUNCION, ASIGNACION, IDENTIFICADOR, NUMERO, OPERADOR_SUMA, OPERADOR_PRODUCTO, OPERADORO_PUESTO, PUNTUACION, ERROR_LEXICO, CONSTANTE_INVALIDA, IDENTIFICADOR_INVALIDO};*/
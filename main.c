//////////////////////////////////////////////////////////////////////////////////////
/*
      TP3 - 2020
      "Un escaner elemental"

      INTEGRANTES: 
      Alejandro Buergo / 168.569-7
      Ignacio Ferrante / 171.524-0
      Patricio Galli   / 172.467-8
                                                                                    */
//////////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include "scanner.h"
#include "tokens.h"

int main() {
	TOKEN t;
	while ((t = yylex()) != FDT){					
			switch(t){
			case PROGRAMA: 
						printf("Token: %s\n",yytext);
						break;						
			case FIN_PROG: 
						printf("Token: %s\n",yytext);
						break;
			case LEER: 
						printf("Token: %s\n",yytext);
						break;
			case ESCRIBIR: 
						printf("Token: %s\n",yytext);
						break;
			case DECLARAR: 
						printf("Token: %s\n",yytext);
						break;
			case ASIGNACION:
						printf("Token: Asignación\n");
						break;
			case IDENTIFICADOR:
						printf("Token: Identificador\t\tlexema: %s\n", yytext);
						break;
			case CONSTANTE:
						printf("Token: Constante\t\tlexema: %s\n", yytext);
						break;
			default:
						printf("Token: '%c'\n", t);	
						break;
		}
	} 		printf("Token: Fin de archivo \n"); 
}

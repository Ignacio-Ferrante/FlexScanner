//char *token_names[] = {"", "Identificador\t\t", "Constante\t\t", "Asignación", "identificador inválido: ", "constante inválida: ", "cadena desconocida: ","Fin de archivo"};
int main() {
	enum token t;
	while ((t = yylex()) != FDT){
		switch(t){
			case PALABRA_RESERVADA:
			printf("Token: %s", toupper(yytext));
			break;
			case CARACTER_VALIDO:
			printf("Token: '%c'", yytext[0]);
			break;
			case CONSTANTE:
			printf("Token: Constante\t\t%slexema: %s\n", yytext);
			break;
			case IDENTIFICADOR:
			printf("Token: Identificador\t\t%slexema: %s\n", yytext);
			break;
			case ASIGNACION:
			printf("Token: Asignación");
			break;
			case IDENTIFICADOR_INVALIDO:
			printf("Error léxico: identificador inválido: %s", yytext);
			break;
			case CONSTANTE_INVALIDA:
			printf("Error léxico: constante inválida: %s", yytext);
			break;
			case CADENA_DESCONOCIDA:
			printf("Error léxico: cadena desconocida: %s", yytext);
			break;
			default:
			printf("Fin de archivo");
			return 0;
		}
	}
}
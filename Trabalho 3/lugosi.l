DIGITO	[0-9]
DIGITOS (DIGITO)+
LETRA	[a-zA-Z]
LETRAOUDIGITO ({LETRA}|{DIGITO})
FINALSUBLINHADO ("_"{LETRAOUDIGITO}+)
TOKEN_ID	{LETRA}{LETRAOUDIGITO}*{FINALSUBLINHADO}*
FACAO_OPCIONAL ("."{DIGITOS})?
EXPOENTE_OPCIONAL ("E"("+"|"-")?{DIGITOS})?
TOKEN_NUMLITERAL {DIGITOS}{FACAO_OPCIONAL}{EXPOENTE_OPCIONAL}
OP  "+"|"-"|"*"|"/"|"&&"|"||"|"<"|">"|"=="
COMANDO ("if"|"while"|"do"|"return"|"print")

BOOL ("true"|"false")
TIPO ("int"|"bool")
MAIN "main"
VAR "var"
SIMBOLOS (":="|";"|",")
APAR "("
FPAR ")"
ACHAVES "{"
FCHAVES "}"

%%
{DIGITO}+		{printf("Inteiro: %s\n",yytext);}
{DIGITOS}{FACAO_OPCIONAL}		{printf("Real: %s\n",yytext);}
{TOKEN_NUMLITERAL}	{printf("Num Literal: %s\n",yytext);}
{TOKEN_ID}			{printf("Token_ID: %s\n",yytext);}
{MAIN} 				{printf("Main: %s\n",yytext);}
{VAR}				{printf("Var: %s\n",yytext);}
{COMANDO}			{printf("Comando: %s\n",yytext);}
{OP}				{printf("Operador: %s\n",yytext);}
{SIMBOLOS}			{printf("Símbolo: %s\n",yytext);}
{BOOL}				{printf("Bool: %s\n",yytext);}
{APAR} 					{printf("Abre parenteses: %s\n",yytext);}
{ACHAVES}				{printf("Abre chaves: %s\n",yytext);}
{FPAR}					{printf("Fecha parenteses: %s\n",yytext);}
{FCHAVES}				{printf("Fecha chaves: %s\n",yytext);}


%%
int yywrap();

main(){
  yylex();
}

int yywrap(){
 return 1;
}

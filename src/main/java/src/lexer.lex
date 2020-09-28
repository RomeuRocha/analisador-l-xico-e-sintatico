package src;

%%

%class AnalisadorLexico
%type boolean
%line
%column 

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}

BRANCO = [\n| |\t|\r]
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SOMA = "+"
SUBTRAI = "-"
MULTI = "*"
DIVID = "/"
INTEIRO = 0|[1-9][0-9]*

%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"then"                       { imprimir("Palavra reservada then", yytext()); }
{BRANCO}                     { imprimir("Espa�o em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}                       { imprimir("Operador de soma", yytext()); }
{INTEIRO}                    { imprimir("N�mero Inteiro", yytext()); }
{SUBTRAI}                    { imprimir("Operador de subtra��o", yytext()); }
{MULTI}                      { imprimir("Operador de multiplica��o", yytext()); }
{DIVID}                      { imprimir("Operador de divis�o", yytext()); }
. { throw new RuntimeException("Caractere inv�lido " + yytext()); }
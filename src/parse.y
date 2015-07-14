
%{
#include <stdio.h>
#include <stdlib.h>
%}

%locations
%pure-parser
%left ATOM QSTRING SYMBOL_EXPANSION

%%

s_expression	:			list
										| '(' list ')'
										| 
										;

list					:			lnode
										| list lnode
										;


lnode					:			atom
										| list
										| s_expression
										;

atom					:			ATOM
										| QSTRING
										;

empty					:			/* empty */
										;

%%
int yylex(YYSTYPE *, void *);

int
main(int argc, char *argv[])
{
	printf("peanut 0.1\n");
	yyparse();
}


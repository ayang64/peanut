
%{
#include <stdio.h>
#include <stdlib.h>

#define BDEBUGF(f,...)		({ fprintf(stderr, "BISON: " #f "\n", ##__VA_ARGS__); })
%}

%locations
%pure-parser
%left ATOM QSTRING ELEMENT ATTRIBUTE SYMBOL_EXPANSION INTEGER

%%

s_expr:							paren_list
										| s_expr paren_list
										{
											BDEBUGF("s_expr");
										}
										;

paren_list:					'(' item_list ')'
										{
											BDEBUGF("list");
										}


item_list:					item
										| item_list item
										{
											BDEBUGF("item_list");
										}
										;

item:								atom
										| paren_list
										{
											BDEBUGF("item");
										}	
										;

atom:								%empty
										| ATOM
										| ATTRIBUTE
										| ELEMENT
										| INTEGER
										| QSTRING
										| SYMBOL_EXPANSION
										;

%%
int yylex(YYSTYPE *, void *);

int
main(int argc, char *argv[])
{
	printf("peanut 0.1\n");
	yyparse();
}


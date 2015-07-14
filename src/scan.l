%{
#include <stdio.h>
#include <stdlib.h>
#include "parse.tab.h"
#define token(n)			({ fprintf(stderr, "TOKEN: %s\n", #n); return (n);})
%}

%option bison-bridge bison-locations 

%%
\"(?:[^"\\]|\\.)*\"				{ token(QSTRING); }
\'(?:[^'\\]|\\.)*\'				{ token(QSTRING); }


\$[[:alpha:]][[:alnum:]]+	{ token(SYMBOL_EXPANSION); } 
[[:alpha:]][[:alnum:]]+		{ token(ATOM); }
[[:space:]]+							;
\n												;
.													{ fprintf(stderr,"returning '%c'\n", yytext[0]); token(yytext[0]); }
%%

%{
#include <stdio.h>
#include <stdlib.h>
#include "parse.tab.h"
#define token(n)			({ fprintf(stderr, "TOKEN: %s: %s\n", #n, yytext); return (n);})
%}

%option bison-bridge bison-locations 

%%
\"(?:[^"\\]|\\.)*\"							{ token(QSTRING); }
\'(?:[^'\\]|\\.)*\'							{ token(QSTRING); }

[[:digit]]+											{ token(INTEGER); }
[^[:space:]^(^)]+								{ token(ATOM); }
[[:space:]]+										;
\n															;
.																{ fprintf(stderr,"returning '%c'\n", yytext[0]); token(yytext[0]); }
%%

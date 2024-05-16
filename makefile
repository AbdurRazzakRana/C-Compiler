# CS466 Spring 2024
# Author: Abdur Razzak
# Date: May 3, 2024

all:	compiler

compiler: compiler.y compiler.l ast.c ast.h symtable.h symtable.c prototype.c prototype.h emit.c emit.h emit_private.h emit_private.c
	lex compiler.l
	yacc -d compiler.y
	gcc lex.yy.c y.tab.c ast.c symtable.c prototype.c emit.c emit_private.c -o compiler

clean:
	rm -f compiler

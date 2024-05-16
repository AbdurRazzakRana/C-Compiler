## C-Compiler
This compiler takes a c program as an input, parses it, constructs an abstract syntax tree, and generates MIPS code as an output. It was gradually developed from the Compiler & Automata course (in CS466, throughout Spring 2024) as a part of the lab at New Mexico State University.

## Structure of the Files
- **compiler.l:** (lex file) will parse the c codes, it will generate tokens by following some rules and without knowing the meaning
- **compiler.y:** (yacc file) has many roles
1. It will maintain a Symbol Table to keep track of the declaration of variables and functions with both names and types.
2. Will write rules for syntax-directed semantics which includes the following
3. If everything goes fine it will create an Abstract Syntax Tree node for each complete statement
4. At the end, it calls the MIPS code emitter function for that generated AST.
- **symtable.c:** is a list of variables and functions that are already declared with their types and names. It uses a pointer list. Every time a new variable or function is about to be declared, it searches first in the current list. If the variable exists already and the user trying to declare 2nd time, it will generate an error to show a duplicate declaration.
- **prototype.c:** is specifically designed to keep track of function prototyping. As parsing is compile time, we need to maintain a list of which functions are prototyped and among them, which are declared later. If the function is prototyped, then called from another function and the prototyped function is declared later, then the program should run fine and therefore, we need to keep the list of implemented functions.
- **ast.c:**  is the Abstract Syntax Tree where each node can only have 2 children, s1 and s2. To Point to the same level next task, it has a variable next. For example int a; int b; node Variable Declaration a has next pointed to Variable Declaration b. Each node also keeps some other information like name, data type, offset level, etc.
- **emit.c:** is exposure function to yacc. It is called after generating the AST and only the head of the structure is given to emit.c. It generates codes for global variables, stings, and necessary rudimentary MIPS codes in the given output file and then calls emit_private to generate code for different cases.
- **emit_private.c:** is the main responsible file that contains all helper functions for generating MIPS dynamic code for different statements and expressions. 

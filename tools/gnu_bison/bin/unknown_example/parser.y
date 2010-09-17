
%token  lxmAuto     lxmBreak    lxmCase     lxmChar
%token  lxmConst    lxmContinue lxmDefault  lxmDo
%token  lxmDouble   lxmElse     lxmEnum     lxmExtern
%token  lxmFloat    lxmFor      lxmGoto     lxmIf
%token  lxmInt      lxmLong     lxmRegister lxmReturn
%token  lxmShort    lxmSigned   lxmSizeof   lxmStatic
%token  lxmStruct   lxmSwitch   lxmTypedef  lxmUnion
%token  lxmUnsigned lxmVolatile lxmVoid     lxmWhile

%token  lxmIdentifier   lxmConstant lxmTypedefName  lxmStringLiteral

%token  lxmArrow    lxmIncrement    lxmDecrement    lxmEllipsis
%token  lxmShl      lxmShr      lxmLessOrEqual  lxmGreaterOrEqual
%token  lxmEqual    lxmNonEqual lxmAnd      lxmOr
%token  lxmMulAssign    lxmDivAssign    lxmModAssign    lxmAddAssign
%token  lxmSubAssign    lxmShlAssign    lxmShrAssign    lxmAndAssign
%token  lxmXorAssign    lxmOrAssign


%start translation_unit
%%

primary_expression
        : lxmIdentifier
        | lxmConstant
        | lxmStringLiteral
        | '(' expression ')'
        ;

postfix_expression
        : primary_expression
        | postfix_expression '[' expression ']'
        | postfix_expression '(' ')'
        | postfix_expression '(' argument_expression_list ')'
        | postfix_expression '.' lxmIdentifier
        | postfix_expression lxmArrow lxmIdentifier
        | postfix_expression lxmIncrement
        | postfix_expression lxmDecrement
        ;

argument_expression_list
        : assignment_expression
        | argument_expression_list ',' assignment_expression
        ;

unary_expression
        : postfix_expression
        | lxmIncrement unary_expression
        | lxmDecrement unary_expression
        | unary_operator cast_expression
        | lxmSizeof unary_expression
        | lxmSizeof '(' type_name ')'
        ;

unary_operator
        : '&'
        | '*'
        | '+'
        | '-'
        | '~'
        | '!'
        ;

cast_expression
        : unary_expression
        | '(' type_name ')' cast_expression
        ;

multiplicative_expression
        : cast_expression
        | multiplicative_expression '*' cast_expression
        | multiplicative_expression '/' cast_expression
        | multiplicative_expression '%' cast_expression
        ;

additive_expression
        : multiplicative_expression
        | additive_expression '+' multiplicative_expression
        | additive_expression '-' multiplicative_expression
        ;

shift_expression
        : additive_expression
        | shift_expression lxmShl additive_expression
        | shift_expression lxmShr additive_expression
        ;

relational_expression
        : shift_expression
        | relational_expression '<' shift_expression
        | relational_expression '>' shift_expression
        | relational_expression lxmLessOrEqual shift_expression
        | relational_expression lxmGreaterOrEqual shift_expression
        ;

equality_expression
        : relational_expression
        | equality_expression lxmEqual relational_expression
        | equality_expression lxmNonEqual relational_expression
        ;

and_expression
        : equality_expression
        | and_expression '&' equality_expression
        ;

exclusive_or_expression
        : and_expression
        | exclusive_or_expression '^' and_expression
        ;

inclusive_or_expression
        : exclusive_or_expression
        | inclusive_or_expression '|' exclusive_or_expression
        ;

logical_and_expression
        : inclusive_or_expression
        | logical_and_expression lxmAnd inclusive_or_expression
        ;

logical_or_expression
        : logical_and_expression
        | logical_or_expression lxmOr logical_and_expression
        ;

conditional_expression
        : logical_or_expression
        | logical_or_expression '?' expression ':' conditional_expression
        ;

assignment_expression
        : conditional_expression
        | unary_expression assignment_operator assignment_expression
        ;

assignment_operator
        : '='
        | lxmMulAssign
        | lxmDivAssign
        | lxmModAssign
        | lxmAddAssign
        | lxmSubAssign
        | lxmShlAssign
        | lxmShrAssign
        | lxmAndAssign
        | lxmXorAssign
        | lxmOrAssign
        ;

expression
        : assignment_expression
        | expression ',' assignment_expression
        ;

constant_expression
        : conditional_expression
        ;

declaration
        : declaration_specifiers ';'
        | declaration_specifiers init_declarator_list ';'
        ;

declaration_specifiers
        : storage_class_specifier
        | storage_class_specifier declaration_specifiers
        | type_specifier
        | type_specifier declaration_specifiers
        | type_qualifier
        | type_qualifier declaration_specifiers
        ;

init_declarator_list
        : init_declarator
        | init_declarator_list ',' init_declarator
        ;

init_declarator
        : declarator
        | declarator '=' initializer
        ;

storage_class_specifier
        : lxmTypedef
        | lxmExtern
        | lxmStatic
        | lxmAuto
        | lxmRegister
        ;

type_specifier
        : lxmVoid
        | lxmChar
        | lxmShort
        | lxmInt
        | lxmLong
        | lxmFloat
        | lxmDouble
        | lxmSigned
        | lxmUnsigned
        | struct_or_union_specifier
        | enum_specifier
        | lxmTypedefName
        ;

struct_or_union_specifier
        : struct_or_union lxmIdentifier '{' struct_declaration_list '}'
        | struct_or_union '{' struct_declaration_list '}'
        | struct_or_union lxmIdentifier
        ;

struct_or_union
        : lxmStruct
        | lxmUnion
        ;

struct_declaration_list
        : struct_declaration
        | struct_declaration_list struct_declaration
        ;

struct_declaration
        : specifier_qualifier_list struct_declarator_list ';'
        ;

specifier_qualifier_list
        : type_specifier specifier_qualifier_list
        | type_specifier
        | type_qualifier specifier_qualifier_list
        | type_qualifier
        ;

struct_declarator_list
        : struct_declarator
        | struct_declarator_list ',' struct_declarator
        ;

struct_declarator
        : declarator
        | ':' constant_expression
        | declarator ':' constant_expression
        ;

enum_specifier
        : lxmEnum '{' enumerator_list '}'
        | lxmEnum lxmIdentifier '{' enumerator_list '}'
        | lxmEnum lxmIdentifier
        ;

enumerator_list
        : enumerator
        | enumerator_list ',' enumerator
        ;

enumerator
        : lxmIdentifier
        | lxmIdentifier '=' constant_expression
        ;

type_qualifier
        : lxmConst
        | lxmVolatile
        ;

declarator
        : pointer direct_declarator
        | direct_declarator
        ;

direct_declarator
        : lxmIdentifier
        | '(' declarator ')'
        | direct_declarator '[' constant_expression ']'
        | direct_declarator '[' ']'
        | direct_declarator '(' parameter_type_list ')'
        | direct_declarator '(' identifier_list ')'
        | direct_declarator '(' ')'
        ;

pointer
        : '*'
        | '*' type_qualifier_list
        | '*' pointer
        | '*' type_qualifier_list pointer
        ;

type_qualifier_list
        : type_qualifier
        | type_qualifier_list type_qualifier
        ;

parameter_type_list
        : parameter_list
        | parameter_list ',' lxmEllipsis
        ;

parameter_list
        : parameter_declaration
        | parameter_list ',' parameter_declaration

parameter_declaration
        : declaration_specifiers declarator
        | declaration_specifiers abstract_declarator
        | declaration_specifiers
        ;

identifier_list
        : lxmIdentifier
        | identifier_list ',' lxmIdentifier
        ;

type_name
        : specifier_qualifier_list
        | specifier_qualifier_list abstract_declarator
        ;

abstract_declarator
        : pointer
        | direct_abstract_declarator
        | pointer direct_abstract_declarator
        ;

direct_abstract_declarator
        : '(' abstract_declarator ')'
        | '[' ']'
        | '[' constant_expression ']'
        | direct_abstract_declarator '[' ']'
        | direct_abstract_declarator '[' constant_expression ']'
        | '(' ')'
        | '(' parameter_type_list ')'
        | direct_abstract_declarator '(' ')'
        | direct_abstract_declarator '(' parameter_type_list ')'
        ;

initializer
        : assignment_expression
        | '{' initializer_list '}'
        | '{' initializer_list ',' '}'
        ;

initializer_list
        : initializer
        | initializer_list ',' initializer
        ;

statement
        : labeled_statement
        | compound_statement
        | expression_statement
        | selection_statement
        | iteration_statement
        | jump_statement
        ;

labeled_statement
        : lxmIdentifier ':' statement
        | lxmCase constant_expression ':' statement
        | lxmDefault ':' statement
        ;

compound_statement
        : '{' '}'
        | '{' statement_list '}'
        | '{' declaration_list '}'
        | '{' declaration_list statement_list '}'
        ;

declaration_list
        : declaration
        | declaration_list declaration
        ;

statement_list
        : statement
        | statement_list statement
        ;

expression_statement
        : ';'
        | expression ';'
        ;

selection_statement
        : lxmIf '(' expression ')' statement
        | lxmIf '(' expression ')' statement lxmElse statement
        | lxmSwitch '(' expression ')' statement
        ;

iteration_statement
        : lxmWhile '(' expression ')' statement
        | lxmDo statement lxmWhile '(' expression ')' ';'
        | lxmFor '(' expression_statement expression_statement ')' statement
        | lxmFor '(' expression_statement expression_statement expression ')' statement
        ;

jump_statement
        : lxmGoto lxmIdentifier ';'
        | lxmContinue ';'
        | lxmBreak ';'
        | lxmReturn ';'
        | lxmReturn expression ';'
        ;

translation_unit
        : external_declaration
        | translation_unit external_declaration
        ;

external_declaration
        : function_definition
        | declaration
        ;

function_definition
        : declaration_specifiers declarator declaration_list compound_statement
        | declaration_specifiers declarator compound_statement
        | declarator declaration_list compound_statement
        | declarator compound_statement
        ;

%%

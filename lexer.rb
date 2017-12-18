require 'rltk/lexer'

module Nameless
  class Lexer < RLTK::Lexer
    rule(/\n/) { :TK_EOL }
    rule(/\r\n/) { :TK_EOL }

    rule(/\s/)

    rule(/verdadeiro/) { :TK_TRUE }
    rule(/falso/) { :TK_FALSE }
    rule(/se/) { :TK_IF }
    rule(/senao/) { :TK_ELSE }
    rule(/fim/) { :TK_END }
    rule(/enquanto/) { :TK_WHILE }
    rule(/defina/) { :TK_DEF }
    rule(/inteiro/) { :TK_INT }
    rule(/caracteres/) { :TK_STRING }

    rule(/\,/) { :TK_COMMA }
    rule(/\;/) { :TK_SEMICOLON }

    rule(/=/) { :TK_EQUAL }
    rule(/==/) { :TK_DEQUAL }
    rule(/===/) { :TK_TEQUAL }
    rule(/\+/) { :TK_PLUS }
    rule(/\+\=/) { :TK_PLUSEQUAL }
    rule(/\-/)  { :TK_MINUS }
    rule(/-\=/) { :TK_MINUSEQUAL }
    rule(/\*/) { :TK_MUL }
    rule(/\*\*/) { :TK_EXPO }
    rule(/\//) { :TK_DIV }
    rule(/\%/) { :TK_MOD }

    rule(/\:/) { :TK_COLON }
    rule(/\:\:/) { :TK_DCOLON }
    rule(/\</) { :TK_LESSER }
    rule(/\<\=/) { :TK_LESSEREQUAL}
    rule(/\>/) { :TK_GREATER }
    rule(/\>\=/) { :TK_GREATEREQUAL }
    rule(/\|/) { :TK_PIPELINE }

    rule(/\(/) { :TK_OPENPAR }
    rule(/\)/) { :TK_CLOSEPAR }
    rule(/\{/) { :TK_OPENBRAC }
    rule(/\}/) { :TK_CLOSEBRAC }

    rule(/[A-Za-z][A-Za-z0-9]*/) { |t| [:TK_IDENTIFIER, t] }

    rule(/[0-9]+/) { |t| [:TK_NUM, t.to_i] }
  end
end

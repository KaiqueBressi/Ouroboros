require './lexer'
require './parser'

test = File.open('test.nl', 'r')
content = test.read

lexer = Nameless::Lexer.lex(content)
parser = Nameless::Parser.parse(lexer)
puts parser

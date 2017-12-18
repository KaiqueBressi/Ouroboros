require 'rltk/parser'

module Nameless
  class Parser < RLTK::Parser
    left :TK_PLUS, :TK_MINUS
    left :TK_MUL, :TK_DIV

    production(:input, 'function') { |f| f }
    production(:function, 'function_header TK_EOL function_definition TK_EOL TK_END') { |_, _, _, _, _ | _ }
    production(:function_header, 'TK_DEF TK_IDENTIFIER TK_DCOLON type_definition') { |_, i, _, t| i }
    production(:function_definition, 'TK_OPENPAR function_arglist TK_CLOSEPAR') { |_, _| _ }
    list(:function_arglist, :arglist_types, :TK_COMMA)

    production(:arglist_types) do
      clause(:TK_IDENTIFIER) { |t| t }
    end

    production(:types) do
      clause(:TK_INT) { |t| t }
      clause(:TK_STRING) { |t| t }
    end

    production(:next_type, 'TK_MINUS TK_GREATER') { |_, _| _ }

    nonempty_list(:type_definition, :types, :next_type)
    finalize
  end
end

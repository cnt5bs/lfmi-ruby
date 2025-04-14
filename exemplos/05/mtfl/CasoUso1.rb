require "lftmi"

puts "Caso 1:"
mtfl1 = LFTMI::C05::MTFL::ReconhecedorMTFL.new("q1", ["q3"])
mtfl1.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
mtfl1.automato.adicionarTransicao({["q1", "a"] => [["q1", "a", "D"]]})
mtfl1.automato.adicionarTransicao({["q1", "b"] => [["q2", "b", "D"]]})
mtfl1.automato.adicionarTransicao({["q1", ">"] => [["q3", ">", "E"]]})
mtfl1.automato.adicionarTransicao({["q2", "b"] => [["q2", "b", "D"]]})
mtfl1.automato.adicionarTransicao({["q2", ">"] => [["q3", ">", "E"]]}) # <-- ALTERA��O

mtfl1.iniciar("aabbb")
automatos = mtfl1.analisar
puts mtfl1.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 1:
# true
# (q1, (1, < [a]a b b b > ))
# (q1, (2, < a [a]b b b > ))
# (q1, (3, < a a [b]b b > ))
# (q2, (4, < a a b [b]b > ))
# (q2, (5, < a a b b [b]> ))
# (q2, (6, < a a b b b [>]))
# (q3, (5, < a a b b [b]> ))

puts "Caso 2:"
mtfl2 = LFTMI::C05::MTFL::ReconhecedorMTFL.new("q1", ["q3"])
mtfl2.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
mtfl2.automato.adicionarTransicao({["q1", "a"] => [["q1", "a", "D"]]})
mtfl2.automato.adicionarTransicao({["q1", "b"] => [["q2", "b", "D"]]})
mtfl2.automato.adicionarTransicao({["q1", ">"] => [["q3", ">", "E"]]})
mtfl2.automato.adicionarTransicao({["q2", "b"] => [["q2", "b", "D"]]})
mtfl2.automato.adicionarTransicao({["q2", ">"] => [["q3", ">", "E"]]}) # <-- ALTERA��O

mtfl2.iniciar("aaba")
automatos = mtfl2.analisar
puts mtfl2.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 2:
# false
# (q1, (1, < [a]a b a > ))
# (q1, (2, < a [a]b a > ))
# (q1, (3, < a a [b]a > ))
# (q2, (4, < a a b [a]> ))

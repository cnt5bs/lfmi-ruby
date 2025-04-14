require "lftmi"

puts "Caso 3:"
mtfl1 = LFTMI::C05::MTFL::ReconhecedorMTFL.new("q1", ["q5"])
mtfl1.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
mtfl1.automato.adicionarTransicao({["q1", "a"] => [["q2", "X", "D"]]})
mtfl1.automato.adicionarTransicao({["q1", "b"] => [["q6", "b", "D"]]})
mtfl1.automato.adicionarTransicao({["q1", "Y"] => [["q4", "Y", "D"]]})
mtfl1.automato.adicionarTransicao({["q2", "a"] => [["q2", "a", "D"]]})
mtfl1.automato.adicionarTransicao({["q2", "Y"] => [["q2", "Y", "D"]]})
mtfl1.automato.adicionarTransicao({["q2", "b"] => [["q3", "Y", "E"]]})
mtfl1.automato.adicionarTransicao({["q2", ">"] => [["q6", ">", "E"]]})
mtfl1.automato.adicionarTransicao({["q3", "X"] => [["q1", "X", "D"]]})
mtfl1.automato.adicionarTransicao({["q3", "Y"] => [["q3", "Y", "E"]]})
mtfl1.automato.adicionarTransicao({["q3", "a"] => [["q3", "a", "E"]]})
mtfl1.automato.adicionarTransicao({["q4", "Y"] => [["q4", "Y", "D"]]})
mtfl1.automato.adicionarTransicao({["q4", "b"] => [["q6", "b", "D"]]})
mtfl1.automato.adicionarTransicao({["q4", ">"] => [["q5", ">", "E"]]})

mtfl1.iniciar("aabb")
automatos = mtfl1.analisar
puts mtfl1.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 3:
# true
# (q1, (1, <[a]abb>))
# (q2, (2, <X[a]bb>))
# (q2, (3, <Xa[b]b>))
# (q3, (2, <X[a]Yb>))
# (q3, (1, <[X]aYb>))
# (q1, (2, <X[a]Yb>))
# (q2, (3, <XX[Y]b>))
# (q2, (4, <XXY[b]>))
# (q3, (3, <XX[Y]Y>))
# (q3, (2, <X[X]YY>))
# (q1, (3, <XX[Y]Y>))
# (q4, (4, <XXY[Y]>))
# (q4, (5, <XXYY[>]))
# (q5, (4, <XXY[Y]>))

puts "Caso 4:"
mtfl2 = LFTMI::C05::MTFL::ReconhecedorMTFL.new("q1", ["q5"])
mtfl2.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
mtfl2.automato.adicionarTransicao({["q1", "a"] => [["q2", "X", "D"]]})
mtfl2.automato.adicionarTransicao({["q1", "b"] => [["q6", "b", "D"]]})
mtfl2.automato.adicionarTransicao({["q1", "Y"] => [["q4", "Y", "D"]]})
mtfl2.automato.adicionarTransicao({["q2", "a"] => [["q2", "a", "D"]]})
mtfl2.automato.adicionarTransicao({["q2", "Y"] => [["q2", "Y", "D"]]})
mtfl2.automato.adicionarTransicao({["q2", "b"] => [["q3", "Y", "E"]]})
mtfl2.automato.adicionarTransicao({["q2", ">"] => [["q6", ">", "E"]]})
mtfl2.automato.adicionarTransicao({["q3", "X"] => [["q1", "X", "D"]]})
mtfl2.automato.adicionarTransicao({["q3", "Y"] => [["q3", "Y", "E"]]})
mtfl2.automato.adicionarTransicao({["q3", "a"] => [["q3", "a", "E"]]})
mtfl2.automato.adicionarTransicao({["q4", "Y"] => [["q4", "Y", "D"]]})
mtfl2.automato.adicionarTransicao({["q4", "b"] => [["q6", "b", "D"]]})
mtfl2.automato.adicionarTransicao({["q4", ">"] => [["q5", ">", "E"]]})
mtfl2.iniciar("aab")
automatos = mtfl2.analisar
puts mtfl2.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 4:
# false
# (q1, (1, <[a]ab>))
# (q2, (2, <X[a]b>))
# (q2, (3, <Xa[b]>))
# (q3, (2, <X[a]Y>))
# (q3, (1, <[X]aY>))
# (q1, (2, <X[a]Y>))
# (q2, (3, <XX[Y]>))
# (q2, (4, <XXY[>]))
# (q6, (3, <XX[Y]>))

puts "Caso 5:"
mtfl3 = LFTMI::C05::MTFL::ReconhecedorMTFL.new("q1", ["q5"])
mtfl3.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
mtfl3.automato.adicionarTransicao({["q1", "a"] => [["q2", "X", "D"]]})
mtfl3.automato.adicionarTransicao({["q1", "b"] => [["q6", "b", "D"]]})
mtfl3.automato.adicionarTransicao({["q1", "Y"] => [["q4", "Y", "D"]]})
mtfl3.automato.adicionarTransicao({["q2", "a"] => [["q2", "a", "D"]]})
mtfl3.automato.adicionarTransicao({["q2", "Y"] => [["q2", "Y", "D"]]})
mtfl3.automato.adicionarTransicao({["q2", "b"] => [["q3", "Y", "E"]]})
mtfl3.automato.adicionarTransicao({["q2", ">"] => [["q6", ">", "E"]]})
mtfl3.automato.adicionarTransicao({["q3", "X"] => [["q1", "X", "D"]]})
mtfl3.automato.adicionarTransicao({["q3", "Y"] => [["q3", "Y", "E"]]})
mtfl3.automato.adicionarTransicao({["q3", "a"] => [["q3", "a", "E"]]})
mtfl3.automato.adicionarTransicao({["q4", "Y"] => [["q4", "Y", "D"]]})
mtfl3.automato.adicionarTransicao({["q4", "b"] => [["q6", "b", "D"]]})
mtfl3.automato.adicionarTransicao({["q4", ">"] => [["q5", ">", "E"]]})
mtfl3.iniciar("abb")
automatos = mtfl3.analisar
puts mtfl3.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 5:
# false
# (q1, (1, <[a]bb>))
# (q2, (2, <X[b]b>))
# (q3, (1, <[X]Yb>))
# (q1, (2, <X[Y]b>))
# (q4, (3, <XY[b]>))
# (q6, (4, <XYb[>]))

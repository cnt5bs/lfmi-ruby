require "lftmi"
puts "Cenario 1:"
r = LFTMI::C06::MTFI::ReconhecedorMTFI.new("q1", ["q5"])
r.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
r.automato.adicionarTransicao({["q1", "a"] => [["q2", "a", "D"]]})
r.automato.adicionarTransicao({["q2", "b"] => [["q3", "b", "D"]]})
r.automato.adicionarTransicao({["q3", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "a"] => [["q4", "a", "D"]]})
r.automato.adicionarTransicao({["q4", "b"] => [["q4", "b", "D"]]})
r.automato.adicionarTransicao({["q4", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "B"] => [["q5", "B", "D"]]})

r.iniciar("abc")
automatos = r.analisar
puts r.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# true
# (q1, (1, < [a]b c B ))
# (q2, (2, < a [b]c B ))
# (q3, (3, < a b [c]B ))
# (q4, (4, < a b c [B]))
# (q5, (5, < a b c B [B]))

puts "Caso 2:"
r = LFTMI::C06::MTFI::ReconhecedorMTFI.new("q1", ["q5"])
r.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
r.automato.adicionarTransicao({["q1", "a"] => [["q2", "a", "D"]]})
r.automato.adicionarTransicao({["q2", "b"] => [["q3", "b", "D"]]})
r.automato.adicionarTransicao({["q3", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "a"] => [["q4", "a", "D"]]})
r.automato.adicionarTransicao({["q4", "b"] => [["q4", "b", "D"]]})
r.automato.adicionarTransicao({["q4", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "B"] => [["q5", "B", "D"]]})

r.iniciar("abca")
automatos = r.analisar
puts r.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# true
# (q1, (1, < [a]b c a B ))
# (q2, (2, < a [b]c a B ))
# (q3, (3, < a b [c]a B ))
# (q4, (4, < a b c [a]B ))
# (q4, (5, < a b c a [B]))
# (q5, (6, < a b c a B [B]))

puts "Caso 3:"
r = LFTMI::C06::MTFI::ReconhecedorMTFI.new("q1", ["q5"])
r.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
r.automato.adicionarTransicao({["q1", "a"] => [["q2", "a", "D"]]})
r.automato.adicionarTransicao({["q2", "b"] => [["q3", "b", "D"]]})
r.automato.adicionarTransicao({["q3", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "a"] => [["q4", "a", "D"]]})
r.automato.adicionarTransicao({["q4", "b"] => [["q4", "b", "D"]]})
r.automato.adicionarTransicao({["q4", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "B"] => [["q5", "B", "D"]]})

r.iniciar("abccba")
automatos = r.analisar
puts r.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# true
# (q1, (1, < [a]b c c b a B ))
# (q2, (2, < a [b]c c b a B ))
# (q3, (3, < a b [c]c b a B ))
# (q4, (4, < a b c [c]b a B ))
# (q4, (5, < a b c c [b]a B ))
# (q4, (6, < a b c c b [a]B ))
# (q4, (7, < a b c c b a [B]))
# (q5, (8, < a b c c b a B [B]))

require "lftmi"
r = LFTMI::C06::MTFI::ReconhecedorMTFIParada.new("q1", [])
r.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
r.automato.adicionarTransicao({["q1", "a"] => [["q2", "a", "D"]]})
r.automato.adicionarTransicao({["q1", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["q1", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["q1", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q2", "b"] => [["q3", "b", "D"]]})
r.automato.adicionarTransicao({["q2", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["q2", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["q2", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q3", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q3", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["q3", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["q3", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q4", "a"] => [["q4", "a", "D"]]})
r.automato.adicionarTransicao({["q4", "b"] => [["q4", "b", "D"]]})
r.automato.adicionarTransicao({["q4", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "B"] => [["q5", "B", "D"]]})
r.automato.adicionarTransicao({["qloop", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["qloop", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["qloop", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["qloop", "B"] => [["qloop", "B", "D"]]})

r.iniciar("abc")
automatos = r.analisar
puts r.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# true
# (q1, (1, <[a]bcB))
# (q2, (2, <a[b]cB))
# (q3, (3, <ab[c]B))
# (q4, (4, <abc[B]))
# (q5, (5, <abcB[B]))

r = LFTMI::C06::MTFI::ReconhecedorMTFIParada.new("q1", [])
r.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
r.automato.adicionarTransicao({["q1", "a"] => [["q2", "a", "D"]]})
r.automato.adicionarTransicao({["q1", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["q1", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["q1", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q2", "b"] => [["q3", "b", "D"]]})
r.automato.adicionarTransicao({["q2", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["q2", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["q2", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q3", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q3", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["q3", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["q3", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q4", "a"] => [["q4", "a", "D"]]})
r.automato.adicionarTransicao({["q4", "b"] => [["q4", "b", "D"]]})
r.automato.adicionarTransicao({["q4", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "B"] => [["q5", "B", "D"]]})
r.automato.adicionarTransicao({["qloop", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["qloop", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["qloop", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["qloop", "B"] => [["qloop", "B", "D"]]})

r.iniciar("abca")
automatos = r.analisar
puts r.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# true
# (q1, (1, <[a]bcaB))
# (q2, (2, <a[b]caB))
# (q3, (3, <ab[c]aB))
# (q4, (4, <abc[a]B))
# (q4, (5, <abca[B]))
# (q5, (6, <abcaB[B]))

r = LFTMI::C06::MTFI::ReconhecedorMTFIParada.new("q1", [])
r.automato.adicionarTransicao({["q0", "<"] => [["q1", "<", "D"]]})
r.automato.adicionarTransicao({["q1", "a"] => [["q2", "a", "D"]]})
r.automato.adicionarTransicao({["q1", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["q1", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["q1", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q2", "b"] => [["q3", "b", "D"]]})
r.automato.adicionarTransicao({["q2", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["q2", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["q2", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q3", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q3", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["q3", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["q3", "B"] => [["qloop", "B", "D"]]})
r.automato.adicionarTransicao({["q4", "a"] => [["q4", "a", "D"]]})
r.automato.adicionarTransicao({["q4", "b"] => [["q4", "b", "D"]]})
r.automato.adicionarTransicao({["q4", "c"] => [["q4", "c", "D"]]})
r.automato.adicionarTransicao({["q4", "B"] => [["q5", "B", "D"]]})
r.automato.adicionarTransicao({["qloop", "a"] => [["qloop", "a", "D"]]})
r.automato.adicionarTransicao({["qloop", "b"] => [["qloop", "b", "D"]]})
r.automato.adicionarTransicao({["qloop", "c"] => [["qloop", "c", "D"]]})
r.automato.adicionarTransicao({["qloop", "B"] => [["qloop", "B", "D"]]})

r.iniciar("a")
begin
  automatos = r.analisar
  puts r.reconheceu?
  automatos.each do |automato|
    puts automato.configuracao?
  end
rescue
  puts("Exceção gerada.")
end

# ./02/af/Movimento.rb:18:in `avancar': uncaught throw `Estouro de B's' (NameError)

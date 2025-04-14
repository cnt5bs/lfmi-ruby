require "lftmi"
# Cenário 1
rfnd = LFTMI::C03::AFND::ReconhecedorNaoDeterministico.new("q0", ["q2"])
rfnd.automato.adicionarTransicao({["q0", "a"] => ["q1", "q2"]})
rfnd.automato.adicionarTransicao({["q1", "b"] => ["q1", "q2"]})
rfnd.automato.adicionarTransicao({["q2", "c"] => ["q2"]})
rfnd.iniciar("abbccc")
automatos = rfnd.analisar
puts rfnd.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# Cenário 2
rfnd = LFTMI::C03::AFND::ReconhecedorNaoDeterministico.new("q0", ["q0"])
rfnd.automato.adicionarTransicao({["q0", "a"] => ["q1", "q2"]})
rfnd.automato.adicionarTransicao({["q1", "b"] => ["q1", "q2"]})
rfnd.automato.adicionarTransicao({["q2", "c"] => ["q2"]})
rfnd.iniciar("abbccc")
automatos = rfnd.analisar
puts rfnd.reconheceu? # false
automatos.each do |automato|
  puts automato.configuracao?
end

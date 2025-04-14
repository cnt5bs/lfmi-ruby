require "lftmi"
# Cenário 1
rpd = LFTMI::C04::APD::ReconhecedorAPD.new("q0", ["q1"])
rpd.automato.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
rpd.automato.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
rpd.automato.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
rpd.automato.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
rpd.iniciar("b")
automatos = rpd.analisar
puts rpd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 2
rpd = LFTMI::C04::APD::ReconhecedorAPD.new("q0", ["q1"])
rpd.automato.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
rpd.automato.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
rpd.automato.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
rpd.automato.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
rpd.iniciar("abcc")
automatos = rpd.analisar
puts rpd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 3
rpd = LFTMI::C04::APD::ReconhecedorAPD.new("q0", ["q1"])
rpd.automato.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
rpd.automato.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
rpd.automato.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
rpd.automato.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
rpd.iniciar("aabcccc")
automatos = rpd.analisar
puts rpd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 4
rpd = LFTMI::C04::APD::ReconhecedorAPD.new("q0", ["q1"])
rpd.automato.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
rpd.automato.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
rpd.automato.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
rpd.automato.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
rpd.iniciar("abccc")
automatos = rpd.analisar
puts rpd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 5
rpd = LFTMI::C04::APD::ReconhecedorAPD.new("q0", ["q1"])
rpd.automato.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
rpd.automato.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
rpd.automato.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
rpd.automato.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
rpd.automato.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
rpd.iniciar("aabccc")
automatos = rpd.analisar
puts rpd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

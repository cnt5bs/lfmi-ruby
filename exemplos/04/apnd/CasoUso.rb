require "lftmi"
# Cenário 1
rpnd = LFTMI::C04::APND::ReconhecedorAPND.new("q0", ["q4"])
rpnd.automato.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
rpnd.automato.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
rpnd.iniciar("ac")
automatos = rpnd.analisar
puts rpnd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 2
rpnd = LFTMI::C04::APND::ReconhecedorAPND.new("q0", ["q4"])
rpnd.automato.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
rpnd.automato.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
rpnd.iniciar("acc")
automatos = rpnd.analisar
puts rpnd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 3
rpnd = LFTMI::C04::APND::ReconhecedorAPND.new("q0", ["q4"])
rpnd.automato.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
rpnd.automato.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
rpnd.iniciar("aacc")
automatos = rpnd.analisar
puts rpnd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 4
rpnd = LFTMI::C04::APND::ReconhecedorAPND.new("q0", ["q4"])
rpnd.automato.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
rpnd.automato.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
rpnd.iniciar("accc")
automatos = rpnd.analisar
puts rpnd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 5
rpnd = LFTMI::C04::APND::ReconhecedorAPND.new("q0", ["q4"])
rpnd.automato.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
rpnd.automato.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
rpnd.iniciar("aac")
automatos = rpnd.analisar
puts rpnd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 6
rpnd = LFTMI::C04::APND::ReconhecedorAPND.new("q0", ["q4"])
rpnd.automato.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
rpnd.automato.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
rpnd.automato.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
rpnd.automato.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
rpnd.iniciar("aacccc")
automatos = rpnd.analisar
puts rpnd.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts

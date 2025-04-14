require "lftmi"
# Cenário 1
apd = LFTMI::C04::APND::AutomatoPilhaNaoDeterministico.new("q0", ["q4"])
apd.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
apd.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
apd.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
apd.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
apd.iniciar("ac")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 2
apd = LFTMI::C04::APND::AutomatoPilhaNaoDeterministico.new("q0", ["q4"])
apd.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
apd.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
apd.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
apd.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
apd.iniciar("acc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 3
apd = LFTMI::C04::APND::AutomatoPilhaNaoDeterministico.new("q0", ["q4"])
apd.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
apd.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
apd.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
apd.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
apd.iniciar("aacc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 4
apd = LFTMI::C04::APND::AutomatoPilhaNaoDeterministico.new("q0", ["q4"])
apd.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
apd.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
apd.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
apd.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
apd.iniciar("accc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 5
apd = LFTMI::C04::APND::AutomatoPilhaNaoDeterministico.new("q0", ["q4"])
apd.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
apd.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
apd.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
apd.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
apd.iniciar("aac")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 6
apd = LFTMI::C04::APND::AutomatoPilhaNaoDeterministico.new("q0", ["q4"])
apd.adicionarTransicao({["q0", "a", "Z0"] => [["q1", ["Z0", "C", "C"]], ["q2", ["Z0", "C"]]]})
apd.adicionarTransicao({["q1", "a", "C"] => [["q1", ["C", "C", "C"]]]})
apd.adicionarTransicao({["q1", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q2", "a", "C"] => [["q2", ["C", "C"]]]})
apd.adicionarTransicao({["q2", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "c", "C"] => [["q3", []]]})
apd.adicionarTransicao({["q3", "", "Z0"] => [["q4", ["Z0"]]]})
apd.iniciar("aacccc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

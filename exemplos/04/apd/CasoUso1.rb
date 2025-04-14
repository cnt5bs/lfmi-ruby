require "lftmi"
# Cenário 1
apd = LFTMI::C04::APD::AutomatoPilhaDeterministico.new("q0", [])
apd.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
apd.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
apd.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
apd.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
apd.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
apd.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
apd.iniciar("b")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 2
apd = LFTMI::C04::APD::AutomatoPilhaDeterministico.new("q0", [])
apd.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
apd.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
apd.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
apd.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
apd.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
apd.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
apd.iniciar("abcc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 3
apd = LFTMI::C04::APD::AutomatoPilhaDeterministico.new("q0", [])
apd.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
apd.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
apd.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
apd.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
apd.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
apd.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
apd.iniciar("aabcccc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

# Cenário 4
apd = LFTMI::C04::APD::AutomatoPilhaDeterministico.new("q0", [])
apd.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
apd.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
apd.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
apd.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
apd.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
apd.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
apd.iniciar("abccc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts
# Cenário 5
apd = LFTMI::C04::APD::AutomatoPilhaDeterministico.new("q0", [])
apd.adicionarTransicao({["q0", "a", "Z0"] => ["q0", ["Z0", "C", "C"]]})
apd.adicionarTransicao({["q0", "a", "C"] => ["q0", ["C", "C", "C"]]})
apd.adicionarTransicao({["q0", "b", "Z0"] => ["q1", ["Z0"]]})
apd.adicionarTransicao({["q0", "b", "C"] => ["q1", ["C"]]})
apd.adicionarTransicao({["q1", "c", "C"] => ["q1", []]})
apd.adicionarTransicao({["q1", "", "Z0"] => ["q1", []]})
apd.iniciar("aabccc")
automatos = apd.executar
automatos.each do |a|
  puts a.configuracao?
end
puts

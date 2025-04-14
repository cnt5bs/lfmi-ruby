require "lftmi"
# Cenário 1:
rfd = LFTMI::C03::AFD::ReconhecedorDeterministico.new("q0", ["q1", "q2"])
rfd.automato.adicionarTransicao({["q0", "0"] => "q0"})
rfd.automato.adicionarTransicao({["q0", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q0", "2"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q1", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q2", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q3", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "2"] => "q3"})
rfd.iniciar("00001")
automatos = rfd.analisar
puts rfd.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 1:
# true
# (q0, (1, <[0]0001>))
# (q0, (2, <0[0]001>))
# (q0, (3, <00[0]01>))
# (q0, (4, <000[0]1>))
# (q0, (5, <0000[1]>))
# (q1, (6, <00001[>]))

# Cenário 2:
rfd = LFTMI::C03::AFD::ReconhecedorDeterministico.new("q0", ["q1", "q2"])
rfd.automato.adicionarTransicao({["q0", "0"] => "q0"})
rfd.automato.adicionarTransicao({["q0", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q0", "2"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q1", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q2", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q3", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "2"] => "q3"})
rfd.iniciar("0122")
automatos = rfd.analisar
puts rfd.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 2:
# true
# (q0, (1, <[0]122>))
# (q0, (2, <0[1]22>))
# (q1, (3, <01[2]2>))
# (q2, (4, <012[2]>))
# (q2, (5, <0122[>]))

# Cenário 3:
rfd = LFTMI::C03::AFD::ReconhecedorDeterministico.new("q0", ["q1", "q2"])
rfd.automato.adicionarTransicao({["q0", "0"] => "q0"})
rfd.automato.adicionarTransicao({["q0", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q0", "2"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q1", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q2", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q3", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "2"] => "q3"})
rfd.iniciar("0011222")
automatos = rfd.analisar
puts rfd.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 3:
# true
# (q0, (1, <[0]011222>))
# (q0, (2, <0[0]11222>))
# (q0, (3, <00[1]1222>))
# (q1, (4, <001[1]222>))
# (q1, (5, <0011[2]22>))
# (q2, (6, <00112[2]2>))
# (q2, (7, <001122[2]>))
# (q2, (8, <0011222[>]))

# Cenário 4:
rfd = LFTMI::C03::AFD::ReconhecedorDeterministico.new("q0", ["q1", "q2"])
rfd.automato.adicionarTransicao({["q0", "0"] => "q0"})
rfd.automato.adicionarTransicao({["q0", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q0", "2"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q1", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q2", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q3", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "2"] => "q3"})
rfd.iniciar("0022")
automatos = rfd.analisar
puts rfd.reconheceu? # false
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 4:
# false
# (q0, (1, <[0]022>))
# (q0, (2, <0[0]22>))
# (q0, (3, <00[2]2>))
# (q3, (4, <002[2]>))
# (q3, (5, <0022[>]))

# Cenário 5:
rfd = LFTMI::C03::AFD::ReconhecedorDeterministico.new("q0", ["q1", "q2"])
rfd.automato.adicionarTransicao({["q0", "0"] => "q0"})
rfd.automato.adicionarTransicao({["q0", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q0", "2"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q1", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q2", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q3", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "2"] => "q3"})
rfd.iniciar("12")
automatos = rfd.analisar
puts rfd.reconheceu? # true
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 5:
# true
# (q0, (1, <[1]2>))
# (q1, (2, <1[2]>))
# (q2, (3, <12[>]))

# Cenário 6:
rfd = LFTMI::C03::AFD::ReconhecedorDeterministico.new("q0", ["q1", "q2"])
rfd.automato.adicionarTransicao({["q0", "0"] => "q0"})
rfd.automato.adicionarTransicao({["q0", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q0", "2"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q1", "1"] => "q1"})
rfd.automato.adicionarTransicao({["q1", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q2", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q2", "2"] => "q2"})
rfd.automato.adicionarTransicao({["q3", "0"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "1"] => "q3"})
rfd.automato.adicionarTransicao({["q3", "2"] => "q3"})
rfd.iniciar("222")
automatos = rfd.analisar
puts rfd.reconheceu? # false
automatos.each do |automato|
  puts automato.configuracao?
end
# Resultado do cenário 6:
# false
# (q0, (1, <[2]22>))
# (q3, (2, <2[2]2>))
# (q3, (3, <22[2]>))
# (q3, (4, <222[>]))

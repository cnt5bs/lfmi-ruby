require "lftmi"
# Cenário 1:
rape = LFTMI::C04::APE::ReconhecedorAPE.new("q11", ["q12"])
rape.automato.adicionarTransicao({["I", "q11", "a"] => ["q11"]})
rape.automato.adicionarTransicao({["I", "q11", "x"] => ["q12"]})
rape.automato.adicionarTransicao({["I", "q12", "b"] => ["q12"]})

rape.iniciar("aaaxbb")
automatos = rape.analisar
puts rape.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts
# Resultado do cenário:
# true
# ((q11, (1, <[a]aaxbb>)), (["Z0"]))
# ((q11, (2, <a[a]axbb>)), (["Z0"]))
# ((q11, (3, <aa[a]xbb>)), (["Z0"]))
# ((q11, (4, <aaa[x]bb>)), (["Z0"]))
# ((q12, (5, <aaax[b]b>)), (["Z0"]))
# ((q12, (6, <aaaxb[b]>)), (["Z0"]))
# ((q12, (7, <aaaxbb[>])), (["Z0"]))

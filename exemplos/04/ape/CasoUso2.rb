require "lftmi"
# Cenário 2:
rape = LFTMI::C04::APE::ReconhecedorAPE.new("q11", ["q12"])
rape.automato.adicionarTransicao({["I", "q11", "x"] => ["q12"]})
rape.automato.adicionarTransicao({["I", "q11", "a"] => ["q13"]})
rape.automato.adicionarTransicao({["I", "q14", "b"] => ["q12"]})
rape.automato.adicionarTransicao({["A", "q13", ""] => ["q14", "q11"]})
rape.automato.adicionarTransicao({["R", "q12", "q14"] => []})
rape.automato.adicionarTransicao({["R", "q12", "Z0"] => []})

rape.iniciar("aaaxbbb")
automatos = rape.analisar
puts rape.reconheceu?
automatos.each do |a|
  puts a.configuracao?
end
puts
# Resultado do cenário:
# true
# ((q11, (1, <[a]aaxbbb>)), (["Z0"]))
# ((q13, (2, <a[a]axbbb>)), (["Z0", "q14"]))
# ((q11, (2, <a[a]axbbb>)), (["Z0", "q14"]))
# ((q13, (3, <aa[a]xbbb>)), (["Z0", "q14", "q14"]))
# ((q11, (3, <aa[a]xbbb>)), (["Z0", "q14", "q14"]))
# ((q13, (4, <aaa[x]bbb>)), (["Z0", "q14", "q14", "q14"]))
# ((q11, (4, <aaa[x]bbb>)), (["Z0", "q14", "q14", "q14"]))
# ((q12, (5, <aaax[b]bb>)), (["Z0", "q14", "q14"]))
# ((q14, (5, <aaax[b]bb>)), (["Z0", "q14", "q14", "q14"]))
# ((q12, (6, <aaaxb[b]b>)), (["Z0", "q14", "q14"]))
# ((q14, (6, <aaaxb[b]b>)), (["Z0", "q14", "q14", "q14"]))
# ((q12, (7, <aaaxbb[b]>)), (["Z0", "q14", "q14"]))
# ((q14, (7, <aaaxbb[b]>)), (["Z0", "q14", "q14", "q14"]))
# ((q12, (8, <aaaxbbb[>])), (["Z0", "q14", "q14"]))
# ((q14, (8, <aaaxbbb[>])), (["Z0", "q14", "q14", "q14"]))

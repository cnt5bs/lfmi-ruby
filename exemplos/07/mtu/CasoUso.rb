require "lftmi"
r = LFTMI::C07::MTU::ReconhecedorMTU.new(0, [2])
r.automato.adicionarTransicao([0, "0", 1, "0", "D"])
r.automato.adicionarTransicao([1, "1", 1, "1", "D"])
r.automato.adicionarTransicao([1, "B", 2, "B", "E"])
r.iniciar("0111")
automatos = r.analisar
puts r.reconheceu?
automatos.each do |automato|
  puts automato.configuracao?
end
# true
# (aa, (0,bbbabbbbabbbbabbbbabba))
# (aaaa, (1,bbbabbbbabbbbabbbbabba))
# (aaaa, (2,bbbabbbbabbbbabbbbabba))
# (aaaa, (3,bbbabbbbabbbbabbbbabba))
# (aaaa, (4,bbbabbbbabbbbabbbbabba))
# (aaaaa, (3,bbbabbbbabbbbabbbbabbabba))

require "lftmi"
glc1 = LFTMI::C04::GLC::GramaticaLivreContexto.new

glc1.adicionarProducao({"E" => ["T+E", "T"]})
glc1.adicionarProducao({"T" => ["F*T", "F"]})
glc1.adicionarProducao({"F" => ["(E)", "a"]})

derivacoes = glc1.derivar("E", 2)
derivacoes.each do |sentencas|
  sentencas.each do |w, substituicoes|
    puts "#{w.inspect}=>#{substituicoes.inspect}"
  end
end

derivacoes = glc1.derivar("E", 4)
derivacoes.each do |sentencas|
  sentencas.each do |w, substituicoes|
    puts "#{w.inspect}=>#{substituicoes.inspect}" if substituicoes == []
  end
end

derivacoes = glc1.derivar("E", 9)
derivacoes.each do |sentencas|
  sentencas.each do |w, substituicoes|
    puts "#{w.inspect}=>#{substituicoes.inspect}" if substituicoes == []
  end
end

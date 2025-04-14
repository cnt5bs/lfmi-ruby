require "lftmi"
gsc = LFTMI::C05::GSC::GramaticaSensivelContexto.new # p. 296 (igual a p. 53!?)
gsc.adicionarProducao({"S" => ["aSBC", "aBC"]})
gsc.adicionarProducao({"CB" => ["BC"]})
gsc.adicionarProducao({"aB" => ["ab"]})
gsc.adicionarProducao({"bB" => ["bb"]})
gsc.adicionarProducao({"bC" => ["bc"]})
gsc.adicionarProducao({"cC" => ["cc"]})

derivacoes = gsc.derivar("S", 4)
derivacoes.each do |sentencas|
  sentencas.each do |w, substituicoes|
    puts "#{w.inspect}=>#{substituicoes.inspect}"
  end
end

# "S"=>["aSBC", "aBC"]
# "aSBC"=>["aaSBCBC", "aaBCBC"]
# "aBC"=>["abC"]
# "aaSBCBC"=>["aaaSBCBCBC", "aaaBCBCBC", "aaSBBCC"]
# "aaBCBC"=>["aaBBCC", "aabCBC"]
# "abC"=>["abc"]
# "aaaSBCBCBC"=>["aaaaSBCBCBCBC", "aaaaBCBCBCBC", "aaaSBBCCBC"]
# "aaaBCBCBC"=>["aaaBBCCBC", "aaabCBCBC"]
# "aaSBBCC"=>["aaaSBCBBCC", "aaaBCBBCC"]
# "aaBBCC"=>["aabBCC"]
# "aabCBC"=>["aabBCC", "aabcBC"]
# "abc"=>[]

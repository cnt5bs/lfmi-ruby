$: << "../..;../../../../lab"
require "lftmi"
g = LFTMI::C04::LLC::Greibach.new
g.adicionarProducao({"S" => ["aBC", "bBC"]})
g.adicionarProducao({"B" => ["bB", "b"]})
g.adicionarProducao({"C" => ["c"]})

# Exemplo 4.41 (a)
puts "Ensaio 1: cadeia abbc"
puts g.pertence?("abbc")
puts g.mostrarSubstituicoes

puts
puts "Ensaio 2: cadeia bcbc"
puts g.pertence?("bcbc")
puts g.mostrarSubstituicoes

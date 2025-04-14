require "lftmi"
# Cenário 1
moore = LFTMI::C03::MOORE::Moore.new("q0", ["q1"])
moore.automato.adicionarTransicao({["q0", "a"] => "q1"})
moore.automato.adicionarTransicao({["q1", "b"] => "q1"})
moore.automato.adicionarTransicao({["q1", "c"] => "q0"})
moore.adicionarLambda({"q0" => "1"})
moore.adicionarLambda({"q1" => ""})
moore.iniciar("abbcabbbcab")
moore.traduzir # -> 111
puts

# Cenário 2
moore = LFTMI::C03::MOORE::Moore.new("q0", ["q1"])
moore.automato.adicionarTransicao({["q0", "a"] => "q1"})
moore.automato.adicionarTransicao({["q1", "b"] => "q1"})
moore.automato.adicionarTransicao({["q1", "c"] => "q0"})
moore.adicionarLambda({"q0" => "1"})
moore.adicionarLambda({"q1" => ""})
moore.iniciar("abbbcab")
moore.traduzir
# Resultado do enário 2
# 11
puts

# Cenário 3
moore = LFTMI::C03::MOORE::Moore.new("q0", ["q1"])
moore.automato.adicionarTransicao({["q0", "a"] => "q1"})
moore.automato.adicionarTransicao({["q1", "b"] => "q1"})
moore.automato.adicionarTransicao({["q1", "c"] => "q0"})
moore.adicionarLambda({"q0" => "1"})
moore.adicionarLambda({"q1" => ""})
moore.iniciar("acacaca")
moore.traduzir # Resultado do enário 3
# 1111
puts

# Cenário 4
moore = LFTMI::C03::MOORE::Moore.new("q0", ["q1"])
moore.automato.adicionarTransicao({["q0", "a"] => "q1"})
moore.automato.adicionarTransicao({["q1", "b"] => "q1"})
moore.automato.adicionarTransicao({["q1", "c"] => "q0"})
moore.adicionarLambda({"q0" => "1"})
moore.adicionarLambda({"q1" => ""})
moore.iniciar("a")
moore.traduzir
# Resultado do enário 4
# 1
puts

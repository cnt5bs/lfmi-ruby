require "lftmi"
# Cenário 1
mealy = LFTMI::C03::MEALY::Mealy.new("q0", ["q1"])
mealy.automato.adicionarTransicao({["q0", "a"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "b"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "c"] => "q0"})
mealy.adicionarLambda({["q0", "a"] => "ab"})
mealy.adicionarLambda({["q1", "b"] => ""})
mealy.adicionarLambda({["q1", "c"] => "c"})
mealy.iniciar("abbcabbbcab")
mealy.traduzir # -> abcabcab
puts

# Cenário 2
mealy = LFTMI::C03::MEALY::Mealy.new("q0", ["q1"])
mealy.automato.adicionarTransicao({["q0", "a"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "b"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "c"] => "q0"})
mealy.adicionarLambda({["q0", "a"] => "ab"})
mealy.adicionarLambda({["q1", "b"] => ""})
mealy.adicionarLambda({["q1", "c"] => "c"})
mealy.iniciar("abbbcab")
mealy.traduzir # -> abcab
puts

# Cenário 3
mealy = LFTMI::C03::MEALY::Mealy.new("q0", ["q1"])
mealy.automato.adicionarTransicao({["q0", "a"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "b"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "c"] => "q0"})
mealy.adicionarLambda({["q0", "a"] => "ab"})
mealy.adicionarLambda({["q1", "b"] => ""})
mealy.adicionarLambda({["q1", "c"] => "c"})
mealy.iniciar("acacaca")
mealy.traduzir # -> abcabcabcab
puts

# Cenário 4
mealy = LFTMI::C03::MEALY::Mealy.new("q0", ["q1"])
mealy.automato.adicionarTransicao({["q0", "a"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "b"] => "q1"})
mealy.automato.adicionarTransicao({["q1", "c"] => "q0"})
mealy.adicionarLambda({["q0", "a"] => "ab"})
mealy.adicionarLambda({["q1", "b"] => ""})
mealy.adicionarLambda({["q1", "c"] => "c"})
mealy.iniciar("a")
mealy.traduzir # -> ab
puts

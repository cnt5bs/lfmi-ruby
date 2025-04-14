require "af/automata/fita_limitada"

entrada = AF::Automata::FitaLimitada.new
entrada.iniciar("abc")
puts entrada.configuracao?

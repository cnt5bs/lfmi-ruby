# exemplos/02/af/CasoUso1.rb
# $: << "C:/ruby teoria/lab/02/af"

# Option 1: Use installed gem
# require 'lftmi'

# Option 2: For development, use this instead:
# $LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require "lftmi"

entrada = LFTMI::C02::AF::FitaLimitada.new
entrada.iniciar("abc")
puts entrada.configuracao?

entrada.avancar
entrada.avancar
puts entrada.configuracao?

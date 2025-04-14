module LFTMI
  module C03
    module AFD
      require "lftmi/02/af/reconhecedor"
      require "lftmi/03/afd/automato_deterministico"

      class ReconhecedorDeterministico < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoDeterministico.new(estadoInicial, estadosFinais)
        end
      end
    end
  end
end

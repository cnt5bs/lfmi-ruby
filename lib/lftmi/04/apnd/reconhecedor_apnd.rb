module LFTMI
  module C04
    module APND
      require "lftmi/02/af/reconhecedor"
      require "lftmi/04/apnd/automato_pilha_nao_deterministico"
      class ReconhecedorAPND < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoPilhaNaoDeterministico.new(estadoInicial, estadosFinais)
        end
      end
    end
  end
end

module LFTMI
  module C03
    module AFND
      require "lftmi/02/af/reconhecedor"
      require "lftmi/03/afnd/automato_nao_deterministico"

      class ReconhecedorNaoDeterministico < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoNaoDeterministico.new(estadoInicial, estadosFinais)
        end
      end
    end
  end
end

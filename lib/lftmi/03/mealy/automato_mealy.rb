module LFTMI
  module C03
    module MEALY
      require "lftmi/03/afd/automato_deterministico"
      require "lftmi/03/mealy/servico/movimentacao_mealy"
      class AutomatoMealy < LFTMI::C03::AFD::AutomatoDeterministico
        attr_accessor :mealy
        def instanciarMovimentacao
          @movimentacao = MovimentacaoMealy.new(self)
        end

        def criarVinculo(mealy)
          @mealy = mealy
        end
      end
    end
  end
end

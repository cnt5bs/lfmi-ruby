module LFTMI
  module C03
    module MOORE
      require "lftmi/03/afd/automato_deterministico"
      require "lftmi/03/moore/servico/movimentacao_moore"
      class AutomatoMoore < LFTMI::C03::AFD::AutomatoDeterministico
        attr_accessor :moore
        def instanciarMovimentacao
          @movimentacao = MovimentacaoMoore.new(self)
        end

        def criarVinculo(moore)
          @moore = moore
        end
      end
    end
  end
end

module LFTMI
  module C03
    module AFD
      require "lftmi/02/af/automato"
      require "lftmi/02/af/fita_limitada"
      require "lftmi/03/afd/servico/movimentacao_deterministica"

      class AutomatoDeterministico < LFTMI::C02::AF::Automato
        def instanciarEntrada
          @entrada = LFTMI::C02::AF::FitaLimitada.new
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoDeterministica.new(self)
        end

        def adicionarTransicao(transicao)
          @transicoes.update(transicao)
        end
      end
    end
  end
end

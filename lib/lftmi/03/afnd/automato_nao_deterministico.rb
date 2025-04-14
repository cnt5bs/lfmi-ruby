module LFTMI
  module C03
    module AFND
      require "lftmi/02/af/automato"
      require "lftmi/02/af/fita_limitada"
      require "lftmi/03/afnd/servico/movimentacao_nao_deterministica"

      class AutomatoNaoDeterministico < LFTMI::C02::AF::Automato
        def instanciarEntrada
          @entrada = LFTMI::C02::AF::FitaLimitada.new
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoNaoDeterministica.new(self)
        end

        def adicionarTransicao(transicao)
          @transicoes.update(transicao)
        end
      end
    end
  end
end

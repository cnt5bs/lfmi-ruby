module LFTMI
  module C02
    module AF
      require "Automato"

      class AutomatoIncomum < Automato
        def instanciarEntrada
          @entrada = FitaLimitada.new
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoIncomum.new(self)
        end
      end
    end
  end
end

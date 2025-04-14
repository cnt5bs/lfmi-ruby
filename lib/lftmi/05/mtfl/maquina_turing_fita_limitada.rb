module LFTMI
  module C05
    module MTFL
      require "lftmi/03/afnd/automato_nao_deterministico"
      require "lftmi/05/mtfl/fita_mtfl"
      require "lftmi/05/mtfl/servico/movimentacao_mtfl"
      class MaquinaTuringFitaLimitada < LFTMI::C03::AFND::AutomatoNaoDeterministico
        def instanciarEntrada
          @entrada = FitaMTFL.new
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoMTFL.new(self)
        end
      end
    end
  end
end

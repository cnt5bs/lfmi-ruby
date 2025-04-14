module LFTMI
  module C06
    module MTFI
      require "lftmi/03/afnd/automato_nao_deterministico"
      require "lftmi/06/mtfi/fita_mtfi"
      require "lftmi/06/mtfi/servico/movimentacao_mtfi"
      class MaquinaTuringFitaIlimitada < LFTMI::C03::AFND::AutomatoNaoDeterministico
        def instanciarEntrada
          @entrada = FitaIlimitada.new
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoMTFI.new(self)
        end
      end
    end
  end
end

module LFTMI
  module C04
    module APND
      require "lftmi/04/apd/automato_pilha"
      require "lftmi/04/apnd/servico/movimentacao_apnd"
      class AutomatoPilhaNaoDeterministico < LFTMI::C04::APD::AutomatoPilha
        def instanciarMovimentacao
          @movimentacao = MovimentacaoAPND.new(self)
        end
      end
    end
  end
end

module LFTMI
  module C04
    module APD
      require "lftmi/04/apd/servico/movimentacao_apd"
      require "lftmi/04/apd/automato_pilha"
      class AutomatoPilhaDeterministico < AutomatoPilha
        def instanciarMovimentacao
          @movimentacao = MovimentacaoAPD.new(self)
        end
      end
    end
  end
end

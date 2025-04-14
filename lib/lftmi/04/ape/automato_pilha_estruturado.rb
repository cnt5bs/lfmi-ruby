module LFTMI
  module C04
    module APE
      require "lftmi/04/apnd/automato_pilha_nao_deterministico"
      require "lftmi/04/ape/pilha_ape"
      require "lftmi/04/ape/servico/movimentacao_ape"
      class AutomatoPilhaEstruturado < LFTMI::C04::APND::AutomatoPilhaNaoDeterministico
        # Interface de instanciação:
        def instanciarEstruturaEspecifica
          @pilha = PilhaAPE.new
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoAPE.new(self)
        end
      end
    end
  end
end

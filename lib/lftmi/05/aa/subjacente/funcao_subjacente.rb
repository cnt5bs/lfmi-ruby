module LFTMI
  module C05
    module AA
      class FuncaoSubjacente
        attr_accessor :estadoSeguinte
        attr_accessor :movimentoCursor
        attr_accessor :aceitacao
        def initialize(funcaoS)
          @estadoSeguinte, @movimentoCursor, @aceitacao = funcaoS
        end

        def aplicar(contextoFS)
          contextoFS.estadoCorrente = @estadoSeguinte
          contextoFS.executar(@movimentoCursor)
        end
      end
    end
  end
end

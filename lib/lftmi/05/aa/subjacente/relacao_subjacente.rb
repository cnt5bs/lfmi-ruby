module LFTMI
  module C05
    module AA
      class RelacaoSubjacente
        attr_accessor :seguinte
        attr_accessor :movimentoCursor
        attr_accessor :aceitacao
        def initialize(relacaoS)
          @seguinte, @movimentoCursor, @aceitacao = relacaoS
        end

        def executar(contextoTS)
          contextoTS.corrente = @seguinte if "." != @seguinte
          contextoTS.executar(@movimentoCursor) if "." != @movimentoCursor
        end

        def igual?(outraRelacaoS)
          (@seguinte == outraRelacaoS.seguinte) &&
            (@movimentoCursor == outraRelacaoS.movimentoCursor)
        end

        def to_s
          "(%s,%s,%s)" % [@seguinte, @movimentoCursor, @aceitacao]
        end

        def to_a
          [@seguinte, @movimentoCursor, @aceitacao]
        end
      end
    end
  end
end

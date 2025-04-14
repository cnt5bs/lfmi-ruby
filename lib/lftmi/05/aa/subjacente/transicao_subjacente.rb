module LFTMI
  module C05
    module AA
      class TransicaoSubjacente
        attr_accessor :seguinte
        attr_accessor :movimentoCursor
        attr_accessor :aceitacao
        def initialize(transicaoS)
          @seguinte, @movimentoCursor, @aceitacao = transicaoS
        end

        def realizarTS(contextoTS)
          if @seguinte != "."
            contextoTS.corrente = @seguinte
          end
          if @movimentoCursor != "."
            contextoTS.executar(@movimentoCursor)
          end
        end

        def igual?(outraTransicaoS)
          (@seguinte == outraTransicaoS.seguinte) &&
            (@movimentoCursor == outraTransicaoS.movimentoCursor)
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

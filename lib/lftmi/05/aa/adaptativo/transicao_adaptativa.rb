module LFTMI
  module C05
    module AA
      require "lftmi/05/aa/gerador/gerador"
      require "lftmi/05/aa/adaptativo/funcao_adaptativa"
      require "lftmi/05/aa/subjacente/transicao_subjacente"
      require "lftmi/05/aa/subjacente/contexto_ts"
      class TransicaoAdaptativa
        attr_reader :topologia
        @@codigoGeral = 1
        attr_accessor :nome
        attr_accessor :condicao
        attr_accessor :funcaoAB
        attr_accessor :transicaoS
        attr_accessor :funcaoAA
        def initialize(condicao, transicaoS, funcaoAB, funcaoAA)
          _definirNome
          @condicao = condicao
          @funcaoAB = funcaoAB
          @transicaoS = TransicaoSubjacente.new(transicaoS)
          @funcaoAA = funcaoAA
          @topologia = nil
        end

        def clonar
          TransicaoAdaptativa.new(@condicao, @transicaoS.to_a, @funcaoAB, @funcaoAA)
        end

        def realizar(mecanismo, contextoTS)
          mecanismo.realizarTA(self, @topologia.transicoesAdaptativas, contextoTS)
        end

        def aplicarFAB
          if @funcaoAB != []
            nomeFAB, listaArgs = @funcaoAB
            funcaoAdaptativa = @topologia.recuperarFA(nomeFAB)
            funcaoAdaptativa.aplicar(listaArgs)
          end
        end

        def realizarTS(contextoTS)
          @transicaoS.realizarTS(contextoTS)
        end

        def aplicarFAA
          if @funcaoAA != []
            nomeFAA, listaArgs = @funcaoAA
            funcaoAdaptativa = @topologia.recuperarFA(nomeFAA)
            funcaoAdaptativa.aplicar(listaArgs)
          end
        end

        def retirarSe
          @topologia.retirarTA(self)
        end

        def contida?
          @topologia.contemInstanciaTA?(self)
        end

        def obterFA(nomeFA)
          raise "FATAL: falta dono!!!" if @topologia.nil?
          fa = @topologia.contemFA?(nomeFA)
          raise "FATAL: nao achei #{nomeFA}" if fa.nil?
          fa
        end

        def mesma?(condicao, transicaoS)
          (@condicao == condicao) &&
            (@transicaoS.to_a[0] == transicaoS[0])
        end

        def igual?(outra)
          (@condicao == outra.condicao) &&
            @transicaoS.igual?(outra.transicaoS)
        end

        # Transi��oAdaptativa:
        def habilitada?(subjacente)
          corrente = subjacente.corrente
          simbolo = subjacente.simboloLido
          (@condicao == [corrente, simbolo])
        end

        def to_s
          "%s:TA=[%s]/%s->(%s)*(%s)" %
            [@nome, @condicao.join(","), @transicaoS,
              @funcaoAB.join(","), @funcaoAA.join(",")]
        end

        def _definirNome
          @nome = @@codigoGeral
          @@codigoGeral += 1
        end

        def definirContextoFA(contextoFA)
          @topologia = contextoFA
        end

        def to_ta
          "[%s]/%s->(%s)*(%s)" %
            [@condicao.join(","), @transicaoS,
              @funcaoAB.join(","), @funcaoAA.join(",")]
        end

        def gerarTransicao(mostrarVazio)
          transicao = "[%s] %s" % [@nome, @condicao[1]]
          if (@funcaoAB != []) || (@funcaoAA != [])
            if @funcaoAB != []
              nomeFAB = @funcaoAB[0]
              params = @funcaoAB[1].join(",")
              transicao += "\\n #{nomeFAB}(#{params}) *"
            else
              transicao += "\\n () *"
            end
            if @funcaoAA != []
              nomeFAA = @funcaoAA[0]
              params = @funcaoAA[1].join(",")
              transicao += " #{nomeFAA}(#{params})"
            else
              transicao += " ()"
            end
          end
          arco = ""
          estadoSaida = @transicaoS.seguinte
          font = "fontname=\"Courier\", fontsize=12"
          if estadoSaida != "."
            arco = "\"%s\" -> \"%s\" [label=\"%s\", #{font}]" %
              [@condicao[0], estadoSaida, transicao]
          elsif mostrarVazio
            estadoSaida = "z" + @condicao[0]
            arco = "node[style=invisible]; \"#{estadoSaida}\";\n\"%s\" -> \"%s\" [label=\"[%s] \", #{font}]\nnode[style=solid]" %
              [@condicao[0], estadoSaida, @nome]
          end
          arco
        end

        def self.zerar
          @@codigoGeral = 1
        end
      end
    end
  end
end

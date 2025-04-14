module LFTMI
  module C05
    module AA
      require "05/aa/gerador/Gerador"
      require "05/aa/adaptativo/FuncaoAdaptativa"
      require "05/aa/subjacente/FuncaoSubjacente"
      require "05/aa/subjacente/ContextoRS"
      class RegraAdaptativa
        attr_reader :listaRAs
        @@codigoGeral = 0
        attr_accessor :nome
        attr_accessor :listaCondicoes
        attr_accessor :funcaoSubjacente
        attr_accessor :funcaoAdaptativaBefore
        attr_accessor :funcaoAdaptativaAfter
        def initialize(condicoes, funcaoAB, funcaoS, funcaoAA)
          _definirNome
          @listaCondicoes = condicoes
          @funcaoSubjacente = FuncaoSubjacente.new(funcaoS)
          @funcaoAdaptativaBefore = funcaoAB
          @funcaoAdaptativaAfter = funcaoAA
          @listaRAs = nil
        end

        def aplicar(mecanismo)
          mecanismo.aplicarRA(@aaDono, self)
        end

        def clonar
          RegraAdaptativa.new(
            @listaCondicoes,
            @funcaoAdaptativaBefore,
            @funcaoSubjacente,
            @funcaoAdaptativaAfter
          )
        end

        def removerSe
          @listaRAs.removerRA(self)
        end

        def contida?
          @listaRAs.contemRA?(self)
        end

        def obterFA(nomeFA)
          raise "FATAL: falta dono!!!" if @listaRAs.nil?
          fa = @listaRAs.contemFA?(nomeFA)
          raise "FATAL: nao achei #{nomeFA}" if fa.nil?
          fa
        end

        def igual?(outra) # semantica de IGUALDADE
          r = listasIguais?(listaCondicoes, outra.listaCondicoes)
          r &&= listasIguais?(funcaoSubjacente, outra.funcaoSubjacente)
          r &&= listasIguais?(funcaoAdaptativaBefore, outra.funcaoAdaptativaBefore)
          r &&= listasIguais?(funcaoAdaptativaAfter, outra.funcaoAdaptativaAfter)
          #  print self.to_s," (?) ", outra.to_s, " = ", r, "\n"
          r
        end

        def listasIguais?(lista, outra)
          return false if lista.size != outra.size
          n = lista.size - 1
          iguais = true
          (0..n).each do |i|
            iguais &&= (lista[i] == outra[i])
          end
          iguais
        end

        def transicaoIgual?(outra) # semantica de IGUALDADE
          iguais = listasIguais?(listaCondicoes, outra.listaCondicoes)
          iguais &&= (funcaoSubjacente.estadoSeguinte == outra.funcaoSubjacente.estadoSeguinte)
          iguais
        end

        def executarB
          if @funcaoAdaptativaBefore != []
            nomeFAB, listaArgs = @funcaoAdaptativaBefore
            # print @aaDono.to_s(), "executando FAB #{nomeFAB}(#{listaArgs.join(",")})\n"
            funcaoAdaptativa = obterFA(nomeFAB)
            funcaoAdaptativa.executar(listaArgs)
          end
        end

        def executarRS(configuracao)
          configuracao.estado = @funcaoSubjacente[0] if "." != @funcaoSubjacente[0]
          configuracao.executar(@funcaoSubjacente[1]) if "." != @funcaoSubjacente[1]
          configuracao.mudarAceita(@funcaoSubjacente[2]) if "." != @funcaoSubjacente[2]
        end

        def executarA
          if @funcaoAdaptativaAfter != []
            nomeFAA, listaArgs = @funcaoAdaptativaAfter
            # print @aaDono.to_s(), "executando FAA #{nomeFAA}(#{listaArgs.join(",")})\n"
            funcaoAdaptativa = obterFA(nomeFAA)
            funcaoAdaptativa.executar(listaArgs)
          end
        end

        def habilitada?(entrada, simboloLido)
          listaCondicoes == [entrada, simboloLido]
        end

        def toString
          res = "RA" + @nome + "= "
          res += " [" + @listaCondicoes.join(",") + "] / "
          res += "(" + @funcaoSubjacente.join(",") + ") -> "
          res += "(" + @funcaoAdaptativaBefore.join(",") + ") * "
          res + "(" + @funcaoAdaptativaAfter.join(",") + ")"
        end

        def _definirNome
          @nome = @@codigoGeral
          @@codigoGeral += 1
        end

        def definirContextoRAs(novo)
          @listaRAs = novo
        end

        def to_ra
          res = "[" + @listaCondicoes.join(",") + "] / "
          res += "(" + @funcaoSubjacente.join(",") + ") -> "
          res += "(" + @funcaoAdaptativaBefore.join(",") + ") * "
          res + "(" + @funcaoAdaptativaAfter.join(",") + ")"
        end

        def gerarArco
          transicao = "[%s] %s" % [@nome, @listaCondicoes[1]]
          if @funcaoAdaptativaBefore != []
            nomeFAB = @funcaoAdaptativaBefore[0]
            params = @funcaoAdaptativaBefore[1].join(",")
            transicao += "\\n #{nomeFAB}(#{params}) *"
          end
          if @funcaoAdaptativaAfter != []
            nomeFAA = @funcaoAdaptativaAfter[0]
            params = @funcaoAdaptativaAfter[1].join(",")
            transicao += "\\n* #{nomeFAA}(#{params})"
          end
          arco = ""
          estadoSaida = @funcaoSubjacente[0]
          if estadoSaida != "."
            arco = "\"%s\" -> \"%s\" [label=\"%s\"]" %
              [@listaCondicoes[0], estadoSaida, transicao]
          end
          arco
        end
      end
    end
  end
end

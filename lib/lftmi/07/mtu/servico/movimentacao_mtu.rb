module LFTMI
  module C07
    module MTU
      require "lftmi/03/afnd/servico/movimentacao_nao_deterministica"
      class MovimentacaoMTU < LFTMI::C03::AFND::MovimentacaoNaoDeterministica
        def calcularOndaDeClones
          onda_de_clones = {}
          condicao_corrente = [@automato.fitaQ.ler, @automato.entrada.ler]
          @automato.fitaM.reiniciarCursor
          transicao = @automato.fitaM.ler
          while transicao != "bba"
            estado_esperado, simbolo_esperado,
              estado_seguinte, simbolo_a_escrever,
              cursor = @automato.codificacao.separar(transicao)
            if condicao_corrente == [estado_esperado, simbolo_esperado]
              clone = @automato.clonar
              onda_de_clones[clone] = [estado_seguinte, simbolo_a_escrever, cursor]
            end
            @automato.fitaM.avancar
            transicao = @automato.fitaM.ler
          end
          onda_de_clones
        end

        def mover(instrucao)
          @automato.fitaQ.escrever(instrucao[0])
          @automato.fitaQ.reiniciarCursor
          @automato.entrada.escrever(instrucao[1])
          @automato.entrada.avancar if instrucao[2] == "cc"
          @automato.entrada.recuar if instrucao[2] == "c"
        end
      end
    end
  end
end

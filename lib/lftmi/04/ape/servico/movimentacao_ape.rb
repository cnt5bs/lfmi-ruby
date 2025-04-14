module LFTMI
  module C04
    module APE
      require "lftmi/03/afnd/servico/movimentacao_nao_deterministica"

      class MovimentacaoAPE < LFTMI::C03::AFND::MovimentacaoNaoDeterministica
        def calcularOndaDeClones
          ondaDeClones = {}
          e = @automato.consulta.estadoCorrente?
          s = @automato.entrada.ler
          z = @automato.pilha.top
          @automato.transicoes.each do |condicaoEsperada, instrucao|
            if condicaoEsperada == ["I", e, s]
              clone = @automato.clonar
              ondaDeClones[clone] = ["I"] + instrucao
            elsif condicaoEsperada == ["A", e, ""]
              clone = @automato.clonar
              ondaDeClones[clone] = ["A"] + instrucao
            elsif condicaoEsperada == ["R", e, z]
              if z != "Z0"
                clone = @automato.clonar
                ondaDeClones[clone] = ["R"] + [z]
              end
            end
          end
          ondaDeClones
        end

        def mover(instrucao)
          case instrucao[0]
          when "I"
            @automato.entrada.avancar
            @automato.estadoCorrente = instrucao[1]
          when "A"
            @automato.pilha.push(instrucao[1])
            @automato.estadoCorrente = instrucao[2]
          when "R"
            @automato.pilha.pop
            @automato.estadoCorrente = instrucao[1]
          end
        end
      end
    end
  end
end

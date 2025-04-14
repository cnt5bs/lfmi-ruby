module LFTMI
  module C04
    module APD
      require "lftmi/03/afd/servico/movimentacao_deterministica"

      class MovimentacaoAPD < LFTMI::C03::AFD::MovimentacaoDeterministica
        def calcularOndaDeClones
          ondaDeClones = {}
          e = @automato.consulta.estadoCorrente?
          s = @automato.entrada.ler
          z = @automato.pilha.top
          @automato.transicoes.each do |condicaoEsperada, instrucao|
            if condicaoEsperada == [e, s, z]
              clone = @automato.clonar
              ondaDeClones[clone] = (instrucao << "A")
            elsif condicaoEsperada == [e, "", z]
              clone = @automato.clonar
              ondaDeClones[clone] = instrucao
            end
          end
          ondaDeClones
        end

        def mover(instrucao)
          @automato.pilha.pop
          @automato.pilha.push(instrucao[1])
          @automato.estadoCorrente = instrucao[0]
          if instrucao.size > 2
            @automato.entrada.avancar
          end
        end
      end
    end
  end
end

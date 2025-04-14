module LFTMI
  module C03
    module AFD
      require "lftmi/02/af/servico/movimentacao"

      class MovimentacaoDeterministica < LFTMI::C02::AF::Movimentacao
        def calcularOndaDeClones
          ondaDeClones = {}
          condicaoCorrente = [@automato.consulta.estadoCorrente?,
            @automato.entrada.ler]
          @automato.transicoes.each do |condicaoEsperada, estadoSeguinte|
            if condicaoEsperada == condicaoCorrente
              clone = @automato.clonar
              ondaDeClones[clone] = estadoSeguinte
            end
          end
          ondaDeClones
        end

        def mover(proximoEstado)
          @automato.estadoCorrente = proximoEstado
          @automato.entrada.avancar
        end
      end
    end
  end
end

module LFTMI
  module C03
    module AFND
      require "lftmi/02/af/servico/movimentacao"

      class MovimentacaoNaoDeterministica < LFTMI::C02::AF::Movimentacao
        def calcularOndaDeClones
          ondaDeClones = {}
          condicaoCorrente = [@automato.consulta.estadoCorrente?,
            @automato.entrada.ler]
          @automato.transicoes.each do |condicaoEsperada, estadosSeguintes|
            if condicaoEsperada == condicaoCorrente
              estadosSeguintes.each do |estadoSeguinte|
                clone = @automato.clonar
                ondaDeClones[clone] = estadoSeguinte
              end
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

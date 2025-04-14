module LFTMI
  module C02
    module AF
      require "lftmi/02/af/servico/movimentacao"

      class MovimentacaoIncomum < Movimentacao
        def calcularOndaDeClones
          if @automato.consulta.estadoCorrente? == "q0"
            return {@automato => []}
          end

          {}
        end

        def mover(instrucao)
          @automato.entrada.avancar
          @automato.entrada.avancar
          @automato.entrada.avancar
          @automato.estadoCorrente = "q1"
        end
      end
    end
  end
end

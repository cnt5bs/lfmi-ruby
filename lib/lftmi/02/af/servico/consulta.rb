module LFTMI
  module C02
    module AF
      class Consulta
        def initialize(automato)
          @automato = automato
        end

        def estadoCorrente?
          @automato.estadoCorrente
        end

        def estadosFinais?
          @automato.estadosFinais
        end

        def estaEmEstadoFinal?
          @automato.estadosFinais.include?(@automato.estadoCorrente)
        end

        def atingiuBOF?
          @automato.entrada.atingiuBOF?
        end

        def atingiuEOF?
          @automato.entrada.atingiuEOF?
        end

        def configuracao?
          "(%s, %s)" % [@automato.estadoCorrente, @automato.entrada.configuracao?]
        end
      end
    end
  end
end

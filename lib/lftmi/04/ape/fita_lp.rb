module LFTMI
  module C04
    module APE
      require "lftmi/02/af/fita_limitada"

      class FitaLP < LFTMI::C02::AF::FitaLimitada
        # Interface caracter�stica:
        def iniciar(cadeia)
          @celulas = ["<"] + cadeia.split + [">"]
          @cursor = 1
        end

        def ler
          @celulas[@cursor]
        end

        def avancar
          n = @celulas.length - 2
          @cursor += 1 if (0..n).include?(@cursor)
        end

        # Interface de consulta:
        def atingiuEOF?
          @celulas[@cursor] == ">"
        end

        def configuracao?
          simboloCorrente = @celulas[@cursor]
          prefixo = ""
          sufixo = ""
          n = @celulas.length
          (0..n - 1).each { |i|
            prefixo += @celulas[i] + " " if i < @cursor
            sufixo += @celulas[i] + " " if i > @cursor
          }
          "(%s, %s[%s]%s)" % [@cursor, prefixo, simboloCorrente, sufixo]
        end

        def to_s
          @celulas.join(" ")
        end
      end
    end
  end
end

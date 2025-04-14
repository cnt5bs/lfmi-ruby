module LFTMI
  module C07
    module MTU
      require "lftmi/02/af/fita"
      class FitaMTU < LFTMI::C02::AF::Fita
        attr_accessor :padrao
        def initialize(padrao)
          super()
          @padrao = padrao
        end

        def iniciarCelulas
          @celulas = "bba"
          @cursor = 0
        end

        def iniciarFita
          iniciarCelulas
        end

        def ler
          simbolos = @celulas.scan(@padrao)
          simbolo = simbolos[@cursor]
          return "bba" if simbolo.nil?
          simbolo
        end

        def conteudo?
          ler
        end

        def escrever(codigo)
          @celulas.gsub!(/bba$/, "")
          simbolos = @celulas.scan(@padrao)
          simbolos[@cursor] = codigo
          @celulas = simbolos.join + "bba"
        end

        def avancar
          @cursor += 1
        end

        def recuar
          @cursor -= 1 if @cursor > 0
        end

        def reiniciarCursor
          @cursor = 0
        end

        # Interface de consulta:
        def configuracao?
          "(%s,%s)" % [@cursor, @celulas]
        end

        def to_s
          @celulas
        end
      end
    end
  end
end

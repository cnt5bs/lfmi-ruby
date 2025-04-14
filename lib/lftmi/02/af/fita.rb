module LFTMI
  module C02
    module AF
      require "lftmi/02/af/servico/clonagem"

      class Fita
        attr_accessor :celulas
        attr_accessor :cursor

        def initialize
          iniciarCelulas
          def iniciarCelulas
          end
        end

        def iniciar(cadeia)
          # raise NotImplementedError.new("'iniciar()' nao pode ser execultado.")
        end

        def ler
          # raise NotImplementedError.new("'ler()' nao pode ser execultado.")
        end

        def avanca
          # raise NotImplementedError.new("'avanca()' nao pode ser execultado.")
        end

        def recua
          # raise NotImplementedError.new("'recua()' nao pode ser execultado.")
        end

        def atingiuBOF?
          # raise NotImplementedError.new("'atingiuBOF?()' nao pode ser execultado.")
        end

        def configuracao?
          # raise NotImplementedError.new("'configuracao?()' nao pode ser execultado.")
        end

        def clonar
          Clonagem.new.clonar(self)
        end
      end
    end
  end
end

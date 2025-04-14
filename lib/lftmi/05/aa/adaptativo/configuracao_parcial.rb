module LFTMI
  module C05
    module AA
      class ConfiguracaoParcial
        attr_accessor :estado
        attr_reader :entrada
        attr_reader :cursor
        attr_reader :aceita

        public

        def initialize(cadeia)
          @entrada = Entrada.new(cadeia)
          @estado = "."
          @aceita = "."
          @cursor = 0
        end

        public

        def clonar
          clone = ConfiguracaoParcial.new(@entrada.cadeia)
          clone.estado = @estado
          clone.mudarAceita(@aceita)
          clone._mudarCursor(@cursor)
          clone
        end

        public

        def _mudarCursor(novoCursor)
          @cursor = novoCursor
        end

        public

        def igual?(outra)
          r = outra.estado == @estado
          r &&= (outra.aceita == @aceita)
          r &&= (outra.cursor == @cursor)
          r && outra.entrada.igual?(@entrada)
        end

        public

        def executar(acao)
          @cursor = @entrada.executar(acao, @cursor)
        end

        public

        def cadeiaRestante
          @entrada.cadeiaRestante(@cursor)
        end

        public

        def simboloLido
          @entrada.simbolo(@cursor)
        end

        def mudarAceita(outro)
          @aceita = outro
        end

        public

        def toString
          "(%s,%s,%s)" % [@estado, simboloLido, @aceita]
        end
      end
    end
  end
end

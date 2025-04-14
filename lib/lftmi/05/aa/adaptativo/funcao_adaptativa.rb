module LFTMI
  module C05
    module AA
      require "05/aa/gerador/Gerador"
      require "05/aa/adaptativo/TransicaoAdaptativa"
      class FuncaoAdaptativa
        attr_accessor :nome
        attr_accessor :corpo
        attr_accessor :topologia
        def initialize(nome)
          @nome = nome
          @corpo = nil
          @topologia = nil
        end

        def definirContextoFA(contextoFA)
          @topologia = contextoFA
        end

        def retirar(condicao, ts, fab, faa)
          @topologia.retirarTA(condicao, ts)
        end

        def adicionar(condicao, ts, fab, faa)
          @topologia.adicionarTA(condicao, ts, fab, faa)
        end

        def aplicar(listaArgs)
          @corpo.call(self, listaArgs)
        end

        def clonar
          clone = FuncaoAdaptativa.new(@nome)
          clone.corpo = @corpo
          clone
        end

        def to_s
          "(%s)" % [@nome]
        end
      end
    end
  end
end

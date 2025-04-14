module LFTMI
  module C04
    module LLC
      require "lftmi/04/llc/gramatica_greibach"
      class Greibach
        # Interface de instanciação
        def initialize
          @glc = GramaticaGreibach.new
        end

        # Interface de ajuste de estrutura
        def adicionarProducao(producao)
          @glc.adicionarProducao(producao)
        end

        # Interface característica
        def pertence?(w)
          @substituicoes = calcularSubstituicoes(w)
          return true if @substituicoes.include?(w)
          false
        end

        def calcularSubstituicoes(w)
          @glc.calcularSubstituicoes(w)
        end

        # Interface de consulta:
        def mostrarSubstituicoes
          @substituicoes.inspect
        end
      end
    end
  end
end

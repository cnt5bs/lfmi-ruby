module LFTMI
  module C03
    module MOORE
      require "lftmi/03/afd/reconhecedor_deterministico"
      class Transdutor < LFTMI::C03::AFD::ReconhecedorDeterministico
        # Estrutura de colaboradores:
        attr_accessor :lambda
        # Interface de instanciação:
        def instanciarEstruturaEspecifica
          @lambda = {}
        end

        # Interface de estrutura de colaboradores:
        def adicionarLambda(lambda)
          @lambda.update(lambda)
        end

        # Interface característica:
        def traduzir
          analisar
        end
      end
    end
  end
end

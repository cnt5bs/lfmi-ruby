module LFTMI
  module C04
    module APD
      require "lftmi/02/af/servico/clonagem"
      class Pilha
        # Interface de instanciação:
        def initialize
          @conteudo = ["Z0"]
        end

        # Interface característica:
        def push(lista)
          @conteudo += lista
        end

        def pop
          @conteudo.pop
        end

        def top
          @conteudo.last
        end

        # Interface de consulta:
        def configuracao?
          "(" + @conteudo.inspect + ")"
        end

        def vazia?
          @conteudo == []
        end

        # Interface de clonagem:
        def clonar
          Clonagem.new.clonar(self)
        end
      end
    end
  end
end

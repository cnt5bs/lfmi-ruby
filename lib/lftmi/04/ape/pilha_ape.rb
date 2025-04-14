module LFTMI
  module C04
    module APE
      require "lftmi/02/af/servico/clonagem"
      require "lftmi/04/apd/pilha"
      class PilhaAPE < LFTMI::C04::APD::Pilha
        # Interface característica:
        def push(estado)
          @conteudo.push(estado)
        end
      end
    end
  end
end

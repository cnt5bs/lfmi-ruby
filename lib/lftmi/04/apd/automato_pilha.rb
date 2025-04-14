module LFTMI
  module C04
    module APD
      require "lftmi/03/afd/automato_deterministico"
      require "lftmi/04/apd/pilha"
      require "lftmi/04/apd/servico/consulta_apd"

      class AutomatoPilha < LFTMI::C02::AF::Automato
        # Estrutura de colaboradores:
        attr_accessor :pilha
        # Interface de instanciação:
        def instanciarEntrada
          @entrada = LFTMI::C02::AF::FitaLimitada.new
        end

        def adicionarTransicao(transicao)
          @transicoes.update(transicao)
        end

        def instanciarEstruturaEspecifica
          @pilha = Pilha.new
        end

        def instanciarConsulta
          @consulta = ConsultaAPD.new(self)
        end
      end
    end
  end
end

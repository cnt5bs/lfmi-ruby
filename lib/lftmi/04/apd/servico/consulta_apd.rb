module LFTMI
  module C04
    module APD
      require "lftmi/02/af/servico/consulta"

      class ConsultaAPD < LFTMI::C02::AF::Consulta
        def pilhaVazia?
          @automato.pilha.vazia?
        end

        def configuracao?
          "(%s, %s)" % [super, @automato.pilha.configuracao?]
        end
      end
    end
  end
end

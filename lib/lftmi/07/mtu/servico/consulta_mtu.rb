module LFTMI
  module C07
    module MTU
      require "lftmi/02/af/servico/consulta"
      class ConsultaMTU < LFTMI::C02::AF::Consulta
        def estaEmEstadoFinal?
          @automato.estadosFinaisCodificados.include?(@automato.fitaQ.ler)
        end
      end
    end
  end
end

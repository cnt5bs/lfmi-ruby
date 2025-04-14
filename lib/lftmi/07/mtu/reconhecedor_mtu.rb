module LFTMI
  module C07
    module MTU
      require "lftmi/02/af/reconhecedor"
      require "lftmi/07/mtu/maquina_turing_universal"
      class ReconhecedorMTU < LFTMI::C02::AF::Reconhecedor
        def initialize(estado_inicial, estados_finais)
          @automato = MaquinaTuringUniversal.new(estado_inicial, estados_finais)
        end

        def condicaoDoAutomato?(automato)
          automato.consulta.estaEmEstadoFinal?
        end
      end
    end
  end
end

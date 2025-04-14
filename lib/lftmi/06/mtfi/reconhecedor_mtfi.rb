module LFTMI
  module C06
    module MTFI
      require "lftmi/02/af/reconhecedor"
      require "lftmi/06/mtfi/maquina_turing_fita_ilimitada"
      class ReconhecedorMTFI < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = MaquinaTuringFitaIlimitada.new(estadoInicial, estadosFinais)
        end

        def condicaoDoAutomato?(automato)
          automato.consulta.estaEmEstadoFinal?
        end
      end
    end
  end
end

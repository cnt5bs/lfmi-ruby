module LFTMI
  module C05
    module MTFL
      require "lftmi/02/af/reconhecedor"
      require "lftmi/05/mtfl/maquina_turing_fita_limitada"
      class ReconhecedorMTFL < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = MaquinaTuringFitaLimitada.new(estadoInicial, estadosFinais)
        end

        def condicaoDoAutomato?(automato)
          automato.estaEmEstadoFinal?
        end
      end
    end
  end
end

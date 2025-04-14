module LFTMI
  module C02
    module AF
      require "lftmi/02/af/automato"

      class Reconhecedor
        attr_accessor :automato

        def initialize(estadoInicial, estadosFinais)
          instanciarEstruturaEspecifica
          instanciarAutomato(estadoInicial, estadosFinais)
        end

        def instanciarEstruturaEspecifica
        end

        def instanciarAutomato(estadoInicial, estadosFinais)
          # raise NotImplementedError.new("'instanciarAutomato()' nao pode ser execultado" )
        end

        def iniciar(cadeia)
          @automato.iniciar(cadeia)
        end

        def analisar
          @subEspacoAutomatos = @automato.executar
        end

        def reconheceu?
          reconheci = false
          @subEspacoAutomatos.each do |automato|
            reconheci = true if condicaoDoAutomato?(automato)
          end

          reconheci
        end

        def condicaoDoAutomato?(automato)
          automato.consulta.atingiuEOF? &&
            automato.consulta.estaEmEstadoFinal?
        end
      end
    end
  end
end

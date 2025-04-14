module LFTMI
  module C03
    module MOORE
      require "lftmi/03/moore/transdutor"
      require "lftmi/03/moore/automato_moore"
      class Moore < Transdutor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoMoore.new(estadoInicial, estadosFinais)
          @automato.criarVinculo(self)
        end

        def traduzirEstado
          print(@lambda[@automato.consulta.estadoCorrente?])
        end
      end
    end
  end
end

module LFTMI
  module C03
    module MEALY
      require "lftmi/03/moore/transdutor"
      require "lftmi/03/mealy/automato_mealy"
      class Mealy < LFTMI::C03::MOORE::Transdutor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoMealy.new(estadoInicial, estadosFinais)
          @automato.criarVinculo(self)
        end

        def traduzirTransicao
          print @lambda[[@automato.consulta.estadoCorrente?, @automato.entrada.ler]]
        end
      end
    end
  end
end

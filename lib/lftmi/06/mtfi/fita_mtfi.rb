module LFTMI
  module C06
    module MTFI
      require "lftmi/04/ape/fita_lp"
      class FitaIlimitada < LFTMI::C04::APE::FitaLP
        attr_accessor :limiteQtdeB
        def iniciar(cadeia)
          @celulas = ["<"] + cadeia.split("") + ["B"]
          @cursor = 1
          @limiteQtdeB = 10
        end

        def avancar
          if @cursor == (@celulas.size - 1)
            @celulas << "B"
            @limiteQtdeB -= 1
          end
          throw "Estouro de B's" if @limiteQtdeB == 0
          @cursor += 1
        end

        def escrever(simbolo)
          @celulas[@cursor] = simbolo
        end
      end
    end
  end
end

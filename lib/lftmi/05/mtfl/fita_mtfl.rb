module LFTMI
  module C05
    module MTFL
      require "lftmi/04/ape/fita_lp"
      class FitaMTFL < LFTMI::C04::APE::FitaLP
        # Interface característica:
        def iniciar(cadeia)
          @celulas = ["<"] + cadeia.split("") + [">"]
          @cursor = 1
        end

        def escrever(simbolo)
          @celulas[@cursor] = simbolo
        end
      end
    end
  end
end

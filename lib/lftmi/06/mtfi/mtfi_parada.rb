module LFTMI
  module C06
    module MTFI
      require "MTFI"
      class MTFIParada < MaquinaTuringFitaIlimitada
        def reconheceu?
          true
        end

        def avancar(sucessor)
          @entrada.avancar if sucessor[2] == "D"
        rescue
          puts "Infinitos movimentos?"
          exit
        end
      end
    end
  end
end

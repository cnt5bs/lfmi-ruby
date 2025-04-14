module LFTMI
  module C06
    module MTFI
      require "lftmi/06/mtfi/reconhecedor_mtfi"
      class ReconhecedorMTFIParada < ReconhecedorMTFI
        def condicaoDoAutomato?(automato)
          true
        end
      end
    end
  end
end

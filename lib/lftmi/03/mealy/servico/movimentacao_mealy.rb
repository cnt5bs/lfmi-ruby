module LFTMI
  module C03
    module MEALY
      require "lftmi/03/afd/servico/movimentacao_deterministica"
      class MovimentacaoMealy < LFTMI::C03::AFD::MovimentacaoDeterministica
        def mover(estadosSeguintes)
          @automato.mealy.traduzirTransicao
          super
        end
      end
    end
  end
end

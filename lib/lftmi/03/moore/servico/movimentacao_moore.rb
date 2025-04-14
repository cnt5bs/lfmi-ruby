module LFTMI
  module C03
    module MOORE
      require "lftmi/03/afd/servico/movimentacao_deterministica"
      class MovimentacaoMoore < LFTMI::C03::AFD::MovimentacaoDeterministica
        def mover(estadosSeguintes)
          @automato.moore.traduzirEstado
          super
        end
      end
    end
  end
end

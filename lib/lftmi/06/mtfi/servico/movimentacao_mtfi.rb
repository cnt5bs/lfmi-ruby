module LFTMI
  module C06
    module MTFI
      require "lftmi/03/afnd/servico/movimentacao_nao_deterministica"
      class MovimentacaoMTFI < LFTMI::C03::AFND::MovimentacaoNaoDeterministica
        def mover(instrucao)
          @automato.estadoCorrente = instrucao[0]
          @automato.entrada.escrever(instrucao[1])
          @automato.entrada.avancar if instrucao[2] == "D"
          @automato.entrada.recuar if instrucao[2] == "E"
        end
      end
    end
  end
end

module LFTMI
  module C04
    module APD
      require "lftmi/02/af/reconhecedor"
      require "lftmi/04/apd/automato_pilha_deterministico"
      class ReconhecedorAPD < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoPilhaDeterministico.new(estadoInicial, estadosFinais)
        end

        def condicaoDoAutomato?(automato)
          automato.consulta.atingiuEOF? &&
            automato.consulta.pilhaVazia?
        end
      end
    end
  end
end

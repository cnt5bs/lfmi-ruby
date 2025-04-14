module LFTMI
  module C04
    module APE
      require "lftmi/02/af/reconhecedor"
      require "lftmi/04/ape/automato_pilha_estruturado"
      class ReconhecedorAPE < LFTMI::C02::AF::Reconhecedor
        def instanciarAutomato(estadoInicial, estadosFinais)
          @automato = AutomatoPilhaEstruturado.new(estadoInicial, estadosFinais)
        end

        def condicaoDoAutomato?(automato)
          automato.consulta.atingiuEOF? &&
            automato.consulta.estaEmEstadoFinal? &&
            automato.pilha.top == "Z0"
        end
      end
    end
  end
end

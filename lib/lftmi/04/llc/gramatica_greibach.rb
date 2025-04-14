module LFTMI
  module C04
    module LLC
      require "lftmi/04/glc/gramatica_livre_contexto"
      class GramaticaGreibach < LFTMI::C04::GLC::GramaticaLivreContexto
        # Interface característica
        def calcularSubstituicoes(w)
          substituicoes = @producoes["S"]
          n = w.length
          (1..(n - 1)).each do |i|
            formasSeguintes = []
            substituicoes.each do |formaSentencial|
              formasDeW = aplicarProducoesEm(formaSentencial, formaSentencial[i, 1])
              formasSeguintes |= formasDeW
            end
            substituicoes = formasSeguintes
          end
          substituicoes
        end

        def aplicarProducoesEm(w, ladoEsquerdo)
          return [] if @producoes[ladoEsquerdo].nil?
          ladosDireitos = @producoes[ladoEsquerdo]
          calcularFormasSentenciaisDe(w, [ladoEsquerdo, ladosDireitos])
        end

        def calcularM
          k = []
          @producoes.each do |naoTerminal, ladoDireito|
            k << ladoDireito.size
          end
          k.sort!
          k.last
        end
      end
    end
  end
end

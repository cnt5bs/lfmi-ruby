module LFTMI
  module C04
    module GLC
      class GramaticaLivreContexto
        # Interface de instanciação
        def initialize
          @producoes = {}
        end

        # Interface de ajuste estrutural
        def adicionarProducao(producao)
          @producoes.update(producao)
        end

        # Interface característica
        def derivar(formaInicial, n)
          formasSentenciais = [formaInicial]
          derivacoes = []
          (1..n).each do |i|
            formasSeguintes = []
            formasSentenciais.each do |w|
              formasDeW = aplicarProducoesEm(w)
              derivacoes << {w => formasDeW}
              formasSeguintes |= formasDeW
            end
            formasSentenciais = formasSeguintes
          end
          derivacoes
        end

        def aplicarProducoesEm(w)
          formasSentenciais = []
          @producoes.each do |ladoEsquerdo, ladosDireitos|
            formasSentenciais |= calcularFormasSentenciaisDe(w, [ladoEsquerdo, ladosDireitos])
          end
          formasSentenciais
        end

        def calcularFormasSentenciaisDe(w, producoes)
          ladoEsquerdo, ladosDireitos = producoes
          # Derivações de cada ocorrência do lado esquerdo em w
          sentinela = w.gsub(ladoEsquerdo, "-")
          wMarcada = w
          formasTemp = []
          while wMarcada != sentinela
            ladosDireitos.each do |ld|
              formasTemp << wMarcada.sub(ladoEsquerdo, ld)
            end
            wMarcada = wMarcada.sub(ladoEsquerdo, "-")
          end
          # Remoção do marcador '-'
          formasSentenciais = []
          formasTemp.each { |r| formasSentenciais << r.gsub("-", ladoEsquerdo) }
          formasSentenciais
        end
      end
    end
  end
end

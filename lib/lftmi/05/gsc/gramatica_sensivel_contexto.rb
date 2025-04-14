module LFTMI
  module C05
    module GSC
      require "lftmi/04/glc/gramatica_livre_contexto"
      class GramaticaSensivelContexto < LFTMI::C04::GLC::GramaticaLivreContexto
        def calcularFormasSentenciaisDe(w, producoes)
          ladoEsquerdo, ladosDireitos = producoes
          # Derivações de cada ocorrência do lado esquerdo em w
          wMarcado = "" + w
          formasSentenciais = []
          k = w.size - 1
          (0..k).each do |i|
            m = wMarcado.match(ladoEsquerdo)
            if !m.nil?
              p = m.pre_match
              s = m.post_match
              ladosDireitos.each do |ld|
                formasSentenciais << p + ld + s
              end
            end
            wMarcado[i] = "-"
          end
          # Remoção do marcador '-'
          formasSentenciais.each do |f|
            k = f.size - 1
            (0..k).each do |i|
              f[i] = w[i] if f[i] == "-"
            end
          end
          formasSentenciais
        end
      end
    end
  end
end

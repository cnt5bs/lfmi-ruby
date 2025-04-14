module LFTMI
  module C05
    module AA
      class Entrada
        def initialize(cadeia)
          @cadeia = ["<"] + cadeia.split("") + [">"]
        end

        def igual?(outra)
          (outra.cadeia == @cadeia.to_s)
        end

        def cadeiaRestante(cursor)
          n = @cadeia.size - 1
          lista = @cadeia[cursor..n]
          lista.join("")
        end

        def simbolo(cursor)
          @cadeia[cursor]
        end

        def cadeia
          @cadeia.join("")
        end

        def gerarNoDot(i, cadeia, marcar = false)
          no = "%s" % [cadeia[i, 1]]
          if marcar
            no = "[%s]" % [cadeia[i, 1]]
          end
          no
        end

        def toDot(cursor)
          arco = ""
          n = @cadeia.size - 1
          (0..n).each do |i|
            arco += if i == cursor
              gerarNoDot(i, cadeia, true)
            else
              gerarNoDot(i, cadeia)
            end
          end
          arco
        end
      end
    end
  end
end

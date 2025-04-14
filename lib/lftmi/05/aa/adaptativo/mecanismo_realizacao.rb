module LFTMI
  module C05
    module AA
      class MecanismoRealizacao
        def realizar(t, contextoTS)
          t.realizar(self, contextoTS)
        end

        def realizarTA(t, listaTAs, contextoTS)
          t.aplicarFAB
          if listaTAs.include?(t)
            t.realizarTS(contextoTS)
            t.aplicarFAA
          end
        end

        def realizarTS(t, contextoTS)
          t.realizarTS(contextoTS)
        end
      end
    end
  end
end

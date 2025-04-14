module LFTMI
  module C05
    module AA
      class MecanismoDisparo
        # MecanismoDisparo:
        def realizar(t, contextoRS)
          t.realizar(self, contextoRS)
        end

        # MecanismoDisparo:
        def dispararTA(contextoFA, contextoRS, t)
          t.aplicarFAB
          if contextoFA.transicoesAdaptativas.include?(t)
            t.executarRS(contextoRS)
            t.aplicarFAA
          end
        end

        # MecanismoDisparo:
        def dispararRS(t, contextoRS)
          t.executarRS(contextoRS)
        end
      end
    end
  end
end

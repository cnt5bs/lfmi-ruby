module LFTMI
  module C05
    module AA
      class MecanismoAplicacao
        def disparar(t, contextoRS)
          t.disparar(self, contextoRS)
        end

        def dispararTA(contextoFA, contextoRS, t)
          t.aplicarFAB
          if contextoFA.transicoesAdaptativas.include?(t)
            t.executarRS(contextoRS)
            t.aplicarFAA
          end
        end

        def dispararRS(ana, rnaCorrente)
          rnaCorrente.executarRS(ana.configuracao)
        end
      end
    end
  end
end

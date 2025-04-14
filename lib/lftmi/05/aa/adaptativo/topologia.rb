module LFTMI
  module C05
    module AA
      require "lftmi/05/aa/adaptativo/funcao_adaptativa"
      require "lftmi/05/aa/gerador/gerador"
      class Topologia
        attr_accessor :transicoesAdaptativas
        attr_accessor :mapaFAs
        attr_accessor :gerador
        def initialize
          @transicoesAdaptativas = []
          @mapaFAs = {}
          @gerador = Gerador.new
        end

        def adicionarTA(condicao, transicaoS, funcaoAB, funcaoAA)
          novaTA = TransicaoAdaptativa.new(condicao, transicaoS, funcaoAB, funcaoAA)
          adicionarInstanciaTA(novaTA)
          # puts "\t+%s"%[novaTA] if( mostrar)
        end

        def adicionarCloneTA(ta)
          cloneTA = ta.clonar
          adicionarInstanciaTA(cloneTA)
        end

        def adicionarInstanciaTA(ta)
          @transicoesAdaptativas << ta
          ta.definirContextoFA(self)
        end

        def retirarTA(condicao, transicaoS)
          taRemovida = contemTA?(condicao, transicaoS)
          if !taRemovida.nil?
            @transicoesAdaptativas.delete(taRemovida)
            # puts "\t-%s"%[taRemovida] if( mostrar )
          end
          taRemovida
        end

        def contemInstanciaTA?(ta)
          contemTA?(ta.condicao, ta.transicaoS.to_a)
        end

        def contemTA?(condicao, transicaoS)
          taLocal = nil
          @transicoesAdaptativas.each do |umaTA|
            if umaTA.mesma?(condicao, transicaoS)
              taLocal = umaTA
            end
          end
          taLocal
        end

        def mesmasTAs?(outroContextoFA)
          if outroContextoFA.transicoesAdaptativas.size != @transicoesAdaptativas.size
            puts "tamanhos diferentes"
            return false
          end
          outroContextoFA.transicoesAdaptativas.each do |outraTA|
            achou = false
            # ~ puts outraTA.to_s
            @transicoesAdaptativas.each do |ta|
              # ~ puts ta.to_s
              achou = true if outraTA.igual?(ta)
            end
            if !achou
              # ~ puts "nao achei"
              return false
            end
          end
          true
        end

        def mesmasFAs?(outroContextoFA)
          nomesFAs = @mapaFAs.keys.sort
          nomesFAsOutro = outroContextoFA.mapaFAs.keys.sort
          nomesFAs == nomesFAsOutro
        end

        def adicionarFA(nomeFA, corpo)
          novaFA = FuncaoAdaptativa.new(nomeFA)
          novaFA.corpo = corpo
          adicionarInstanciaFA(novaFA)
        end

        def adicionarCloneFA(fa)
          cloneFA = fa.clonar
          adicionarInstanciaFA(cloneFA)
        end

        def adicionarInstanciaFA(fa)
          @mapaFAs[fa.nome] = fa
          fa.definirContextoFA(self)
        end

        def recuperarFA(nomeFA)
          @mapaFAs[nomeFA]
        end

        def to_s
          @transicoesAdaptativas
        end
      end
    end
  end
end

module LFTMI
  module C02
    module AF
      class Movimentacao
        def initialize(automato)
          @automato = automato
        end

        def executar
          automatosEnvolvidos = [@automato]
          ondaDeClones = calcularOndaDeClones
          while ondaDeClones != {}
            executarMovimentos(ondaDeClones)
            atualizarAutomatosEnvolvidos(ondaDeClones, automatosEnvolvidos)
            atualizarOndaDeCones(ondaDeClones)
          end
          automatosEnvolvidos
        end

        def executarMovimentos(ondaDeClones)
          ondaDeClones.each do |clone, instrucao|
            clone.movimentacao.mover(instrucao)
          end
        end

        def atualizarAutomatosEnvolvidos(ondaDeClones, automatosEnvolvidos)
          ondaDeClones.keys.each do |clone|
            automatosEnvolvidos << clone
          end
        end

        def atualizarOndaDeCones(ondaDeClones)
          novaOndaDeClones = {}
          ondaDeClones.keys.each do |clone|
            novaOndaDeClones.update(clone.movimentacao.calcularOndaDeClones)
          end
          ondaDeClones.replace(novaOndaDeClones)
        end

        # Interface de especialização:
        def calcularOndaDeClones
          aviso = "'calcularOndaDeClones()' depende da categoria do automato"
          raise NotImplementedError.new(aviso)
        end

        def mover(instrucao)
          aviso = "'mover()' depende da categoria do automato"
          raise NotImplementedError.new(aviso)
        end
      end
    end
  end
end

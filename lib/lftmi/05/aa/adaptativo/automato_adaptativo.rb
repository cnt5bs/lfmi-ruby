module LFTMI
  module C05
    module AA
      require "05/aa/adaptativo/FuncaoAdaptativa"
      require "05/aa/adaptativo/TransicaoAdaptativa"
      require "05/aa/adaptativo/Topologia"
      require "05/aa/adaptativo/MecanismoRealizacao"
      require "05/aa/subjacente/ContextoTS"
      require "05/aa/entrada/Entrada"
      require "05/aa/gerador/Gerador"
      class AutomatoAdaptativo
        @@codigoClone = "clone0"
        attr_accessor :nome
        attr_accessor :topologia
        attr_accessor :contextoTS
        def initialize
          @nome = "?"
          @topologia = Topologia.new
          @contextoTS = nil
        end

        def iniciar(cadeiaEntrada, estadoInicial)
          @contextoTS = ContextoTS.new(cadeiaEntrada)
          @contextoTS.corrente = estadoInicial
          @contextoTS.executar("v")
        end

        def executar
          automatosGerados = [self]
          visiveis = calcularVisiveis
          while visiveis != {}
            visiveis.each do |taHabilitada, clone|
              clone.realizar(taHabilitada)
            end
            novoSubEspaco = {}
            visiveis.values.each do |clone|
              subEspacoDoClone = clone.calcularVisiveis
              novoSubEspaco.update(subEspacoDoClone)
            end
            visiveis = novoSubEspaco
            automatosGerados.concat(visiveis.values)
          end
          automatosGerados
        end

        def calcularVisiveis
          subEspacoAutomatosVisiveis = {}
          @topologia.transicoesAdaptativas.each do |ta|
            if ta.habilitada?(@contextoTS)
              subEspacoAutomatosVisiveis[ta] = clonar
            end
          end
          subEspacoAutomatosVisiveis
        end

        def executarNoTempo(mostrarVazio)
          tempo = "t0"
          instanciasGeradas = [self]
          self.nome = tempo + "-" + nome
          gerarGrafo(mostrarVazio)
          TransicaoAdaptativa.zerar
          subEspacoInstanciasVisiveis = calcularVisiveis
          while subEspacoInstanciasVisiveis != {}
            tempo.succ!
            subEspacoInstanciasVisiveis.each do |raHabilitada, clone|
              clone.realizar(raHabilitada)
              clone.nome = tempo + "-" + clone.nome.to_s
              clone.gerarGrafo(mostrarVazio)
            end
            novoSubEspaco = {}
            TransicaoAdaptativa.zerar
            subEspacoInstanciasVisiveis.values.each do |clone|
              subEspacoDoClone = clone.calcularVisiveis
              novoSubEspaco.update(subEspacoDoClone)
            end
            subEspacoInstanciasVisiveis = novoSubEspaco
            instanciasGeradas.concat(subEspacoInstanciasVisiveis.values)
          end
          instanciasGeradas
        end

        def clonar
          @@codigoClone.succ!
          novoAA = AutomatoAdaptativo.new
          novoAA.nome = @@codigoClone
          novoAA.contextoTS = @contextoTS.clonar
          @topologia.transicoesAdaptativas.each do |ta|
            novoAA.topologia.adicionarCloneTA(ta)
          end
          @topologia.mapaFAs.each do |nome, fa|
            novoAA.topologia.adicionarCloneFA(fa)
          end
          novoAA.topologia.gerador = @topologia.gerador
          novoAA
        end

        def adicionarTA(condicao, transicaoS, funcaoAB, funcaoAA)
          @topologia.adicionarTA(condicao, transicaoS, funcaoAB, funcaoAA)
        end

        def adicionarFA(nomeFA, corpo)
          @topologia.adicionarFA(nomeFA, corpo)
        end

        def recuperarTA(ta)
          taLocal = nil
          @topologia.transicoesAdaptativas.each do |taExistente|
            taLocal = taExistente if ta.igual?(taExistente)
          end
          raise "FATAL: nao achei a RA #{ta.nome}" if taLocal.nil?
          taLocal
        end

        def removerTodasRA(condicoes, acoes, funcaoAB, funcaoAA)
          ra = TransicaoAdaptativa.new(condicoes, acoes, funcaoAB, funcaoAA)
          removida = nil
          @transicoesAdaptativas.each do |raExistente|
            removerRA(raExistente) if ra.igual?(raExistente)
            removida = raExistente
          end
          removida
        end

        def contemTA?(ta)
          @topologia.contemInstanciaTA?(ta)
        end

        def contemFA?(nomeFA)
          fa = @mapaFAs[nomeFA]
          raise "FATAL: aa sem a FA #{nomeFA}!!!" if fa.nil?
          fa
        end

        def mesmasTAs?(outroAA)
          @topologia.mesmasTAs?(outroAA.topologia)
        end

        def mesmasFAs?(outroAA)
          @topologia.mesmasFAs?(outroAA.topologia)
        end

        # Aut�matoAdaptativo:
        def realizar(taHabilitada)
          mecanismo = MecanismoRealizacao.new
          ta = recuperarTA(taHabilitada)
          mecanismo.realizar(ta, @contextoTS)
        end

        def executarTA(ta)
          taCorrente = contemTA?(ta)
          if !@topologia.contemInstanciaTA?(taCorrente)
            raise "FATAL: nao achei a TA #{taCorrente.nome}"
          end
          taCorrente.aplicarFAB
          if @topologia.contemInstanciaTA?(taCorrente)
            taCorrente.realizarTS(@contextoTS)
            taCorrente.aplicarFAA
          end
          subEspacoInstanciasVisiveis = calcularVisiveis
          if subEspacoInstanciasVisiveis == {}
            subEspacoInstanciasVisiveis = calcularVisiveis
            if subEspacoInstanciasVisiveis == {}
              if (@contextoTS.aceita == "v") &&
                  (@contextoTS.cadeiaRestante == "")
              end
            end
          end
          subEspacoInstanciasVisiveis
        end

        def gerarGrafo(mostrarVazio)
          nomeArq = "lib/05/aa/image/graphviz/05-#{@nome}.dot"
          if mostrarVazio
            nomeArq = "lib/05/aa/image/graphviz/05-#{@nome}-vazio.dot"
          end
          font = "fontname=\"Courier\", fontsize=12"
          begin
            arq = File.new(nomeArq, "w")
          rescue
            puts Dir.pwd
            exit(1)
          end
          texto =
            "digraph G {
      	compound=true;
      	charset=Latin1
      	rankdir=TB;
          nodesep=0.9;
          pad=-0.2;
              "
          arq.puts(texto)
          # arq.puts( "subgraph cluster0 {\n" )
          cursor = @contextoTS.cursor
          cadeiaDot = @contextoTS.entrada.toDot(cursor)
          # arq.puts(   "XX [ shape=plaintext,
          #            label=\"Situa��o da cadeia de entrada: #{cadeiaDot}\"];" )
          # arq.puts( "}\n" )
          estadoCorrente = @contextoTS.corrente
          infos = "\"Aut�mato '#{@nome}'\\n\\n'#{@nome}.contextoTS':\\nPosi��o do cursor = #{cadeiaDot}\\n"
          infos += "Estado corrente = #{estadoCorrente}\""
          texto =
            "
      	subgraph cluster0 {
      		style=invisible;
      		obs [ shape=note, #{font},
      		label=#{infos}];

      		node [style=invisible,width =0.2,#{font}]; a;
      		node [shape = circle,style=\"setlinewidth(5)\"]; K;
      		#{gerarEstado("L", estadoCorrente)};
      		#{gerarEstado(estadoCorrente, estadoCorrente)};
      		node [style=solid,color=black];
      		{rank=same;L;K;}
      		{rank=same;I;obs;}
              "
          arq.puts(texto)
          arq.puts("\n\t\ta -> \"I\"\n")
          @topologia.transicoesAdaptativas.each do |ta|
            transicao = ta.gerarTransicao(mostrarVazio)
            arq.puts("\t\t" + transicao)
          end
          texto = "\t}\n}"
          arq.puts(texto)
          arq.close
        end

        def gerarEstado(estado, estadoCorrente)
          estilo = "style=\"filled\""
          if estado == "L"
            estilo = if estado == estadoCorrente
              "style=\"setlinewidth(5),filled\""
            else
              "style=\"setlinewidth(5)\""
            end
          end
          "node [shape = circle,#{estilo}]; \"#{estado}\""
        end

        def self.zerarNomesClones
          @@codigoClone = "clone0"
        end

        def to_s
          "%s:AA = %s" % [@nome, @contextoTS.to_s]
        end
      end
    end
  end
end

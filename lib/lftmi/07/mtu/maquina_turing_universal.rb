module LFTMI
  module C07
    module MTU
      require "lftmi/03/afnd/automato_nao_deterministico"
      require "lftmi/07/mtu/fita_mtu"
      require "lftmi/07/mtu/servico/movimentacao_mtu"
      require "lftmi/07/mtu/servico/consulta_mtu"
      require "lftmi/07/mtu/servico/codificacao"
      class MaquinaTuringUniversal < LFTMI::C03::AFND::AutomatoNaoDeterministico
        # Estrutura de colaboradores:
        attr_accessor :fitaM
        attr_accessor :fitaQ
        attr_accessor :estadosFinaisCodificados
        attr_accessor :codificacao
        # Interface de instanciação de colaboradores:
        def instanciarConsulta
          @consulta = ConsultaMTU.new(self)
        end

        def instanciarMovimentacao
          @movimentacao = MovimentacaoMTU.new(self)
        end

        def instanciarEstruturaEspecifica
          @codificacao = Codificacao.new
        end

        def instanciarEntrada
          @entrada = FitaMTU.new(padraoSimbolo)
        end

        def instanciarTransicoes
          @fitaM = FitaMTU.new(padraoTransicao)
        end

        def instanciarEstadosFinais(estadosFinais)
          super
          @estadosFinaisCodificados = []
          estadosFinais.each do |estado|
            codigoEstado = @codificacao.codificarEstado(estado, estadosFinais)
            @estadosFinaisCodificados << codigoEstado
          end
        end

        def instanciarEstadoCorrente(estadoInicial)
          @fitaQ = FitaMTU.new(padraoEstado)
          codQ0 = @codificacao.codificarEstado(estadoInicial, @estadosFinais)
          @fitaQ.escrever(codQ0)
        end

        # Interface de estrutura:
        def adicionarTransicao(lista)
          qi, sm, qj, sn, e = lista
          transicao = @codificacao.codificarTransicao(qi, sm, qj, sn, e, @estadosFinais)
          @fitaM.escrever(transicao)
          @fitaM.avancar
        end

        # Inteface característica:
        def registrarW(cadeia)
          cadeiaCodificada = ""
          cadeia.split("").each do |s|
            cadeiaCodificada += @codificacao.codificarSimbolo(s)
          end
          @entrada.escrever(cadeiaCodificada)
          @entrada.reiniciarCursor
        end

        def iniciar(cadeia)
          registrarW(cadeia)
        end

        # Interface de consulta:
        def configuracao?
          "(%s, %s)" % [@fitaQ.conteudo?, @entrada.configuracao?]
        end

        # Interface específica:
        def padraoTransicao
          @codificacao.padraoTransicao
        end

        def padraoEstado
          @codificacao.padraoEstado
        end

        def padraoSimbolo
          @codificacao.padraoSimbolo
        end
      end
    end
  end
end

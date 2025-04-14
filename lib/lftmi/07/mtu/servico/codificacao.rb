module LFTMI
  module C07
    module MTU
      class Codificacao
        def padrao_estado
          /a+/
        end

        def codificarEstado(i, estados_finais)
          return "a" * ((2 * i) + 1) if estados_finais.include?(i)
          "a" * (2 * (i + 1))
        end

        def padrao_simbolo
          /b+a|bba|ba/
        end

        def codificar_simbolo(s)
          return "ba" if s == "<"
          return "bba" if s == "B"
          "b" * (s.to_i + 3) + "a"
        end

        def padraoCursor
          /cc|c/
        end

        def codificar_movimento_cursor(m)
          return "c" if m == "E"
          "cc" if m == "D"
        end

        def padraoTransicao
          /#{padrao_estado}#{padrao_simbolo}#{padrao_estado}#{padrao_simbolo}#{padraoCursor}/
        end

        def codificarTransicao(qi, sm, qj, sn, e, estados_finais)
          cod_qi = codificarEstado(qi, estados_finais)
          cod_sm = codificar_simbolo(sm)
          cod_qj = codificarEstado(qj, estados_finais)
          cod_sn = codificar_simbolo(sn)
          od_e = codificar_movimento_cursor(e)
          "%s%s%s%s%s" % [cod_qi, cod_sm, cod_qj, cod_sn, od_e]
        end

        def separar(transicao)
          partes = transicao.scan(/(#{padrao_estado})(#{padrao_simbolo})(#{padrao_estado})(#{padrao_simbolo})(#{padraoCursor})/)
          partes[0]
        end
      end
    end
  end
end

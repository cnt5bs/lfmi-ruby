module LFTMI
  module C05
    module AA
            require 'lftmi/05/aa/entrada/entrada.rb'
            class ContextoRS
                attr_accessor :corrente
                attr_accessor :cursor
                attr_reader :entrada
                attr_reader :aceita
                def initialize( cadeia )
            	@entrada = Entrada.new( cadeia )
            	@corrente = "."
            	@aceita = "."
            	@cursor = 0
                end
                def clonar()
            	clone = ContextoRS.new( @entrada.cadeia() )
            	clone.corrente = @corrente
            	clone.cursor = @cursor
            	clone.mudarAceita( @aceita )
            	return clone
                end
                def igual?( outro )
            	r = ( outro.corrente == @corrente )&&
                      ( outro.cursor == @cursor )&&
                      ( outro.entrada.igual?( @entrada ))    
            	return r
                end
                def executar( acao )
            	case acao
                    when /v/ :
                          n = @entrada.cadeia().size() - 1
                        if( @cursor >= n )
                            raise "FATAL: avanco #{cursor} limitado a #{n}!!!" 
                        end
                        @cursor += 1
                    when /./ :
                      end
                end
                def cadeiaRestante()
            	return @entrada.cadeiaRestante( @cursor )
                end
                def simboloLido()
            	return @entrada.simbolo( @cursor )
                end
                def mudarAceita( outro )
            	@aceita =outro
                end
                def to_s()
            	"(%s,%s,%s)"%[@corrente, simboloLido(), @aceita]
                end
            end
        end
    end
end

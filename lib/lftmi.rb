# lib/lftmi.rb
module LFTMI
end

require_relative "lftmi/02/af/fita_limitada"
require_relative "lftmi/02/af/automato"

require_relative "lftmi/03/afd/automato_deterministico"
require_relative "lftmi/03/afd/reconhecedor_deterministico"
require_relative "lftmi/03/afnd/automato_nao_deterministico"
require_relative "lftmi/03/afnd/reconhecedor_nao_deterministico"
require_relative "lftmi/03/moore/moore"
require_relative "lftmi/03/mealy/mealy"

require_relative "lftmi/04/apd/automato_pilha"
require_relative "lftmi/04/apd/automato_pilha_deterministico"
require_relative "lftmi/04/apd/reconhecedor_apd"
require_relative "lftmi/04/apnd/automato_pilha_nao_deterministico"
require_relative "lftmi/04/apnd/reconhecedor_apnd"
require_relative "lftmi/04/ape/automato_pilha_estruturado"
require_relative "lftmi/04/ape/reconhecedor_ape"
require_relative "lftmi/04/ape/fita_lp"
require_relative "lftmi/04/glc/gramatica_livre_contexto"
require_relative "lftmi/04/llc/gramatica_greibach"
require_relative "lftmi/04/llc/greibach"

require_relative "lftmi/05/gsc/gramatica_sensivel_contexto"
require_relative "lftmi/05/mtfl/maquina_turing_fita_limitada"
require_relative "lftmi/05/mtfl/reconhecedor_mtfl"

require_relative "lftmi/06/mtfi/reconhecedor_mtfi"
require_relative "lftmi/06/mtfi/reconhecedor_mtfi_parada"
require_relative "lftmi/06/mtfi/fita_mtfi"

require_relative "lftmi/07/mtu/reconhecedor_mtu"

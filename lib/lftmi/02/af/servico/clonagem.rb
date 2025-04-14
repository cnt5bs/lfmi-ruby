module LFTMI
  module C02
    module AF
      require "yaml"

      class Clonagem
        def clonar(original)
          dadosDoClone = "#{original.class}.dat"
          open(dadosDoClone, "w") { |arquivo|
            YAML.dump(original, arquivo)
          }

          # --- Definição das classes pertmitidas ---
          # Lista de todas as classes que podem ser clonadas
          allowed_classes = [
            Symbol,
            Regexp,

            original.class,

            LFTMI::C02::AF::FitaLimitada,
            LFTMI::C02::AF::Consulta,

            LFTMI::C03::AFD::MovimentacaoDeterministica,
            LFTMI::C03::AFND::MovimentacaoNaoDeterministica,
            LFTMI::C03::MOORE::MovimentacaoMoore,
            LFTMI::C03::MOORE::Moore,
            LFTMI::C03::MEALY::MovimentacaoMealy,
            LFTMI::C03::MEALY::Mealy,

            LFTMI::C04::APD::Pilha,
            LFTMI::C04::APD::ConsultaAPD,
            LFTMI::C04::APD::MovimentacaoAPD,
            LFTMI::C04::APND::MovimentacaoAPND,
            LFTMI::C04::APE::PilhaAPE,
            LFTMI::C04::APE::MovimentacaoAPE,
            LFTMI::C04::APE::FitaLP,

            LFTMI::C05::MTFL::FitaMTFL,
            LFTMI::C05::MTFL::MovimentacaoMTFL,

            LFTMI::C06::MTFI::FitaIlimitada,
            LFTMI::C06::MTFI::MovimentacaoMTFI,

            LFTMI::C07::MTU::FitaMTU,
            LFTMI::C07::MTU::Codificacao,
            LFTMI::C07::MTU::ConsultaMTU,
            LFTMI::C07::MTU::MovimentacaoMTU

          ]

          # --- Load using permitted_classes ---
          clone = open(dadosDoClone) { |arquivo|
            YAML.load(arquivo, permitted_classes: allowed_classes, aliases: true)
          }
          # Removo o arquivo temporário depois da carga
          File.delete(dadosDoClone)
          clone # retorno o clone carregad
        end
      end
    end
  end
end

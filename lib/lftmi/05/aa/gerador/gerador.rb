module LFTMI
  module C05
    module AA
      class Gerador
        @@g = "#0"
        def g
          @@g = @@g.succ
        end

        def self.zerar
          @@g = "#0"
        end

        def to_s
          @@g
        end
      end
    end
  end
end

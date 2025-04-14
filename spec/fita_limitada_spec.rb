require "lftmi"

RSpec.describe LFTMI::C02::AF::FitaLimitada do
  describe "#iniciar" do
    it "configura a fita corretamente" do
      fita = described_class.new
      fita.iniciar("abc")
      expect(fita.to_s).to eq("abc")
    end
  end
  # ... your tests ...
end

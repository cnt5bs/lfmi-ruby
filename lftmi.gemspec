Gem::Specification.new do |s|
  s.name = "lftmi"
  s.version = "0.1.7"
  s.summary = "Biblioteca do livro LFTMI"
  s.description = "Uma biblioteca Ruby com implementações de conceitos de Linguagens Formais, Teoria dos Autômatos e Modelos de Implementação, baseada no livro LFTMI."
  s.authors = ["ItaloSV"]
  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.homepage = "https://github.com/cnt5bs/lfmi-ruby"
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 3.0.0"
  s.executables = []
  s.add_development_dependency "rspec", "~> 3.0"
end

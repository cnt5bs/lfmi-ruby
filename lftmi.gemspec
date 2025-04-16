Gem::Specification.new do |s|
  s.name = "lftmi"
  s.version = "0.1.7"
  s.summary = "Biblioteca do livro LFTMI"
  s.description = """
Biblioteca Ruby do Livro "Linguagens Formais: Teoria, Modelagem e Implementação" (Prêmio Jabuti 2010).

Autores do livro original:

    Marcus Vinicius Midena Ramos
    João José Neto
    Italo Santiago Vega

Editora Bookman, 2009, ISBN 9788577804535, 656 páginas. URL: https://www.marcusramos.com.br/univasf/livro1/index.html

Biblioteca RubyGems: https://rubygems.org/gems/lftmi
"""
  s.authors = ["ItaloSV"]
  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.homepage = "https://github.com/cnt5bs/lftmi-ruby"
  s.license = "MIT" 
  s.email = ["italosvg@gmail.com"]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 3.0.0"
  s.executables = []
  s.add_development_dependency "rspec", "~> 3.0"
end

Gem::Specification.new do |s|
  s.name          = 'postwiki'
  s.version       = '1.0.0'
  s.authors       = ['Brendan Baldwin']
  s.email         = ['postwiki.com']
  s.homepage      = 'https://github.com/brendan/postwiki'
  s.summary       = 'Relational Wiki.'
  s.description   = "It's the Wiki I always wanted.  Semantic links, extensible parser and context processors."
  s.files         = `git ls-files`.split("\n")
  s.executables   = s.files.grep(/^bin\//).map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'json'

  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end

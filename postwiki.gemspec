Gem::Specification.new do |s|
  s.name = "postwiki"
  s.version = "0.0.1"
  s.authors = ["Brendan Baldwin"]
  s.email = ["brendan@usergenic.com"]
  s.homepage = "http://postwiki.com"
  s.summary = "It's the wiki software I always wanted."
  s.description = "A wiki that uses semantic links in a way that is awesome."
  s.files = `git ls-files`.split("\n")
  s.executables = s.files.grep(/^bin\//).map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end

Gem::Specification.new do |s|
  s.name        = "send_file"
  s.version     = "1.0.0"
  s.summary     = "File sending for Rack applications."
  s.description = s.summary
  s.authors     = ["Francesco Rodríguez"]
  s.email       = ["frodsan@me.com"]
  s.homepage    = "https://github.com/frodsan/send_file"
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_development_dependency "cuba"
  s.add_development_dependency "cutest"
  s.add_development_dependency "rack-test"
end

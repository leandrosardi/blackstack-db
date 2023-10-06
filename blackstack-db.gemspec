Gem::Specification.new do |s|
  s.name        = 'blackstack-core'
  s.version     = '1.2.14'
  s.date        = '2023-08-17'
  s.summary     = "THIS GEM IS STILL IN DEVELOPMENT STAGE. Core classes, functions and constants for the BlackStack framework."
  s.description = "THIS GEM IS STILL IN DEVELOPMENT STAGE. Find documentation here: https://github.com/leandrosardi/blackstack-core."
  s.authors     = ["Leandro Daniel Sardi"]
  s.email       = 'leandro.sardi@expandedventure.com'
  s.files       = [
    "lib/blackstack-core.rb",
    "lib/extend_datetime.rb",
    "lib/extend_exception.rb",
    "lib/extend_fixnum.rb",
    "lib/extend_float.rb",
    "lib/extend_string.rb",
    "lib/extend_time.rb",
    "lib/functions.rb",
    "examples/example01.rb",
    "examples/example02.rb",    
  ]
  s.homepage    = 'https://rubygems.org/gems/blackstack-core'
  s.license     = 'MIT'
  s.add_runtime_dependency 'sequel', '~> 5.56.0', '>= 5.56.0'
end
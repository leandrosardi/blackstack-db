Gem::Specification.new do |s|
  s.name        = 'blackstack-core'
  s.version     = '1.0.1'
  s.date        = '2023-10-06'
  s.summary     = "Modules for simple setup of database connections."
  s.description = "Modules for simple setup of database connections: https://github.com/leandrosardi/blackstack-db."
  s.authors     = ["Leandro Daniel Sardi"]
  s.email       = 'leandro@connectionsphere.com'
  s.files       = [
    "lib/blackstack-db/crdb.rb",
    "lib/blackstack-db/postgresql.rb",
    "lib/blackstack-db.rb",
  ]
  s.homepage    = 'https://rubygems.org/gems/blackstack-db'
  s.license     = 'MIT'
  s.add_runtime_dependency 'sequel', '~> 5.56.0', '>= 5.56.0'
end
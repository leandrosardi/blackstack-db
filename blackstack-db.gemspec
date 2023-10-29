Gem::Specification.new do |s|
  s.name        = 'blackstack-db'
  s.version     = '1.0.4'
  s.date        = '2023-10-29'
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
  s.add_runtime_dependency 'colorize', '~> 0.8.1', '>= 0.8.1'
  s.add_runtime_dependency 'simple_cloud_logging', '~> 1.2.2', '>= 1.2.2'
  s.add_runtime_dependency 'sequel', '~> 5.56.0', '>= 5.56.0'
end
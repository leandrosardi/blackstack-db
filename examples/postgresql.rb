require_relative '../lib/blackstack-db'

# DB ACCESS - KEEP IT SECRET
# Connection string to the demo database: export DATABASE_URL='postgresql://demo:<ENTER-SQL-USER-PASSWORD>@free-tier14.aws-us-east-1.cockroachlabs.cloud:26257/mysaas?sslmode=verify-full&options=--cluster%3Dmysaas-demo-6448'
BlackStack::PostgreSQL::set_db_params({ 
  :db_url => '89.116.25.250', # n04
  :db_port => '5432', 
  :db_name => 'micro.data', 
  :db_user => 'blackstack', 
  :db_password => '*****',
  :db_sslmode => 'disable',
})

DB = BlackStack::PostgreSQL.connect

p now
p guid


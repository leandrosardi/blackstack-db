require 'blackstack-db'
#require_relative '../lib/blackstack-db'

# DB ACCESS - KEEP IT SECRET
# 
# For running a CockroachDB instance in your local computer:
# - cockroach start-single-node --insecure
# 
# Either you use a local (demo) database, or a cloud (serverless) database, always find a connection string like this:
# - postgresql://demo:demo7343@127.0.0.1:26257/movr?sslmode=require
# - postgresql://root@dev1:26257/defaultdb?sslmode=disable
# Then, map the parameters of such a connection string here.
# 
BlackStack::CRDB::set_db_params({ 
  :db_url => '7tt.cockroachlabs.cloud', 
  :db_cluster => 'freeleadsdata-12255', # this parameter is optional. Use this when using TYPE_CRDB serverless.
  :db_sslmode => 'verify-full',
  :db_port => '26257', 
  :db_name => 'defaultdb', 
  :db_user => 'web', 
  :db_password => '*****',
})

DB = BlackStack::CRDB.connect

p now
p guid


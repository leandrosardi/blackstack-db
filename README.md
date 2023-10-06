# BlackStack DB

This gem has been designed as a part of the **BlackStack** framework.

It provides modules for a simple database connections and get a [Sequel](https://sequel.jeremyevans.net/) database object.

I ran tests on:

- Ubuntu 18.04,
- Ubuntu 20.04.

Email to me if you want to collaborate.

**Outline**

1. [Installation](#1-installation)
2. [Connecting PostgreSQL](#2-connecting-postgresql)
3. [Connecting CockroachDB](#3-connecting-cockroachdb)
4. [Disconnecting](#4-disconnecting)

## 1. Installation

```
gem install blackstack-db
```

## 2. Connecting PostgreSQL

The `connect` method returns a [Sequel](https://sequel.jeremyevans.net/) database object.

Refer to [this document](https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html) to know how to handle a Sequel connection.

```ruby
require 'blackstack-db'

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
```

## 3. Connecting CockroachDB

The `connect` method returns a [Sequel](https://sequel.jeremyevans.net/) database object.

Refer to [this document](https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html) to know how to handle a Sequel connection.

```ruby
require 'blackstack-db'

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
```

## 4. Disconnecting

```ruby
BlackStack::PostgreSQL.disconnect
```

or 

```ruby
BlackStack::CRDB.disconnect
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the last [ruby gem](https://rubygems.org/gems/simple_command_line_parser). 

## Authors

* **Leandro Daniel Sardi** - *Initial work* - [LeandroSardi](https://github.com/leandrosardi)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details



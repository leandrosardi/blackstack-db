require 'sequel'
require_relative './blackstack-db/postgresql.rb'
require_relative './blackstack-db/crdb.rb'

module BlackStack
    TYPE_POSTGRESQL = 0
    TYPE_CRDB = 1
    @@db_type = nil

    def self.set_db_type(n)
        @@db_type = n
    end # set_db_type

    def self.db_type
        @@db_type
    end # db_type
end # BlackStack

# return a postgresql uuid
def guid()
    if BlackStack.db_type == BlackStack::TYPE_POSTGRESQL
        return BlackStack::PostgreSQL.guid
    elsif BlackStack.db_type == BlackStack::TYPE_CRDB
        return BlackStack::CRDB.guid
    else
        raise "Unknown database type"
    end
end
            
# return current datetime with format `YYYY-MM-DD HH:MM:SS`
def now()
    if BlackStack.db_type == BlackStack::TYPE_POSTGRESQL
        return BlackStack::PostgreSQL.now
    elsif BlackStack.db_type == BlackStack::TYPE_CRDB
        return BlackStack::CRDB.now
    else
        raise "Unknown database type"
    end
end

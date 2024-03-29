require 'colorize'
require 'simple_cloud_logging'
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

    def self.connection_string
        if @@db_type == TYPE_POSTGRESQL
            return BlackStack::PostgreSQL.connection_string
        elsif @@db_type == TYPE_CRDB
            return BlackStack::CRDB.connection_string
        else
            raise "Unknown database type"
        end
    end # connection_string

    def self.db_connect
        if @@db_type == TYPE_POSTGRESQL
            return BlackStack::PostgreSQL.connect
        elsif @@db_type == TYPE_CRDB
            return BlackStack::CRDB.connect
        else
            raise "Unknown database type"
        end
    end

    def self.db_test(l=nil)
        if @@db_type == TYPE_POSTGRESQL
            return BlackStack::PostgreSQL.test(l)
        elsif @@db_type == TYPE_CRDB
            return BlackStack::CRDB.test(l)
        else
            raise "Unknown database type"
        end
    end # test

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

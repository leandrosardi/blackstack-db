module BlackStack
    module PostgreSQL
        # database connection parameters
        @@db_url = nil
        @@db_port = nil
        @@db_name = nil
        @@db_user = nil
        @@db_password = nil

        # return the connection string for a postgresql database
        def self.connection_string
            "postgresql://#{@@db_user}:#{@@db_password}@#{@@db_url}:#{@@db_port}/#{@@db_name}"
        end # connection_string

        # database connection getters
        def self.db_url
            @@db_url
        end
        def self.db_port
            @@db_port
        end
        def self.db_name
            @@db_name
        end
        def self.db_user
            @@db_user
        end
        def self.db_password
            @@db_password
        end

        def self.set_db_params(h)
            # validate: the parameter h is requred
            raise "The parameter h is required." if h.nil?

            # validate: the parameter h must be a hash
            raise "The parameter h must be a hash" unless h.is_a?(Hash)

            # validate: the :db_url key is required
            raise 'The key :db_url is required' unless h.has_key?(:db_url)

            # validate: the :db_port key is required
            raise 'The key :db_port is required' unless h.has_key?(:db_port)

            # validate: the db_name key is required
            raise 'The key :db_name is required' unless h.has_key?(:db_name)

            # validate: the db_user key is required
            raise 'The key :db_user is required' unless h.has_key?(:db_user)

            # validate: the db_password key is required
            raise 'The key :db_password is required' unless h.has_key?(:db_password)

            # validate: the :db_url key must be a string
            raise 'The key :db_url must be a string' unless h[:db_url].is_a?(String)

            # validate: the :db_port key must be an integer, or a string that can be converted to an integer
            raise 'The key :db_port must be an integer' unless h[:db_port].is_a?(Integer) || (h[:db_port].is_a?(String) && h[:db_port].to_i.to_s == h[:db_port])

            # validate: the :db_name key must be a string
            raise 'The key :db_name must be a string' unless h[:db_name].is_a?(String)

            # validate: the :db_user key must be a string
            raise 'The key :db_user must be a string' unless h[:db_user].is_a?(String)

            # validate: the :db_password key must be a string
            raise 'The key :db_password must be a string' unless h[:db_password].is_a?(String)

            # set type
            BlackStack::set_db_type(BlackStack::TYPE_POSTGRESQL)

            # map values
            @@db_url = h[:db_url]
            @@db_port = h[:db_port].to_i
            @@db_name = h[:db_name]
            @@db_user = h[:db_user]
            @@db_password = h[:db_password]
        end # set_db_params

        # create database connection
        def self.connect
            BlackStack::set_db_type(BlackStack::TYPE_POSTGRESQL)
            Sequel.connect(BlackStack::PostgreSQL.connection_string)
        end

        # return a postgresql uuid
        def self.guid()
            DB['SELECT uuid_generate_v4() AS id'].first[:id]
        end
            
        # return current datetime with format `%Y-%m-%d %H:%M:%S %Z`, using the timezone of the database (`select current_setting('TIMEZONE')`)
        # TODO: I am hardcoding the value of `tz` because for any reason `SELECT current_setting('TIMEZONE')` returns `UTC` instead of 
        # `America/Argentina/Buenos_Aires` when I run it from Ruby. Be sure your database is ALWAYS configured with the correct timezone.
        def self.now()
            tz = 'America/Argentina/Buenos_Aires' #DB["SELECT current_setting('TIMEZONE') AS tz"].first[:tz]
            DB["SELECT current_timestamp at TIME ZONE '#{tz}' AS now"].first[:now]
        end

        def self.seconds_ago(n)
            tz = 'America/Argentina/Buenos_Aires' #DB["SELECT current_setting('TIMEZONE') AS tz"].first[:tz]
            DB["SELECT (current_timestamp - interval '#{n} seconds') at TIME ZONE '#{tz}' AS now"].first[:now]
        end

        # test the connection to the database.
        # raise an exception if the connection fails, or if any incongruence is found.
        def self.test(l=nil)
            l = BlackStack::DummyLogger.new if l.nil?
            @db = nil

            #l.log "Connection String:"
            #l.log BlackStack::PostgreSQL::connection_string
            
            l.logs "Testing connection... "
            begin
                @db = BlackStack::Deployer::DB::connect(
                    BlackStack::PostgreSQL::connection_string # use the connection parameters setting in ./config.rb
                )
                l.logf "success".green
            rescue => e
                l.logf "failed".red
                l.log e.message
            end
            
            # if the name of databsase in `config.rb` is wrong, the connection is made to the defaultdb.
            # This validation checks the connection to the correct database.
            begin
                l.logs "Verify database name... "
                s = @db["SELECT datname FROM pg_database"].first[:datname]
                raise 'Wrong database name' if s !~ /#{Regexp.escape(BlackStack::PostgreSQL::db_name)}/i
                l.logf "success".green
            rescue => e
                l.logf "failed".red
                l.log e.message
            end
        end

    end # module PostgreSQL
end
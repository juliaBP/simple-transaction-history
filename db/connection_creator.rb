require 'pg'

def create_connection(dbname)
  PG::Connection.new(dbname: dbname)
end

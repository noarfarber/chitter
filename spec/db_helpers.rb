require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  query = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  query.first
end

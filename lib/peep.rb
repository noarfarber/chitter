require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    query = connection.exec("SELECT * FROM peeps;")
    query.map { |peep| peep['peep'] }
  end
end

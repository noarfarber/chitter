require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    query = connection.exec("SELECT * FROM peeps;")
    query.map { |peep| peep['peep'] }
  end
end

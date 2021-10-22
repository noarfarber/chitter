require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('Hello world');")
      connection.exec("INSERT INTO peeps (peep) VALUES('I need coffee');")

      peeps = Peep.all

      expect(peeps).to include("Hello world")
      expect(peeps).to include("I need coffee")
    end
  end
end

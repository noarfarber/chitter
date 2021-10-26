require 'peep'
require 'db_helpers'

describe Peep do
  describe '.all' do
    it 'shows all peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(message: 'Hello world')
      peep2 = Peep.create(message: 'I need coffee')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep2.id
      expect(peeps.first.message).to eq 'I need coffee'
    end
  end

  describe '.create' do
    it 'creates a new post' do
      peep = Peep.create(message: 'Too much coffee')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Too much coffee'
    end
  end
end

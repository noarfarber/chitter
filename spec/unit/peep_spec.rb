require 'peep'
require 'user'
require 'db_helpers'

describe Peep do

  describe '#initialize' do
    it 'initializes a new peep' do
      user = User.create(name: 'Alfie', username: 'Alfifi', email: 'alfie@doggo.com', password: '12345')
      peep = Peep.create(message: 'Hello world', user_id: user.id)

      expect(peep['message']).to eq 'Hello world'
      expect(peep['user_id']).to eq user.id
    end
  end

  describe '.all' do
    it 'shows all peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      user = User.create(name: 'Alfie', username: 'Alfifi', email: 'alfie@doggo.com', password: '12345')
      peep = Peep.create(message: 'Hello world', user_id: user.id)
      peep2 = Peep.create(message: 'I need coffee', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep2['id']
      expect(peeps.first.message).to eq 'I need coffee'
      expect(peeps.first.user_id).to eq user.id
    end
  end

  describe '.create' do
    it 'creates a new post' do
      user = User.create(name: 'Alfie', username: 'Alfifi', email: 'alfie@doggo.com', password: '12345')
      peep = Peep.create(message: 'Too much coffee', user_id: user.id)
      persisted_data = persisted_data(table: :peeps, id: peep['id'])

      # expect(peep).to be_a Peep
      expect(peep['id']).to eq persisted_data.first['id']
      expect(peep['message']).to eq 'Too much coffee'
      expect(peep['created_at']).not_to be_nil
      expect(peep['user_id']).to eq user.id
    end
  end
end

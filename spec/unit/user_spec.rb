require 'user'
require 'db_helpers'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'Alfie', 
        username: 'TheDog', 
        email: 'alfie@dogsmail.com', 
        password: '12345')
  
      persisted_data = persisted_data(id: user.id, table: :users)
  
      expect(user).to be_a User
      expect(user.username).to eq 'TheDog'
      expect(user.email).to eq 'alfie@dogsmail.com'
      expect(user.id).to eq persisted_data.first['id']
    end

    it 'hashes the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('12345')

      user = User.create(
        name: 'Alfie', 
        username: 'TheDog', 
        email: 'alfie@dogsmail.com', 
        password: '12345'
      )
    end
  end

  describe '.find' do
    it 'finds the user by ID' do
      user = User.create(
        name: 'Alfie', 
        username: 'TheDog', 
        email: 'alfie@dogsmail.com', 
        password: '12345')

      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil unless an ID is given' do
      expect(User.find(nil)).to eq nil
    end
  end
end

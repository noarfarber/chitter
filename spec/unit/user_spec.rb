require 'user'
require 'db_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(
      name: 'Alfie', 
      username: 'TheDog', 
      email: 'alfie@dogsmail.com', 
      password: '12345')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.name).to eq 'Alfie'
    expect(user.email).to eq 'alfie@dogsmail.com'
    expect(user.id).to eq persisted_data.first['id']
  end
end

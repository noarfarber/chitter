require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(
      name: 'Alfie', 
      username: 'TheDog', 
      email: 'alfie@dogsmail.com', 
      password: '12345')

    expect(user).to be_a User
    expect(user.name).to eq 'Alfie'
    expect(user.email).to eq 'alfie@dogsmail.com'
  end
end

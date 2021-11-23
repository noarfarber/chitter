require 'pg'

feature 'Viewing peeps' do
  scenario 'The user sees a list of peeps' do
    user = User.create(name: 'Alfie', username: 'Alfifi', email: 'alfie@doggo.com', password: '12345')

    Peep.create(message: "Hello world", user_id: user.id)
    Peep.create(message: "I need coffee", user_id: user.id)

    visit '/peeps'

    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'I need coffee'
  end
end

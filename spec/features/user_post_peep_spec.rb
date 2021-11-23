feature 'Posting a peep as a user' do
  scenario 'A user can post a peep' do
    user = User.create(name: 'Alfie', username: 'Alfifi', email: 'alfie@dogsmail.com', password: '12345')

    visit "users/#{user.id}/peeps/new"
    fill_in('message', with: 'Hello world')

    click_button 'Post'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello world'
  end
end

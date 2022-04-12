feature 'Posting a peep as a user' do
  scenario 'A user can post a peep' do
    visit '/'
    click_button 'Sign Up'

    fill_in('name', with: 'Alfie')
    fill_in('username', with: 'Alfifi')
    fill_in('email', with: 'alfie@dogsmail.com')
    fill_in('password', with: '12345')
    click_button "Submit"

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello, Alfifi'

    click_button 'Post a Peep'

    expect(current_path).to eq "/users/#{@user.id}/peeps/new"
    # visit "users/#{@user.id}/peeps/new"
    # fill_in('message', with: 'Hello world')

    # click_button 'Post'

    # expect(current_path).to eq '/peeps'
    # expect(page).to have_content 'Hello world'
    # save_and_open_page
  end

  xscenario 'A user can see other users peeps' do
    user = User.create(name: 'Alfie', username: 'Alfifi', email: 'alfie@dogsmail.com', password: '12345')
    author = User.create(name: 'Fred', username: 'Freddie', email: 'fred@dogsmail.com', password: '12345')

    visit "/peeps"

    expect(page).to have_content author.username
  end
end

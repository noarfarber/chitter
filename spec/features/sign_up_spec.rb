feature 'Sign up' do
  scenario 'A user can sign up to Chitter' do
    visit 'users/new'
    
    fill_in('name', with: 'Alfie')
    fill_in('username', with: 'TheDog')
    fill_in('email', with: 'alfie@dogsmail.com')
    fill_in('password', with: '12345')
    click_button('Submit')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Hello, TheDog"
  end
end

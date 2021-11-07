feature 'View index page' do
  scenario 'the user visits the index page' do
    visit('/')
    expect(page).to have_content 'Chitter'
    expect(page).to have_button 'Sign Up'
  end
end

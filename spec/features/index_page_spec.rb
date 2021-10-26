feature 'View index page' do
  scenario 'the user visits the index page' do
    visit('/')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Chitter'
  end
end

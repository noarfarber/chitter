feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    visit('/peeps/new')
    fill_in('message', with: 'Hello world')
    click_button('Post')

    expect(page).to have_content('Hello world')
  end
end

feature 'Viewing peeps' do
  scenario 'The user sees a list of peeps' do
    visit('/peeps')

    expect(page).to have_content "Hello world"
    expect(page).to have_content "I need coffee"
  end
end

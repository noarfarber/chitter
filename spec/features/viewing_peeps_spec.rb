require 'pg'

feature 'Viewing peeps' do
  scenario 'The user sees a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: "Hello world")
    Peep.create(message: "I need coffee")

    visit('/peeps')

    expect(page).to have_content "Hello world"
    expect(page).to have_content "I need coffee"
  end
end

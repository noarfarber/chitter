require 'pg'

feature 'Viewing peeps' do
  scenario 'The user sees a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Hello world');")
    connection.exec("INSERT INTO peeps VALUES(2, 'I need coffee');")

    visit('/peeps')

    expect(page).to have_content "Hello world"
    expect(page).to have_content "I need coffee"
  end
end

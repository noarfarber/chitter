require 'pg'

task :test_database_setup do
  p "Cleaning database"

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

end

task :setup do
  p "Creating databases"

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(120));")
  end
end

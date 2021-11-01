require 'pg'

task :test_database_setup do
  p "Cleaning database"

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps, users;")

end

task :setup do
  p "Creating databases"

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
      message VARCHAR(120), 
      created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
      user_id INTEGER REFERENCES users (id));")

    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
      name VARCHAR(50), 
      username VARCHAR(25) UNIQUE, 
      email VARCHAR(40) UNIQUE, 
      password VARCHAR(100));")
  end
end

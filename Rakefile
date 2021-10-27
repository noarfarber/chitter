require 'pg'

task :test_database_setup do
  p "Cleaning database"

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

end

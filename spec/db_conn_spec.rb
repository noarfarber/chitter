require 'db_conn'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the correct db via pg' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes a query via pg' do
      conn = DatabaseConnection.setup('chitter_test')

      expect(conn).to receive(:exec_params).with("SELECT * FROM peeps;", [])

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end

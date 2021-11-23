require_relative 'db_conn'
require_relative 'user'

class Peep
  attr_reader :id, :message, :created_at, :user_id

  def initialize(id:, message:, created_at:, user_id:)
    @id = id
    @message = message
    @created_at = created_at
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        created_at: peep['created_at'],
        user_id: peep['user_id']
      )
    end
  end
    
  def self.create(message:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps(message, user_id) VALUES('#{message}', '#{user_id}') 
      RETURNING id, message, created_at, user_id;"
    )
    return result[0]
  end
end

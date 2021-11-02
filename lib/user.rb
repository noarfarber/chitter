require 'pg'
require_relative 'db_conn'

class User
  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4)
      RETURNING id, name, username, email;", 
      [name, username, email, password]
    )
    User.new(id: result[0]['id'], 
      name: result[0]['name'], 
      username: result[0]['username'], 
      email: result[0]['email'])
  end
end
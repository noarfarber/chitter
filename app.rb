# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    peeps = [
      "Hello world",
      "I need coffee"
    ]
    p peeps.join
  end

  run! if app_file == $PROGRAM_NAME
end

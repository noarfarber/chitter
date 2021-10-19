# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    
    erb :'peeps/home'
  end

  run! if app_file == $PROGRAM_NAME
end

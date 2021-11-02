require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './db_conn_setup'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], 
      username: params[:username], 
      email: params[:email], 
      password: params[:password])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/home'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end

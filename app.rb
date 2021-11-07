require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './db_conn_setup'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'/welcome'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], 
      username: params[:username], 
      email: params[:email], 
      password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end

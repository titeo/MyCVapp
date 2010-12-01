require 'rubygems'
require 'sinatra'
require 'haml'
require 'gravatar'

load 'environment.rb'

get '/' do
  haml :index
end

#
# SIGN UP
#
get '/signup' do
  haml :signup
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/user/#{@user.id}"
  else
    redirect '/'
  end
end

#
# LOGIN
#
get '/login' do
  haml :login
end

post '/login' do
   haml :user_profile
end

#
# USER
#
get '/user/:id' do
  @user = User.get(params[:id])
  if @user
    haml :user_profile
  else
    redirect '/'
  end
end

get '/user/:id/settings' do
  @user = User.get(params[:id])
  if @user
    haml :user_settings
  else
    redirect '/'
  end
end

post '/user/:id/settings' do
   @user = User.get(params[:id])
   @user.update(params[:user])
   redirect "/user/#{@user.id}"
end
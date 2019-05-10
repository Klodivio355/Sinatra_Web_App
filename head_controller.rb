# COM1001 Team 07 application controller
#Default setup code
require 'sinatra'
require 'sinatra/flash'
require 'twitter'
require 'erb'
require 'sqlite3'
require_relative 'error_handling'
require_relative 'account'
require_relative 'admin'
require_relative 'admin_2'
set :bind, '0.0.0.0'

include ERB::Util

before do 
    @database = SQLite3::Database.new './database.sqlite'
end

before do 
    config = {
        :consumer_key => '1aheI4yHG8uYkbmSz7zgHzOui',
        :consumer_secret => '1bsUvd7kgVOG0kvMFhLGfynUuZhCQ9ntN10t0wXX15Q2KpFQM0',
        :access_token => '1092446070788050946-4ccor6DmOuZFzOCJq64dn3arUfuvhL',
        :access_token_secret => 'EK7WWBp9YJ3S9VW8bCYc2KcyP15sp8s0vWy0WjVYoGAKq'
    }
    @client = Twitter::REST::Client.new(config)
end

#views
get '/' do
   redirect '/home'
end

get '/login' do
   @wronglogin = false
   unless session[:logged_in] 
        erb :login
    else
        redirect '/home'
    end 
end

get '/home' do
    erb :home
end

get '/create_account' do
    unless session[:logged_in]
        @submitted = false
        erb :create_account 
    else
        redirect '/home'
    end
end

get '/contact' do
    erb :contact
end

get '/session_clear' do
    session.clear
    redirect '/'
end
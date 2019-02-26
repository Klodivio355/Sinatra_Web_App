require 'erb'
require 'sinatra'
require 'css'
require 'tilt/erubis'
require 'sqlite3'
require 'twitter'

config ={
    :consumer_key => '1aheI4yHG8uYkbmSz7zgHzOui',
    :consumer_secret => '1bsUvd7kgVOG0kvMFhLGfynUuZhCQ9ntN10t0wXX15Q2KpFQM0',
    :access_token => '1092446070788050946-4ccor6DmOuZFzOCJq64dn3arUfuvhL',
    :access_token_secret => 'EK7WWBp9YJ3S9VW8bCYc2KcyP15sp8s0vWy0WjVYoGAKq'
    }

client= Twitter::REST::Client.new(config)




set :bind,'0.0.0.0'

include ERB::Util

enable :sessions
set :session_secret, 'super secret'

get '/' do
    redirect '/create_account' unless session[:logged_in]
      erb :shop

end

get '/create_account' do
    erb :create_account
end

get '/login' do
  erb :login
end



post '/login' do
    $username=params[:Username]
    $pass=params[:password]
    erb :login
end
post '/shop' do
    
   
    
    if params[:userlog]==$username && params[:password1]==$pass then
        session[:logged_in]=true
        session[:logged_time]=Time.now
        redirect '/'
    end
    @error = "Password incorrect"
     erb :login
end
    
    get '/shop_clear' do
        session.clear
        erb :shop_clear
    end
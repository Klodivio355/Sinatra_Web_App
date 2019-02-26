require 'tilt/erubis'
enable :sessions
set :session_secret, 'super secret'

get '/create_account' do
    erb :create_account unless session[:logged_in]
end

post '/makeaccount' do
    $username=params[:username]
    $pass=params[:password]
    redirect '/'
end

post '/login' do
    #TODO: Add database query and matching here
    if params[:userlog]==$username && params[:password1]==$pass then
        session[:logged_in]=true
        session[:logged_time]=Time.now
        redirect '/twitter_search'
    else
        redirect '/'
    end
end
    
get '/session_clear' do
    session.clear
    redirect '/'
end
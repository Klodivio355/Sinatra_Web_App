require 'tilt/erubis'
require 'sqlite3'
enable :sessions
set :session_secret, 'super secret'

before do 
    @database = SQLite3::Database.new './database.sqlite'
end

get '/create_account' do
    erb :create_account unless session[:logged_in]
    erb :create_account
end

post '/makeaccount' do
    @query = 'INSERT INTO user_details 
              VALUES (? , ? , ? ,0);'
    @database.execute @query, params[:username], params[:email], params[:password]
    redirect '/'
end

post '/login' do
    @user_email = params[:userlog]
    @check_count = @database.get_first_value('SELECT COUNT(*) FROM user_details WHERE email = ?',[@user_email])
    @check_admin_count = @database.get_first_value('SELECT COUNT(*) FROM admin_details WHERE email = ?',[@user_email])
    if @check_count == 1 
        pass = @database.get_first_value('SELECT password FROM user_details WHERE email = ? ;',[@user_email])
        if pass == params[:password1]
            session[:logged_in]=true
            session[:logged_email]=@user_email
            session[:logged_time]=Time.now
            redirect '/home'
        else
            @wrong = true
            erb :login
        end
    elsif @check_admin_count == 1 
        @pass = @database.get_first_value('SELECT password FROM admin_details WHERE email = ? ;',[@user_email])
        if @pass == params[:password1]
            session[:logged_in]=true
            session[:logged_email]=@user_email
            session[:logged_time]=Time.now
            redirect '/twitter_search'
        else
            @wrong = true
            erb :login
        end
    else
        redirect '/'
    end
end
    

get '/personalInformationPage' do
    if session[:logged_in] 
        @user_pass = @database.get_first_value('SELECT password FROM user_details WHERE email = ? ;',[session[:logged_email]])
        @user_handle = @database.get_first_value('SELECT twitter_handle FROM user_details WHERE email = ? ;',[session[:logged_email]])
        @user_email = session[:logged_email]
        erb :personalInformationPage
    else
        redirect '/'
    end
end
post '/changeinfo' do
    @query = 'UPDATE user_details 
             SET twitter_handle = ?,email = ?,password = ?
             WHERE email = ?;'
    @database.execute @query, params[:username], params[:email], params[:password], session[:logged_email]
    redirect '/session_clear'
end
get '/session_clear' do
    session.clear
    redirect '/'
end
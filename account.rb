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
    query = 'INSERT INTO user_details 
              VALUES (? , ? , ? ,0);'
    @database.execute query, params[:userhandle], params[:email], params[:password]
    redirect '/'
end

post '/login' do
    @user_email = params[:useremail]
    check_count = @database.get_first_value('SELECT COUNT(*) FROM user_details WHERE email = ?',[@user_email])
    if check_count == 1 
        pass = @database.get_first_value('SELECT password FROM user_details WHERE email = ? ;',[@user_email])
        if pass == params[:password]
            session[:logged_in]=true
            session[:logged_time]=Time.now
            redirect '/home'
        end
    else
        check_admin_count = @database.get_first_value('SELECT COUNT(*) FROM admin_details WHERE email = ?',[@user_email])
        if check_admin_count == 1 
            pass = @database.get_first_value('SELECT password FROM admin_details WHERE email = ? ;',[@user_email])
            if pass == params[:password1]
                session[:logged_in]=true
                session[:logged_time]=Time.now
                #TODO: add admin functionality
                redirect '/twitter_search'
            end
        else
            redirect '/'
        end
    end
end
    
get '/session_clear' do
    session.clear
    redirect '/'
end
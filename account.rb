enable :sessions
set :session_secret, 'super secret'

include ERB::Util

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

before do 
    @database = SQLite3::Database.new './database.sqlite'
end

post '/makeaccount' do
  @submitted=true
  @handle = params[:userhandle].strip
  @email = params[:email].strip
  @password = params[:password].strip
  @password_c = params[:repeat_password].strip
  
  @handle_ok = !@handle.nil? && @handle != ""
  @email_ok =!@email.nil? && @email =~ VALID_EMAIL_REGEX
  @unique = false
  if @handle_ok && @email_ok
    @unique = @database.get_first_value('SELECT COUNT(*) FROM user_details WHERE twitter_handle = ? AND email = ?',[@handle,@email]) == 0 
  end
  @password_ok = !@password.nil? && @password != "" && @password == @password_c
  
  @all_ok = @handle_ok && @password_ok && @email_ok && @unique
    
   if @submitted && @all_ok 
    @query = 'INSERT INTO user_details 
              VALUES (? , ? , ? ,0);'
    @database.execute @query, [@handle, @email, @password]
       
    redirect '/'
   else   
    erb :create_account
   end
   
end

post '/login' do
    @user_email = params[:useremail]
    @check_count = @database.get_first_value('SELECT COUNT(*) FROM user_details WHERE email = ?',[@user_email])
    @check_admin_count = @database.get_first_value('SELECT COUNT(*) FROM admin_details WHERE email = ?',[@user_email])
    if @check_count == 1 
        pass = @database.get_first_value('SELECT password FROM user_details WHERE email = ? ;',[@user_email])
        if pass == params[:password]
            session[:logged_in]=true
            session[:logged_email]=@user_email
            session[:logged_time]=Time.now
            session[:logged_isadmin]=0
            redirect '/home'
        else
            @wrong = true
            erb :login
        end
    elsif @check_admin_count == 1 
        @pass = @database.get_first_value('SELECT password FROM admin_details WHERE email = ? ;',[@user_email])
        @id = @database.get_first_value('SELECT admin_id FROM admin_details WHERE email = ? ;',[@user_email])
        @area = @database.get_first_value('SELECT area FROM admin_details WHERE email = ? ;',[@user_email])
        if @pass == params[:password]
            session[:logged_in]=true
            session[:logged_email]=@user_email
            session[:logged_time]=Time.now
            session[:logged_adminid]=@id
            session[:logged_adminarea]=@area
            if(@area == 'both')
                session[:logged_isadmin]=2
            else 
                session[:logged_isadmin]=1
            end
            redirect '/home'
        else
            @wrong = true
            erb :login
        end
    else
        redirect '/'
    end
end
    
get '/accountInfo' do
    if session[:logged_in] 
        @user_pass = @database.get_first_value('SELECT password FROM user_details WHERE email = ? ;',[session[:logged_email]])
        @user_handle = @database.get_first_value('SELECT twitter_handle FROM user_details WHERE email = ? ;',[session[:logged_email]])
        @user_email = session[:logged_email]
        erb :accountInfo
    else
        redirect '/'
    end
end

post '/changeinfo' do
    @firstname = params[:username].strip
    @email = params[:email].strip
    @password = params[:password].strip
    
    @firstname_ok = !@firstname.nil? && @firstname != ""    
    @email_ok =!@email.nil? && @email =~ VALID_EMAIL_REGEX
    @password_ok = !@password.nil? && @password != ""
    @all_ok = @firstname_ok && @password_ok && @email_ok
    
    if @all_ok 
        @query = 'UPDATE user_details 
             SET twitter_handle = ?,email = ?,password = ?
             WHERE email = ?;'
        @database.execute @query, @firstname, @email, @password, session[:logged_email]
        redirect '/session_clear'
    else
        erb :accountInfo
    end
end
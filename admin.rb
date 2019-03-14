require 'sqlite3'
enable :sessions
set :session_secret, 'super secret'

include ERB::Util

get '/admin_section' do
    unless session[:logged_isadmin]
        redirect '/'
    end
    
    query = %{SELECT car_registration, type, number_of_seats, availability FROM car_details ORDER BY availability ASC}
    @car_results = @database.execute query
    
    unless params[:search].nil?
        search_string = params[:search]
        results = @client.search(search_string)
        @tweets = results.take(20)
    end
    erb :admin_section
end

post '/updateBooking' do
    @adminID = session[:logged_adminid]
    @handle = params[:handleIn]
    @reg = params[:regIn]
    @startTime = params[:startTimeIn]
    @endTime = params[:endTimeIn]
    @date = params[:dateIn]
    @startPos = params[:startPosIn]
    @endPos = params[:endPosIn]
    @price = params[:priceIn]
    puts @adminID
    @updateQuery = 'INSERT INTO ride_history VALUES(?,?,?,?,?,?,?,?,?)'
    @database.execute @updateQuery, @adminID, @handle, @reg,@startPos, @endPos, @startTime, @endTime, @date, @price
    
    redirect '/admin_section'
end
require 'sqlite3'
require 'sinatra/flash'
enable :sessions
set :session_secret, 'super secret'

include ERB::Util

get '/admin_section' do
    unless session[:logged_isadmin]
        redirect '/'
    end
    
    @area = session[:logged_adminarea]
    puts @area
    
    query = %{SELECT car_registration, type, number_of_seats, availability FROM car_details ORDER BY availability ASC}
    @car_results = @database.execute query
    
    unless params[:busy].nil?
        query = %{SELECT twitter_handle, car_registration, start_point, start_time, date FROM ride_history WHERE car_registration = ? ORDER BY date DESC LIMIT 1;}
        @carReg = params[:busy]
        @currentRide = @database.execute query, @carReg
        
        @queryHandle = @currentRide[0][0]
        @queryReg = @currentRide[0][1]
        @queryStart = @currentRide[0][2]
        @queryTime = @currentRide[0][3]
        @queryDate = @currentRide[0][4]
    end
    
    unless params[:search].nil?
        search_string = params[:search]
        results = @client.search(search_string)
        @tweets = results.take(30)
    end
    erb :admin_section
end

post '/updateBooking' do
    @adminID = session[:logged_adminid]
    @handle = params[:handleIn].strip
    @reg = params[:regIn]
    @startTime = params[:startTimeIn]
    @endTime = params[:endTimeIn]
    @date = params[:dateIn]
    @startPos = params[:startPosIn]
    @endPos = params[:endPosIn]
    @price = params[:priceIn].strip
    
    if(params[:enterForm] == 'Complete Booking')
        @timeCheck = !@endTime.nil? && @endTime!=""
        @posCheck = !@endPos.nil? && @endPos!=""
        @priceCheck = !@price.nil? && @price!=""
        if(@timeCheck && @posCheck && @priceCheck)
            @availUpdate = 0
            @updateQuery = 'UPDATE ride_history SET end_point = ?, end_time = ?, price = ? WHERE twitter_handle = ? AND date = ? AND car_registration = ?'
            @database.execute @updateQuery, @endPos, @endTime, @price, @handle, @date, @reg
            
            @carUpdate = 'UPDATE car_details SET availability = ? WHERE car_registration = ?'
            @database.execute @carUpdate, @availUpdate, @reg
            flash[:success] = "Ride complete, details saved, car is now free to allocate."
        else
            flash[:error] = "Failed to submit booking, not all information was correct."
        end
     elsif(params[:enterForm] == 'Save Booking')
        @availUpdate = 1
        @updateQuery = 'INSERT INTO ride_history VALUES(?,?,?,?,?,?,?,?,?)'
        @database.execute @updateQuery, @adminID, @handle, @reg,@startPos, @endPos, @startTime, @endTime, @date, @price
        
        @carUpdate = 'UPDATE car_details SET availability = ? WHERE car_registration = ?'
        @database.execute @carUpdate, @availUpdate, @reg
        flash[:success] = "Details saved, awaiting completion."      
    end
    
    redirect '/admin_section'
end
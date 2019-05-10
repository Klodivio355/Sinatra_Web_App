get '/admin_section' do
    unless session[:logged_isadmin]
        redirect '/'
    end
    
    @area = session[:logged_adminarea]

    @car_results = ""
    @car_results2 = ""
    if @area.eql? 'both'
        query = %{SELECT car_registration, type, availability, area FROM car_details ORDER BY availability ASC}
        @car_results = @database.execute query
        query2 = %{SELECT car_registration, type, availability, area FROM car_details WHERE availability = 0}
        @car2 = @database.execute query2
    else
        query = %{SELECT car_registration, type, availability, area FROM car_details WHERE area = ? ORDER BY availability ASC}
        @car_results = @database.execute query, @area
        query2 = %{SELECT car_registration, type, availability, area FROM car_details WHERE area = ? AND availability = 0}
        @car2 = @database.execute query2, @area
    end
    
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
        @tweets = results.take(50)
        bannedquery = 'SELECT twitter_handle FROM misuse_list WHERE banned=1'
        @banned = @database.execute bannedquery
        @banned.each do |b|
            x = @tweets.length - 1
            while x >= 0
                puts x
                if @tweets[x].user.screen_name.eql? b[0]
                        @tweets.delete_at(x)
                end
                x = x - 1
            end
        end
            
            
    end
    erb :admin_section
end

post '/reply' do
    @replytext = params[:replyText]
    @id = params[:replyID].to_i
    @client.retweet(@id)
    @client.update(@replytext, :in_reply_to_status_id => @id)
    
    redirect '/admin_section'
end

post '/issueWarning' do
    @selectedWarning = params[:misuseSubmit]
    @user = params[:warnHandle]
    checkQuery = 'SELECT COUNT(*) FROM misuse_list WHERE twitter_handle = ?'
    @existing = @database.get_first_value(checkQuery, @user) == 1
    if @selectedWarning.eql? 'Warn'
        if @existing
            getCount = 'SELECT misuse_count FROM misuse_list WHERE twitter_handle = ?'
            currentCount = @database.get_first_value(getCount, @user)
            currentCount = currentCount + 1
            updateQuery = 'UPDATE misuse_list SET misuse_count = ? WHERE twitter_handle = ?'
            @database.execute updateQuery, currentCount, @user
        else
            addMisuse = 'INSERT INTO misuse_list VALUES (?,1,0)'
            @database.execute addMisuse, @user
            currentCount = 1
        end
        flash[:success] = @user + " was warned, warning count = " + currentCount.to_s
    else 
        if @existing
            banUser = 'UPDATE misuse_list SET banned = 1 WHERE twitter_handle = ?'
            @database.execute banUser, @user
        else
            addBan = 'INSERT INTO misuse_list VALUES (?,0,1)'
            @database.execute addBan, @user
        end
         flash[:success] = @user + " was successfully banned, and tweets will not be displayed."
    end
    
    redirect '/admin_section'
end

post '/updateBooking' do
    @adminID = session[:logged_adminid]
    @handle = params[:handleIn].strip
    @reg = params[:regValue]
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
            @database.execute @carUpdate, @availUpdate ,@reg
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
    #!elsif(params[:enterForm] == 'Cancel Booking')
        #!@cancelQuery = 'DELETE FROM ride_history WHERE twitter_handle = ? AND date = ? AND car_registration = ?'
        #!@database.execute @cancelQuery, @handle, @date, @reg
        #!@carUpdate = 'UPDATE car_details SET availability = ? WHERE car_registration = ?'
        #!@availUpdate = 0
        #!@database.execute @carUpdate, @availUpdate, @reg
        #!flash[:success] = "Booking cancelled." 
    end
    
    redirect '/admin_section'
end

get '/giveaway' do 
        search_term = params[:prizeTerm]
        giveaway_result = @client.search(search_term)
        @entrytweets = giveaway_result.take(50)
        unless @entrytweets.empty?
            @random = rand(@entrytweets.size)
            @winner = @entrytweets[@random].user.screen_name
            while @winner == "ise19team07"
                @random = rand(@entrytweets.size)
                @winner = @entrytweets[@random].user.screen_name
            end
            flash[:success] = "The Winner is... @" + @winner
            @client.update("CONGRATULATIONS to @" + @winner + ", you were the winner of the '" + search_term + "' competition!")
            redirect '/admin_section'
        end
    flash[:warning] = 'Failed to successfully select a winner, please try again.'
    redirect '/admin_section'
end
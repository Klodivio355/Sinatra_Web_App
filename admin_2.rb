get '/admin_two' do
      unless session[:logged_isadmin]
        redirect '/'
    end
    
    @area = session[:logged_adminarea]
    
    if(@area.eql? 'manchester')
        query1 = %{SELECT car_registration, type, area FROM car_details WHERE area = 'manchester' ORDER BY type DESC}
        query2 = %{SELECT admin_id, first_name, surname, email, area FROM admin_details WHERE area = 'manchester'}
    elsif(@area.eql? 'sheffield')  
        query1 = %{SELECT car_registration, type, area FROM car_details WHERE area = 'sheffield' ORDER BY type DESC}
        query2 = %{SELECT admin_id, first_name, surname, email, area FROM admin_details WHERE area = 'sheffield'}
    else
        query1 = %{SELECT car_registration, type, area FROM car_details ORDER BY type DESC}
        query2 = %{SELECT admin_id, first_name, surname, email, area FROM admin_details}
    end
    @car_results = @database.execute query1
    
    query1 = %{SELECT * FROM misuse_list ORDER BY banned}
    @misuse_results = @database.execute query1
    
    query2 = %{SELECT admin_id, first_name, surname, email, area FROM admin_details}
    @admin_results = @database.execute query2
    
    query1 = %{SELECT * FROM car_description}
    @des_results = @database.execute query1
    
    erb :admin_two
end

post '/runQuery' do
    @one = params[:inputOne]
    @two= params[:inputTwo]
    @three = params[:inputThree]
    @four = params[:inputFour]
    @five = params[:inputFive]
    @label = params[:queryLabel]
    
    
    puts("label = " + @label.to_s)
    
    case @label
        when "addTaxi"
            query1 = %{INSERT INTO car_details VALUES (?,?,0,?)}
            @database.execute query1, @one, @two, @three
        when "removeTaxi"
            query1 = %{DELETE FROM car_details WHERE car_registration = ?}
            @database.execute query1, @one
        when "addType"
            query1 = %{INSERT INTO car_description VALUES (?,?,?,?)}
            @database.execute query1,@one,@two,@three,@four
        when "updatePrice"
            query1 = %{UPDATE car_description SET base_price = ? WHERE type = ?}
            @database.execute query1,@two,@one
        when "updateDescription"
            query1 = %{UPDATE car_description SET description = ?, base_price = ?, number_of_seats = ? WHERE type = ?}
            @database.execute query1,@two,@three,@four,@one
        when "unbanUser"
            query1 = %{UPDATE misuse_list SET banned = 0 WHERE twitter_handel = ?}
            @database.execute query1,@one
        when "updateEmail"
            query1 = %{UPDATE admin_details SET email = ? WHERE admin_id = ?}
            @database.execute query1, @one, @two
        when "updatePassword"
            if(@two == @three)
                query1 = %{UPDATE admin_details SET password = ? WHERE admin_id = ?}
                @database.execute query1,@two,@one
            else
                @wrongPassword = true
            end
        else
            if(@area.eql? 'both')
                if(@label == "addAdmin")
                    query1 = %{SELECT admin_id FROM admin_details ORDER BY admin_id DESC}
                    @result = @database.execute query1
                    id = @result[0] + 1
                    query1 = %{INSERT INTO admin_details VALUES(id,?,?,?,?,?)}
                    @database.execute query1, @one,@two,@three,@four,@five
                else
                    query1 = %{DELETE FROM admin_details WHERE admin_id = ?}
                    @database.execute query1,@one
                end
            else
                @notSuperAdmin = true
            end
    end
    redirect'/admin_two'
end
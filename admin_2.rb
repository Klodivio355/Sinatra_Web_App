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
    
    erb :admin_two
end
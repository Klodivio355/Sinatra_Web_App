include ERB::Util

get '/admin_two' do
    query = %{SELECT car_registration, type, number_of_seats, base_price, description FROM car_details ORDER BY type DESC}
    @car_results = @database.execute query
    
    query = %{SELECT * FROM misuse_list ORDER BY banned}
    @misuse_results = @database.execute query
    
    query = %{SELECT admin_id, first_name, surname, email, area FROM admin_details}
    @admin_results = @database.execute query
    
    erb :admin_two
end
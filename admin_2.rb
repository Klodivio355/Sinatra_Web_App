require 'sqlite3'
require 'sinatra/flash'

include ERB::Util

get '/admin_two' do
    query = %{SELECT car_registration, type, number_of_seats, base_price FROM car_details ORDER BY type DESC}
    @car_results = @database.execute query
    
    query2 = %{SELECT * FROM misuse_list ORDER BY banned}
    @misuse_results = @database.execute query2
    
    erb :admin_two
end
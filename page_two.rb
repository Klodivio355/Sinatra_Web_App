require 'sqlite3'
require 'sinatra/flash'
require 'sinatra'
require 'erb'
set :bind, '0.0.0.0'
include ERB::Util

before do 
    @database = SQLite3::Database.new './database.sqlite'
end

get '/admin_two' do
    query = %{SELECT car_registration, type, number_of_seats, price FROM car_details ORDER BY type DESC}
    @car_results = @database.execute query
    
    query = %{SELECT * FROM misue_table ORDER BY banned}
    @misuse_results = @database.execute query
    
    erb :admin_two
end
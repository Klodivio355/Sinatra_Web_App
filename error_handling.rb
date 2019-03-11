require 'sinatra'
disable :raise_errors
disable :show_exceptions

not_found do
   erb :fourzerofour
end

error do
    erb :fivehundred
end
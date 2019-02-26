require 'sinatra'
disable :raise_errors
disable :show_exceptions

not_found do
   erb :error_page
end

error do
    erb :output_page
end
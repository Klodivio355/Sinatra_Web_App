# COM1001 Team 07 application controller

#Default setup code

require 'sinatra'
require 'twitter'
require 'erb'
require 'sqlite3'
require_relative 'error_handling'
require_relative 'account'
set :bind, '0.0.0.0'

include ERB::Util

before do 
    config = {
        :consumer_key => '1aheI4yHG8uYkbmSz7zgHzOui',
        :consumer_secret => '1bsUvd7kgVOG0kvMFhLGfynUuZhCQ9ntN10t0wXX15Q2KpFQM0',
        :access_token => '1092446070788050946-4ccor6DmOuZFzOCJq64dn3arUfuvhL',
        :access_token_secret => 'EK7WWBp9YJ3S9VW8bCYc2KcyP15sp8s0vWy0WjVYoGAKq'
    }
    @client = Twitter::REST::Client.new(config)
end

#views
get '/' do
    @wrong = false
    erb :login
end

get '/twitter_search' do
    unless params[:search].nil?
        search_string = params[:search]
        results = @client.search(search_string)
        @tweets = results.take(20)
    end
    erb :twitter_search
end

get '/home' do
    erb :home
end
require 'sinatra'
require 'twitter'

set :bind, '0.0.0.0'

config = {
  :consumer_key => '1aheI4yHG8uYkbmSz7zgHzOui',
  :consumer_secret => '1bsUvd7kgVOG0kvMFhLGfynUuZhCQ9ntN10t0wXX15Q2KpFQM0',
  :access_token => '1092446070788050946-4ccor6DmOuZFzOCJq64dn3arUfuvhL',
  :access_token_secret => 'EK7WWBp9YJ3S9VW8bCYc2KcyP15sp8s0vWy0WjVYoGAKq'
}
client = Twitter::REST::Client.new(config)

get '/' do
    erb :button
end

get '/loginwithoutcheck' do
    @remember_me2 = false
    erb :button
    "Cookie 1 has a value of: #{request.cookies['mail']}." 
    "Cookie 2 has a value of: #{request.cookies['pass']}."
end

get '/loginwithcheck' do
    @remember_me2 = true
    @mail_value = "ana"
    @pass_value = "dd"
    erb :button
    "pass cookie has a value of: #{request.cookies['pass']}."
    "mail cookie has a value of: #{request.cookies['mail']}."
    
end



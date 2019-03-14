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
    response.delete_cookie 'pass'
    response.delete_cookie 'mail'
    erb :button
    #response.set_cookies[]
    #"Cookie 1 has a value of: #{request.cookies['email_checked']}." 
    #"Cookie 2. has a value of: #{request.cookies['password_checked']}."
end

get '/loginwithcheck' do
    @remember_me2 = true
    @mail_value = 'null'
    @pass_value = 'null'
    response.set_cookie('mail', @mail_value)
    response.set_cookie('pass', @pass_value)
    erb :button
    #"Cookie 1 has a value of: #{request.cookies['email_checked']}." 
    #"Cookie 2. has a value of: #{request.cookies['password_checked']}."
end



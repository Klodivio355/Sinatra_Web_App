require 'sinatra'
#require 'mail'

enable :sessions
set :session_secret, 'super secret'
include ERB::Util

post ' /contact' do
    
  erb :contact

  @name = params[:name].strip
  @email = params[:email].strip
  @message = params[:message].strip
    
    #Mail.defaults do
   #   delivery_method :smtp, address: "localhost", port: 1025
  #  end
     
  #  Mail.deliver do
  #        from     'mfontana1@sheffield.ac.uk'
   #       to       'maxime.fontana@orange.fr'
   #       subject  'Here is what you wanted '
   #       body     'blablabla'
         # add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
    #    end
    
  #  mail.deliver!
    
    
end


require 'capybara'
require 'rspec'
require 'capybara/cucumber'
#require 'simplecov'

#SimpleCov.start do
#  add_filter 'features/'
#end

require_relative '../../head_controller'
require_relative '../../account'

ENV['RACK_ENV'] = 'test'

Capybara.app = Sinatra::Application

class Sinatra::ApplicationWorld
  include RSpec::Expectations
  include RSpec::Matchers
  include Capybara::DSL
end

World do
  Sinatra::ApplicationWorld.new  
end
require 'sinatra'
require 'data_mapper'
require './lib/user'
require './lib/link'
require './lib/tag'
require 'rack-flash'
require 'sinatra/partial'
require './controllers/homepage.rb'
require './controllers/links.rb'
require './controllers/tags.rb'
require './controllers/users.rb'
require './controllers/sessions.rb'
require_relative 'data_mapper_setup'
require_relative 'helpers/session'

enable :sessions
set :session_secret,  'super secret'
use Rack::Flash 
set :partial_template_engine, :erb
use Rack::MethodOverride
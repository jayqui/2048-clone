require 'sinatra'
require 'pathname'

# helper constants for configuration
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path # otherwise Sinatra assumes the root is the file that calls the configure block.
  enable :sessions
  set :views, File.join(Sinatra::Application.root, "app", "views")
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'
end

# Require all controllers and models
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '**/*.rb')].each { |file| require file }

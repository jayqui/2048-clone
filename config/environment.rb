# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'pathname'
require 'sinatra'

# Some helper constants for path-centric logic
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

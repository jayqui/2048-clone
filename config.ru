require_relative 'config/environment'
require 'sass/plugin/rack'

# Sass
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# Run
run Sinatra::Application

require 'sinatra'

get '/' do
  @game = Game.new
  erb :'index'
end

get '/' do
  session[:game] = Game.new
  erb :'index', locals: {game: session[:game]}
end

post '/swipe' do
  if request.xhr?
    case request.params['move']
    when 'left'  then session[:game].left
    when 'right' then session[:game].right
    when 'up'    then session[:game].up
    when 'down'  then session[:game].down
    else
      status 400
    end

    erb :'_board', layout: false, locals: {game: session[:game]}
  end
end

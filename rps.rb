# controller
require 'sinatra/base'
require './lib/game'

class Rps < Sinatra::Base

  set :sessions, true

  get '/' do
    erb :index
  end

  run if app_file == $0

  post '/name' do
    session[:name] = params[:name]
    redirect '/game'
  end

  get '/game' do
    session[:game] = Game.new(session[:name])
    @restart = params[:restart]
    @name = session[:game].player_name
    erb :game
  end

  get '/result' do
    @weapon = params[:weapon]
    @comp_weapon = session[:game].computer_weapon
    @outcome = session[:game].battle(params[:weapon])
    @result_pic = session[:game].result_img_url(@weapon, @comp_weapon)
    erb :result
  end

end

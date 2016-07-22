require_relative './lib/player'
require 'sinatra/base'
require_relative './lib/game'


class BattleMon < Sinatra::Base
 enable :sessions

 get '/' do
   erb :index
 end

 post '/names' do
   player_1 = Player.new(params[:player_1_name])
   player_2 = Player.new(params[:player_2_name])
   @game = Game.game(player_1, player_2)
   redirect '/play'
 end

 get '/play' do
   @game = Game.instance
   erb :play
 end

 get '/attack' do
   @game = Game.instance
   @game.attack
   @game.switch_turns
   if @game.player_dead?
   redirect '/end'
  else
   erb :attack
  end
 end

 get '/end' do
   erb :end
 end




 # start the server if ruby file executed directly
 run! if app_file == $0
end

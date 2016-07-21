require_relative './lib/player'
require 'sinatra/base'

class BattleMon < Sinatra::Base
 enable :sessions

 get '/' do
   erb :index
 end

 post '/names' do
   $player_1 = Player.new(params[:player_1_name])
   $player_2 = Player.new(params[:player_2_name])
   $game = Game.new($player_1, $player_2)
   redirect '/play'
 end

 get '/play' do
   @player_1_name = $game.player_1.name
   @player_2_name = $game.player_2.name
   erb :play
 end

 get '/attack' do
   @player_1_name = $game.player_1.name
   @player_2_name = $game.player_2.name
   $player_2.reduce_points
   erb :attack
 end




 # start the server if ruby file executed directly
 run! if app_file == $0
end

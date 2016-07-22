class Game

attr_reader :player_1, :player_2, :player_1_turn

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @player_1_turn = true
  end

  def attack#(player)
    @player_1_turn ? @player_2.reduce_points : @player_1.reduce_points
  end

  def switch_turns
    @player_1_turn ^= true
  end

   def player_dead?
     @player_1.dead || @player_2.dead
   end

   def self.game(player_1, player_2)
     @game = Game.new(player_1, player_2)
   end

   def self.instance
     @game
   end

end

require_relative 'class_game'
require_relative 'class_players'
require_relative 'class_board'
require_relative 'class_boardcases'

def perform
  new_game = Game.new
  until Game.victory? == 'win'
    Game.turn
  end
end

perform

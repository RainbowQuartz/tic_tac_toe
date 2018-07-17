require 'pry'

class Game
  def initialize
    Players.new
    Board.new
  end

  def turn
      if turn odd?
        player_1 chooses where to play
      else
        player_2 chooses where to play
      end
  end
end

class Board < Game
  def initialize
    Boardcases.new
  end
end

class Players < Game
  def initialize
    p 'Name of player 1 :'
    print '>'
    @player_1 = gets.chomp
    p 'Name of player 2 :'
    print '>'
    @player_2 = gets.chomp
  end
end

class Boardcases < Board
  attr_accessor :case_1, :case_2, :case_3, :case_4, :case_5, :case_6, :case_7, :case_8, :case_9
  
  def initialize
    @case_1 = '|_|'
    @case_2 = '|_|'
    @case_3 = '|_|'
    @case_4 = '|_|'
    @case_5 = '|_|'
    @case_6 = '|_|'
    @case_7 = '|_|'
    @case_8 = '|_|'
    @case_9 = '|_|'
    puts @case_1 + @case_2 + @case_3
    puts @case_4 + @case_5 + @case_6
    puts @case_7 + @case_8 + @case_9
  end
end

binding.pry
Game.new

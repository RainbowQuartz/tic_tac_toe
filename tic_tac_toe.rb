require 'pry'

class Game
  @@turns = 1

  def initialize
    Players.new
    Board.new
  end

  def Game.turn
    if @@turns.odd?
    print "#{$player_1}'s turn, enter the row in which you want to play"
    row = gets.to_i
    print "enter the column in which you want to play"
    column = gets.to_i
    else
    print "#{$player_2}'s turn, enter the row in which you want to play"
    row = gets.to_i
    print "enter the column in which you want to play"
    column = gets.to_i
    end
    @@turns += 1
  end
end

class Board < Game
  def initialize
    Boardcases.new
  end
end

class Players < Game
  attr_accessor :player_1, :player_2

  def initialize
    p 'Name of player 1 :'
    print '>'
    $player_1 = gets.chomp
    p 'Name of player 2 :'
    print '>'
    $player_2 = gets.chomp
  end
end

class Boardcases < Board
  def initialize
    $Boardcases =  Array.new(3) { Array.new(3, '|_|')}
  end
end

binding.pry
Boardcases.new
Board.new
Players.new
Game.new

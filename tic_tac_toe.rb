require 'pry'

class Game
  def initialize
    Players.new
    Board.new
    @@turns = 1
  end

  def Game.turn_action(row, column, string)
    if $boardcases[row - 1][column - 1] == '|_|'
      $boardcases[row - 1][column - 1] = string
    else
      puts "This case has already been played or doesn't exist, try again."
      @@turns += 1
    end
  end

  def Game.turn
    if @@turns.odd?
      print "#{$player_1}'s turn, enter the row in which you want to play (1--3): "
      row = gets.to_i
      print "enter the column in which you want to play (1--3): "
      column = gets.to_i
      Game.turn_action(row, column, '|X|')
    else
      print "#{$player_2}'s turn, enter the row in which you want to play (1--3): "
      row = gets.to_i
      print "enter the column in which you want to play (1--3): "
      column = gets.to_i
      Game.turn_action(row, column, '|O|')
    end
    Game.victory?
    $boardcases.map{|x| puts x.join}
    @@turns += 1
  end

  def Game.victory?
    if $boardcases.join.include?("|_|")
      if (
        ($boardcases[0][0] == $boardcases[0][1] && $boardcases[0][0] == $boardcases[0][2] && $boardcases[0][0] == '|X|') ||
        ($boardcases[1][0] == $boardcases[1][1] && $boardcases[1][0] == $boardcases[1][2] && $boardcases[1][0] == '|X|') ||
        ($boardcases[2][0] == $boardcases[2][1] && $boardcases[2][0] == $boardcases[2][2] && $boardcases[2][0] == '|X|') ||
        ($boardcases[0][0] == $boardcases[1][0] && $boardcases[0][0] == $boardcases[2][0] && $boardcases[0][0] == '|X|') ||
        ($boardcases[0][1] == $boardcases[1][1] && $boardcases[0][1] == $boardcases[2][1] && $boardcases[0][1] == '|X|') ||
        ($boardcases[0][2] == $boardcases[1][2] && $boardcases[0][2] == $boardcases[2][2] && $boardcases[0][2] == '|X|') ||
        ($boardcases[0][0] == $boardcases[1][1] && $boardcases[0][0] == $boardcases[2][2] && $boardcases[0][0] == '|X|') ||
        ($boardcases[0][2] == $boardcases[1][1] && $boardcases[0][2] == $boardcases[2][2] && $boardcases[0][2] == '|X|')
        )
        puts "Player 1 #{$player_1} win, well done!!!"
      elsif (
        ($boardcases[0][0] == $boardcases[0][1] && $boardcases[0][0] == $boardcases[0][2] && $boardcases[0][0] == '|0|') ||
        ($boardcases[1][0] == $boardcases[1][1] && $boardcases[1][0] == $boardcases[1][2] && $boardcases[1][0] == '|0|') ||
        ($boardcases[2][0] == $boardcases[2][1] && $boardcases[2][0] == $boardcases[2][2] && $boardcases[2][0] == '|0|') ||
        ($boardcases[0][0] == $boardcases[1][0] && $boardcases[0][0] == $boardcases[2][0] && $boardcases[0][0] == '|0|') ||
        ($boardcases[0][1] == $boardcases[1][1] && $boardcases[0][1] == $boardcases[2][1] && $boardcases[0][1] == '|0|') ||
        ($boardcases[0][2] == $boardcases[1][2] && $boardcases[0][2] == $boardcases[2][2] && $boardcases[0][2] == '|0|') ||
        ($boardcases[0][0] == $boardcases[1][1] && $boardcases[0][0] == $boardcases[2][2] && $boardcases[0][0] == '|0|') ||
        ($boardcases[0][2] == $boardcases[1][1] && $boardcases[0][2] == $boardcases[2][2] && $boardcases[0][2] == '|0|')
        )
        puts "Player 1 #{$player_1} win, well done!!!"
      end
    else
      puts "match nul"
    end
  end
end

class Board < Game
  def initialize
    Boardcases.new
    $boardcases.map{|x| puts x.join}
  end
=begin
  def Board.making_the_board
    $boardcases.map{|x| puts x.join}
  end
=end
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
  attr_accessor :case_1, :case_2, :case_3, :case_4, :case_5, :case_6, :case_7, :case_8, :case_9

  def initialize
    $boardcases =  Array.new(3) { Array.new(3, '|_|')}
  end
end

binding.pry
Game.new

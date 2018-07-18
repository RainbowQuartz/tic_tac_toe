require_relative 'class_players'
require_relative 'class_board'
require_relative 'class_boardcases'

class Game
  def initialize
    Players.new
    Board.new
    @@turns = 1
  end
  #l'initialisation renvoie aux fonctions initialize des classes dépendant de Game

  def Game.turn_action(row, column, string)
    if $boardcases[row - 1][column - 1] == '|_|'
      $boardcases[row - 1][column - 1] = string
    else
      puts "This case has already been played or doesn't exist, try again."
      @@turns += 1
    end
  end
  #permet d'effectuer les actions communes aux deux joueur.se.s

  def Game.get_row
    row = gets.to_i
    until (1...4) === row
      print 'Wrong number, try again > '
      row = gets.to_i
    end
    return row
  end
  #fonction commune des entrées de rang

  def Game.get_column
    print "Enter the column in which you want to play (1--3): "
    column = gets.to_i
    until (1...4) === column
      print 'Wrong number, try again > '
      column = gets.to_i
    end
    return column
  end
  #fonction commune des entrées de colonnes

  def Game.turn
    if @@turns.odd?
      print "#{$player_1}'s turn, enter the row in which you want to play (1--3): "
      row  = Game.get_row
      column = Game.get_column
      Game.turn_action(row, column, '|X|')
    else
      print "#{$player_2}'s turn, enter the row in which you want to play (1--3): "
      row = Game.get_row
      column = Game.get_column
      Game.turn_action(row, column, '|O|')
    end
    Game.victory?
    Board.puts_the_board
    @@turns += 1
  end
  #fonction déroulant un tour

  def Game.victory?
    if $boardcases.join.include?("|_|")
      if (
        ($boardcases[0][0] + $boardcases[0][1] + $boardcases[0][2] == "|X||X||X|") ||
        ($boardcases[1][0] + $boardcases[1][1] + $boardcases[1][2] == "|X||X||X|") ||
        ($boardcases[2][0] + $boardcases[2][1] + $boardcases[2][2] == "|X||X||X|") ||
        ($boardcases[0][0] + $boardcases[1][0] + $boardcases[2][0] == "|X||X||X|") ||
        ($boardcases[0][1] + $boardcases[1][1] + $boardcases[2][1] == "|X||X||X|") ||
        ($boardcases[0][2] + $boardcases[1][2] + $boardcases[2][2] == "|X||X||X|") ||
        ($boardcases[0][0] + $boardcases[1][1] + $boardcases[2][2] == "|X||X||X|") ||
        ($boardcases[0][2] + $boardcases[1][1] + $boardcases[2][0] == "|X||X||X|"))
        puts "Player 1 win, well done #{$player_1} !!!"
        return 'win'
      elsif (
        ($boardcases[0][0] + $boardcases[0][1] + $boardcases[0][2] == "|O||O||O|") ||
        ($boardcases[1][0] + $boardcases[1][1] + $boardcases[1][2] == "|O||O||O|") ||
        ($boardcases[2][0] + $boardcases[2][1] + $boardcases[2][2] == "|O||O||O|") ||
        ($boardcases[0][0] + $boardcases[1][0] + $boardcases[2][0] == "|O||O||O|") ||
        ($boardcases[0][1] + $boardcases[1][1] + $boardcases[2][1] == "|O||O||O|") ||
        ($boardcases[0][2] + $boardcases[1][2] + $boardcases[2][2] == "|O||O||O|") ||
        ($boardcases[0][0] + $boardcases[1][1] + $boardcases[2][2] == "|O||O||O|") ||
        ($boardcases[0][2] + $boardcases[1][1] + $boardcases[2][0] == "|O||O||O|"))
        puts "Player 2 win, well done #{$player_2} !!!"
        return 'win'
      end
    else
      puts "match nul"
      return 'win'
    end
  end
  #fonction verifiant si une condition de victoire est atteinte
end

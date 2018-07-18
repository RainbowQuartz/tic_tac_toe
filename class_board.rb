require_relative 'class_boardcases'
#va chercher le fichier contenant la classe Boardcases
class Board
  def initialize
    Boardcases.new
    Board.puts_the_board
  end
  #appelle la classe Boardcases lors de l'initialisation et la méthode puts_the_board

  def Board.puts_the_board
  	$boardcases.map { |x| puts x.join }
  	puts "-----------------------------------------------------------"
  end
  #affiche le plateau de jeu
end

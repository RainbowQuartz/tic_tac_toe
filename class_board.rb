require_relative 'class_boardcases'
#va chercher le fichier contenant la classe Boardcases
class Board
  def initialize
    Boardcases.new
    $boardcases.map { |x| puts x.join }
  end
  #appelle la classe Boardcases lors de l'initialisation
end

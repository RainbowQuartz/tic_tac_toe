require_relative 'class_boardcases'

class Board
  def initialize
    Boardcases.new
    $boardcases.map{|x| puts x.join}
  end
end

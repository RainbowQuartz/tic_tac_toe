class Players
  attr_accessor :player_1, :player_2

  def initialize
    p 'Name of player 1 :'
    print '>'
    $player_1 = gets.chomp
    p 'Name of player 2 :'
    print '>'
    $player_2 = gets.chomp
  end
  #chaque joueur rentre son nom
end

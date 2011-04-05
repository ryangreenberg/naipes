class Trick
  attr_reader :cards, :player
  
  def initialize(cards, player)
    @cards = cards
    @player = player
  end
end
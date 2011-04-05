class Player
  attr_reader :name, :cards
  def initialize(name)
    @name = name
    @cards = []
  end
  
  def draw(deck)
    @cards << deck.draw
  end
end

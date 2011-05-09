class CardSet
  def initialize(cards = [], name = nil)
    @cards = cards
    @name = name
  end
  
  def <<(card)
    @cards << card
  end
  
  
end
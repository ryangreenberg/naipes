class Card
  attr_reader :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  
  def is_suit?(suit_symbol)
    @suit.is?(suit_symbol)
  end
  
  def display(options={})
    
  end
  
  def to_s
    "#{@value}#{@suit.to_visual_symbol}"
  end
end
class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value?(value)
    @value.is?(value)
  end

  def suit?(suit)
    @suit.is?(suit)
  end

  def to_s
    "#{@value}#{@suit.to_visual_symbol}"
  end
end
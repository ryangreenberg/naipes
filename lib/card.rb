class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def ==(other)
    other.suit?(@suit) == other.value?(@value)
  end

  def value?(value)
    @value == value
  end

  def suit?(suit)
    @suit == suit
  end

  def display(options)
    "#{@value.display(options)}#{@suit.display(options)}"
  end

  def to_s
    "#{@value}#{@suit.to_visual_symbol}"
  end
end
class Suit
  SUIT_NAMES = [:hearts, :spades, :diamonds, :clubs]
  SUIT_ABBREVIATIONS = {
    :hearts => "H",
    :spades => "S",
    :diamonds => "D",
    :clubs => "C"
  }
  SUIT_SYMBOLS = {
    :hearts => "♥",
    :spades => "♠",
    :diamonds => "♦",
    :clubs => "♣"
  }

  def self.default_suits
    SUIT_NAMES.map { |suit| Suit.new(suit) }
  end

  def initialize(suit_name)
    @suit_name = suit_name
  end

  def is?(suit_symbol)
    @suit_name == suit_symbol
  end

  def ==(other)
    @suit_name == other.suit_name
  end

  def to_visual_symbol
    SUIT_SYMBOLS[@suit_name]
  end

  def to_s
    SUIT_ABBREVIATIONS[@suit_name]
  end
end
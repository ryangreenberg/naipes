class Suit
  attr_reader :suit_name

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

  def ==(other)
    @suit_name == other.suit_name
  end
  
  def <=>(other)
    SUIT_NAMES.find_index(@suit_name) <=> SUIT_NAMES.find_index(other.suit_name)
  end

  def display(options)
    if options[:abbreviation]
      SUIT_ABBREVIATIONS[@suit_name]
    end
  end

  def to_s
    SUIT_ABBREVIATIONS[@suit_name]
  end
end
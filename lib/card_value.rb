class InvalidCardValue < StandardError; end

class CardValue
  attr_reader :value

  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  NAMED_VALUES = {
    :ace => 1,
    :jack => 11,
    :queen => 12,
    :king => 13
  }

  ABBREVIATION_NAMES = {
    1 => 'A',
    11 => 'J',
    12 => 'Q',
    13 => 'K'
  }

  def self.default_values
    VALUES.map { |value| CardValue.new(value) }
  end

  def initialize(value)
    if NAMED_VALUES.include?(value)
      @value = NAMED_VALUES[value]
    else
      raise InvalidCardValue unless VALUES.include?(value)
      @value = value
    end
  end

  def ==(other)
    @value == other.value
  end

  def display(options)
    if options[:abbreviation]
      ABBREVIATION_NAMES.include?(@value) ? ABBREVIATION_NAMES[@value] : @value
    end
  end

  def to_s
    @value
  end
end

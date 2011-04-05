class CardValue
  VALUES = %w{2 3 4 5 6 7 8 9 10 J Q K A}

  def self.default_values
    VALUES.map { |value| CardValue.new(value) }
  end

  def initialize(card_value)
    @card_value = card_value
  end

  def to_s
    @card_value
  end
end

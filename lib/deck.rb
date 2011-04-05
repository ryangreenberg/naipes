class Deck
  include Enumerable

  def initialize(suits, values)
    @cards = []
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle
    @cards = @cards.sort_by { rand }
  end

  def draw
    @cards.shift
  end

  def length
    @cards.length
  end
  alias size length
  alias count length

  def each(&block)
    @cards.each { |card| yield card }
  end
end

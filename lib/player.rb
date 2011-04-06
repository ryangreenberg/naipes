class Player
  attr_reader :name, :cards
  def initialize(name)
    @name = name
    @cards = []
  end

  def draw(deck)
    @cards << deck.draw
  end

  def take_turn(game)
    puts "#{@name}'s turn..."
    puts @cards.display(:abbreviation)
    game.allowed?(:action => :draw)
  end
end

class Player
  attr_reader :name, :cards
  def initialize(name)
    @name = name
    @cards = []
  end

  def draw(deck)
    @cards << deck.draw
  end

  def remove(card)
    removed_card = @cards.delete(card)
    removed_card
  end

  def choose_suit(game)
    # Automatically pick the suit that the player currently has the most of
    suit_counts = @cards.inject({}) do |suit_count, card|
      suit_name = card.suit.suit_name
      suit_count[suit_name] ||= 0
      suit_count[suit_name] += 1
      suit_count
    end

    most_common_suit = suit_counts.max {|a, b| a[1] <=> b[1] }
    { :action => :choose_suit, :suit => Suit.new(most_common_suit[0]) }
  end

  def take_turn(game)
    puts "*" * 10
    puts "#{@name}'s turn..."

    # Automated play for crazy eights
    card_to_play = @cards.detect do |card|
      game.allowed?({:action => :play, :card => card})
    end

    if card_to_play
      {:action => :play, :card => card_to_play}
    else
      {:action => :draw}
    end
  end
  
  def to_s
    @name
  end
end

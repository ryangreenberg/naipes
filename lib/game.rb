require 'observer'

class Game
  include Observable
  
  attr_reader :deck, :players

  def initialize(players=[])
    @players = players
    @deck = Deck.new(suits, values)
  end

  def suits
    Suit.default_suits
  end

  def values
    CardValue.default_values
  end

  def play
    raise NotImplementedError
  end
  
  def notify(event)
    changed
    event = {:action => event} if event.is_a?(Symbol)
    notify_observers(event, self)
  end
end

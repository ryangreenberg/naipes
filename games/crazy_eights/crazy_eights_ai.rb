class CrazyEightsAi
  def initialize(game, controller, player)
    @game = game
    @controller = controller
    @player = player
    
    @game.add_observer(self)
  end

  def my_turn
    card_to_play = @player.cards.detect do |card|
      @game.allowed?(@player, :action => :play, :card => card)
    end

    if card_to_play
      turn = {:action => :play, :card => card_to_play}
    else
      turn = {:action => :draw}
    end
    
    @controller.take_turn(@player, turn)
  end
  
  def choose_suit
    # Automatically pick the suit that the player currently has the most of
    suit_counts = @player.cards.inject({}) do |suit_count, card|
      suit_name = card.suit.suit_name
      suit_count[suit_name] ||= 0
      suit_count[suit_name] += 1
      suit_count
    end

    most_common_suit = suit_counts.max {|a, b| a[1] <=> b[1] }
    
    @controller.take_turn({ :action => :choose_suit, :suit => Suit.new(most_common_suit[0]) })
  end
  
  def update(event, game)
    if event[:action] == :turn && event[:player] == @player
        my_turn
    elsif event[:action] == :choose && event[:player] == @player
      choose_suit
    end
  end
  
end
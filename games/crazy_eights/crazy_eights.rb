class CrazyEights < Game

  STARTING_NUMBER_OF_CARDS = 8
  WILD_CARD = 8

  def play
    @discard = []
    deal
    while
      @players.each do |player|
        player.take_turn(self)
        break if game_over?
      end
    end
  end

  # class Action
  #   def initialize(name)
  #     @name = name
  #   end
  # end

  def available_actions
    [:draw, :play]
  end

  def allowed?(action, params)
    if action == :draw
      true
    elsif action == :play
      card = params[:card]
      card.value?(WILD_CARD) || card.suit?(suit_at_top_of_discard_pile) || card.value?(value_at_top_of_discard_pile)
    else
      false
    end
  end

  def game_over?
    @players.any { |player| player.cards.size == 0 }
  end

  def deal
    STARTING_NUMBER_OF_CARDS.times do
      @players.each do |player|
        player.draw(@deck)
      end
    end

    @discard << @deck.draw
  end
end
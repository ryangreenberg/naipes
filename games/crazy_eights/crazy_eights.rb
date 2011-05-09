class CrazyEights < Game

  STARTING_NUMBER_OF_CARDS = 8
  WILD_CARD = CardValue.new(8)

  def can_start?
    @players.size > 1
  end

  def start
    deal
    changed
    notify(:action => :turn, :player => current_player)
  end

  def current_player
    @players.first
  end
  
  def winner
  end
  
  def top_card
    @discard.last
  end

  def handle_decision(player, decision)
    if decision[:action] == :draw
      puts "#{player.name} is drawing a card..."
      player.draw(@deck)
      notify(:action => :draw, :player => player, :card => player.cards.last)
      
      reshuffle_discard if @deck.size == 0
    elsif decision[:action] == :play
      played_card = player.remove(decision[:card])
      @discard << played_card
      notify(:action => :play, :player => player, :card => played_card)

      if played_card.value?(WILD_CARD)
        notify(:action => :choose_suit, :player => player)
      else
        @wild_card_suit = nil
      end

    elsif decision[:action] == :choose_suit
      puts "#{player.name} choose #{decision[:suit]} as the suit..."
      @wild_card_suit = decision[:suit]
      notify(:action => :suit_change, :suit => decision[:suit])
    end
    
    next_player
  end
  
  def next_player
    @players.push(@players.shift)
    notify(:action => :turn, :player => current_player)
  end

  # class Action
  #   def initialize(name)
  #     @name = name
  #   end
  # end
  #
  # def available_actions
  #   [:draw, :play]
  # end

  def allowed?(player, decision)
    if decision[:action] == :draw
      true
    elsif decision[:action] == :play
      card = decision[:card]
      if player.cards.include?(card)
        card.value?(WILD_CARD) || card.suit?(suit_at_top_of_discard_pile) || card.value?(value_at_top_of_discard_pile)
      else
        false
      end
    else
      false
    end
  end

  def suit_at_top_of_discard_pile
    @wild_card_suit || @discard.last.suit
  end

  def value_at_top_of_discard_pile
    @discard.last.value
  end

  def game_over?
    @players.any? { |player| player.cards.size == 0 }
  end

  def deal
    @deck.shuffle
    changed
    notify(:shuffle)

    STARTING_NUMBER_OF_CARDS.times do
      @players.each do |player|
        player.draw(@deck)
        changed
        notify(:action => :draw, :player => player, :card => player.cards.last)
      end
    end

    @discard = [ @deck.draw ]
    notify(:flip)
  end

  def reshuffle_discard
    puts "Reshuffling deck..."
    saved_card = @discard.pop
    @deck.add(@discard)
    @deck.shuffle
    @discard = [ saved_card ]
    changed
    notify(:shuffle)
  end
end
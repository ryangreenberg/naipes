class CrazyEights < Game

  STARTING_NUMBER_OF_CARDS = 8
  WILD_CARD = CardValue.new(8)

  def play
    deal

    while true
      @players.each do |player|
        decision = player.take_turn(self)
        handle_decision(player, decision)

        if game_over?
          @winner = player
          break
        end

        puts "#{player.name} has #{player.cards.size} cards: #{player.cards.join(', ')}"

        # wait = STDIN.gets
      end
      break if @winner
    end

    puts "Game over! #{@winner.name} was the winner!"
  end

  def handle_decision(player, decision)
    if decision[:action] == :draw
      puts "#{player.name} is drawing a card..."
      player.draw(@deck)
      reshuffle_discard if @deck.size == 0
    elsif decision[:action] == :play
      puts "#{player.name} plays #{decision[:card]}..."
      played_card = player.remove(decision[:card])
      @discard << played_card

      if played_card.value?(WILD_CARD)
        decision = player.choose_suit(self)
        handle_decision(player, decision)
      else
        @wild_card_suit = nil
      end

    elsif decision[:action] == :choose_suit
      puts "#{player.name} choose #{decision[:suit]} as the suit..."
      @wild_card_suit = decision[:suit]
    end
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

  def allowed?(decision)
    if decision[:action] == :draw
      true
    elsif decision[:action] == :play
      card = decision[:card]
      card.value?(WILD_CARD) || card.suit?(suit_at_top_of_discard_pile) || card.value?(value_at_top_of_discard_pile)
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

    STARTING_NUMBER_OF_CARDS.times do
      @players.each do |player|
        player.draw(@deck)
      end
    end

    @discard = [ @deck.draw ]
    puts "#{@discard[0]} is the first card..."
  end

  def reshuffle_discard
    puts "Reshuffling deck..."
    saved_card = @discard.pop
    @deck.add(@discard)
    @deck.shuffle
    @discard = [ saved_card ]
  end
end
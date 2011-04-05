class Hearts < Game
  attr_accessor :scores

  def initialize(players)
    super
    @scores = players.inject({}) { |hash, player| hash[player] = 0; hash }
  end

  def deal
    @players.cycle(@deck.size / @players.size) do |player|
      player.draw(@deck)
    end
  end

  def play
    puts "Starting a new game of hearts with #{@players.map {|p| p.name }.join(', ')}"
    while !game_over?
      play_hand
    end
  end

  def play_hand
    new_deck
    deal
    @tricks = []
    while !hand_over?
      current_player = select_player_to_lead_trick
      current_player.take_turn(self)
      # p current_player.cards
    end
    # for 13 rounds (until 13 tricks have been played):
    # select_player
    # ask player to play card
    # add card to table
    # if the trick is complete, determine who won the trick
    # give the cards to the player who won the trick
  end

  def new_deck
    @deck = Deck.new(suits, values)
    @deck.shuffle
  end

  def select_player_to_lead_trick
    # For the first trick, the player with the 2 of clubs leads the trick
    #
  end

  # Does it make sense to define these in a rules class?
  def game_over?
    @scores.values.any? { |score| score >= 100 }
  end

  def hand_over?
    @tricks.length < 13
  end

  def select_player
  end
end

class CrazyEightsCLI < CLI
  def initialize(game, controller, player)
    @game = game
    @controller = controller
    @player = player
    
    @game.add_observer(self)
  end
  
  def run
    if agree("Would you like to start a game of Crazy Eights? ") { |q| q.default = 'yes' }
      say("Hey there, #{@player}. ")
      say("Starting a new game of hearts with #{(@game.players - [@player]).map(&:to_s).join(', ')}")
      @controller.start
    end
  end

  def my_hand
    @player.cards.map(&:to_s).join(" ")
  end

  def my_turn
    say(my_hand)
    
    actions = [:draw]
    actions += [:play] if can_play?
    
    turn = {:action => choose(*actions)}

    if turn[:action] == :play
      cards_by_name = legal_plays.inject({}) { |h, c| h[c.to_s] = c; h }
      
      while true
        card_name = choose(*cards_by_name.keys)
        card = cards_by_name[card_name]
        if @game.allowed?(@player, :action => :play, :card => card)
          turn[:card] = card
          break
        else
          say("Invalid selection")
        end
      end
    end
    
    @controller.take_turn(@player, turn)
  end
  
  def choose_suit
    turn = {:action => :choose_suit, :suit => Suit.new(choose(*[:hearts, :spades, :diamonds, :clubs]))}
    @controller.take_turn(@player, turn)
  end
  
  def can_play?
    legal_plays.size > 0
  end
  
  def legal_plays
    @player.cards.select { |card| @game.allowed?(@player, :action => :play, :card => card) }
  end
  
  def another_players_turn
    player = @game.current_player
    @controller.take_turn(player, Automaton.new(player, @game).decide_turn)
  end

  def update(event, game)
    explain(event, game)
    
    if event[:action] == :turn && event[:player] == @player
        my_turn
    elsif event[:action] == :choose && event[:player] == @player
      choose_suit
    end
  end
  
  def explain(event, game)
    event_description = case event[:action]
      when :deal then "Dealing..."
      when :flip then "Top card is #{game.top_card}"
      when :turn then "It is #{game.current_player}'s turn..."
      # when :draw then (event[:player] == @player ? "You drew #{event[:card]}" : "#{event[:player]} drew a card")
      when :play then "#{event[:player]} played #{event[:card]}"
      when :suit_change then "#{event[:player]} changed the suit to #{event[:suit]}"
      # else "Game changed: #{event[:action]}"
    end
    
    say(event_description) if event_description
  end
end
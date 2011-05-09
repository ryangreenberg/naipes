class GameController
  def initialize(game)
    @game = game
  end
  
  def start
    raise StandardError.new("game does not meet the requirements to start") unless @game.can_start?
    @game.start
  end
  
  def take_turn(player, action)
    raise StandardError.new("invalid action") unless @game.allowed?(player, action)
    @game.handle_decision(player, action)
  end
end
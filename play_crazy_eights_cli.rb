require 'cards'

$LOAD_PATH.push('games/crazy_eights')
require 'crazy_eights'
require 'crazy_eights_cli'
require 'crazy_eights_ai'

players = [Player.new("Alan"), Player.new("Barbara"), Player.new("Carl"), Player.new("Deborah")]
game = CrazyEights.new(players)
controller = GameController.new(game)

ui = CrazyEightsCLI.new(game, controller, players[0])
players.slice(1, players.size).each { |p| CrazyEightsAi.new(game, controller, p) }
ui.run
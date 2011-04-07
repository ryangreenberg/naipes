require 'cards'

$LOAD_PATH.push('games/crazy_eights')
require 'crazy_eights'

players = [Player.new("Alan"), Player.new("Barbara"), Player.new("Carl"), Player.new("Deborah")]
game = CrazyEights.new(players)
game.play
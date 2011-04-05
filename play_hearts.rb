require 'cards'

$LOAD_PATH.push('games/hearts')
require 'hearts'
require 'trick'

players = [Player.new("Alan"), Player.new("Barbara"), Player.new("Carl"), Player.new("Deborah")]
game = Hearts.new(players)
game.play
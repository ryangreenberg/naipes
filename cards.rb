%w{card card_value deck game player suit}.each do |file|
  require "#{File.join(File.dirname(__FILE__), 'lib', file)}"
end

# helper for generating cards on the console
def c(abbr)
  suit_abbr_to_suit = {
    'H' => :hearts,
    'S' => :spades,
    'D' => :diamonds,
    'C' => :clubs
  }

  value, suit_abbr = abbr.split('')
  Card.new(suit_abbr_to_suit[suit_abbr.upcase], value.to_i)
end
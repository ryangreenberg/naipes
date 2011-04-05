%w{card card_value deck game player suit}.each do |file|
  require "#{File.join(File.dirname(__FILE__), 'lib', file)}"
end
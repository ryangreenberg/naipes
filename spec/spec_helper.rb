require 'rspec'
require 'rr'

RSpec.configure do |config|
  config.mock_with :rr
end

%w{card card_value deck game player suit}.each do |file|
  require "#{File.join(File.dirname(__FILE__), '..', 'lib', file)}"
end

%w{hearts trick}.each do |file|
  require "#{File.join(File.dirname(__FILE__), '..', 'games', 'hearts', file)}"
end
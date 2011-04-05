require File.dirname(__FILE__) + '/../spec_helper'

describe Card do
  describe "#initialize" do
    it "is initialized with a suit and value" do
      suit = Suit.new(:hearts)
      value = CardValue.new(9)
      card = Card.new(suit, value)
      
      card.suit.should == suit
      card.value.should == value
    end
  end
end
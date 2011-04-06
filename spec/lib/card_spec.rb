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
  
  describe "#==" do
    it "returns true when compared card has the same suit and value" do
      suit = Suit.new(:hearts)
      value = CardValue.new(9)
      card_a = Card.new(suit, value)
      card_b = Card.new(suit, value)
      card_a.should == card_b
    end
    
    it "returns false when compared card has different suit" do
      suit_a = Suit.new(:hearts)
      suit_b = Suit.new(:clubs)
      value = CardValue.new(9)
      card_a = Card.new(suit_a, value)
      card_b = Card.new(suit_b, value)
      card_a.should_not == card_b
    end
    
    it "returns false when compared card has different value" do
      suit = Suit.new(:hearts)
      value_a = CardValue.new(9)
      value_b = CardValue.new(8)
      card_a = Card.new(suit, value_a)
      card_b = Card.new(suit, value_b)
      card_a.should_not == card_b
    end
  end
end
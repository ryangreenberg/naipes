require File.dirname(__FILE__) + '/../spec_helper'

describe Suit do
  describe "is?" do
    it "is true when the symbol matches the name of the suit" do
      suit = Suit.new(:hearts)
      suit.is?(:hearts).should be_true
    end
    
    it "is false when the symbol does not match the name of the suit" do
      suit = Suit.new(:hearts)
      suit.is?(:spades).should be_false
    end
  end
end
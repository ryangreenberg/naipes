require File.dirname(__FILE__) + '/../spec_helper'

describe Suit do
  describe "==" do
    it "is true when the suits are the same" do
      suit_a = Suit.new(:hearts)
      suit_b = Suit.new(:hearts)
      suit_a.should == suit_b
    end

    it "is false when the symbol does not match the name of the suit" do
      suit_a = Suit.new(:hearts)
      suit_b = Suit.new(:clubs)
      suit.is?(:spades).should be_false
    end
  end
end
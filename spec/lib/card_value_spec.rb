require File.dirname(__FILE__) + '/../spec_helper'

describe CardValue do
  describe "#initializer" do
    it "raises an error when value is not recognized" do
      invalid_value = 50
      lambda { CardValue.new(invalid_value) }.should raise_error
    end

    it "accepts named values for special cards" do
      special_cards = [:jack, :queen, :king, :ace]
      special_cards.each do |special_card|
        card_value = CardValue.new(special_card)
        card_value.value.should == CardValue::NAMED_VALUES[special_card]
      end
    end
  end
end
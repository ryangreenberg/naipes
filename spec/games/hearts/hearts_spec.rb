require File.dirname(__FILE__) + '/../../spec_helper'

describe Hearts do
  before do
    @players = [Player.new("Peter"), Player.new("Paul"), Player.new("Mary"), Player.new("John")]
    @game = Hearts.new(@players)
  end
  
  describe "#game_over?" do
    it "is false when no player has more than 100 points" do
      @game.scores = {
        players[0] => 10,
        players[1] => 20,
        players[2] => 30,
        players[3] => 40
      }
      @game.game_over?.should be_false
    end
    
    it "is true when any player has more than 100 points" do
      @game.scores = {
        players[0] => 10,
        players[1] => 20,
        players[2] => 30,
        players[3] => 100
      }
      @game.game_over?.should be_true
    end
  end
  
  describe "# select_player_to_lead_trick" do
    it "returns the player with the 2 of clubs for the first trick" do
      
    end
  end
end
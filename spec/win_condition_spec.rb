require 'spec_helper'

describe "the win condition logic" do
	it "should return cats game if game is over but nobody has won" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","_"]]		
	end

	it "should return win if the player has won" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","_"]]		
	end

	it "should return lose if the player has lost" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","_"]]		
	end
end
require 'spec_helper'

describe "#generate board" do

  it 'should return a proper board' do
	x = generate_board(3,"_")
	expect(x).to eql([["_","_","_"],
					  ["_","_","_"],
					  ["_","_","_"]])
  end	
end

describe "#won? function" do
	it "should return true if the player has won diagonally left" do
		board = [["o","_","x"],
		 		 ["o","x","_"],
		 		 ["x","_","_"]]
		did_we_win = won?("x","_",board)
		expect(did_we_win).to eql(true) 		 
	end

	it "should return true if the player has won diagonally right" do
		board = [["o","_","x"],
		 		 ["o","o","_"],
		 		 ["x","_","o"]]
		did_we_win = won?("o","_",board)
		expect(did_we_win).to eql(true) 		 
	end	

	it "should return true if the player has won vertically" do
		board = [["o","_","x"],
		 		 ["o","x","_"],
		 		 ["o","_","_"]]
		did_we_win = won?("o","_",board)
		expect(did_we_win).to eql(true) 		 
	end

	it "should return true if the player has won horozontally" do
		board = [["_","_","x"],
		 		 ["o","o","o"],
		 		 ["o","_","o"]]
		did_we_win = won?("o","_",board)
		expect(did_we_win).to eql(true) 		 
	end

	it "should return false if the player hasn't yet won" do
		board = [["o","o","_"],
		 		 ["o","x","_"],
		 		 ["x","_","_"]]
		did_we_win = won?("x","_",board)
		expect(did_we_win).to eql(false) 		
	end
end

describe "#safe_value?" do
	it "returns true if value is equal to value array" do
		test = [2,2]
		board = [["o","o","_"],
		 		 ["o","x","_"],
		 		 ["x","_","_"]]
		try = safe_value?(test,board,"_")
		expect(try).to eql(true)
	end
	it "should return false if array is less than zero" do
		test = [0,-2]
		board = [["o","o","_"],
		 		 ["o","x","_"],
		 		 ["x","_","_"]]
		try = safe_value?(test,board,"_")
		expect(try).to eql(false)		
	end
	it "should return false if array is to big" do
		test = [3,2]
		board = [["o","o","_"],
		 		 ["o","x","_"],
		 		 ["x","_","_"]]
		try = safe_value?(test,board,"_")
		expect(try).to eql(false)		
	end
end

describe "#make_move" do
	it "should fill the specified cell with your symbol" do
		board = [["o","o","_"],
		 		 ["o","x","_"],
		 		 ["x","_","_"]]
		board = make_move(board, "x", [0,2]) 	
		
		expect(board).to eql([["o","o","x"],
		 		 			  ["o","x","_"],
		 		 			  ["x","_","_"]])	 
	end
end







require 'spec_helper'

describe "#could_win_straight?" do
	
	it "should work vertically " do
		board = [["x","o","x"],
		 		 ["_","x","_"],
		 		 ["x","_","o"]]
		answer = could_win_straight?("x","vertically",board) 
		expect(answer).to eql([1,0])		 
	end

	it "should return false if can't win vertically" do
		board = [["_","o","o"],
		 		 ["o","x","_"],
		 		 ["x","_","x"]]
		answer = could_win_straight?("x","vertically",board) 
		expect(answer).to eql(false)			
	end

	it "should work horozontally " do
		board = [["x","_","x"],
		 		 ["_","x","_"],
		 		 ["x","_","o"]]
		answer = could_win_straight?("x","horozontally",board) 
		expect(answer).to eql([0,1])			
	end

	it "should return false if can't win horozontally" do
		board = [["x","o","o"],
		 		 ["o","x","_"],
		 		 ["x","o","x"]]
		answer = could_win_straight?("x","horozontally",board) 
		expect(answer).to eql(false)			
	end
end		

describe "#could_win_diagonally?" do
	
	it "should work diagonally left" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","o"]]
		answer = could_win_diagonally?("x","diagonal-left",board) 
		expect(answer).to eql([1,1])			
	end

	it "should return false if can't win diagonally left" do
		board = [["_","o","o"],
		 		 ["o","_","_"],
		 		 ["x","_","x"]]
		answer = could_win_diagonally?("x","diagonal-left",board) 
		expect(answer).to eql(false)			
	end

	it "should work diagonally right" do
		board = [["o","_","x"],
		 		 ["o","o","_"],
		 		 ["x","_","_"]]
		answer = could_win_diagonally?("o","diagonal-right",board) 
		expect(answer).to eql([2,2])				
	end	

	it "should return false if can't win diagonally right" do
		board = [["_","o","o"],
		 		 ["o","o","_"],
		 		 ["x","_","x"]]
		answer = could_win_diagonally?("x","diagonal-right",board) 
		expect(answer).to eql(false)			
	end		
end	

describe "#could_win?" do
	it "should work properly" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","_"]]

		expect(could_win?("x",board)).not_to  eql(false)
		expect(could_win?("o",board)).to  eql(false) 		 		
	end
end
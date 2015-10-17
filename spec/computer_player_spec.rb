require 'spec_helper'

describe "#could_win_straight?" do
	
	it "should work vertically " do
		board = [["x","o","x"],
		 		 ["_","x","_"],
		 		 ["x","_","o"]]
		answer = could_win_straight?("x","_","vertically",board) 
		expect(answer).to eql([1,0])		 
	end

	it "should return false if can't win vertically" do
		board = [["_","o","o"],
		 		 ["o","x","_"],
		 		 ["x","_","x"]]
		answer = could_win_straight?("x","_","vertically",board) 
		expect(answer).to eql(false)			
	end

	it "should work horozontally " do
		board = [["x","_","x"],
		 		 ["_","x","_"],
		 		 ["x","_","o"]]
		answer = could_win_straight?("x","_","horozontally",board) 
		expect(answer).to eql([0,1])			
	end

	it "should return false if can't win horozontally" do
		board = [["x","o","o"],
		 		 ["o","x","_"],
		 		 ["x","o","x"]]
		answer = could_win_straight?("x","_","horozontally",board) 
		expect(answer).to eql(false)			
	end
end		

describe "#could_win_diagonally?" do
	
	it "should work diagonally left" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","o"]]
		answer = could_win_diagonally?("x","_","diagonal-left",board) 
		expect(answer).to eql([1,1])			
	end

	it "should return false if can't win diagonally left" do
		board = [["_","o","o"],
		 		 ["o","_","_"],
		 		 ["x","_","x"]]
		answer = could_win_diagonally?("x","_","diagonal-left",board) 
		expect(answer).to eql(false)			
	end

	it "should work diagonally right" do
		board = [["o","_","x"],
		 		 ["o","o","_"],
		 		 ["x","_","_"]]
		answer = could_win_diagonally?("o","_","diagonal-right",board) 
		expect(answer).to eql([2,2])				
	end	

	it "should return false if can't win diagonally right" do
		board = [["_","o","o"],
		 		 ["o","o","_"],
		 		 ["x","_","x"]]
		answer = could_win_diagonally?("x","_","diagonal-right",board) 
		expect(answer).to eql(false)			
	end		
end	

describe "#could_win?" do
	it "should work properly" do
		board = [["o","_","x"],
		 		 ["o","_","_"],
		 		 ["x","_","_"]]

		expect(could_win?("x","_",board)).not_to  eql(false)
		expect(could_win?("o","_",board)).to  eql(false) 		 		
	end
end

describe "#be_aggressive" do
	it "should return a vacant space on opponents axis" do
		board = [["_","x","_"],
		 		 ["_","o","x"],
		 		 ["_","_","_"]]	

		choice = be_aggressive("x","_",board)
		expect(choice).not_to  eql(false)
		expect(choice).not_to  eql(nil)		 	
	end
end

describe "#check_for" do
	it "should describe a win as a 3 set of characters that aren't the placeholder" do
		player = "x"; placeholder = "_"; 
		set = ["x","x","x"]; set_index = [[0,0],[0,1],[0,2]]; 
		length = 3; type = "win"
		check = check_for(player,placeholder,set,set_index,length,type)

		expect(check).to  eql(true)
	end

end





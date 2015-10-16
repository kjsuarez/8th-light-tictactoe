require 'spec_helper'

describe "smoke test" do

  it 'should pass' do
	x = true
	expect(x).to eql(true)
  end	
end

describe Board do
	it "should pass" do
		placeholder = ""
		board = Board.new(placeholder)
		x = board.smoke_test
		expect(x).to eql(true)
	end
end
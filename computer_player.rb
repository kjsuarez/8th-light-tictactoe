require_relative "game_helper"
require_relative "computer_player"

def check_for(player,set,set_index,length,type=nil) # tested
	if type == "win"
		if (count_element(player,set)==(length)&&set.include?("_") == false)
			answer = true
		end
		return answer
	else
		if (count_element(player,set)==(length-1)&&set.include?("_"))
			index = set.index("_")
			answer = set_index[index] 
		end	
		return answer
	end
end

def could_win_diagonally?(player,how,board,type = nil) # tested
	answer = false
	length = board.length
	set = []
	set_index = []	
	length.times do |n|
		if how == "diagonal-left"
			set<<board[n][-(n+1)]
			set_index<<[n,length-(n+1)]
		elsif how == "diagonal-right"
			set<<board[n][n]
			set_index<<[n,n]
		else
			return "attribute error in #could_win_diagonally"
		end	
	end	
	if type == "win"
		if (check_for(player,set,set_index,length,type)) != nil
			answer = check_for(player,set,set_index,length,type)  # returns [player,set_index[index]] or false
		end					
	else
		if (check_for(player,set,set_index,length)) != nil
			answer = check_for(player,set,set_index,length)  # returns [player,set_index[index]] or false
		end	
	end

	return answer		
end

def could_win_straight?(player,how,board,type=nil) # tested
	answer = false
	length = board.length
	length.times do |x|
		set = []
		set_index = []
	
		length.times do |y|
			if how == "vertically"
				set<<board[y][x]
				set_index<<[y,x]
			elsif how == "horozontally"
				set<<board[x][y]
				set_index<<[x,y]	
			else
				return "bad parameter in #could_win"
			end			
			
			if type == "win"
				if (check_for(player,set,set_index,length,type)) != nil
					answer = check_for(player,set,set_index,length,type)  # returns [player,set_index[index]] or false
				end
			else
				if (check_for(player,set,set_index,length)) != nil
					answer = check_for(player,set,set_index,length)  # returns [player,set_index[index]] or false
				end	
			end		
		end	
	end	
	return answer		
end

def could_win?(player,board, type=nil)
	if could_win_straight?(player,"vertically",board,type) != false
		return could_win_straight?(player,"vertically",board,type)
	elsif could_win_straight?(player,"horozontally",board,type) != false
		return could_win_straight?(player,"horozontally",board,type)
	elsif could_win_diagonally?(player,"diagonal-left",board,type) != false
		return could_win_diagonally?(player,"diagonal-left",board,type)
	elsif could_win_diagonally?(player,"diagonal-right",board,type) != false
		return could_win_diagonally?(player,"diagonal-right",board,type)	
	else
		return false
	end
end

def won?(player,board)
	return could_win?(player,board,type = "win")
end

def next_available_space(board)
	length = board.length
	available_spaces = []
	length.times do |x|
		length.times do |y|
			if board[y][x] == "_"
				available_spaces << [y,x]
			end
		end
	end	
	available_spaces.shuffle!
	return available_spaces[0]	
end

def center_available?(board)
	length = board.length
	if length%2 != 0
		if board[length/2][length/2] == "_"
			return true	
		else 
			return false
		end		
	else
		return false
	end
end

def sides_available(board)
	length = board.length
	cell_array = []
	length.times do |y|
		length.times do |x|
			if (board[y][x] == "_")&&([y,x]!=[0,0]&&[y,x]!=[0,length-1]&&[y,x]!=[length-1,0]&&[y,x]!=[length-1,length-1]) 
				cell_array << [y,x]
			end
		end
	end
	return cell_array
end








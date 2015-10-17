require_relative "game_helper"
require_relative "computer_player"

def check_for(player,placeholder,set,set_index,length,type=nil) # tested
	if type == "win"
		if (count_element(player,set)==(length)&&set.include?(placeholder) == false)
			answer = true
		end
		return answer
	elsif type == "aggressive"
		if (count_element(player,set)>(0)&&set.include?(placeholder) == true)
			index = set.index(placeholder)
			answer = set_index[index]
		end
		return answer	
	else
		if (count_element(player,set)==(length-1)&&set.include?(placeholder))
			index = set.index(placeholder)
			answer = set_index[index] 
		end	
		return answer
	end
end

def could_win_diagonally?(player,placeholder,how,board,type = nil) # tested
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
		if (check_for(player,placeholder,set,set_index,length,type)) != nil
			answer = check_for(player,placeholder,set,set_index,length,type)  # returns [player,set_index[index]] or false
		end						
	else
		if (check_for(player,placeholder,set,set_index,length)) != nil
			answer = check_for(player,placeholder,set,set_index,length)  # returns [player,set_index[index]] or false
		end	
	end

	return answer		
end

def could_win_straight?(player,placeholder,how,board,type=nil) # tested
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
			
			if type == "win"||type =="aggressive"
				if (check_for(player,placeholder,set,set_index,length,type)) != nil
					answer = check_for(player,placeholder,set,set_index,length,type)  # returns [player,set_index[index]] or false
				end					
			else
				if (check_for(player,placeholder,set,set_index,length)) != nil
					answer = check_for(player,placeholder,set,set_index,length)  # returns [player,set_index[index]] or false
				end	
			end		
		end	
	end	
	return answer		
end

def could_win?(player,placeholder,board, type=nil)
	vertical = could_win_straight?(player,placeholder,"vertically",board,type)
	horozontal = could_win_straight?(player,placeholder,"horozontally",board,type) 
	diagonal_left = could_win_diagonally?(player,placeholder,"diagonal-left",board,type)
	diagonal_right = could_win_diagonally?(player,placeholder,"diagonal-right",board,type)

	if vertical != false
		return vertical
	elsif horozontal != false
		return horozontal
	elsif diagonal_left != false
		return diagonal_left
	elsif diagonal_right != false
		return diagonal_right	
	else
		return false
	end
end

def be_aggressive(player,placeholder,board)
	vertical = could_win_straight?(player,placeholder,"vertically",board,"aggressive")
	horozontal = could_win_straight?(player,placeholder,"horozontally",board,"aggressive")	
	if vertical != false
		return vertical
	elsif horozontal != false
		return horozontal
	else
		return false
	end		
end

def won?(player,placeholder,board)
	return could_win?(player,placeholder,board,type = "win")
end

def next_available_space(board,placeholder)
	length = board.length
	available_spaces = []
	length.times do |x|
		length.times do |y|
			if board[y][x] == placeholder
				available_spaces << [y,x]
			end
		end
	end	
	available_spaces.shuffle!
	return available_spaces[0]	
end

def center_available?(board,placeholder)
	length = board.length
	if length%2 != 0
		if board[length/2][length/2] == placeholder
			return true	
		else 
			return false
		end		
	else
		return false
	end
end

def corners_available(board,placeholder)
	length = board.length
	cell_array = []
	length.times do |y|
		length.times do |x|
			if (board[y][x] == placeholder)&&([y,x]==[0,0]||[y,x]==[0,length-1]||[y,x]==[length-1,0]||[y,x]==[length-1,length-1]) 
				cell_array << [y,x]
			end
		end
	end
	return cell_array
end

def make_decision(player_1,player_2,placeholder,board,turn)
	length = board.length
	win_move = could_win?(player_2,placeholder,board)
	intercept_move = could_win?(player_1,placeholder,board)
	if win_move # computer can win this turn
		move = win_move
		board = make_move(board,player_2,move) # make winning move
	elsif intercept_move # computer can intercept winning move
		move = intercept_move
		board = make_move(board,player_2,move)# make intercept
	elsif center_available?(board,placeholder) # if center if available
		board = make_move(board,player_2,[length/2,length/2]) # take it
	elsif corners_available(board,placeholder)!=false&& turn == 2 # if corners are available
		move = 	corners_available(board,placeholder).shuffle![0]
		board = make_move(board,player_2,move)		# take one
	elsif be_aggressive(player_1,placeholder,board)# can make move on the same axis as opponent
		move = be_aggressive(player_1,placeholder,board)	
		board = make_move(board,player_2,move)	
	else
		move = next_available_space(board)# take next available space
		board = make_move(board,player_2,move)
	end
	return board	
end






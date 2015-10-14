require_relative "game_helper"
require_relative "computer_player"

def check_colomns(board,type,player)

	if type == "win"
		won = [false]
		length = board.length
		
		length.times do |x|
			check = []
			length.times do |y|
				
				check<<board[y][x]
			end	
			if ((check[0]!="_")&&(check[0]==check[1] && check[1]==check[2]))
				won = [true,check[0]]
			end
		end	
		return won

	elsif type == "could_win"
		answer = [false]
		length = board.length
		length.times do |x|
			check = []
			check_index = []
			length.times do |y|
				check<<board[y][x]
				check_index<<[y,x]
				if player == "x"
					if (count_element("x",check)==2&&check.include?("_"))
						index = check.index("_")
						answer = [true,check_index[index]]	 
					end
				elsif player == "o"
					if (count_element("o",check)==2&&check.include?("_"))
						index = check.index("_")
						answer = [true,check_index[index]] 
					end		
				end
			end	
		end	

		return answer
	else
		return "error"	
	end
end


def check_rows(board,type,player)
	if type == "win"
		won = [false]
		length = board.length
		
		length.times do |x|
			check = []
			length.times do |y|
				
				check<<board[x][y]
			end	
			if ((check[0]!="_")&&(check[0]==check[1] && check[1]==check[2]))
				won = [true,check[0]]
			end
		end	
		return won

	elsif type == "could_win"
		length = board.length
		check = []
		check_index = []
		answer = [false]
		length = board.length
		length.times do |x|
			check = []
			check_index = []
			length.times do |y|
				check<<board[x][y]
				check_index<<[x,y]
			
				if player == "x"
					if (count_element("x",check)==2&&check.include?("_"))
						index = check.index("_")
						answer = [true,check_index[index]] 
					end	
				elsif player == "o"
					if (count_element("o",check)==2&&check.include?("_"))
						index = check.index("_")
						answer = [true,check_index[index]]	 
					end		
				end
			end	
		end	
		return answer
	else
		return "error"	
	end

end

def check_diagonals(board,type, player)
	if type == "win"
		if ((board[0][0]!="_")&&(board[0][0]==board[1][1] && board[1][1]==board[2][2]))
			return [true,board[0][0]]
		elsif ((board[0][2]!="_")&&(board[0][2]==board[1][1] && board[1][1]==board[2][0]))
			
			return [true,board[0][0]]
		else
			return [false]		
		end	

	elsif type == "could_win"
		check1 = [board[0][0],board[1][1],board[2][2]]
		check2 = [board[0][2],board[1][1],board[2][0]]
		if player == "x"
			if (count_element("x",check1)==2&&check1.include?("_"))
				index = check1.index("_")
				if index == 0
					return [true,[0,0]]
				elsif index == 1
					return [true,[1,1]]
				elsif index == 2
					return [true,[2,2]]
				else			
					return "error"
				end
			
			elsif (count_element("x",check2)==2&&check2.include?("_"))
				index = check2.index("_")
				if index == 0
					return [true,[0,2]]
				elsif index == 1
					return [true,[1,1]]
				elsif index == 2
					return [true,[2,0]]
				else			
					return "error"
				end
			else 
				return [false]
			end	

		elsif player == "o"
			if (count_element("o",check1)==2&&check1.include?("_"))
				index = check1.index("_")
				if index == 0
					return [true,[0,0]]
				elsif index == 1
					return [true,[1,1]]
				elsif index == 2
					return [true,[2,2]]
				else			
					return "error"
				end
				
			elsif (count_element("o",check2)==2&&check2.include?("_"))
				index = check2.index("_")
				if index == 0
					return [true,[0,2]]
				elsif index == 1
					return [true,[1,1]]
				elsif index == 2
					return [true,[2,0]]
				else			
					return "error"
				end	
				
			else
				return [false]		
			end						
		else
			
		end		
	else
		
	end

end

def could_win?(board, player)

	check_diagonals(board,"could_win",player)
	if check_diagonals(board,"could_win",player)[0]
		return check_diagonals(board,"could_win",player)[1]

	elsif check_colomns(board,"could_win",player)[0]
		return check_colomns(board,"could_win",player)[1]

	elsif check_rows(board,"could_win",player)[0]
		return check_rows(board,"could_win",player)[1]
				
	else
		return [false]
	end
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
	if board[1][1] == "_"
		return true	
	else 
		return false
	end	
end
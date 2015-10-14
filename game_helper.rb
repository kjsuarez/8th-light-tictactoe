require_relative "game_helper"

def count_element(element,array)
	counts = Hash.new 0
	array.each do |el|
 		counts[el] += 1
	end
	return counts[element]
end


def print_board(board)
 	print "#{board[0]}\n"
 	print "#{board[1]}\n"
 	print "#{board[2]}\n"
end 

def blank_board()
	return [["_","_","_"],
			["_","_","_"],
			["_","_","_"]];
end

def moves_left(board)
	count = 0
	array = board.flatten
	array.each do |cell|
		if cell == "_"
			count +=1
		end
	end
	return count
end

def game_won?(board)
	won = false
	won = check_colomns(board,"win",nil)||check_rows(board,"win",nil)||check_diagonals(board,"win",nil)               
	return won
end


def legal?(board,y,x)
	if board[y][x] == "_"
		return true
	else
		puts "that's an illegal move"
		return false
	end
end

def get_players_move(board)
	legal = false
	while legal == false
		answer = gets.strip.downcase
		responce = []
		if answer == "up"||answer == "u"
			responce = [0,1]; legal = legal?(board,0,1)
		elsif answer == "center"||answer == "c"
			responce = [1,1]; legal = legal?(board,1,1)		
		elsif answer == "down"||answer == "d"
			responce = [2,1]; legal = legal?(board,2,1)
		elsif answer == "left"||answer == "l"
			responce = [1,0]; legal = legal?(board,1,0)
		elsif answer == "right"||answer == "r"
			responce = [1,2]; legal = legal?(board,1,2)
		elsif answer == "up right"||answer == "ur"||answer == "right up"||answer == "ru"
			responce = [0,2]; legal = legal?(board,0,2)
		elsif answer == "up left"||answer == "ul"||answer == "left up"||answer == "lu"
			responce = [0,0]; legal = legal?(board,0,0)
		elsif answer == "down right"||answer == "dr"||answer == "right down"||answer == "rd"
			responce = [2,2]; legal = legal?(board,2,2)
		elsif answer == "down left"||answer == "dl"||answer == "left down"||answer == "ld"
			responce = [2,0]; legal = legal?(board,2,0)													
		else
			puts "I'm sorry that's not a recognized responce, try again"
		end
	end
	return responce
end

def make_move(board, player, space)
	x = space[1]; y = space[0]
	board[y][x] = player
	return board
end

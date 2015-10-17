require_relative "game_helper"

def count_element(element,array) # returns the number of times an element is in an array
	counts = Hash.new 0
	array.each do |el|
 		counts[el] += 1
	end
	return counts[element]
end


def print_board(board) 	# prints the current board to the console
 	board.length.times do |count|
 		print "\n"
 		board.length.times do |count2|
 			print "| #{board[count][count2]} "
 		end
 		print " |\n"
 	end
 	return true
end 

def generate_board(length,placeholder) # tested
	board = []
	length.times do |n|
		row = []
		length.times do |m|
			row << placeholder.to_s
		end
		board << row
	end
	return board
end

def safe_value?(coords,board,placeholder) # tested
	y = coords[0]; x = coords[1]
	if x>=board.length&&y>=board.length
		return false
	elsif coords.length == 2 &&
		coords[0] < board.length &&
		coords[0] >= 0 &&
		coords[1] < board.length &&
		coords[1] >= 0 &&board[y][x] == placeholder
		return true
	elsif x<board.length&&y<board.length&&
		board[y][x] != placeholder
		puts "that is an illegal move"
		return false		
	else
		puts "that is not a recognized move"
		return false	
	end	
end

def get_players_move(board,placeholder) # figure out how to test STDIN
	legal = false
	while legal == false
		answer = gets.strip.split(','); coords = []
		answer.each do |el|
			coords << el.to_i
		end
		legal = safe_value?(coords,board,placeholder)		
	end
	return coords
end

def make_move(board, player, cell) # tested
	x = cell[1]; y = cell[0]
	board[y][x] = player
	return board
end

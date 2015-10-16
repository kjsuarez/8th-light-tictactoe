require_relative "game_helper"
require_relative "computer_player"

class Board
	attr_accessor :board
	def initialize(board)
		@board = board
	end

	def smoke_test
		return true			
	end	

	# won?


	# make move()

end


def play_tic_tac_toe
	turn = 1;
	length = 3
	board = generate_board(length,"_")
	print_board(board) # refactor
	while (turn<=9 && !won?("x",board)&& !won?("o",board))
		puts "player's turn"
		puts "turn: #{turn}"
		if turn%2 != 0 	# if turn is odd 		# players turn
			move = get_players_move(board);
			board = make_move(board,"x",move)
			turn+=1
			print_board(board)
		end
		puts "bot's turn"
		puts "turn: #{turn}"
		if (turn<9 && !won?("x",board)&& !won?("o",board))# if there are moves left 
												# and the game hasn't been won #computers turn
			# computer takes turn; 
			win_move = could_win?("o",board)
			intercept_move = could_win?("x",board)
			if win_move
				move = win_move
				board = make_move(board,"o",move)
			elsif intercept_move
				move = intercept_move
				board = make_move(board,"o",move)
			elsif center_available?(board) # if center if available
				board = make_move(board,"o",[length/2,length/2])
			elsif sides_available(board)!=false&& turn == 2
				move = 	sides_available(board).shuffle![0]
				board = make_move(board,"o",move)						
			else
				move = next_available_space(board)# take next available space
				board = make_move(board,"o",move)
			end
			turn+=1
			print_board(board)
		end
	end
	if turn == 10 && !won?("x",board)&& !won?("o",board)
		puts "cats game"
	elsif won?("x",board)
		puts "you win!"
	elsif won?("o",board)
		puts "better luck next time"
	else
		puts "there was an error in win calculation"			
	end	
end



require_relative "game_helper"
require_relative "computer_player"

def play_tic_tac_toe
	turn = 1;
	board = blank_board
	print_board(board)
	while (turn<=9 && !game_won?(board)[0])
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
		if (turn<9 && !game_won?(board)[0])# if there are moves left 
												# and the game hasn't been won #computers turn
			# computer takes turn; 
			win_move = could_win?(board, "o")
			intercept_move = could_win?(board,"x")
			if win_move[0]
				move = win_move
				board = make_move(board,"o",move)
			elsif intercept_move[0]
				move = intercept_move
				board = make_move(board,"o",move)
			elsif center_available?(board) # if center if available
				board = make_move(board,"o",[1,1])		
			else
				move = next_available_space(board)# take next available space
				board = make_move(board,"o",move)
			end
			turn+=1
			print_board(board)
		end
	end
	if turn == 10 && !game_won?(board)[0]
		puts "cats game"
	elsif turn%2 == 0
		puts "you win!"
	else
		puts "better luck next time"		
	end	
end

play_tic_tac_toe

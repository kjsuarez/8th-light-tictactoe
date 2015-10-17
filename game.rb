require_relative "game_helper"
require_relative "computer_player"

def example_board(length)
 	length.times do |count|
 		print "\n"
 		length.times do |count2|
 			print "| #{count},#{count2} "
 		end
 		print " |\n"
 	end
 	return true
end

def play_tic_tac_toe
	player_1 = "x"
	player_2 = "o"
	blank = "_"
	turn = 1;
	length = 3
	board = generate_board(length,blank)
	print "Welcome to Tic Tac Toe!\n"
	print "you can make moves by inputing a pair of numbers\n"
	print "those numbers correspond to these axis:\n"
	example_board(length)
	puts "\nok good luck!"
	print_board(board) # refactor

	while (turn<=9 && !won?(player_1,blank,board)&& !won?(player_2,blank,board))
		puts "your turn"
		if turn%2 != 0 	# if turn is odd 		# players turn
			move = get_players_move(board);
			board = make_move(board,player_1,move)
			turn+=1
			print_board(board)
		end

		puts "bot's turn"
		puts "turn: #{turn}"
		if (turn<9 && !won?(player_1,blank,board)&& !won?(player_2,blank,board))# if there are moves left 
												# and the game hasn't been won #computers turn
			# computer takes turn; 
			board = make_decision(player_1,player_2,blank,board,turn)
			turn+=1
			print_board(board)
		end
	end
	if turn == 10 && !won?(player_1,blank,board)&& !won?(player_2,blank,board)
		puts "cats game"
	elsif won?(player_1,blank,board)
		puts "you win!"
	elsif won?(player_2,blank,board)
		puts "better luck next time"
	else
		puts "there was an error in win calculation"			
	end	
end


#play_tic_tac_toe

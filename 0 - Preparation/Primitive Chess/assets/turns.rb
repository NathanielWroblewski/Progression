def white_turn
  printboard
  @initial_valid = false
  #check for check/checkmate
  until @initial_valid == true
    @last_move = "black"
    puts "\n"
    puts "White to move."
    puts "Initial position?"
    @initial_position = gets.chomp
    @initial_rank = @initial_position.scan(/\d/).join
    @initial_file = @initial_position.downcase.scan(/[a-h]{1}/).join
    @initial_valid = valid_piece?
    snag_piece_type
    puts "\n"
  end
  #@terminal_valid = false
  #unless @terminal_valid == true
    puts "Terminal position?"
    @terminal_position = gets.chomp
    @terminal_rank = @terminal_position.scan(/\d/).join
    @terminal_file = @terminal_position.downcase.scan(/[a-h]{1}/).join
  #  @terminal_valid = valid_move?
    puts "\n"
  #end
  reckless_move
end

def black_turn
  printboard
  @initial_valid = false
  #check for check/checkmate
  until @initial_valid == true
    @last_move = "white"
    puts "\n"
    puts "Black to move."
    puts "Initial position?"
    @initial_position = gets.chomp
    @initial_rank = @initial_position.scan(/\d/).join
    @initial_file = @initial_position.downcase.scan(/[a-h]{1}/).join
    @initial_valid = valid_piece?
    snag_piece_type
    puts "\n"
  end
  #@terminal_valid = false
  #unless @terminal_valid == true
    puts "Terminal position?"
    @terminal_position = gets.chomp
    @terminal_rank = @terminal_position.scan(/\d/).join
    @terminal_file = @terminal_position.downcase.scan(/[a-h]{1}/).join
  #  @terminal_valid = valid_move?
    puts "\n"
  #end
  reckless_move
end
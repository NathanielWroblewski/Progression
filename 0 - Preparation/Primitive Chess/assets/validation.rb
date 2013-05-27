def snag_piece_type
  @all_squares.each do |hash|
    @snagged_piece = hash[:piece] if hash[:rank] == @initial_rank && hash[:file] == @initial_file
  end
end

def valid_piece?
  @all_squares.each do |hash|
      if hash[:piece] == "_" && hash[:rank] == @initial_rank && hash[:file] == @initial_file
        puts "\n"
        puts "***Invalid move.  There is no piece to move.***"
        @initial_valid = false
      elsif @last_move == "black" && hash[:piece] == hash[:piece].upcase && hash[:rank] == @initial_rank && hash[:file] == @initial_file
        @initial_valid = true
      elsif @last_move == "white" && hash[:piece] == hash[:piece].downcase && hash[:rank] == @initial_rank && hash[:file] == @initial_file
        @initial_valid = true
      elsif @last_move == "black" && hash[:piece] == hash[:piece].downcase && hash[:rank] == @initial_rank && hash[:file] == @initial_file
        puts "\n"
        puts "***Invalid move.  You cannot move your opponent's piece.***"
        @initial_valid = false
      elsif @last_move == "white" && hash[:piece] == hash[:piece].upcase && hash[:rank] == @initial_rank && hash[:file] == @initial_file
        puts "\n"
        puts "***Invalid move.  You cannot move your opponent's piece.***"
        @initial_valid = false
      else
      end
    end
  @initial_valid
end

#def valid_move?
  #@all_squares.each do |hash|
    #Check initial position's piece first
    #Then check how that piece can move
    #Then check if its landing on its own piece
    #Then check if a piece is in its way
    #Consider check
    #Consider checkmate
    #If check, consider blocking check
    #Castling
    #EnPassant

    #case snagged_piece
    #when "R"
    #when "r"
    #when "N"
    #when "n"
    #when "B"
    #when "b"
    #when "Q"
    #when "q"
    #when "K"
    #when "k"
    #when "P"
      #if @initial_rank == "2" && ( @terminal_rank == "3" || @terminal_rank == "4" ) && @initial_file == @terminal_file && hash[:piece] == "_"
        #@terminal_valid = true
      #elsif @initial_file == @terminal_file && @terminal_rank == @initial_rank.next && hash[:piece] == "_"
        #@terminal_valid = true
      #elsif attacking
        #@terminal_valid = true
      #else
        #terminal_valid = false
    #when "p"
    #else
    #end
    #end
    #@terminal_valid
    #end
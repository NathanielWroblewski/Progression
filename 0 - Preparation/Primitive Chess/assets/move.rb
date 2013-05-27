def reckless_move
  @all_squares.each do |hash|
    hash[:piece] = @snagged_piece if hash[:rank] == @terminal_rank && hash[:file] == @terminal_file
  end
  @all_squares.each do |hash|
    hash[:piece] = "_" if hash[:rank] == @initial_rank && hash[:file] == @initial_file
  end
end
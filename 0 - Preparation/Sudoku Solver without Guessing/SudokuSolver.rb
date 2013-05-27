class SudokuSolver

  def initialize(input)
    @input = input.split(//)
  end

  def generate_coordinates
    letters = "A".upto("I").to_a
    numbers = 1.upto(9).to_a
    @coordinates = []
    @box_letters = ["ABC","DEF","GHI"]
    @box_numbers = ["123","456","789"]

    numbers.each do |num|
      letters.each do |letter|
        @coordinates << letter + num.to_s
      end
    end
  end

  def spawn_cells
    @cell_array = []
    keys = [:coordinate, :value]
    values = @coordinates.zip(@input).flatten
    @cell_array = values.each_slice(2).map { |value| Hash[keys.zip(value)]}
    
    @cell_array.each do |hash|
      hash[:value] != "0" ? hash[:possibilities] = hash[:value] : hash[:possibilities] = %w{1 2 3 4 5 6 7 8 9}
    end
  end

  def check_row_column
    @cell_array.each do |hash|
      if hash[:value] == "0"
        row_letter = hash[:coordinate][0]
        column_number = hash[:coordinate][1]
        @cell_array.each do |hashes|
  	  hash[:possibilities].delete(hashes[:value]) if hashes[:coordinate][0] == row_letter || hashes[:coordinate][1] == column_number
        end
      update_values(hash)
      else
      end
    end
  end

  def check_boxes
    @cell_array.each do |hash|
      if hash[:value] == "0"
        letter_index = @box_letters.index { |i| i.include?(hash[:coordinate][0])}
        number_index = @box_numbers.index { |i| i.include?(hash[:coordinate][1])}
        @cell_array.each do |hashes|
      	  hash[:possibilities].delete(hashes[:value]) if @box_letters[letter_index].include?(hashes[:coordinate][0]) && @box_numbers[number_index].include?(hashes[:coordinate][1])
        end
        update_values(hash)
      else
      end
    end
  end

  def print_board
    i = 1
    puzzle_dimension = Math.sqrt(@input.length).to_i
    box_dimension = Math.sqrt(puzzle_dimension).to_i
    @cell_array.each do |hash|
      if hash[:coordinate][0] == "A" && hash[:coordinate][1].to_i % box_dimension == 1
        puts "\n----------------------"
      elsif i % puzzle_dimension == 1
        print "\n"
      elsif i % box_dimension == 1
        print "| "
      else
      end
      print "#{hash[:value]} "
      i += 1
    end
    puts "\n----------------------\n\n"
  end

  def solved?
    @cell_array.each do |hash|
      if hash.has_value?("0")
      	@solved = false
      	break
      else
      	@solved = true
      end
    end
    @solved
  end

  def update_values(hash)
    condition_met = hash[:value] == "0" && hash[:possibilities].length == 1
    hash[:value] = hash[:possibilities][0] if condition_met
    hash[:possibilities] = hash[:possibilities].join if condition_met
  end

  def run
    i = Time.now
    generate_coordinates
    spawn_cells
    iterations = 0
    until solved?
      check_row_column
      check_boxes unless solved?
      iterations += 1
    end
    f = Time.now
    print_board
    puts "Number of iterations required: #{iterations.to_s}"
    puts "Time taken to solve: #{f - i} seconds\n\n"
  end
end

solver = SudokuSolver.new("700100305000000407021005060000020603600903004309010000060800530207000000105004002")
solver.run

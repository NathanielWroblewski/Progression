# By the end of the next two challenges you'll have a fully-functioning Sudoku solver that you can run from the command line.

# Sudoku is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called "boxes") contains all of the digits from 1 to 9.

# The person who created the puzzle provides a partial solution so that some squares already have numbers. Typically, there are enough initial numbers to guarantee a unique solution.

   

# For the first iteration, we're just going build a solver that fills in "logically necessary" squares and requires no guessing.

# Learning Goals
# Breath: we know this is the hardest challenge you've hit yet. When in doubt, take a step back and reflect on how you or someone else plays Sudoku and don't get "stuck" in the code.

# Your goal here is to learn how to model a relatively complex real-world system — a person solving Sudoku. You'll learn the importance of well-encapsulated code and use some basic object-oriented design.

# Objectives
# Modeling: Write down the nouns and verbs of the game
# Think carefully about all the nouns and verbs in a Sudoku game. There's the person who created the puzzle (the setter). There's the person who is solving the puzzle (the player). What are the important parts of the board called? How do the player and setting interact with them?

# A computer program that solves Sudoku is simulating the player, which means the better you can empathize with the player the more likely you'll understand how to write a Sudoky solver. You'll be tempted to focus on the board first — is it some kind of array, a hash, something else? — but don't! Understanding the person playing the game is key; the code to "power" the board is a detail.

# Modeling: Strategies for Humans
# Get out an actual Sudoku puzzle, printed on a piece of paper. Play it with your pair. Pay attention to yourself and to each other.

# What strategies are you adopting and why?
# How do you choose where to start?
# How do you know when to really put a number in a cell?
# Did you adopt the same notation/board markings while playing Sudoku? Why? If not, why did you choose differently?
# Are you avoiding any strategies because they're too tedious or require you to remember too much?
# It's important to see that sometimes the strategies that work for us (humans) would be really hard to implement on a computer, and vice versa: strategies we avoid because we'd have to write too much, use too many sheets of paper, or remember too much are a cakewalk for a computer.

# Modeling: Pseudocode for First Iteration
# Remember, for the first iteration, we're just going build a solver that fills in "logically necessary" squares and requires no guessing. This might not solve every Sudoku board, although it often solves the easiest. How can you tell when you've filled in all the "logically necessary" squares?

# Write out pseudocode for this version, separately, and compare it to each other. How does it differ? Which approach seems more sound? Are there some core operations or methods you need to support?

# For example, given a cell/square, you'll probably need at least three methods:

# Give me the other cells in that cell's row.
# Give me the other cells in that cell's column.
# Give me the other cells in that cell's box.
# Ruby: Now code it!
# Your Sudoku solver should take a string like this as its input:

# 619030040270061008000047621486302079000014580031009060005720806320106057160400030
# Each consecutive 9 digits represents a row of the Sudoku board, and a 0 represents an empty cell. It'd work like this:

# game = Sudoku.new('003020600900305001001806400008102900700000008006708200002609500800203009005010300')

# game.solve!

# puts game.board
# This would print something like this:

# ---------------------
# 4 8 3 | 9 2 1 | 6 5 7
# 9 6 7 | 3 4 5 | 8 2 1
# 2 5 1 | 8 7 6 | 4 9 3
# ---------------------
# 5 4 8 | 1 3 2 | 9 7 6
# 7 2 9 | 5 6 4 | 1 3 8
# 1 3 6 | 7 9 8 | 2 4 5
# ---------------------
# 3 7 2 | 6 8 9 | 5 1 4
# 8 1 4 | 2 5 3 | 7 6 9
# 6 9 5 | 4 1 7 | 3 8 2
# ---------------------
# Again, note, this first iteration might not solve every possible Sudoku board. This means it would finish when it can no longer make a choice and "give up." We'll create the fully-featured version in the next challenge.

# Don't worry about the particular format of the board when printed. The key thing is getting the logic around solving/guessing correctly.

# What about performance?

# Do not worry about performance yet! Optimizations can come later. Clean, logical code is more important and will be easier to refactor.

DIGITS = "123456789".split(//)
LETTERS = "ABCDEFGHI".split(//)
class Puzzle
  def initialize(grid)
    grid.split(//)
    create_units
    create_peers
    @hash = Hash[@coordinates.zip(grid.split(//)).each { |i| i[1] = '123456789' if i[1] == '0'}]
  end
 
  def solve
    i = Time.new # Benchmarking
    iterations = 0 #Benchmarking
 
    until solved?
      iterations += 1
      update
    end
 
    f = Time.new #Benchmarking
    puts "Iterations: #{iterations}" #Benchmarking
    puts "Run time: #{f - i}" #Benchmarking
  end
 
  def print_board
    puts ("-" * 21)
    @hash.each do |k,v|
      print "#{v} "
      print "| " if k[1].to_i % 3 == 0 && k[1] != "9"
      print "\n" if k[1].to_i == 9
      puts ("-" * 21) if k[0] =~ /[CFI]/ && k[1] == "9"
    end
  end
 
  def create_units
    rows = LETTERS.product(DIGITS).map(&:join).each_slice(9).to_a
    columns = DIGITS.product(LETTERS).map { |i| i.join.reverse }.each_slice(9).to_a
    boxes = []
 
    LETTERS.each_slice(3) do |letter|
      DIGITS.each_slice(3) do |digit|
        boxes << letter.product(digit).map {|x| x.join}
      end
    end
 
    @coordinates = rows.flatten
    @units =  (rows + columns + boxes)
    puts; puts;
  end
 
  def create_peers
    @peers = Hash.new([])
    @coordinates.each do |c|
      @units.each do |unit|
        @peers[c] += unit.reject { |elem| elem == c } if unit.include?(c)
        @peers[c].uniq!
      end
    end 
  end
 
  def update
    @hash.each do |coord,possibilities|
        @peers[coord].each { |peer_coord| @hash[peer_coord].sub!(possibilities,'') } if possibilities.length == 1
    end
  end
 
  def solved?
    @hash.all? { |k, v| v.length == 1}
  end
end
 
sudoku = Puzzle.new('096040001100060004504810390007950043030080000405023018010630059059070830003590007')
sudoku.solve
sudoku.print_board

#sample sudokus

# 096040001100060004504810390007950043030080000405023018010630059059070830003590007
# 105802000090076405200400819019007306762083090000061050007600030430020501600308900
# 005030081902850060600004050007402830349760005008300490150087002090000600026049503
# 096040001100060004504810390007950043030080000405023018010630059059070830003590007
# 105802000090076405200400819019007306762083090000061050007600030430020501600308900
# 005030081902850060600004050007402830349760005008300490150087002090000600026049503
# 290500007700000400004738012902003064800050070500067200309004005000080700087005109
# 080020000040500320020309046600090004000640501134050700360004002407230600000700450
# 608730000200000460000064820080005701900618004031000080860200039050000100100456200
# 370000001000700005408061090000010000050090460086002030000000000694005203800149500
# 000689100800000029150000008403000050200005000090240801084700910500000060060410000
# 030500804504200010008009000790806103000005400050000007800000702000704600610300500
# 000075400000000008080190000300001060000000034000068170204000603900000020530200000
# 300000000050703008000028070700000043000000000003904105400300800100040000968000200
# 302609005500730000000000900000940000000000109000057060008500006000000003019082040
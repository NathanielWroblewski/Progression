# Starting with your attempt from the previous iteration of the Sudoku solver, we now want to add the ability to make guessing.

# What happens if a square can contain multiple possible numbers and you don't have enough information to conclude right then and there which number it is?

# Most people who play Sudoku "guess," usually by writing possibilities in the corners of the square.

# Objectives
# Implement a guessing-friendly version of Sudoku
# Once we've filled in all cells which have only one possible value, we have to guess. Write out pseudocode for how that might work before you dive in!

# This solver should now be able to solve any Sudoku puzzle, although some will take a long time. Try it with the sample.unsolved.txt file in the attached gist.

DIGITS = ('1'..'9').to_a
LETTERS = ('A'..'I').to_a
 
class Puzzle
  attr_accessor :hash, :peers
 
  def initialize(grid)
    create_units
    create_peers
    @hash = Hash[@coordinates.zip(grid.split(//)).each { |i| i[1] = '123456789' if i[1] == '0'}]
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
  end
 
  def guess(alternative)
    sqr = @hash.key(@hash.select { |k,v| v.length > 1 }.values.min_by(&:length))
    return false unless (sqr)
    @hash[sqr] = @hash[sqr][0]
    alternative.hash[sqr] = alternative.hash[sqr][1..-1]
    true
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
    old = @hash.values.map { |i| i.dup }
    @hash.each do |sqr, values|
      @peers[sqr].each { |neighbor| @hash[neighbor].delete!(values) } if values.length == 1
    end
    old != @hash.values
  end
 
  def solved?
    @hash.values.all? { |v| v.length == 1}
  end
 
  def contradiction?
    array = []
    @units.each do |unit|
      array = unit.map { |sqr| @hash[sqr] if @hash[sqr].length == 1 }
      return true if array.uniq.length != array.length
      array = []
    end
    false
  end
end
 
puzzle = Puzzle.new('096040001100060004504810390007950043030080000405023018010630059059070830003590007')
 
solutions, alternatives = [],[]
alternatives.push(puzzle)
until alternatives.empty?
  puzzle = Marshal.load(Marshal.dump(alternatives.pop)) 
  simplification_found = true
  while(!puzzle.solved? and simplification_found)
    simplification_found = puzzle.update
    unless simplification_found
      alternative = Marshal.load(Marshal.dump(puzzle))
      simplification_found = puzzle.guess(alternative)
      alternatives.push(alternative) if simplification_found
    end
  end
  if(puzzle.solved? and !puzzle.contradiction?)
    solutions.push(Marshal.load(Marshal.dump(puzzle)))
  end
end
 
solutions.each { |i| i.print_board ; puts}

#unsolved sudokus

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
# Build an interactive command-line game of Battleship! The full rules are on wikipedia, but here's an abridged version from Samuel Bednar:

# Each player has two 10x10 boards with columns labeled 1-10 and rows labeled A-J, one labeled "Your Ships" to represent their own ships and one to represent their opponent's board, labeled "Enemy Ships"
# Each player arranges their ships on their own board (see fleet table)
# Take turns firing a salvo at your opponent, calling out squares as "A3", "B6", etc. Salvo = number of your ships you have left (use counter) / 1 shot.
# Mark salvos fired on the "Enemy Ships" grid (/ marks a miss, i.e. water; X marks a hit). You must call out when your ship is sunk completely.
# # Fleet table

# | #  | Ship             | Size |
# | -- | ---------------- | ---- |
# | 1x | Aircraft carrier | 5    |      
# | 1x | Battleship       | 4    |
# | 1x | Cruiser          | 3    |
# | 2x | Destroyer        | 2    |
# | 2x | Submarine        | 1    |
# Objectives
# Setting up the environment
# User plays against the computer
# When starting a new game, each player should have two empty boards: 'HOME' and 'ENEMY'.
# User should be able to determine the position of ships on their 'HOME' board OR the computer should seed the board with the ships pre-positioned.
# Start with a fleet of just 5 ships, one of each type
# Determining gameplay
# The game starts with user firing a salvo (a series of shots) at their opponent's (the computer's) ships.
# The number of shots in a salvo is equal to the number of unsunk ships in a player's fleet.
# After a salvo is fired, the user is notified of hits and misses on their 'ENEMY' board.
# Winning the game
# The user should be notified when they have sunk one of their opponent's ships.
# When the user has sunk all of their opponent's ships, they win the game.
# Refactoring
# Refactor your code. Some questions to ask yourself:

# Is it DRY?
# Are the methods and variables appropriately named?
# Does it utilize appropriate data structures?
# Is there proper commenting?
# Is it concise and comprehensible?
# Optional features
# Fleet has 7 ships, 2x submarines and destroyers
# User can play against another user
# Computer can play against itself
# Computer is somewhat intelligent (i.e. it knows to cluster shots near a hit until a ship is sunk)

class Board
  attr_accessor :board
 
  def initialize
    board = Array.new(10, " ").map!{ |row| Array.new(10, " ")}
    rows = ("A".."J").to_a
    columns = ["  ", "1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ",  "9 ", "10"]
    @board = board.unshift(rows).each_with_index do |row, i|
      row.unshift(columns[i])
    end
  end
 
  def print_board(board = @board)
    puts "-" * 46
    board.each do |row|
      print "| "
      print row.join(" | ")
      puts " |"
      puts "-" * 46
    end
  end
 
  def add_ship(coords, ship)
    coords.each do |coord|
      @board[coord[0]][coord[1]] = ship[0]
    end
  end
 
  def enemy_board
    ships = %w{s d c b a}
    hide_ships = @board.map do |row|
      row.map do |square|
        ships.include?(square) ? square = " " : square
      end
    end
    print_board(hide_ships)
  end
end
 
class Fleet
  attr_accessor :fleet
 
  def initialize
    @fleet = Hash[ :battleship => 4, :carrier => 5, :submarine => 3, :cruiser => 3, :destroyer => 2 ]
  end
 
  def sunk?(ship)
    @fleet.delete(ship) if @fleet[ship] == 0
  end
 
  def damage_report(ship_class)
    @fleet.each do |ship, health|
      @fleet[ship] = health - 1 if ship_class == ship[0]
      puts sunk?(ship) ? "Ship sunk!" : "Ship hit!"
    end
  end
end
 
class Player
  attr_accessor :fleet, :player_type, :player_board
 
  def initialize(type = "CPU")
    @type = type
    @fleet = Fleet.new
 
    if @type == "Human"
      @player_board = Board.new
      intro
      place_ships
    else
      @player_board = Board.new
      cpu_placement
    end
  end
 
  def intro
    puts "\n" * 240
    puts "WELCOME TO RUBY BATTLESHIP!"
    print "\n\nSelect your difficulty (easy, medium, hard): "
    difficulty = gets.chomp.downcase
    @player_board.print_board
  end
 
  def place_ships
    SHIPS.each do |ship, length|
      loop do
        puts "\nStation your #{ship.to_s}. (#{ship.to_s.capitalize}'s are #{length.to_s} units long.)"
        puts "To do so, enter the most northwestern coordinate pair followed by"
        puts "an orientation. ('H' for horizontal, 'V' for vertical) Example: (A1H)"
        @placement = gets.chomp.upcase
        puts "That location is invalid." unless valid?
        placement_coord(ship)
        puts "Let's try to avoid a collision." unless avail?
        break if valid? == true && avail? == true
      end
      @player_board.add_ship(@coords, ship)
      puts "\n" * 240
      @player_board.print_board
    end
  end
 
  def cpu_placement
    row = ("A".."J").to_a
    orient = %w{ H V }
    SHIPS.each do |ship, length|
      loop do
        @placement = "#{row[rand(10)]}#{rand(10) + 1}#{orient[rand(2)]}"
        placement_coord(ship)
        break if exist? == true && avail? == true
      end
      @player_board.add_ship(@coords, ship)
    end
  end
 
  def valid?
    (@placement =~ (/[A-J]([1-9|10])[HV]/)) != nil ? true : false
  end
 
  def placement_coord(ship, i = 0)
    column, row, orient = parse_placement
    @coords = []
    SHIPS[ship].times do
      @coords << [row + i, column] if orient == "V"
      @coords << [row, column + i] if orient == "H"
      i += 1
    end
    @coords
  end
 
  def exist?
    @coords.each do |coord|
      return false if ((coord[0] > 10) || (coord[1] > 10))
    end
    true
  end
 
  def avail?
    @coords.each do |coord|
      return @player_board.board[coord[0]][coord[1]] != " " ? false : true
    end
  end
 
  def parse_placement
    column_hash = Hash[("A".."J").to_a.zip((1..10).to_a)]
    column = column_hash[@placement[0]]
    orient = @placement.slice(-1)
    row = @placement[1].to_i
    return column, row, orient
  end
 
  def sunk
    @fleet -= 1
  end
end
 
SHIPS = { :battleship => 4, :carrier => 5, :submarine => 3, :cruiser => 3, :destroyer => 2 }
 
class Game
  
  def initialize
    @user = Player.new("Human")
    @cpu = Player.new
    @current, @other = @user, @cpu
 
    loop do
      human_turn
      end_turn
      cpu_turn
      end_turn
    end
  end
 
  def human_turn
    puts "\n" * 240
    puts "\nPrevious targets: \n"
    @other.player_board.enemy_board
    puts "Your fleet: \n"
    @current.player_board.print_board
    loop do
      puts "\nWeapons readied.  #{@current.fleet.fleet.length} ships operational. #{@other.fleet.fleet.length} enemies nearby."
      print "\nEnter target: "
      @attack = gets.chomp.upcase
      puts "Target out of weapon range." unless valid_coord?
      break if valid_coord?
    end
    parse_attack
    @other.player_board.enemy_board
  end
 
  def parse_attack
    column_hash = Hash[("A".."J").to_a.zip((1..10).to_a)]
    column = column_hash[@attack.slice!(0)]
    row = @attack.to_i
    result(column, row)
  end
 
  def valid_coord?
    return (/[A-J]([1-9]|10)/).match(@attack) ? true : false
  end
 
  def result(column, row)
    case @other.player_board.board[row][column]
    when " " then @other.player_board.board[row][column] = "~"
    when "s", "a", "b", "c", "d"
      @other.fleet.damage_report(@other.player_board.board[column])
      @other.player_board.board[row][column] = "X"
      puts "HIT!"
      exit if game_over?
    end
  end
 
  def game_over?
    @other.fleet.fleet.empty?
  end
 
  def end_turn
    if @current == @user
      @current, @other = @cpu, @user
    else
      @current, @other = @user, @cpu
    end
  end
 
  def cpu_turn
    @cpu_attack_coord = [rand(10) + 1, rand(10) + 1]
    @cpu_attack_coord_cont = @other.player_board.board[@cpu_attack_coord[0]][@cpu_attack_coord[1]]
 
    until @cpu_attack_coord_cont != "~" || "X"
      @cpu_attack_coord = [rand(10) + 1, rand(10) + 1]
      @cpu_attack_coord_cont = @other_player.player_board.board[@cpu_attack_coord[0]][@cpu_attack_coord[1]]
    end
    result(@cpu_attack_coord[1], @cpu_attack_coord[0])
  end
end
 
 
game = Game.new
# Vroom vroom! We're going to build a simple game called Ruby Racer. This is a "game" like Chutes and Ladders is a game: the fixed board layout and random rolls of the dice completely determine the outcome.

# The game works like a (random and much quieter) drag race. There are two players. Each starts with a "car" sitting at the beginning of the track, side-by-side. The track is N squares long. Players take turns rolling a die and advance their car according to the value of the roll.

# We'll create less fatalistic versions in future challenges.

# Learning Goals
# This challenge is about modeling a simple game with little human interaction and no strategy. You'll learn a bit about how console output works when you have to print the board. The starting code is well-written, so pay attention to the style, what methods exist, what their inputs and return values are, and how they segment the actions necessary to "play" the game.

# Objectives
# Implement Using the Skeleton Code
# The source gist for this challenge contains a lot of skeleton code; use it! You should mostly be filling out the pre-defined RubyRacer class, although feel free to dress up the output and have a little fun with the logic of the game. Maybe add some totally sweet ASCII art?

# Here's what the output should look like, roughly:


# Note: Are you assuming there are only two players and they're always labeled 'a' and 'b'? Why? If it's intentional as a means to get a simpler version up and running, that's fine, but it's important to be clear about what assumptions your program is making and why! Try to write a version that accepts any number of players (identified by single characters) as input.

# Think of Fun Additions
# As a thought experiment, think about what would make this game more fun? Powerups? Landmines that send you back to the start? More player control?

# Is your code well-suited to adding these features or would it be difficult?

class Die
  def initialize(sides = 6)
    @sides = sides
  end

  def roll
    1 + rand(@sides)
  end
end
 
# Use "reputs" to print over a previously printed line,
# assuming the cursor is positioned appropriately.
def reputs(str = '')
  puts "\e[0K" + str
end

def clear_screen!
  print "\e[2J"
end
 
# Moves cursor to the top left of the terminal
def move_to_home!
  print "\e[H"
end
 
# Flushes the STDOUT buffer.
# By default STDOUT is only flushed when it encounters a newline (\n) character
def flush!
  $stdout.flush
end

require_relative 'racer_utils'
 
class RubyRacer
  attr_reader :players, :length
 
  def initialize(players, length = 30)
    @hash = {}
    @length = length
    @die = Die.new
    players.each do |player|
      @hash[player] = 1
    end
  end
  
  # Returns +true+ if one of the players has reached 
  # the finish line, +false+ otherwise
  def finished?
    @hash.has_value?(30)
  end
  
  # Returns the winner if there is one, +nil+ otherwise
  def winner
    @hash.key(@hash.values.max)
  end
  
  # Rolls the dice and advances +player+ accordingly
  def advance_player!(player)
    @hash[player] += @die.roll * 2
    @hash[player] = @length if @hash[player] > (length)
  end
  
  # Prints the current game board
  # The board should have the same dimensions each time
  # and you should use the "reputs" helper to print over
  # the previous board
  def print_board
    reputs
    @hash.each do |player, position|
      puts " |" * (position - 1) + player + "|" + " |" * (length - position)
    end
  end
end
 
players = ['a', 'b']
 
game = RubyRacer.new(players)
 
# This clears the screen, so the fun can begin
clear_screen!
 
until game.finished?
  players.each do |player|
    # This moves the cursor back to the upper-left of the screen
    move_to_home!
  
    # We print the board first so we see the initial, starting board
    game.print_board
    game.advance_player!(player)
    
    # We need to sleep a little, otherwise the game will blow right past us.
    # See http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-sleep
    sleep(0.5)
  end
end
 
# The game is over, so we need to print the "winning" board
move_to_home!
game.print_board
 
puts "Player '#{game.winner}' has won!"
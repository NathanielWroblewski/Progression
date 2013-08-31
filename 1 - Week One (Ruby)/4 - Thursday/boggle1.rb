# We're going to create a basic Boggle board generator. Read about Boggle on Wikipedia if you're not familiar with the game.

# Boggle is a simple game, but when you get down into it there are some subtleties.

# First, we're only going to model the first part of boggle, where you place the Boggle dice and shake them around to create the initial board. To imagine what that might look like, visualize a blank 4x4 grid with a button next to it. When you push the button a letter appears in each of the 16 cells and you can begin playing Boggle.

# We're going to do it in two steps. First, we'll to build a dumb version which doesn't care at all about whether it's likely that the Boggle board will have English words. Second, we'll build a version that models the dice.

# External Resources
# Boggle on Wikipedia
# Play Boggle online
# Learning Goals
# Modeling a simple real-world procedure in Ruby
# Method definition, arguments, and return values
# Common string methods
# Internal representation vs. display representation
# As you're coding, ask yourself...
# Do I have a clear understanding of how this procedure works?
# Am I stuck because I know what I want to do but don't know how to say it in Ruby?
# Am I stuck because my understanding of how Boggle works is too fuzzy or mistaken?
# Objectives
# Stupid Boggle Board
# Our BoggleBoard class has one core instance method: shake!

# For the first step, focus on how you represent the board. shake! should modify the board, filling each cell with a random upper-case letter A-Z.

# There are no other restrictions on the letters. They can appear multiple times, for example. Just pick a flippin' random letter and don't sweat it, ok?

# I also know you're worrying about how "Q" is always "Qu" in Boggle. Stop! Just let it be "Q" for now.

# We want to write code that works like this:

# board = BoggleBoard.new
# puts board
# # An unshaken board prints out something sensible, like:
# # ____
# # ____
# # ____
# # ____

# # Shake (and modify) the board
# board.shake!

# puts board
# # Prints out:
# # DUMV
# # KSPD
# # HCDA
# # ZOHG

# board.shake!
# puts board

# # We've shaken again, so a new random board:
# # QIRZ
# # EEBY
# # OEJE
# # MHCU
# Smart(er) Boggle Board
# We need to model the dice, now. Think carefully about how shaking a Boggle board works. Each die lands in one and only one cell, with one side facing up.

# Can you think of a way to model a die landing in only one cell without explicitly keeping track of which dice have landed and which haven't? One way to do this is using a secondary Array, can you think of another?

# We'll still only have one core method, BoggleBoard#shake!. Here's a list of Boggle dice, with "Q" representing "Qu":

# AAEEGN
# ELRTTY
# AOOTTW
# ABBJOO
# EHRTVW
# CIMOTU
# DISTTY
# EIOSST
# DELRVY
# ACHOPS
# HIMNQU
# EEINSU
# EEGHNW
# AFFKPS
# HLNNRZ
# DEILRX
# Dealing with Q
# Assuming we want "Qu" to be printed rather than "Q", how could we make that happen?

# There are several ways of making this happen, especially if you keep in mind that how the board appears to the computer — how it's represented in your program — doesn't have to be how it appears to the person using the program.

# Consider a few ways to make "Qu" print instead of just "Q", deliberate on the tradeoffs for a few minutes, and implement one. You'll probably want to change how the board is printed, too, since "Qu" will throw everything out of alignment.

# For example, something like this might be appropriate:

# > puts board.shake!
# U  N  O  T  
# S  E  W  G  
# S  V  L  T  
# L  Qu C  F
# Check out the String#ljust method for an easy way to add the right amount of space for display.

class BoggleBoard
 
DICE = [%w{A A E E G N},       
        %w{E L R T T Y},
        %w{A O O T T W},
        %w{A B B J O O},
        %w{E H R T V W},
        %w{C I M O T U},
        %w{D I S T T Y},
        %w{E I O S S T},
        %w{D E L R V Y},
        %w{A C H O P S},
        %w{H I M N Q U},
        %w{E E I N S U},
        %w{E E G H N W},
        %w{A F F K P S},
        %w{H L N N R Z},
        %w{D E I L R X}]
 
  attr_reader :unshaken
 
  def initialize
    @unshaken = true
    @board = Array.new(4)
  end
 
  def shake!
    @unshaken = false
    @board = DICE.map { |die| die[rand(6)] }
  end
 
  def print_board
    @board.each_with_index do |letter, index|
      print ("\n" + "-  " * 4) if @unshaken
      print "#{letter}  " if letter != "Q"
      print "Qu " if letter == "Q"
      print "\n" if (index + 1) % 4 == 0
    end
    puts "\n"
  end
end
 
 
board = BoggleBoard.new
board.print_board
board.shake!
board.print_board
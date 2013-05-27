# Good code is clean, organized, and follows a set of grammatical and syntactic conventions.

# Every programmer has their own preferred way of writing code, but the best programmers will utilize (and perhaps even contribute to) the accepted standard for a given language, framework, or DSL.

# There are plenty of style guides for Ruby. Any piece of software (open source or proprietary) should use a style guide. It doesn't really matter which one, so long as everyone working on the team follows it.

# The example code in this challenge is extremely messy. Using the conventions defined in this Ruby Style Guide, clean up the code. In particular, make sure to read the sections on Naming, Comments, and Source Code Layout.

# You can rewrite the program any way you desire, so long as you don't break the driver code (i.e. if you run the program, it should print all true).

# Learning Goals
# Cleaning up poorly formatted code
# Organizing code for consistency and readability
# Recognizing incorrect conventions and fixing them without breaking the interface
# Objectives
# Implement style consistency
# Clean up the code in the program using the conventions outlined in @bbatsov's Ruby Style Guide.

# Make sure that the code still works! You are just adding a fresh layer of paint to the walls, not tearing them down.

class GuessingGame
  VALID_NUMBERS = (1..100).to_a
 
  def initialize(answer)
    @answer = answer
    @solved = false
    unless VALID_NUMBERS.include?(@answer)
      fail "Answer must be between 1 and 100"
    end
  end
 
  def guess(number)
    if number == @answer
      @solved = true
      :correct
    elsif number > @answer
      @solved = false
      :high
    else 
      @solved = false
      :low
    end
  end
 
  def solved?
    @solved
  end
end
 
game = GuessingGame.new(10)
puts game.guess(5)  == :low
puts game.guess(15) == :high
puts game.solved?   == false
puts game.guess(10) == :correct
puts game.solved?   == true
puts game.guess(2)  == :low
puts game.solved?   == false
 
begin
  Guessing_game.new(200)
  rescue RuntimeError => e
  puts e.to_s == "Answer must be between 1 and 100"
end
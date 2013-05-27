# Learning to program means learning to approach problems in a new way. It requires breaking them down into components that can be expressed in code.

# Most of us do not "think in code" when we are living our daily lives. We interact with other humans who, unlike computers, are intuitive and emotive creatures. Logic and mathematical reasoning certainly play a role in our everyday thinking, but we have these wonderful things called senses which help us navigate the world and perform all kinds of complex calculations without much conscious effort.

# Part of being an effective programmer is the ability to communicate the functionality of your program to other programmers. Learning to write, think in, and interpret pseudocode will help you train your brain to understand how a computer "thinks". If you can think like a computer, you will know how to write in a way that a computer can understand.

# In this challenge you will practice writing psuedocode from existing code in both Ruby and other languages. Work through the code and make sure you understand what it does before you write your psuedocode. Your psuedocode should abstract out the process of the program without being code specific.

# External Resources
# Psuedocode by Naomi Nishimura from Cornell
# Pseudocode Standard from CalPoly
# Learning Goals
# Writing Pseudocode
# Reading and tracing code
# Objectives
# Write Standard Pseudocode for Ruby
# Translate the given Ruby method in Your Repo into pseudocode, including comments. See here for examples and good guidlines on formatting. Most importantly, your pseudocode should follow these principles.

# The grid is an array of arrays contianing
# rocks and gold, something like this:
# [ ['R', 'R', 'G'],
#   ['R', 'G', 'R'],
#   ['R', 'G', 'G'] ]
 
def pick_up_the_gold(grid)
  gold_sachel = []
  x, y        = 0, 0
 
  while y < grid.length
    current_sq  = grid[y][x]
    
    if current_sq == 'G'
      gold_sachel.push 'G'
      grid[y][x] = 'R'
    end
    
    if x == (grid[y].length - 1)
      x = 0
      y += 1
    else
      x += 1
    end
  end
  
  raise "Oops, looks like we missed one" if grid.include? 'G'
  
  puts "You picked up #{gold_sachel.count} pieces of gold!"
end
 
# __________________________
# WRITE YOUR PSEUDOCODE HERE
 
#Pick up gold from grid
#
#SET gold sachel to empty
#SET coordonates x & y to 0
#WHILE y is in the grid
#  IF grid coordinate contains gold THEN
#    PUT gold in gold sachel
#    SET grid coordinated as recovered
#  ENDIF
#
#  IF we reach right end of grid THEN
#    Move to next line first row
#  ELSE
#    Move to next row
#  ENDIF
#ENDWHILE
#
#IF Grid still has gold THEN
#  PUT error message
#ENDIF
#
#PUT the total gold collected
# In this challenge, let's start creating some data structures and better understand what's going on under the hood with arrays and hashes.

# A powerful way to create an array is using the Array.new class method.

# first_25_letters = ('A'..'Z').first(25)

# letter_grid = Array.new(5) { first_25_letters.shift(5) }
# # => [ ["A", "B", "C", "D", "E"],
# #      ["F", "G", "H", "I", "J"],
# #      ["K", "L", "M", "N", "O"],
# #      ["P", "Q", "R", "S", "T"],
# #      ["U", "V", "W", "X", "Y"] ]
# Do you understand how the above code is working? If not, make a note to come back later so you understand passing blocks and the shift method.

# Learning Goals
# Generating nested arrays and hashes with ruby
# Using ruby's built-in methods to speed coding
# Researching Array and Hash methods
# Looping and conditions
# Tic-tac-toe Revisited - Populating a Board
# Take a look at the simple 2 dimensional array for Tic-Tac-Toe from Nested Arrays. Let's say we wanted to generate 10 sample boards with x's and o's. How would you do that? How do you make the x's and o's random? In the first iteration, it's OK to create boards that don't have logical ratio of x's and o's.

# Write some driver code with a test to make sure your method is working, and your resultant array has 9 elements. What Array method would you use?

# Extra Credit: Go ahead and populate a board with a realistic ratio of x's and o's. There should only be either 5 x's or 4 o's or vice versa. There's an enumerable method that works on arrays that can help you! How could you write a good driver code test to make sure the array has the right number of x's and o's?

# Convert nested array to hash
# Ruby provides a handy Hash::[] method which will convert a properly formatted array into a hash. Documentation.

# Convert each entry (player) from the data table array from the previous challenge (shown below) into a hash. You will need to write code that modifies the original array into the right format that the Hash:: method expects to get the proper result.

# [["Number", "Name", "Position", "Points per Game"],
#  ["12","Joe Schmo","Center",[14, 32, 7, 0, 23] ],
#  ["9", "Ms. Buckets ", "Point Guard ", [19, 0, 11, 22, 0] ],
#  ["31", "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ], 
#  ["18", "Sally Talls", "Power Forward ", [18, 29, 26, 31, 19] ], 
#  ["22", "MK DiBoux ", "Small Forward ", [11, 0, 23, 17, 0] ]]
# Take a moment to read up in the documentation on what format your array must be for the Hash method to work.

# When finished, you should have an array of hash objects, which will allow you to write code like this:

# hashed_data_table[2]
# # => { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] }

# puts hashed_data_table[0]["Name"] == "Joe Schmo"   # outputs true
# Remember: Write good driver code tests!

continuum = %w{x x x x x o o o o }
continuum_array = continuum.permutation.to_a
all_boards = []
continuum_array.uniq!.each do |continua|
  all_boards << Array.new(3) {continua.shift(3)}
end
 
 
def print_board(all_boards)
  all_boards.first(10).each do |board|
    board.each do |row|
      row.each_with_index do |cell,index|
        print index == 0 || index == 1 ? cell + "|" : cell + "\n"
      end
    end
    print "\n"
  end
end
 
p print_board(all_boards)
# Exercise: Print out a times table
# Implement a method called times_table which takes as its input an integer and prints out a times table with that number of rows.

# The numbers can be separated by any spaces or tabs, but each row must be on a new line. This means it's ok if the columns don't line up.

# For example, times_table(5) should print the following out to the screen:

# 1   2   3   4   5
# 2   4   6   8  10   
# 3   6   9  12  15   
# 4   8  12  16  20   
# 5  10  15  20  25
# Again, you don't need to worry about the spacing between columns. The point of the exercise is to understand the logic, not master the formatting. You should be at least one space/tab between the numbers, though, otherwise it won't look like a times table!

def times_table(rows)
  1.upto(rows) do |y|
    puts
    1.upto(rows) { |x| print "#{x * y} "}
  end
end
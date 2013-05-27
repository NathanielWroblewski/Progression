# Exercise: Print out a pretty right triangle
# Write a method print_triangle which takes at its input an integer representing the number of rows to print, and prints out a right triangle consisting of * characters, one line per row.

# For example, print_triangle(5) should print out:

# *
# **
# ***
# ****
# *****
# And print_triangle(2) should print out:

# *
# **
# If we pass in 0 it should print nothing (not even an empty line).

def print_triangle(rows)
  1.upto(rows) do |i|
    puts "*" * i
  end
end
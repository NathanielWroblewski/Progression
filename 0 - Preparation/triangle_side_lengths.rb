# Exercise: Triangle side lengths
# Write a method valid_triangle? which takes as its input three non-negative numbers. It should return true if the three numbers could form the side lengths of a triangle and false otherwise.

# The arguments don't correspond to specific sides. Don't worry about handling negative inputs — garbage in, garbage out.

# For example,

# valid_triangle?(0,0,0) # => false, because a triangle can't have 0-length sides

# valid_triangle?(1,1,1) # => true, an equilateral triangle

# valid_triangle?(3,4,5) # => true, a right triangle
# valid_triangle?(4,3,5) # => true, the same right triangle
# valid_triangle?(5,3,4) # => true, the same right triangle

# valid_triangle?(10, 10, 100) #=> false, no such triangle exists

def valid_triangle?(a, b, c)
  (a + b > c) && (a + c > b) && (b + c > a)
end
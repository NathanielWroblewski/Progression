# Exercise: Calculating the mean of an array of numbers
# Write a method mean which takes an Array of numbers as its input and returns the average (mean) value as a Float.

# For example,

# mean([1,2,3])      # => 2.0
# mean([4.5, 0, -1]) # => 1.1666666666666667
# mean([-100, 100])  # => 0.0

def mean(array)
  array.inject(:+).to_f / array.size
end
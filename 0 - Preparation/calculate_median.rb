# Exercise: Calculating the median of an array of numbers
# Write a method median which takes an Array of numbers as its input and returns the median value.

# You might want to look up the definition of "median.""

# For example,

# median([1,2,3])      # => 2
# median([4.5, 0, -1]) # => 0
# median([-100, 100])  # => 0.0

def median(array)
  mid = array.size / 2
  array.size % 2 == 0 ? (array[mid] + array[mid-1])/2.to_f : array[mid]
end
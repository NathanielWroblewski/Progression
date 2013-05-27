# Exercise: Calculating the array mode
# Write a method mode which takes an Array of numbers as its input and returns an Array of the most frequent values.

# If there's only one most-frequent value, it returns a single-element Array.

# For example,

# mode([1,2,3,3])         # => [3]
# mode([4.5, 0, 0])       # => [0]
# mode([1.5, -1, 1, 1.5]) # => [1.5]
# mode([1,1,2,2])         # => [1,2]
# mode([1,2,3])           # => [1,2,3], because all occur with equal frequency

def mode(array)
  array.group_by{|num|array.count(num)}.max.last.uniq
end

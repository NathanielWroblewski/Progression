# What is the difference between binary search and linear search? Is one always faster than the other? What are the advantages to one over the other?

# In this challenge, we'll be pitting the two search types against each other and profiling their performance to see how they match up.

# Objectives
# A little bit of background
# Before you start, do some research on the two types of searches. You can start with this Stack Overflow answer.

# The ultimate test
# How do your search algorithms match up against Ruby's built in Array#index method?

# Add Array#index to your benchmarking code and see how your methods compare.

# Profile with Benchmark
# Use the Benchmark module in Ruby to profile your linear_search and binary_search methods.

# Benchmark all three search algorithms against arrays of 1,000, 10,000, and 1,000,000 pre-sorted integers.

require 'benchmark'
 
def binary_search(object, array, upper, lower = 0)
  mid = (lower + upper) / 2
  return nil if array[mid] == nil || lower > upper # Prevent stack overflow, returns nil if object not in array
  object < array[mid] ? upper =  mid - 1 : lower = mid + 1
  object == array[mid] ? mid : binary_search(object, array, upper, lower)
end
 
def linear_search(object, array)
  i = 0
  until array[i] == object || array[i] == nil
    i += 1
  end
  array[i] == object ? i : nil
end
 
def each_search(object,array)
  array.each do |num|
    if num == object
      return num
    end
  end
end
 
array = []
1.upto(1_000_000).each do |num|
  array << num
end
 
puts Benchmark.measure {binary_search(301_000,array,array.length)}
puts Benchmark.measure {linear_search(301_000,array)}
puts Benchmark.measure {each_search(301_000,array)}
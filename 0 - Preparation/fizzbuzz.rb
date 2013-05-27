# Exercise: Implement FizzBuzz (Super Edition)
# FizzBuzz is a classic programming exercise.

# The usual example asks the developer to write a program which prints out each number from 1 to 100. But for multiples of 3 print 'Fizz' instead of the number and for multiples of 5 print 'Buzz'. For numbers which are multiples of both 3 and 5 print 'FizzBuzz'.

# This exercise has a little twist. Write a method called super_fizzbuzz which takes as its input an Array of integers.

# It should return a "fizzbuzzed" Array, i.e., the array is identical to the input with the following substitutions:

# Multiples of 3 should be replaced with the string "Fizz"
# Multiples of 5 should be replaced with the string "Buzz"
# Multiples of 15 should be replaced with the string "FizzBuzz"
# For example:

# super_fizzbuzz([1,2,3])  # => [1, 2, "Fizz"]
# super_fizzbuzz([1,2,5])  # => [1, 2, "Buzz"]
# super_fizzbuzz([1,2,15]) # => [1, 2, "FizzBuzz"]

# super_fizzbuzz([30, 9, 20, 1]) # => ["FizzBuzz", "Fizz", "Buzz", 1]

def super_fizzbuzz(array)
  array.map do |num|
    if num % 15 == 0
      "FizzBuzz"
    elsif num % 5 == 0
      "Buzz"
    elsif num % 3 == 0
      "Fizz"
    else
      num
    end
  end
end
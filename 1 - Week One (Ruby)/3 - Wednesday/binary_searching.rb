# Children who are learning arithmetic sometimes play a number-guessing game:

# "I’m thinking of a number between 1 and 100. Can you guess it?"
# "Is the number less than 50?"
# "Yes."
# "Is the number less than 25?"
# "No."
# And so on, halving the interval at each step until only one number is left.

# This technique is known colloquially as the binary chop. It is a well-known technique for searching through a collection. Let's build it in Ruby.

# Beware that this exercise is harder than it looks. Jon Bentley, in his book Programming Pearls, reports that 90% of professional programmers cannot write a proper implementation of binary search in two hours, and Donald Knuth, in the second volume of his book The Art of Computer Programming, reports that though the first binary search was published in 1946, the first bug-free binary search wasn’t published until 1962.

# If you want to read more, check out the Wikipedia article.

# Source: Chris Pine, Learn to Program: | Programming Praxis

# Objectives
# Ensuring accuracy
# Write a suitable test program that shows the accuracy of your binary search method. Test your method against a variety of inputs. Does it always return the correct answer?

# A basic testing program could look like this:

# test_array = (100..200).to_a
# puts binary_search(135, test_array) == 35
# # => true

# test_array = [13, 19,  24,  29,  32,  37,  43]
# puts binary_search(35, test_array) == -1
# # => true
# Write the algorithm
# Your first task is to write a method that takes a target number and a sorted array of numbers in non-decreasing order and returns either the position of the number in the array, or -1 to indicate the target number is not in the array. For instance, binary_search(32, [13, 19, 24, 29, 32, 37, 43]) should return 4, since 32 is the fourth element of the array (counting from zero).

# Start with pseudocode! What are the steps? What's the end case? Spell it out before jumping into ruby.

# You can't use Array#index. Sorry. The point is to build a binary search, not use Ruby's built in search methods.

# HINT: Here's an implementation of binary search in Javascript. You can start creating your pseudocode with this as a model.

def binary_search(object, array, upper, lower = 0)
    mid = (lower + upper) / 2
    return nil if array[mid] == nil || lower > upper # Prevent stack overflow, returns nil if object not in array
    object < array[mid] ? upper =  mid - 1 : lower = mid + 1
    object == array[mid] ? mid : binary_search(object, array, upper, lower)
end

##################################driver code######################
array = []
1.upto(1_000).each do |num|
  array << num if num.odd?
end
 
 puts binary_search(4, array = [1,2,3,4,5,6,7,8,9,10], array.length)
 puts binary_search(401, array, array.length)
 puts binary_search(401, array, array.length) == array.index(401)
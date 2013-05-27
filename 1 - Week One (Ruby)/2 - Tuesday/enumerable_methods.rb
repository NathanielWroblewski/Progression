# When you need to operate on a Ruby Array, you can accomplish just about anything you can imagine with the each method. Often, though, using each is not the best way to work with Arrays.

# For example, when you find yourself adding conditional logic inside your each block, or using each to search, sort, or transform the Array, consider the power of Ruby's Enumerable module.

# Constraint: do not use the for or each method in any of your solutions to this Challenge. Besides these 2, any other enumerable method is up for grabs!

# Objectives
# Utilize Enumerable's other methods
# Enumerable is chock full of useful, convenient methods that make working with enumerables much simpler. This exercise will expose you to a handful of these methods. Each method in the exercise tells you which Enumerable method you should use, so it's your job to figure out how to call it to perform the desired task.

# Note: Be careful not to break the driver code.

# TODO: Print the 1st, 3rd, 5th, 7th, etc. elements of a list on separate lines.
#       You should make use of Enumerable#each_with_index
def print_odd_indexed_integers(array)
  array.each_with_index do |value, index|
    puts value if index.even?
  end
end
 
# TODO: Return the odd numbers from a list of integers.
#       You should make use of Enumerable#select
def odd_integers(array)
  array.select { |num| num.odd? }
end
 
# TODO: Return the first number from an Array that is less than a particular number - 'limit.'
#       You should make use of Enumerable#find
def first_under(array, limit)
  array.find { |num| num < limit }
end
 
# TODO: Take an Array of Strings and return a new Array with an exclamation point appended to each String.
#       You should make use of Enumerable#map
def add_bang(array)
  array.map {|word| word + "!" }
end
 
# TODO: Calculate the sum of an Array of numbers.
#       You should make use of Enumerable#reduce
def sum(array)
  array.reduce(:+)
end
 
# TODO: Reorganize an Array of the elements into groups of 3, and then sort each group alphabetically.
#       You should make use of Enumerable#each_slice
def sorted_triples(array)
  result = []
  array.each_slice(3) { |a| result << a.sort }
  result
end
 
# Driver code... don't change this.
print_odd_indexed_integers([2, 4, 6, 8, 10, 12]) # this should print "2\n6\n10"
 
puts odd_integers([3, 4, 7, 9, 10, 16]) == [3, 7, 9]
 
puts first_under([13, 21, 7, 0, 11, 106], 10) == 7
 
puts add_bang(["hi", "mom"]) == ["hi!", "mom!"]
 
puts sum([1, 1, 2, 3, 5]) == 12
 
words = %w(the salted pork is particularly good)
puts sorted_triples(words) == [["pork", "salted", "the"],
                               ["good", "is", "particularly"]]
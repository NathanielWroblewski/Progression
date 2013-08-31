# Define enumerable methods
# In comments, clearly define what Array#map, Array#inject and Array#select do.

# Write your own method
# Then, write a method Array#my_map that replicates the #map method on an array. Your method can use other enumerables but it must contain a yield statement.

# To illustrate, here is an example of replicating the #each method using length.times. Notice that this example uses self to allow the method to be called on the Array object.

# If you are unclear on the use of self, you can revisit this exercise.

# class Array
#   def my_each
#     self.length.times do |i|
#       yield(self[i])
#     end
#   end 
# end

# [1,2,3,4].my_each { |i| puts i }
# Oh, and don't do this:

# class Array
#   alias :my_map :map
# end
# That avoids the intent of this exercise. Not cheating, but it doesn't help you learn much.

# WARNING: What we are doing here is called "extending a core class". As in, you are adding a new method #my_map to the Array class and extending it's pool of potential methods. This is generally a no-no, but may be used in rare cases. "Extending a class" (without the "core" part) is different and very common and useful, which usually means adding new methods to one of your own classes (like adding a #check_rows method to class SudokuBoard).

# 1. Define enumerable methods
#Array#map is similar to array#each in that it iterates over each element of
#the array and performs whatever block is passed to it on each element.  The
#primary difference, it seems, is that array each will not return an array
#where map will return an array.
 
#Array#inject iterates over an array with an accumulator.  The result of the
#block you pass to inject is added to the accumulator.  You can specify an
#initial value for the accumulator, or you can pass a symbol to inject for 
#simple operations like summing all elements of an array or obtaining the 
#product of all elements in an array.
 
#Array#select filters an array for elements where the block its passed evaluates
#to true.  Select returns a new array comprised of the elements for which the
#block evaluated to true.
 
# -----------
# 2. Write your own method `Array#my_map`
#
# Here is a template to start with:
class Array
  def my_map
    result = []
    self.length.times do |element|
      result << yield(self[element])
    end
    result
  end
end
 
puts [1,2,3,4].my_map { |i| i -= 1 }  == [0,1,2,3] # makes you count like a programmer!
 
puts [1,2,3,4].my_map { |x| x * 2 } == [2,4,6,8]
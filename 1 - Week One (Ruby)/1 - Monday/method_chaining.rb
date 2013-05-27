# Method chaining is a programming technique for making your code more concise and eloquent.

# It is often useful to write your programs out on many lines so that you can visualize the functionality more easily. This is a great first step, but it may not be the most readable or efficient way to write your code.

# You should always refactor your code to make it more clear, readable, and concise. Method chaining is one tool that you can make use of towards this end.

# However, it can be taken too far. Getting your code to fit on the fewest possible number of lines is nice, but it can also lead to very unreadable and convoluted code.

# In the Ruby world, it is considered more professional to write readable, elegant code than extra-compact, complex code.

# Objectives
# Increase elegance with chaining
# Refactor the statements within the method body of shout_backwards into one line of code.

# It should still be clear what the method's behavior is even after you refactor.

# Refactor for clarity
# Break down the convoluted statement within squared_primes so that it reads more smoothly.

# It should be much clearer what the method is doing after you refactor.

# TODO: Refactor for elegance
# def shout_backwards(string)
#   all_caps  = string.upcase
#   backwards = all_caps.reverse
#   result    = backwards + "!!!"
 
#   return result
# end
 
 
# FIXME: This is convoluted. Refactor for clarity.
# def squared_primes(array)
#   array.find_all{|x| (2..x-1).select(){|i| x % i == 0 }.count == 0 }.map{|p| p*p}
# end
 
# Driver code... don't edit. This should print a bunch of trues.
# puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
# puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]

# def shout_backwards(string)
#   string.upcase.reverse + "!!!"
# end
 
 
# FIXME: This is convoluted. Refactor for clarity.
def squared_primes(array)
  prime = []
  array.each do |x|
    if (2..(x - 1)).all? { |num| x % num != 0 }
    prime << x
    end
  end
  prime.map { |i| i**2 }
end
 
# Driver code... don't edit. This should print a bunch of trues.
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]
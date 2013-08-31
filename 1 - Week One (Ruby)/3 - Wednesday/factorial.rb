# We're going to write a Ruby method factorial to compute the factorial of an integer. You've done this before as an exercise, so feel free to look at other students' solutions.

# The focus this time around will be on understanding recursion.

# If you don't remember, the factorial of a non-negative integer , denoted , is the product of all positive integers less than . For example,



# The factorial function wasn't pulled out of a mathematician's hat — it has a very concrete meaning. If you have 3 socks, for example, there are 3! = 6 ways to order those socks. In general, if you have a set of  things then there are  ways to order those things.

# By convention we define



# so that we can formaly define the factorial as



# This definition is called recursive because we define the factorial of  in terms of the factorial of . We stop at the base case, where .

# Learning Goals
# This is your first run-in with recursion at DBC. It will seem strange at first, but you'll quickly get used to it. Eventually, you'll develop a kind of sixth sense and start saying things like, "This feels like a recursive problem."

# The most important thing to understand is that every recursive problem has some number of base cases, the condition that acts like the "kick" from Inception, bumping you back up ever-closer to where you came from. The base case is the part of the recursive problem that is not defined in terms of itself.

# "What are the base cases?" should be the first question you ask every time you want to approach a problem recursively. Many recursive problems have only one base case, but others have more.

# Objectives
# Factorial, Iteratively
# Implement an iterative version of the factorial function called factorial_iterative. It should accept any non-negative integer as input. Don't worry about handling bad input.

# Factorial, Recursively
# Implement a recursive version of the factorial function called factorial_recursive. It should accept any non-negative integer as input. Don't worry about handling bad input.

# What's the largest value your recursive factorial function can take as its input before it crashes? What does the error mean?

def factorial_recursive(num)
  num == 0 ? 1 : num * factorial_recursive(num - 1)
end
 
def factorial_iterative(num)
  1.upto(num).reduce(:*)
end
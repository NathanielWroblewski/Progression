# We're going to have you implement two versions of the Fibonacci sequence: an iterative version and a recursive version. We'll compare the performance of each and discuss potential improvements. They'll be methods called fib_iterative and fib_recursive, respectively, which take an integer n as input and returns the nth Fibonacci number.

# Each version will work as follows:

# def fib_iterative(n)
#   # returns the nth Fibonacci number
# end

# fib_iterative(0) = 0
# fib_iterative(1) = 1
# fib_iterative(2) = 1
# fib_iterative(3) = 2
# fib_iterative(4) = 3
# fib_iterative(5) = 5
# # etc…
# Although writing a method to return Fibonacci numbers might seem contrived, we work through it because the rules of the system are easy to model in code. It helps us understand what a makes a good model or a bad model, and also different ways to model the same system, e.g., even though, functionally, an iterative and recursive solution produce the same output given the same input, they perform very differently.

# External Resources
# Fibonacci Numbers on Wikipedia
# Doodling in Math: Spirals, Fibonacci, and Being a Plant: Part 1, Part 2, and Part 3
# Ruby Kickstart - Introduction to Recursion
# Learning Goals
# Modeling a simple real-world system in Ruby code
# Method definition, arguments, and return values
# Simple looping and iteration
# Simple recursion
# Understanding basic performance considerations, benchmarking, and tradeoffs between memory and speed
# As you're coding, ask yourself…
# What kind of values can my method take as its input/arguments?
# What kind of values can my method return?
# Are there any tradeoffs I'm making? Memory versus speed? Readability versus speed? On what side of those tradeoffs am I falling and why? What might my code look like if I fell on the other side of those tradeoffs?
# Objectives
# Iterative Version
# Write an iterative method to calculate Fibonacci numbers called fibonacci_iterative. This means you should use looping methods like Fixnum#times, Fixnum#upto, Array#each, etc.

# Recursive Version
# Write a recursive method to calculate Fibonacci numbers called fibonacci_recursive. This means you should not use any loops, but instead

# After you're done, ask yourself…
# Are there any method arguments that don't make sense? What should my program do in that situation? "Ignore them" is one valid answer — what are others?
# How large can my input be before it takes too long for my program to run? How long is "too long?"
# Context and History
# Math!
# Here's how we'd define the Fibonacci sequence, mathematically.



# Where do Fibonacci numbers come from?
# The Fibonacci sequence was named after Leonardo of Pisa, also known as Fibonacci, who created an idealized model of how rabbits breed. His greatly simplified model worked thus:

# At the beginning of the first month we start with a pair of newborn rabbits, one male and one female
# Rabbit pairs can't mate for their first month of life, but can starting at the end of their first month and do so at the end of every month thereafter
# A pregnant rabbit takes one month to give birth and always gives birth to a new male/female rabbit pair
# Rabbits never die
# He then asked, "How many pairs of rabbits will there be after a year?" In the first month there is 1 pair. They mate at the end of their first month, but there is still only 1 pair. They give birth to a new pair at the end of their second month, at which point the original pair mates again. There are two pairs of rabbits, now.

# At the end of the third month, the original pair gives birth again, so there are three pairs. The first pair and second pair can now both mate, and do, so at the end of the fourth month they give birth and there are five pairs. And so on.

# In other words, at the end of each month the set of rabbits that can breed are all the rabbits that have bred before plus the rabbit pairs born at the end of the last month.

# The sequence goes 1, 1, 2, 3, 5, 8, 13, etc. This sequence is called the "Fibonacci sequence" and the Nth item in this sequence — the number of rabbits alive after N months in Fibonacci's rabbit model — is called the Nth Fibonacci number.

# We can restate the rules like this:

# rabbits_at_month(1) = 1
# rabbits_in_month(2) = 1
# rabbits_in_month(n) = rabbits_in_month(n-1) + rabbits_on_month(n-2)
# We've defined the rules of a system, here, and you write Ruby code which models that system. I give you some number of months, n, and your Ruby program gives me the number of rabbits alive after n months.

def fibonacci_recursive(n)
  return 0 if n == 0
  return 1 if n == 1
  fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
end
 
def fibonacci_iterative(n)
  array = [0,1]
  until (array.length - 1) >= n
    array << (array[-1] + array[-2])
  end
  array[n]
end
# Recursion can be an elegant and extremely compact coding technique, but many times it's performance isn't quite as good as it's iterative cousin.

# In this challenge, lets see just how much slower recursion is than iteration for the Fibonacci problem.

# Benchmark!
# Use the Ruby Benchmark module to test the performance of the two previous implementations of Fibonacci, the iterative and the recursive. You'll want to have two tests which execute the same chunk of code many times over, e.g., the first test calls fibonacci_iterative(10) 1,000 times and the second test calls fibonacci_recursive(10) 1,000 times.

# Use different numbers for input and see what you get.

# Running the benchmarks repeatedly helps to smooth out any noise if, say, another process on your computer took some of the CPU's resources while one of the benchmarks was running.

# Extra Credit!
# Refactor fibonacci_recursive to make it faster!

# Think about:

# Where is the computer doing "rework?" (i.e. calculating a number it's already calculated before)
# How could you prevent the computer from doing rework?
# Need help? Look into ruby's optional or default parameters.

require 'benchmark'
 
def fibonacci_recursive(num)
  if num == 0
    0
  elsif num == 1
    1
  else
    fibonacci_recursive(num - 1) + fibonacci_recursive(num - 2)
  end
end
 
def fibonacci_iterative(num)
  array = [0,1]
  until (array.length - 1) >= num
    array << (array[-1] + array[-2])
  end
  array[num]
end
 
puts Benchmark.measure {fibonacci_recursive(30)}
puts Benchmark.measure {fibonacci_iterative(30)}
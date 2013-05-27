# One of the first questions a good programmer will ask themselves when they encounter a bug is "what is the error message telling me?". Error messages are your friend.

# These exercises contain bugs. Your task is to figure out what the error is and then change to code to remove the bug. In order to do this, you will have to read the error message that Ruby returns.

# There is usually more than one way to fix a bug.

# In the first exercise, you will get rid of the ArgumentError bug by changing the statement that invokes the method.

# In the second exercise, you will have to change the method definition in order to solve the bug.

# The third exercise contains a few TypeErrors, which are common bugs in dynamically typed languages such as Ruby.

# Here's a juicy question: why would we rewrite the invocation as opposed to the definition of the method?

# In a small program like this, the code is flexible enough to warrant either choice. When working on larger applications, you have to constantly be aware of how you are fixing bugs. Fixing one bug can easily cause more bugs or confusion down the line if you are not careful.

# Objectives
# Error-related Exercises
# This challenges brings you back to the old Ruby Intro interface. Complete the following exercises so they pass, and paste your solution code for each chunk into the gist.

# Debugging ArgumentError - Part 1
# Debugging ArgumentError - Part 2
# Debugging TypeError

# Solution for Challenge: Debugging Drill: Read the Error. Started 2013-04-23T00:52:49+00:00
# Solution for Challenge: Debugging Drill: Read the Error. Started 2013-04-23T00:08:15+00:00
def mean(numbers)
  sum = numbers.inject(:+)
  
  return sum / numbers.length
end
 
# This will throw an error. Change this line so that it works.
sample_avg = mean([5, 3, 6, 10])
 
def mean(*numbers)
  sum = numbers.inject(:+)
  
  return sum / numbers.length
end
 
# This will throw an error. Change this line so that it works.
sample_avg = mean(5, 3, 6, 10)
 
def print_and_sort(array)
  output_string = ""
  array.each do |element|
    output_string = output_string + " " + element.to_s
  end
  puts output_string
  output_string.strip.split(/ /).sort
end
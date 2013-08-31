# A data structure is a particular way of storing and organizing data so that it can be used efficiently. Data structures are usually categorized as primitive, composite or abstract.

# A primitive data structure is provided by the language and can be used as a building block for composite and abstract data structures. A composite data structure is composed of primitive data structures. In Ruby, there are two composite data structures; arrays and hashes. They provide simple index or key based data storage.

# When working with data, there is often a particular problem pattern or setting in which we need to access data in a specific way that is not built into an array or a hash. We can then create an abstract data structure to implement this pattern. An abstract data structure is defined by the operations that may be performed on it but does not define how it is implemented or which primitive or composite types are used for the implementation.

# In this challenge, we will explore two of the more common abstract data structures, the Stack and the Queue and understand how and when to implement them in Ruby.

# External Resources
# Data Structures on Wikipedia
# Learning Goals
# Understanding the types of data structures
# Implement the Stack and Queue data structures in Ruby
# Determining when to use a particular data structure.
# As you're coding, ask yourself...
# Do I understand this data structure?
# Could I explain it to my state senator in two or three sentences?
# Objectives
# Understanding Data Structures
# There are many abstract data structures, each suited to a particular data need. When working with data, it is good to have a set of these structures in your toolbox and be easily able to answer the questions:

# What is the best way to store this data?
# What is the best way to access this data?
# Read over the list of Data Structures on Wikipedia and notice how they are grouped. Try to think how each could be used to solve a particular pattern. Then look up the common data structures below:

# Stack
# Queue
# Linked List
# Set
# For each one, write down what it is in your own words, draw a picture of it or work through the examples and code.

# Make sure you clearly understand each structure and can clearly explain it to your pair (and a teacher) before moving on.

# Implementing a stack in Ruby.
# From your reading above, you know that a stack is an abstract data structure with methods push to add data and pop to remove data and that uses the Last-In-First-Out (LIFO) rule to add and remove data. Some implementations also have a function which returns the current length of the stack. Another typical helper operation is top (also known as peek) can return the current top element of the stack without removing it.

# You can visualize a stack as a stack of plates where the last plate you put on the stack is the first one you would pull off when it's time to eat dinner.

# So how do we use a stack in Ruby?

# Since Ruby only has an array and hash built in, you have to implement the other abstract data structures by building a class that has the correct behavior through its methods and that uses either an array or a hash to store the data.

# For example, you could implement a stack by creating a class that contains an array to store the elements and uses the methods to push and pop to add and remove the data from the front of the array.

# Since your Stack class is not an array, (even though it uses an array to store its data) you will also have to directly implement the needed array methods like size , each, first, last and whatever other functionality you need.

# Complete the following steps:

# Copy the code in the Basic Implementation of stack into your own stack.rb file.
# Look through the Stack class code and note how the key factors of a stack are implemented. Discuss each method with your pair so you fully understand how it works.
# Test the Stack class code by writing code to create a new Stack and add and remove data from it. Try running the following commands on your Stack class, then make up a few of your own.
# #create a new stack 
# my_stack=Stack.new;

# #verify there are no elements on the new stack
# puts "The stack is empty?  #{my_stack.empty?}"

# #add 3 elements to the stack
# my_stack.push("ruby")
# my_stack.push("is")
# my_stack.push("cool")

# #since our stack is implemented on array we can add any type of object
# my_stack.push(15)


# #look at all the elements in the stack by popping them off one at time 

#     puts "Next Element: #{my_stack.pop}"
#     puts "Next Element: #{my_stack.pop}"
#     puts "Next Element: #{my_stack.pop}"
#     puts "Next Element: #{my_stack.pop}"

# #verify there are no elements left on the stack
# puts "The stack is empty?  #{my_stack.empty?}"

# #what happens if you try to call pop on an empty stack?
# puts "Trying to remove an item from an empty stack ... "
#     puts "Next Element: #{my_stack.pop}"
# You may have noticed that there is no method to display a particular item in the stack (ie - you can't write puts my_stack[i] . Why is this?
# Now it's your turn. The stack in this example has an infinite size. This may not always be an appropriate model.

# Refactor the stack.rb code so that a stack is created with a max_size.
# Implement a full? method
# Do not allow the stack to store more than it's max_size of elements.
# Implement a Queue with an Array
# Now it's your turn.

# A queue is a data structure that utilizes the First-In-First-Out (FIFO) data model and allows data to be added to the end of the queue enqueue and data to be removed from the front of the queue dequeue.

# Using the stack example as a model, write a class to implement a queue with an array.

# Next, write code to instantiate your Queue class and call its methods similar to what we did with the Stack class.

# Upload a gist with your Queue class and the code you wrote to show how it works.

# After you're done, ask yourself...
# What functionality do I still need to implement in my abstract data structures?
# Why doesn't Ruby have a built in stack, queue, or other abstract data structure?
# Is there array functionality that is not implemented in my class? Does it need to be?
# If someone asked me to implement a Propositional Directed Acyclic Graph using an array (or something equally scary) how would I use what I had learned in this challenge to break down that problem?

# A very basic Stack implemented with an array  
# Makes use of the built in #pop and # push methods that exist for arrays.
 
class Stack
 
  def initialize(max_size = 3)
    @store = []
    @max_size = max_size
  end
 
  def push(x)
    raise "The stack is full" if @store.length == @max_size
    @store.push x
  end
 
  def pop
    raise "Stack Underflow - The stack is empty" if self.empty?
    @store.pop
  end
 
  def peek
    @store.last
  end
 
  def empty?
    @store.empty?
  end
 
  def index(x)
    @store[x]
  end
 
  def full?
   @store.length == @max_size
  end
 
end
 
 
#DRIVERS
 
#create a new stack 
my_stack = Stack.new(1);
 
# #verify there are no elements on the new stack
# puts "The stack is empty?  #{my_stack.empty?}"
 
# #add 3 elements to the stack
# my_stack.push("ruby")
# my_stack.push("is")
# my_stack.push("cool")
 
# #since our stack is implemented on array we can add any type of object
# my_stack.push(15)
 
 
# #look at all the elements in the stack by popping them off one at time 
 
#     puts "Next Element: #{my_stack.pop}"
#     puts "Next Element: #{my_stack.pop}"
#     puts "Next Element: #{my_stack.pop}"
#     puts "Next Element: #{my_stack.pop}"
 
# #verify there are no elements left on the stack
# puts "The stack is empty?  #{my_stack.empty?}"
 
# #what happens if you try to call pop on an empty stack?
# puts "Trying to remove an item from an empty stack ... "
#     puts "Next Element: #{my_stack.pop}"
 
 
p my_stack.push("hello")
p my_stack.full?
#p my_stack.push("hey")
 
class Queue
 
  def initialize
    @queue = []
  end
 
  def enqueue(object)
    @queue.push(object)
  end
 
  def dequeue
    @queue.shift
  end
end
 
my_queue = Queue.new
p my_queue.enqueue("hey")
p my_queue.enqueue("friend")
p my_queue.dequeue
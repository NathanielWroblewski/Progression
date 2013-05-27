# The fundamental way that programmers organize their code is by writing methods. Methods (the code you write between def and end) have input, output, and side-effects.

# A method's input is the arguments you pass in, such as in puts "hi mom", where the puts method's input is the argument "hi mom". The puts method takes input, but only ever returns nil as output. Its side-effect is that it writes to STDOUT. On the other hand, many methods have no side-effects (also known as functions) and are purely input/output. For example, File.exists?("app/models") takes "app/models" as input, and returns true or false.

# One of the conventions that you'll learn in Ruby is that methods with side-effects are appended with a ! (what programmers call a "bang"). This helps future programmers calling these methods understand that when they call it, something serious is happening behind the scenes.

# For this exercise, you will write a function (a method with no side-effects), and then a method with the side-effect of "destroying" its input argument.

# Note: the bang ! symbol is used because permanently modifying data is dangerous. Use destructive methods with caution.

# Learning Goals
# Preserving/consuming method arguments
# Modifying values in place
# Objectives
# Rules for your method
# You will be writing two versions of a method called destroy_message which takes in a string identified by the variable message and modifies that string based upon the following rules:

# A message is a string that may or may not contain a ":"
# If the original message contains a ":" then all content after (but not including) the ":" is removed when the message self-destructs. So if the original message is "This message will self destruct: Ruby is fun" then the destructed message is "This message will self destruct:".
# If the original message does not contain a ":" then it will not change in when it is destructed.
# Writing methods with no side effects
# Start by writing the destroy_message method following the rules outlined above. It must not permanently alter the original string passed in.

# What does that mean? Here is an example of a non-destructive method:

# name = "Mr. Billy Jones"

# # The String#sub method replaces one part of the string
# # with another and returns the new, modified string.
# name.sub('Jones', 'Jimmy Jones')
# # => "Mr. Billy Jimmy Jones"

# # But it does NOT permanently change the string, as we
# # can see here:
# name
# # => "Mr. Billy Jones"
# Destroying everything!
# Now, write the method destroy_message! which does the same thing as destroy_message (without the !) except that this new method will permanently modify the original string.

# What does it mean to permanently modify a piece of data? Here is an example of a destructive method:

# name = "Mr. Billy Jones"

# # The String#sub! method replaces one part of the ORIGINAL
# # string with another and returns the modified string.
# name.sub!('Jones', 'Jimmy Jones')
# # => "Mr. Billy Jimmy Jones"

# # When you call #sub! on a string, it permanently modifies
# # the original value.
# name
# # => "Mr. Billy Jimmy Jones"

def destroy_message(string)
  string.include?(":") ? string.scan(/.*:/).join : string
end
 
def destroy_message!(string)
  string.include?(":") ? string.gsub!(/:.*/,":") : nil
end
 
# Driver code... 
string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
puts destroy_message(string) == "this message will self-destruct:"
puts string == original_string # we shouldn't modify the string passed to destroy_message
 
string = "this has no message"
original_string = string.dup
puts destroy_message(string) == string
puts string == original_string # we shouldn't modify the string passed to destroy_message
 
string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
destroy_message!(string)
puts string == "this message will self-destruct:"
puts string != original_string
 
string = "this has no message"
result = destroy_message!(string)
puts result.nil?
puts string == string
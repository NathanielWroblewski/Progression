# Exercise: Separate Numbers with Commas
# Write a method separate_comma which takes an integer as its input and returns a comma-separated integer as a string. Like this:

# separate_comma(1000)    # => "1,000"
# separate_comma(1000000) # => "1,000,000"
# separate_comma(0)       # => "0"
# separate_comma(100)     # => "100"

def separate_comma(number)
  number.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
end
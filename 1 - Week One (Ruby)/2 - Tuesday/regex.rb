# Ruby's String class has over 100 public methods that give Ruby programmers a remarkable power to process, manipulate, and transform textual data. About a dozen of those String methods use Regular Expressions in order to allow for high-powered string matching.

# An example of low-powered string matching is when you use your browser's search (⌘f on a Mac) for a specific word, say, your own name. What if you wanted to search your browser for anything that matches the pattern for a social security number? For that, you'd use Regular Expressions.

# As you work through the exercises of this challenge, we recommend you use http://rubular.com to help you code your regex. Refer to the Pickaxe Guide or this overview if you get stuck!

# Objectives
# Use the driver code in the gist to guide you to a working solution.
# Add additional driver code where you want to feel more comfortable with your implementation. For instance, what happens when you pass a string with only a single SSN into the hide_all_ssns or get_all_ssns methods?
# Did adding driver code helped you solve the challenge more effectively? How? (Answer in the gist as a comment)

# Determine whether a string contains a Social Security number.
def has_ssn?(string)
  string.scan(/\d{3}-\d{2}-\d{4}/).empty? ? false : true
end
 
puts "has_ssn? returns true if it has what looks like a SSN"
puts has_ssn?("please don't share this: 234-60-1422") == true
 
puts "has_ssn? returns false if it doesn't have a SSN"
puts has_ssn?("please confirm your identity: XXX-XX-1422") == false
 
 
# Return the Social Security number from a string.
def grab_ssn(string)
  ssn = string.scan(/\d{3}-\d{2}-\d{4}/).join
  ssn.empty? ? nil : ssn
end
 
puts "grab_ssn returns an SSN if the string has an SSN"
puts grab_ssn("please don't share this: 234-60-1422") == "234-60-1422"
 
puts "grab_ssn returns nil if it doesn't have a SSN"
puts grab_ssn("please confirm your identity: XXX-XX-1422") == nil
 
 
# Return all of the Social Security numbers from a string.
def grab_all_ssns(string)
  string.scan(/\d{3}-\d{2}-\d{4}/)
end
 
puts "grab_all_ssns returns all SSNs if the string has any SSNs"
puts grab_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == ["234-60-1422", "350-80-0744", "013-60-8762"]
 
puts "grab_all_ssns returns an empty Array if it doesn't have any SSNs"
puts grab_all_ssns("please confirm your identity: XXX-XX-1422") == []
 
 
# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  string.gsub!(/(\d{3})-(\d{2})-(\d{4})/, 'XXX-XX-\3' )
  string
end
 
puts "hide_all_ssns obfuscates any SSNs in the string"
puts hide_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == "XXX-XX-1422, XXX-XX-0744, XXX-XX-8762"
 
puts "hide_all_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: XXX-XX-1422"
puts hide_all_ssns(string) == string
 
 
# Ensure all of the Social Security numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_ssns(string)
  string.gsub(/(\d{3})\D?(\d{2})\D?(\d{4})/, '\1-\2-\3')
end
 
puts "format_ssns finds and reformat any SSNs in the string"
puts format_ssns("234601422, 350.80.0744, 013-60-8762") == "234-60-1422, 350-80-0744, 013-60-8762"
 
puts "format_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: 44211422"
puts format_ssns(string) == string
# Exercise: Implement a Reverse Polish notation calculator
# Create an RPNCalculator class which can evaluate expressions written in Reverse Polish notation.

# It should have an evaluate instance method which takes as its input a valid RPN expression and returns its evaluation. Your calculator only needs to handle addition, multiplication, and subtraction (not division).

# Operators and numbers should be separated by a single space.

# For example,

# calc = RPNCalculator.new

# calc.evaluate('1 2 +')   # => 3
# calc.evaluate('2 5 *')   # => 10
# calc.evaluate('50 20 -') # => 30

# # The general rule is that 'A B op' is the same as 'A op B'
# # i.e., 5 4 - is 5 - 4.
# calc.evaluate('70 10 4 + 5 * -') # => 0

class RPNCalculator
  def evaluate(string)
    a = []
    string.split.each do |x|
      x == "*" ? a.push(a.pop * a.pop) : x == "+" ? a.push(a.pop + a.pop) : x == "-" ? a.push(-a.pop + a.pop) : a.push(x.to_i)
    end
  a[0]
  end
end
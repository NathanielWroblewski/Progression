# Did you ever use a TI-92 calculator? One of the amazing features of this calculator is that it could perform symbolic computations. For example, you could ask the TI-92: "What's the derivative of ?" and it'd spit back 3x^2.

# We're going to augment our Reverse Polish Notation calculator to support basic symbolic computations. The end result will be a program that works like this:

# calc = RPNCalculator.new

# calc.evaluate('3 4 +')     # => 7

# calc.evaluate('y x +')     # => 'y x +'
# calc.evaluate('3 1 x * +') # => '3 x +'
# calc.evaluate('0 x +')     # => 'x'

# calc.evaluate('x y +', :x => 1, :y => 2)         # => 3
# calc.evaluate('x y +', :x => 1)                  # => '1 y +'
# calc.evaluate('x y +', :y => 10)                 # => 'x 10 +'
# calc.evaluate('w z *', :z => 1)                  # => 'w'
# calc.evaluate('z x y + *'), :z => 10)            # => '10 x y + *'
# calc.evaluate('z x y + *'), :x => 1, :y => 2)    # => 'z 3 *'
# calc.evaluate('z x y + *'), :z => 10, :x => 3)   # => '10 3 y + *'
# We're graduating from modeling simple arithmetic to modeling the basic rules of algebra. Many of the techniques you'll learn doing this challenge are applicable when implementing your own programming language.

# Objectives
# Accommodating symbolic expressions
# We're going to add support to our calculator for symbolic expressions, e.g., 5 * (x + 10).

# The RPNCalculator#evaluate method should now work like this:

# calc = RPNCalculator.new

# calc.evaluate('* x + 3 4')       # => 'x 3 4 + *'
# calc.evaluate('2 8 foo_bar + *') # => '* 2 + 8 foo_bar'
# Don't worry about how to simplifying or evaluating these symbolic expressions, yet. That's for the next version.

# Simplifying Symbolic Expressions
# Next, let's implement some basic support for simplifying symbolic expressions. Our calculator should simplify the expressions as much as possible, given the fact the calculator doesn't know what values the symbols correspond to (yet).

# We'll only implement three rules, for now:

# # Rule 1, addition by 0
# # The sum of any number N and 0 is N

# calc.evaluate('0 k +')     # => 'k'
# calc.evaluate('x 0 0 + +') # => 'x'

# # Rule 2, multiplication by 1
# # The product of any number N and 1 is N

# calc.evaluate('1 k *')     # => 'k'
# calc.evaluate('x 1 1 * *') # => 'x'
# calc.evaluate('q 1 * 0 +') # => 'q'

# # Rule 3, multiplication by 0
# # The product of any number N and 0 is 0

# calc.evaluate('a b c 0 * * *') # => 0
# Where values can be evaluated they should be. These simplification rules just give us a way to partially evaluate particular combinations of symbolic expressions and numerical expressions.

# States more generally, let expr is any expression, which might include a variable.

# 1 expr * and expr 1 * should be written as just expr
# 0 expr + and expr 0 + should be written as just expr
# Expressions that can be evaluated should be, e.g., 4 1 + expr * should be written as 5 expr * .
# What is evaluation, really?

# Let's move up one rung on the ladder of abstraction. Evaluating arithmetic expressions like

# calc.evaluate('3 4 +')     # => 7
# can be seen as just another kind of simplification. Your original RPNCalculator happened to support this kind of simplification only. Consider modeling RPNCalculator#evaluate as a series of sequtially-applied simplification rules, one of which says "if both operands are numbers, apply the operator to them and return the numerical value."

# Evaluating symbols with values
# Now let's add the ability to bind variables to symbolic values. Add an optional second parameter to evaluate, so it looks like this:

# class RPNCalculator
#   def evaluate(expr, bindings = {})
#   end
# end
# The bindings hash maps symbols to their values. It doesn't have to contain every symbol. For example:

# calc = RPNCalculator.new
# calc.evaluate('x y +', :x => 1, :y => 2)         # => 3
# calc.evaluate('x y +', :x => 1)                  # => '1 y +'
# calc.evaluate('x y +', :y => 10)                 # => 'x 10 +'
# calc.evaluate('w z *', :z => 1)                  # => 'w'
# calc.evaluate('z x y + *'),  :z => 10)           # => '10 x y + *'
# calc.evaluate('z x y + *'), :x => 1, :y => 2)    # => 'z 3 *'
# calc.evaluate('z x y + *'), :z => 10, :x => 3)   # => '10 3 y + *'

class RPNCalculator
  LETTERS = ("a".."z").to_a
 
  def initialize
    @stack = []
  end
 
  def substitute!
    @operations.map! do |element|
      @subs[element.to_sym] ? @subs[element.to_sym].to_s : element
    end
  end
 
  def evaluate(operations, subs = {})
    @operations, @subs = operations.split(" "), subs
    @stack = []
    substitute! unless subs == {}
    @operations.each { |element| evalify(element) }
    @stack
  end
 
  def evalify(element)
    case element
    when "*" then @stack << multiply(pop!, pop!)
    when "+" then @stack << add(pop!, pop!)
    when "-" then @stack << subtract(pop!, pop!)
    else @stack << element
    end
    @stack.flatten!
  end
 
  def pop!
    @stack.pop
  end
 
  def letter?(letter)
    LETTERS.include?(letter)
  end
 
  def zero?(number)
    number == "0" ? true : false
  end
 
  def one?(number)
    number == "1" ? true : false
  end
 
  def multiply(a, b)
    return a if one?(b)
    return b if one?(a)
    return 0 if zero?(a) || zero?(b)
    mathify(a,b,:*)
  end
 
  def add(a,b)
    return a if zero?(b)
    return b if zero?(a)
    mathify(a,b,:+)
  end
 
  def subtract(a,b)
    return a if zero?(b)
    return b if zero?(a)
    mathify(b,a,:-)
  end
 
  def mathify(a,b,operation)
    return [b,a,operation.to_s] if letter?(a) || letter?(b)
    (a.to_i).send(operation, b.to_i)
  end
end
 
#####################################
calc = RPNCalculator.new
p calc.evaluate('k 1 *')     # => 'k'
p calc.evaluate('x 1 1 * *') # => 'x'
p calc.evaluate('3 4 +')     # => 7
 
p calc.evaluate('y x +')     # => 'y x +'
p calc.evaluate('3 1 x * +') # => '3 x +'
p calc.evaluate('0 x +')     # => 'x'
p calc.evaluate('x y +', :x => 1, :y => 2)         # => 3
p calc.evaluate('x y +', :x => 1)                  # => '1 y +'
p calc.evaluate('x y +', :y => 10)                 # => 'x 10 +'
p calc.evaluate('w z *', :z => 1)                  # => 'w'
p calc.evaluate('z x y + *', :z => 10)            # => '10 x y + *'
p calc.evaluate('z x y + *', :x => 1, :y => 2)    # => 'z 3 *'
p calc.evaluate('z x y + *', :z => 10, :x => 3)   # => '10 3 y + *'
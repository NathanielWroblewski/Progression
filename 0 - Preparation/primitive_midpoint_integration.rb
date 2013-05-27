# Primitive Midpoint Integration
# Midpoint integration of a function over some interval by n partitions. 
# #integrate(a,b,n,&f)

# where 'a' = lower bound of interval
# where 'b' = upper bound of interval
# where 'n' = number of partitions
# where 'f' = function of the form f = lamba { |x| x**2 }
# where the unary '&' converts blocks to procs and vice versa
# where 'dx' is the width of the approximating rectangles (determined by the number of partitions)

class Integration
  class << self
    
    def integrate(a,b,n,&f)
      dx = ( b - a ) / n.to_f
      n.times.inject(0) { |acum,i| acum + f[a + dx * ( i + 0.5 ) ] } * dx
    end
  end
end

require 'rspec'
require 'integration'

describe Integration do
  a = lambda { |x| x**2 } 
  it "should integrate correctly using the midpoint method" do
    Integration.integrate(1,2,100,&a).should be_within( 1e-5 ).of( 7.0 / 3 )
  end
end
#Exercise: Write your own exercise

#-----

# Exercise: Student Submission: Kaprekar's Number
# Define a method kaprekar? that can determine if its integer argument (k) is a Kaprekar number.

# Example:
# 9 is a Kaprekar number because
# 9 ^ 2 = 81 and 8 + 1 = 9

# Likewise, 297 is a Kaprekar number because
# 297 ^ 2 = 88209 and 88 + 209 = 297

# You can learn more about Kaprekar numbers here: http://en.wikipedia.org/wiki/Kaprekar_number

def kaprekar?(k)
  sqr, n = (k**2).to_s, k.to_s.length
  k == sqr[-n..-1].to_i + (sqr.length.even? ? sqr[0..(n-1)].to_i : sqr[0..(n-2)].to_i)
end

describe "kaprekar?" do
  it "should return true for 9" do
    kaprekar?(9).should be_true
  end
 
  it "should return false for 46" do
    kaprekar?(46).should be_false
  end
 
  it "should return true for 55" do
    kaprekar?(55).should be_true
  end
 
  it "should return false for 90" do
    kaprekar?(90).should be_false
  end
 
  it "should return true for 297" do
    kaprekar?(297).should be_true
  end
 
  it "should return true for 703" do
    kaprekar?(703).should be_true
  end
end
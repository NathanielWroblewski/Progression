# Exercise: Create a method to pad an array
# Implement Array#pad and Array#pad!. Each method accepts a minimum size (non-negative integer) and an optional pad value as arguments.

# If the array's length is less than the minimum size, Array#pad should return a new array padded with the pad value up to the minimum size.

# For example, ruby [1,2,3].pad(5)

# should return

# [1,2,3,nil,nil]
# And ruby [1,2,3].pad(5, 'apple')

# should return

# [1,2,3,'apple', 'apple']
# If the minimum size is less than or equal to the length of the array, it should just return the array.

# That is, [1,2,3].pad(3) should return [1,2,3].

# my_array.pad(0) should always return an array equal to my_array. Array#pad should always return a new object, i.e., it should be non-destructive.

# Array#pad! behaves identically to Array#pad except that it modifies the underlying array.

class Array
  def pad!(min_size, value = nil)
    until self.size >= min_size
      self.push(value)
    end
    self
  end

  def pad(min_size, value = nil)
    self.clone.pad!(min_size, value)
  end
end
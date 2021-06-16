class String
  def upcase?
    upcase == self
  end
end

# p "hello".upcase?
# p "HELLO".upcase?

class Integer
  def prime?
    return false if self < 2

    (2...self).each do |n|
      return false if self % n == 0
    end

    true
  end
end

# p 7.prime?
# p 2.prime?
# p 4.prime?

class Array
  def has_zero?
    include?(0) # equivalent to self.include?(0)
  end
end

p [4, 2, 3, 1, 0].has_zero?
p [4, 2, 3, 1].has_zero?

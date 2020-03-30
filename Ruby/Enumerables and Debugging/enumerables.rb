class Array
  def my_each(&prc)
    length = self.length
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    result = []
    self.each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.each { |el| result << el unless prc.call(el) }
    result
  end

  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.each do |el|
      return false unless prc.call(el)
    end
    true
  end
end


## TESTS ##

# my_each test
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# my_select test
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# my_reject test
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# my_any? test
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# my_all? test
# a = [1, 2, 3]
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
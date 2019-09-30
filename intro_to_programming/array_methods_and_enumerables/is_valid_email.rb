# Write a method is_valid_email that takes in a string
# and returns a boolean indicating whether or not it
# is a valid email address.

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  name_and_domain = str.split('@')
  # contains exactly on @ symbol
  return false if name_and_domain.length > 2

  name, domain = name_and_domain

  # contains only lowercase alphabetic letters
  lowercase_alphabets = "abcdefghijklmnopqrstuvwxyz"
  name.each_char do |ch|
    if !lowercase_alphabets.include?(ch)
      return false
    end
  end

  # contains exactly one . after the @
  provider_and_region = domain.split('.')
  return false if provider_and_region.length != 2

  return true
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false


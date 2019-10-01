# Write a method retrieve_values that takes in two hashes and a key.
# The method should return an array containing the values from the
# two hashes that correspond with the given key.

def retrieve_values(hash1, hash2, key)
  key_array = []
  key_array << hash1[key]
  key_array << hash2[key]
  key_array
end


dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts
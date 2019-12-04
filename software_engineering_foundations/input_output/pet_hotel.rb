require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
  def initialize(name)
     @name = name
     @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end


hotel = PetHotel.new("Animal Inn")

cat = Cat.new("Sennacy")
dog = Dog.new("Fido")

hotel.check_in(cat)
hotel.check_in(dog)


p hotel
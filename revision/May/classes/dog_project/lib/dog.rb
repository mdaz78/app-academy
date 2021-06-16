class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def bark
    return "BORK!" if @age >= 5
    "bork!"
  end

  def favorite_food?(food)
    serialized_favorited_foods = @favorite_foods.map { |favorite_food| favorite_food.downcase }
    serialized_favorited_foods.include? (food.downcase)
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def favorite_foods
    @favorite_foods
  end
end

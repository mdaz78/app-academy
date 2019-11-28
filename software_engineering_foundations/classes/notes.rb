# Defining a class
class Cat
  @@behavior = "kiddish"

  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end

  # getters
  def name
    @name
  end

  def age
    @age
  end

  def color
    @color
  end

  def behavior
    @@behavior
  end

  # setters
  def age=(new_age)
    @age = new_age
  end
end

# Initialize an instance of class
cat_1 = Cat.new("Sennacy", 5, "brown")
p cat_1
p cat_1.behavior

cat_2 = Cat.new("Whiskers", 4, "white")
p cat_2
p cat_2.behavior
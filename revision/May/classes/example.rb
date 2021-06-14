class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end

  def color
    @color
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def color=(color)
    @color = color
  end

  def age=(age)
    @age = age
  end

  def meow_at(person)
    p "#{@name} meows at #{person}"
  end
end

cat_1 = Cat.new("Sennacy", "Brown", 5)
p cat_1.name
p cat_1.color
p cat_1.age
p cat_1.meow_at("Zafar")

cat_1.name = "Sinnacy"
cat_1.color = "White"
cat_1.age = 7

p cat_1.name
p cat_1.color
p cat_1.age
p cat_1.meow_at("abu")

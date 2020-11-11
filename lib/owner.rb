class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    owner_cat = []
    Cat.all.each { |cat| owner_cat << cat if cat.owner == self }
    return owner_cat
  end

  def dogs
    owner_dog = []
    Dog.all.each { |dog| owner_dog << dog if dog.owner == self }
    return owner_dog
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy" if dog.owner == self }
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" if cat.owner == self }
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
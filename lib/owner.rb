require "pry"
class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@all
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name) 
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name) 
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name) 
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def walk_dogs
     @pets[:dogs].each{|pet| pet.mood="happy" if pet.mood=="nervous"}
  end

  def play_with_cats
    @pets[:cats].each{|pet| pet.mood="happy" if pet.mood=="nervous"}
  end

  def feed_fish
    @pets[:fishes].each{|pet| pet.mood="happy" if pet.mood=="nervous"}
  end

  def sell_pets
    @pets.each do |key, value| 
      value.each do |pet|
        if pet.mood == "happy"
          pet.mood = "nervous" 
          value.clear
        end
      end
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
# binding.pry
# 0

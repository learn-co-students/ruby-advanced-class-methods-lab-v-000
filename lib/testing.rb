require 'pry'
class Person
  @@all = []
  attr_accessor :name

  def self.all
    @@all
  end

  def self.create(name)
    binding.pry
    puts "Waaa"
    person = self.new
    person.name = name
    @@all << person
  end

end

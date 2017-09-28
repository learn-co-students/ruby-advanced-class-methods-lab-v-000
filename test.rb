require 'pry'

csv_data = "Elon Musk, 45, Tesla
Mark Zuckerberg, 32, Facebook
Martha Stewart, 74, MSL"

class Person
  attr_accessor :name, :age, :company

  def self.new_from_csv(csv_data)
    rows = csv_data.split("\n")
    people = rows.collect do |row|
      binding.pry
      data = row.split(", ")
      name = data[0]
      age = data[1]
      company = data[2]

      person = self.new # This is an important line.
      person.name = name
      person.age = age
      person.company = company
      person
    end
    people
  end
end

nick = Person.new_from_csv(csv_data)
binding.pry

puts "hello"

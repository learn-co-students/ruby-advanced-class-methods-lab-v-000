Class Dog

def initialize(name)
  thisdog = self.new
  thisdog.name = name
  thisdog.food = "bones"
  thisdog.save
  thisdog

end

def who
  puts thisdog.name
  puts thisdog.food
  puts @name
  puts @food
end

def save
  self.class.all << self
end

end

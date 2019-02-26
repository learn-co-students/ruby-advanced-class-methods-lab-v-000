class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    s = self.new
    s.save
    s
  end
  def self.create_by_name(string_name)
    s = self.new
    s.name = string_name
    s.save
    s
  end
  def self.new_by_name(string_name)
    s = self.new
    s.name = string_name
    s
  end
  def self.find_by_name(string_name)
    self.all.detect {|i| i.name == string_name}
  end
  def self.find_or_create_by_name(string_name)
   self.find_by_name(name) || self.create_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

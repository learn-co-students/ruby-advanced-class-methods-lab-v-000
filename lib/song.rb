class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    self
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
   self.new_by_name(name).save.uniq
   self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect do |song|
    song.name == name
     end
    end
end

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  #   @@all << self
  # end

  def self.all
    @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.all.detect {|song| song.name == name}
    self.find_by_name(name) || self.create_by_name(name)
  end


  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

end

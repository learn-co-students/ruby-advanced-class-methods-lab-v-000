class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name 
  end # of initialize

  def self.all
    @@all
  end # of self.all


  def save
    self.class.all << self
  end # of save 


  def self.create
    song = self.new
    song.name = name
    song.save
    song 
  end # of self.create


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end # of self.new_by_name


  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save 
  end # of self.create_by_name

end # of class 

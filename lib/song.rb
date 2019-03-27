class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    #self.all << name
  end

  # def self.create(name)
  #   person = self.new
  #   person.name = name
  #   @@all << person
  # end
end

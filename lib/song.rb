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
    self.all<<song
    song 
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all<<song
    song
  end

  def self.find_by_name(name)
     @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new_by_name(name)
    if song.name = name
      return song
    else
      self.create_by_name
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name)
    song = self.new
    name_array = name.chomp(".mp3").split(" - ")
    song.name = name_array[1]
    song.artist_name = name_array[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    name_array = name.chomp(".mp3").split(" - ")
    song.name = name_array[1]
    song.artist_name = name_array[0]
    @@all<<song
  end

  def self.destroy_all
    @@all = []
  end
end

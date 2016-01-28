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
#     song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    @@all.sort {|x, y| x.name <=> y.name}
  end

  def self.new_from_filename(file_name)
    artist, name = file_name.split(" - ")
    name = name.split(".mp3")[0]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    artist, name = file_name.split(" - ")
    name = name.split(".mp3")[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end
  
  def self.destroy_all
    @@all = []
  end





end

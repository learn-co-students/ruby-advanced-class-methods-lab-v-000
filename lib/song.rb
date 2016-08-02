class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new("")
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new(title)
  end

  def self.create_by_name(title)
    song = self.new(title)
    @@all << song
    song
  end

  def self.find_by_name(title)
    song = self.all.detect{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    if song == nil
      song = self.create_by_name(title)
    end
    song
  end

  def self.alphabetical
    array = self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    array = filename.split(" - ")
    song = self.new(array[1], array[0])
  end

  def self.create_from_filename(filename)
    filename.chomp!(".mp3")
    array = filename.split(" - ")
    song = self.new(array[1], array[0])
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

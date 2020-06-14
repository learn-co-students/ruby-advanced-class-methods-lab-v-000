class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name = "", artist_name = "")
  	@name = name
  	@@all << self
  	@artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	new_song = self.new
  	new_song
  end

  def self.new_by_name(song_name)
  	self.new(song_name)
  end

  def self.create_by_name(song_name)
  	self.new(song_name)
  end

  def self.find_by_name(song_name)
  	self.all.detect{ |name_of_song| name_of_song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
  	self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
  	self.all.sort_by{ |each_song| each_song.name }
  end

  def self.new_from_filename(filename)
  	self.new(filename.split(" - ")[1].gsub(".mp3", ""), filename.split(" - ")[0])
  end

  def self.create_from_filename(filename)
  	self.new(filename.split(" - ")[1].gsub(".mp3", ""), filename.split(" - ")[0])
  end

  def self.destroy_all
  	self.all.clear
  end

end

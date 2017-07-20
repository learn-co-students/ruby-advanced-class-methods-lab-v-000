class Song
	require 'pry'
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
  	song.save
  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song.save
  	song
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)

  	self.all.detect {|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
  	
  	song = Song.find_by_name(name) 
  	song == nil ? Song.create_by_name(name) : song
  end

  def self.alphabetical
  	#binding.pry
  	self.all.sort_by {|song| song.name}  
  end

  def self.destroy_all
  	self.all.clear
  end

  def self.new_from_filename(song_file)
  arr = song_file.chomp('.mp3').split(" - ")
  song = self.new
  song.artist_name = arr[0]
  song.name = arr[1]
  song.save
  song
  end

def self.create_from_filename(song_file)
  arr = song_file.chomp('.mp3').split(" - ")
  song = self.new
  song.artist_name = arr[0]
  song.name = arr[1]
  song.save
  song
  end

end

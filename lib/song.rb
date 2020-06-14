require 'pry'

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

  def self.find_by_name(song_name)
  	@@all.any? do |song| 
  		if song_name == song.name
  			return song
  		end
  	end
  	
  end

  def self.find_or_create_by_name(name)
  	self.find_by_name(name) ? self.new_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}	
  end

  def self.new_from_filename(filename)
	file = filename.split(" - ")
	artist_name = file[0]
	song_name = file[1].chomp!(".mp3")
	song = self.new
	song.name = song_name
	song.artist_name = artist_name 
	song
	
  end

  def self.create_from_filename(filename)
  	file = filename.split(" - ")
	artist_name = file[0]
	song_name = file[1].chomp!(".mp3")
	song = self.new
	song.name = song_name
	song.artist_name = artist_name 
	song.save
	song

	 # binding.pry
  end

  def self.destroy_all
  	@@all = []
  	
  end
 
end

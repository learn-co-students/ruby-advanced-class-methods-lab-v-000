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
  	song
  end

  def self.create_by_name(name)
  	song = self.create
  	song.name = name 
  	song
  end

  def self.find_by_name(name)
  	self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.all.include? name
  		song = name
  		song
  	else song = self.create_by_name(name)
  		song
  	end
  end

  def self.alphabetical
  	self.all.sort_by do |song|
  		song.name 
  	end
  end

  def self.new_from_filename(file_mp3)
  	file = file_mp3.split(" - ")
  	artist_name = file[0]
  	song_name = file[1].chomp(".mp3")

  	song = self.new
  	song.name = song_name
  	song.artist_name = artist_name
  	song
  end

  def self.create_from_filename(file_mp3)
  	song = self.new_from_filename(file_mp3)
  	song.save
  end

  def self.destroy_all
  	self.all.clear
  end
end

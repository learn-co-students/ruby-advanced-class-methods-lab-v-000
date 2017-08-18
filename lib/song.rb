class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
  	song = self.new
  	self.all << song
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
  	self.all << song
  	song
  end

  def self.find_by_name(name)
  	songs = self.all
  	songs.detect {|song|song.name == name}
  end  

  def self.find_or_create_by_name(name)
  	res = self.find_by_name(name)
  	if res == nil
  		self.create_by_name(name)
  	else
  		return res 
  	end
  end

  def self.alphabetical
  	self.all.sort_by {|song|song.name}
  end 

  def self.new_from_filename(file_name)
  	song = self.new
  	file_arr = file_name.split(" - ")
  	song.artist_name = file_arr[0]
  	song.name = file_arr[1].sub(/.mp3/, '')
  	song
  end

  def self.create_from_filename(file_name)
  	song = self.new_from_filename(file_name)
  	self.all << song
  	song
  end 

  def self.destroy_all
  	self.all.clear
  end  


end

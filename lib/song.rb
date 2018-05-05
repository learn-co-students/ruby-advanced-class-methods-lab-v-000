class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#above code was given, below is new code 
  def self.create
  	song = self.new
  	song.save 
  	song 
  end 

  def self.new_by_name(song_name) 
  	song = self.new 
  	song.name = song_name
  	song 
  end 

  def self.create_by_name(song_name) 
  	song = self.create 
  	song.name = song_name 
  	song
  end 

  def self.find_by_name(song_name) 
  	self.all.detect {|song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name) 
  	 self.find_by_name(song_name) || self.create_by_name(song_name) 
  end 

  def self.alphabetical 
  	self.all.sort_by { |song| song.name }
  end 

  def self.new_from_filename(filename) 
  	song_data = filename.split(" - ") 
  	song_name = song_data[1].split(".")[0]
  	song_artist = song_data[0] 
  	song = self.new 
  	song.name = song_name 
  	song.artist_name = song_artist 
  	song 
  end 

  def self.create_from_filename(filename) 
  	song_data = filename.split(" - ") 
  	song_name = song_data[1].split(".")[0]
  	song_artist = song_data[0] 
  	song = self.create 
  	song.name = song_name 
  	song.artist_name = song_artist 
  	song 
  end 

  def self.destroy_all 
  	self.all.clear
  end

end

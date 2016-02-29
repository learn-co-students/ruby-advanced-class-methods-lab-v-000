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
  	new_song = self.new
  	new_song.save
  	new_song
  end

  def self.new_by_name(song)
  	new_song = self.new
  	new_song.name = song
  	new_song
  end

  def self.create_by_name(song)
  	new_song = self.new
  	new_song.save
  	new_song.name = song
  	new_song
  end

  def self.find_by_name(song)
  	all.each do |name|
  		return name if name.name == song
  	end
  end

  def self.find_or_create_by_name(song)
  	self.create_by_name(song) if self.find_by_name(song) != song
  end

  def self.alphabetical
  	all.sort_by {|song| song.name}  
  end

  def self.new_from_filename(song)
  	song_split = song.split("-")
  	artist = song_split[0].strip!
  	name = song_split[1]
  	name = name.split(".")
  	name = name[0].strip!
  	new_song = self.new
  	new_song.name = name
  	new_song.artist_name = artist
  	new_song
  end

  def self.create_from_filename(song)
		song_split = song.split("-")
  	artist = song_split[0].strip!
  	name = song_split[1]
  	name = name.split(".")
  	name = name[0].strip!
  	new_song = self.new
  	new_song.name = name
  	new_song.artist_name = artist
  	new_song.save
  end

  def self.destroy_all
  	all.clear
  end
end

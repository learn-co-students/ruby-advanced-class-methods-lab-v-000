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
    @@all << self.new
    return @@all[@@all.length-1]
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

  def self.find_by_name(name_string)
  	@@all.find {|song| song.name == name_string}
  end

  def self.find_or_create_by_name(name_string)
    if
  	  self.find_by_name(name_string) == nil
  	  song = self.create_by_name(name_string)
  	  song
  	else
  	  self.find_by_name(name_string)
  	end
  end

  def self.alphabetical
  	@@all.sort! { |a,b| a.name <=> b.name }
  end

  def self.new_from_filename(artist_song_string)
  	song = self.new
  	data = artist_song_string.split(" - ")
  	song.artist_name = data[0]
	  song_type = data[1].split(".")
	  song.name = song_type[0]
    song
  end

  def self.create_from_filename(artist_song_string)
    song = self.new
    data = artist_song_string.split(" - ")
    song.artist_name = data[0]
    song_type = data[1].split(".")
    song.name = song_type[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  private

  def self.all
    @@all
  end

  def self.create
  	song = self.new
  	@@all << song
  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = new_by_name(name)
  	@@all << song
  	song
  end

  def self.find_by_name(name)
  	@@all.find do |song|
  		song.name == name
  	end
  end

  def self.find_or_create_by_name(name)
  	if find_by_name(name)
  		return find_by_name(name)
  	else create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by do |song|
  		song.name
  	end
  end

  def self.new_from_filename(filename)
  	file = filename.split(" - ")
  	artist = file[0]
  	song_and_type = file[1].split(".")
  	song_name = song_and_type[0]
  	song = self.new
  	song.artist_name = artist
  	song.name = song_name
  	song
  end

  def self.create_from_filename(filename)
  	file = filename.split(" - ")
  	artist = file[0]
  	song_and_type = file[1].split(".")
  	song_name = song_and_type[0]
  	song = self.new
  	song.artist_name = artist
  	song.name = song_name
  	song.save
  	song
  end

  def self.destroy_all
  	@@all.clear
  end
end

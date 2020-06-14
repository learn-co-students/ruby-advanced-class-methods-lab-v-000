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
  	song = self.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  	else
  		self.new_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by{|a| a.name}
  end

  def self.new_from_filename(filename)
  	filename.slice!(/.mp3/)
  	name_array = filename.split(" - ")

  	artist_name = name_array[0]
  	song_name = name_array[1]

  	song = self.new
  	song.artist_name = artist_name
  	song.name = song_name
  	song
  end

  def self.create_from_filename(filename)
  	self.new_from_filename(filename).save
  end

  def self.destroy_all
  	self.all.clear
  end




end

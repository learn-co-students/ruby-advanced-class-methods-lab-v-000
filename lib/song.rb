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
require 'pry'
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
  	Song.all.detect { |song| song.name==name }
  end

  def self.find_or_create_by_name(name)
  	@@all.include?(name) ? Song.find_by_name(name) : Song.create_by_name(name)
  end

  def self.alphabetical
  	output = []
  	@@all.each { |song| output << song.name }
  	output.sort.collect { |name| Song.find_by_name(name)  }
  end

  def self.new_from_filename(file)
  	file.chomp!(".mp3")
  	split = file.split(" - ")
  	artist_name, name = split[0], split[1]
  	#binding.pry
  	song = self.new
  	song.artist_name = artist_name
  	song.name = name  	
  	song
  end

  def self.create_from_filename(file)
  	file.chomp!(".mp3")
  	split = file.split(" - ")
  	artist_name, name = split[0], split[1]
  	song = self.new
  	song.artist_name = artist_name
  	song.name = name
  	song.save
  	song
  end

  def self.destroy_all
  	@@all.clear
  end

end

#Song.new_from_filename("Thundercat - For Love I Come.mp3")
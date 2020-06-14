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
  	song
  end

  def self.create_by_name(name)
  	song = self.new_by_name(name)
  	song.save
  	song
  end

  def self.find_by_name(name_to_search)
  	all.select do |song|
  		name_to_search == song.name
  	end[0]
  end

  def self.find_or_create_by_name(new_name)
  	song_exists = false
  	existant_song = self.new
  	all.each do |song|
  		if song.name == new_name
  			song_exists = true
  			existant_song = song
  		end
  	end

  	if !song_exists
  		self.create_by_name(new_name)
  	else
  		existant_song
  	end
  end

  def self.alphabetical
  	alphabetized_list = []
  	all_songs_copy = all

  	all.length.times do
  		lowest_on_this_pass = all_songs_copy[0]
  		all_songs_copy.each do |song|
  			if song.name < lowest_on_this_pass.name
  				lowest_on_this_pass = song
  			end
  		end
  		all_songs_copy.delete(lowest_on_this_pass)
  		alphabetized_list << lowest_on_this_pass
  	end
  	alphabetized_list
  end

  def self.new_from_filename(filename)
  	song = self.new
  	split_by_dash = filename.split(" - ")

  	name_with_mp3 = split_by_dash[1]
  	song.name = name_with_mp3.split('.')[0]

  	song.artist_name = split_by_dash[0]

  	song
  end

  def self.create_from_filename(filename)
  	song = self.new_from_filename(filename)
  	song.save
  end

  def self.destroy_all
  	all.clear
  end

end

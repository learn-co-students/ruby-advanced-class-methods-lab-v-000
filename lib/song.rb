require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # return @@all
  def self.all
    @@all
  end

  # save all songs 
  def save
    self.class.all << self
  end

  # create new instance, shovel into @@all, and return new instance
  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
  
  # create new instance, change its name, and return the new song
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  # create new instance, change its name, shovel into @@all return new song
  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save 
    new_song
  end
  
  # find a song by its name
  def self.find_by_name(name)
    self.all.find{|song| song.name === name}
  end
  
  # find it by name if exists and return instance, or create it by name
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) === nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  # sort each song alphabetically
  def self.alphabetical
    self.all.sort_by!{|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    split_filename = file_name.split(' - ')
    artist_name = split_filename[0]
    song_name = split_filename[1].split('.')[0]
    new_song = self.new 
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end
  
  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end
end

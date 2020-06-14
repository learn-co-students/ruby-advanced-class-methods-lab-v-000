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
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new #instantiate new song
    song.name = song_name #call name= writer from attr_accessor on song instance to set instance variable @name and store in variable
    song #call new song instance with @name property
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    #create a new song with name and return new song instance
    #return matching song instance name - match song_name
  end

  def self.alphabetical
     @@all.sort_by {|songs| songs.name }
  end

  def self.new_from_filename(file_name)
    split_file = file_name.split(/(-|.mp3)/)
    artist_name = split_file[0]
    song_name = split_file[2]
    song = self.new
    song.name = song_name.strip
    song.artist_name = artist_name.strip
    song
  end

  def self.create_from_filename(file_name)
    save_file = self.new_from_filename(file_name)
    save_file.save
  end

  def self.destroy_all
    self.all.clear
  end
end

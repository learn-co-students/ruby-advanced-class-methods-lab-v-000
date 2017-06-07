require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end

  def intialize(name)
    @name = name
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(string)
    song_name = self.new
    song_name.name = string
    song_name
  end

  def self.create_by_name(string)
    #is there a way to call the .new_by_name method
    #set it to a variable, and push it into @@all?
    song_name = self.create #.create, already does the .new and .push to array
    song_name.name = string
    song_name
  end

  def self.find_by_name(string)
    self.all.detect{|song_name| song_name.name == string}
  end

  def self.find_or_create_by_name(string)
    #first, check if the song exist
    #if it doesn't, .create_by_name
    self.find_by_name(string) || self.create_by_name(string)
  end

  def self.alphabetical
    all.sort_by do |song_name|
      song_name.name
    end
  end

  def self.new_from_filename(file_name)
    #Split file into artist and song
    array = file_name
    file_split = array.split(" - ")
    #Divide artist and song, and drop .mp3(w/ .gsub)
    name_artist = file_split[0]
    song_name = file_split[1].gsub(".mp3", "")
    #Now create new song
    song = self.new
    song.name = song_name
    song.artist_name = name_artist
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear 
  end 

  def save
    self.class.all << self
  end

end

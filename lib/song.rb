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
    # song.name = name
    song.save
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.new_by_name(name)
    end
    #   else
    #     song = self.new
    #     song.name = name
    #     song
    #   end
  end

  def self.alphabetical
    alphabetized_songs = @@all.sort_by {|song| song.name}
    # @@all.sort {|x, y| x.name <=> y.name}
    alphabetized_songs
  end

  def self.new_from_filename(filename)
    # Thundercat - For Love I Come.mp3
    # if the song is in `.mp3` format then return a new `Song` instance
    # filename.match(/\.mp3/)
    # if filename.include?(".mp3") == true
      # new_filename = filename.gsub(".mp3", "").split(" - ") # THIS WORKS TOO!!!
      new_filename = filename.chomp(".mp3").split(" - ")
      # new_filename = filename.split(" - ")  #and split the string into two at the "-"

      song = self.new_by_name(new_filename[1])  #first index of the new array is the song name
      song.artist_name = new_filename[0]
      # song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
      song
      # new_filename[0] =               #second index of the new array is the artist name
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end 

end

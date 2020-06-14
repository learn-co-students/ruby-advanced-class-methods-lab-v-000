require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@songs = []

  def self.all
    @@songs
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    #song = "#{@name}" + " - #{@artist_name}"
    @@songs << song
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def Song.find_by_name(name)
    @@songs.detect{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def Song.alphabetical
    @@songs.sort_by{|song| song.name}
  end


  def Song.new_from_filename(filename)
    file = filename.split(" - ") #["Thundercat ", " For Love I Come.mp3"]
    artist_name = file[0]
    name = file[1].chomp(".mp3")
    song2 = Song.new
    song2.name = name
    song2.artist_name = artist_name
    song2
  end

  def Song.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end

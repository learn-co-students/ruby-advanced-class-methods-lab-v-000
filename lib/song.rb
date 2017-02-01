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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(new_name)
    new_song = self.new
    new_song.name = new_name
    new_song
  end

  def self.create_by_name(new_name)
    new_song = self.new
    new_song.name = new_name
    new_song.save
    new_song
  end

  def self.find_by_name(search_name)
    self.all.detect { |song| song.name == search_name }
  end

  def self.find_or_create_by_name(search_name)
    x = find_by_name(search_name)
    if x == nil
      create_by_name(search_name)
    else
      x
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    new_artist_name = filename[0]
    song_name = filename[1]
    song_name = song_name.sub(/(.mp3)/, "")

    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = new_artist_name
    new_song.save
    new_song
  end

  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    new_artist_name = filename[0]
    song_name = filename[1]
    song_name = song_name.sub(/(.mp3)/, "")

    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = new_artist_name
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
  
end

#Song.create_by_name("Call Me Maybe")
#Song.create_by_name("Thriller")
#Song.create_by_name("Blank Space")
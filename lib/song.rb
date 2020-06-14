# require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
      @@all.select {|found_song| found_song.name == name}.first
  end

  def self.find_or_create_by_name(song_name)
        if self.find_by_name(song_name)
          self.find_by_name(song_name)
        else
          self.create_by_name(song_name)
        end
    end

  def self.alphabetical
    @@all.sort_by {|object| object.name}
  end

  def self.new_from_filename(mp3_name)
    total_array = mp3_name.split(" - ")
    song = self.new
    @artist_name = total_array[0]
    @name = total_array[1].split(".mp3").first
    song.name = @name
    song.artist_name = @artist_name
    song
  end

  def self.create_from_filename(mp3_name)
  song = self.new_from_filename(mp3_name)
  @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end

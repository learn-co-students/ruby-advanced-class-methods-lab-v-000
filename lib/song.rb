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
    self.new.tap do |object|
      self.all << object
    end
  end

  def self.new_by_name(song)
    self.new.tap do |object|
      object.name = song
    end
  end

  def self.create_by_name(song)
    self.new.tap do |object|
      object.name = song
      self.all << object
    end
  end

  def self.find_by_name(song)
    self.all.detect{|object| object.name == song}
  end

  def self.find_or_create_by_name(song)
    self.new.tap do |object|
      object.name = song
      if self.all.detect{|object| object == song} == song
        self.all
      else
        self.all << song unless self.all.include?(song)
      end
    end
  end

  def self.alphabetical
    self.all.sort_by!{|object| object.name}
  end

  def self.new_from_filename(file)
    no_ext_song = file.chomp(".mp3")
    artist = no_ext_song.split(" - ")[0]
    title = no_ext_song.split(" - ")[1]

    song_file = self.new
    song_file.artist_name = artist
    song_file.name = title
    song_file
  end

  def self.create_from_filename(file)
    no_ext_song = file.chomp(".mp3")
    artist = no_ext_song.split(" - ")[0]
    title = no_ext_song.split(" - ")[1]

    song_file = self.create
    song_file.artist_name = artist
    song_file.name = title
    song_file
  end

  def self.destroy_all
    self.all.clear
  end
end

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
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if !@@all.empty?
      @@all.each do |song|
        if song.name == song_name
         song
        end
      end
    end
      self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    artist_info = filename.split(' - ')
    artist_song = self.create
    artist_song.artist_name = artist_info[0]
    artist_song.name = artist_info[1].chomp('.mp3')
    artist_song
  end

  def self.create_from_filename(filename)
    artist_info = filename.split(' - ')
    artist_song = self.create
    artist_song.artist_name = artist_info[0]
    artist_song.name = artist_info[1].chomp('.mp3')
    artist_song.save
    artist_song
  end

  def self.destroy_all
    @@all.clear
  end
end

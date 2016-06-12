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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    self.all.each do |song|
      if song.name == song_name
        return song
      end
    end
    self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(' - ')
    song = self.new
    song.name = arr[1].chomp('.mp3')
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    arr = filename.split(' - ')
    song = self.create_by_name(arr[1].chomp('.mp3'))
    song.artist_name = arr[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

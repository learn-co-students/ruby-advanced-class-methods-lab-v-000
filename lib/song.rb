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
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      return @@all.last
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(artist_name_filetype)
    song_array = artist_name_filetype.split(/[-.]/).map(&:strip)
    song = self.new
    @artist_name = song_array[0]
    @name = song_array[1]
    song.artist_name = @artist_name
    song.name = @name
    song
  end

  def self.create_from_filename(artist_name_filetype)
    song_array = artist_name_filetype.split(/[-.]/).map(&:strip)
    song = self.new
    @artist_name = song_array[0]
    @name = song_array[1]
    song.artist_name = @artist_name
    song.name = @name
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

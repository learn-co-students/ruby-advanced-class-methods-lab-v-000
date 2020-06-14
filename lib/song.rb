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

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
  end

  def self.create
    created_song = Song.new("","")
    created_song.save
    created_song
  end

  def self.new_by_name(name)
    created_song = Song.new(name, "")
    created_song
  end

  def self.create_by_name(name)
    created_song = Song.new(name, "")
    created_song.save
    created_song
  end

  def self.find_by_name(name)
    found_song = Song.all.find{|song| song.name == name}
    found_song
  end

  def self.find_or_create_by_name(name)
    found_song = Song.find_by_name(name)
    if found_song != nil
      found_song
    else
      created_song = Song.create_by_name(name)
      created_song
    end
  end

  def self.alphabetical
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs
  end

  def self.new_from_filename(filename)
        split_filename = filename.split(%r/( - )|[.]/)
        name = split_filename[2]
        artist_name = split_filename[0]
        created_song = Song.new(name, artist_name)
        #binding.pry
        created_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end

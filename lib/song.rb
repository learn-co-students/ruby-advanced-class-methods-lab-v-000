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

  #binding.pry
  def self.create
    song = self.new
    self.all << song
    song
   #binding.pry
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
   # binding.pry
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
   # binding.pry
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end

  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
    #binding.pry
  end

  def self.new_from_filename(artist_title)
    new_a =  artist_title.gsub(/.mp3/, '').split(/\s\-\s/)
    song = self.create
    if new_a != nil
      song.name = new_a[1]
      song.artist_name = new_a[0]
    end
    song

   # binding.pry
  end

  def self.create_from_filename(artist_title)
    song = self.new_from_filename(artist_title)
    song_match = self.find_by_name(song.name)
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

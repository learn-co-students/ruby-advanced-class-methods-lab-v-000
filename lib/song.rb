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
    @song = self.new
    @song.save.last
  end

  def self.new_by_name(n)
    @song = self.new
    @song.name = n
    @song 
  end

  def self.create_by_name(n)
    self.new_by_name(n)
    @song.save.last
  end

  def self.find_by_name(n)
    @@all.detect { |song| song.name == n}
  end

  def self.find_or_create_by_name(name)
    
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end    
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file)
    @artist = file.split("-")[0].delete(" ")
    @name = file.split("-")[1].split(".")[0].lstrip
    song = self.new_by_name(@name)
    song.artist_name = @artist
    song
  end

  def self.create_from_filename(file)
    @artist
    @name
    song = self.create_by_name(@name)
    song.artist_name = @artist
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

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
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)  
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort do |a, b|
       a.name <=> b.name
    end
  end

  def self.new_from_filename(file)
    song = self.new
    a = file.split(" - ")
    a[1].slice!(".mp3")
    song.name = a[1]
    song.artist_name = a[0]
    song
  end

  def self.create_from_filename(file)
    song = self.create
    a = file.split(" - ")
    a[1].slice!(".mp3")
    song.name = a[1]
    song.artist_name = a[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end





end

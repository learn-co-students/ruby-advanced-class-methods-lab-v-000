require "pry"

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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
     song = self.find_by_name(name)
     if song == nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    self.all.sort! {|song_1, song_2| song_1.name <=> song_2.name }
    self.all
  end

  def self.new_from_filename(filename)
    filename.to_s.chomp!(".mp3")
    name_array = []
    name_array = filename.to_s.split("-")
    name_array.each {|item| item.strip!}
    song = self.create_by_name(name_array[1].to_s)
    song.artist_name = name_array[0].to_s
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


end

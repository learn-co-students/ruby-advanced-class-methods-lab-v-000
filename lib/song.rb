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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |instance|
      if instance.name == name
        return instance
      end
    end
  end

  def self.find_or_create_by_name(name)
    @@all.each do |instance|
      if instance.name == name
        return instance
      end
    end
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.alphabetical
    @@all.sort_by do |instance|
      instance.name
    end
  end

  def self.new_from_filename(name)
    song = self.new
    song.name = name.split(/\s-\s|\.mp3/)[1]
    song.artist_name = name.split(/\s-\s|\.mp3/)[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = name.split(/\s-\s|\.mp3/)[1]
    song.artist_name = name.split(/\s-\s|\.mp3/)[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end

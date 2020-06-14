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

  def Song.create
    song = Song.new
    @@all << song
    song
  end
  
  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end
  
  def Song.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def Song.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def Song.alphabetical
    @@all.sort_by {|song| song.name }
  end
  
  def Song.new_from_filename(filename)
    song =Song.new
    data = filename.split(" - ")
    song.artist_name = data[0]
    name_mp = data[1].split(".")
    song.name = name_mp[0]
    @@all << song
    song
  end
  
  def Song.create_from_filename(filename)
    song =Song.new
    data = filename.split(" - ")
    song.artist_name = data[0]
    name_mp = data[1].split(".")
    song.name = name_mp[0]
    @@all << song
    song
  end
  
  def Song.destroy_all
    self.all.clear
  end
  
end

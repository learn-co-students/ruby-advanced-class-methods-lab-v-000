require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
    
  def Song.create
    song = Song.new
    @@all << song
    return song
  end
  
  def Song.new_by_name(name)
    song = self.create
    song.name = name
    return song
  end
  
  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  def Song.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end
  
  def Song.find_or_create_by_name(name)
    found_song = Song.find_by_name(name)
    if found_song != nil
      return found_song
    else
      Song.create_by_name(name)
    end
  end
  
  def Song.alphabetical
    az_array = []
    array = []
    @@all.each do |song|
      array << song.name
    end
    array.sort!
    array.each do |name|
      az_array << self.find_by_name(name)
    end
    az_array
  end
  
  def self.new_from_filename(file)
    artist_name = file.split("-")[0].strip
    name = file.split("-")[1].strip
    name = name.split(".mp3")[0].strip
    song = Song.new
    song.artist_name = artist_name
    song.name = name
    return song
  end
  
  def self.create_from_filename(file)
    artist_name = file.split("-")[0].strip
    name = file.split("-")[1].strip
    name = name.split(".mp3")[0].strip
    song = Song.new
    song.artist_name = artist_name
    song.name = name
    @@all << song
    return song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end

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
    return song
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    self.all << song
    return song
  end
  
  def self.find_by_name(name)
    self.all.each do |song|
      return song if song.name == name
    end
    return nil
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == NIL
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    return self.all.collect.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    new_song = name.split(/[-.]/)
    song = self.new 
    song.name = new_song[1].strip
    song.artist_name = new_song[0].strip
    self.all << song
    return song
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
  
  def self.destroy_all
    self.all.clear
  end

end
 

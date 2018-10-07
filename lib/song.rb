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
    song.name = name
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end 
  
  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    unless song = self.find_by_name(name)
      song = self.create_by_name(name)
    end
    song
  end
  
  # def self.find_or_create_by_name(name)
  #   if !(self.find_by_name(name)) == nil 
  #     self.find_by_name(name)
  #   else 
  #     self.create_by_name(name)
  #   end 
  # end
  
  def self.find_or_create_by(name)
    unless song = self.find_by_name(name)
      song = self.create_by_name(name)
    end
    song
  end
  
  # def self.alphabetical
  #   @@all.sort_by{ |song| song.name }
  # end 
  
  # def self.new_from_filename 
  # end 
  
  # def self.create_from_filename 
  # end 
  
  # def self.destroy_all 
  # end 
  
end

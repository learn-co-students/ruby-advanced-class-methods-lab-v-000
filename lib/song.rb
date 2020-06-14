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
  @@all << song = self.new
  song
end 

  def self.new_by_name(song_name_string)
    song = self.new
    song.name = song_name_string
    song 
  end
  
  def self.create_by_name(song_name_string)
    song = self.new
    song.name = song_name_string
    @@all << song
    song
end

  def self.find_by_name(string_name)
    @@all.find do |string|
      if string.name == string_name
        string.name
      end
    end 
  end

  def self.find_or_create_by_name(string_name)
    self.find_by_name(string_name) || self.create_by_name(string_name)
      end 
      
  def self.alphabetical
    @@all.sort_by{|song| song.name}
    end 
    
  def self.new_from_filename(file_name)
    song = self.new
    song.name = (file_name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (file_name.split(" - ")[0])
    song
  end 
  
  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
    
  end 
  
  def self.destroy_all
    self.all.clear
  end

end 

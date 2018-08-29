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
    @@all << song
    song
  
  end

  def self.new_by_name(s_name)
    song = self.new
    song.name = s_name
    song
    #remember to recall your updated instantiated object
  end  
  
  def self.create_by_name(s_name)
    song = self.new
    song.name = s_name 
    @@all << song #saves
    song
  end  
  
  def self.find_by_name(s_name)
    @@all.find {|song_in_all| song_in_all.name == s_name}
    
  end

  def self.find_or_create_by_name(s_name)
    create_by_name(s_name)
    find_by_name(s_name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song_in_all| song_in_all.name}
    #I spent too long on this... look at find by name...do the same thing but with sort... dear god it was right in front of you
  end
  
  def self.new_from_filename(s_name_ext)
    song = self.new
    song_parts = s_name_ext.split("- ")
    song.name = song_parts[1].chomp(".mp3")
    song.artist_name = song_parts[0].chomp(" ")
    song
    #REMEMBER TO CALL IT AGAIN
  end
  
  def self.create_from_filename(s_name_ext)
    song = self.new
    song_parts = s_name_ext.split("- ")
    @name = song_parts[1].chomp(".mp3")
    @artist_name = song_parts[0].chomp(" ")
    @@all << song #saves
    song
  end
  
  def self.destroy_all
    @@all = []
  end
end

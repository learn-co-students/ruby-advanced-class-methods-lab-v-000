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
    created_song = self.new
    created_song.save
    created_song
  end
  
  def self.new_by_name(name_of_song)
    individual_song = self.new
    individual_song.name = name_of_song
    individual_song
  end
  
  def self.create_by_name(name_of_song)
    individual_song = self.create
    individual_song.name = name_of_song
    individual_song
  end
  
  def self.find_by_name(name_of_song)
    self.all.detect do |individual_song|
      individual_song.name == name_of_song
    end
  end
  
  def self.find_or_create_by_name(name_of_song)
    # @@all << name_of_song unless @@all.include?(name_of_song)
    # @@all
    
    if self.all.any? {|song| song.name == name_of_song}
      return song.name
    else
      song = self.create
    end
    #self.all.detect do |individual_song|
    #  individual_song.name == name_of_song
    #end
  end
  
  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    filename['.mp3'] = ''
    seperated_filename = filename.split(" - ")
    
    song.artist_name = seperated_filename[0]
    song.name = seperated_filename[1]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.create
    filename['.mp3'] = ''
    seperated_filename = filename.split(" - ")
    
    song.artist_name = seperated_filename[0]
    song.name = seperated_filename[1]
  end

  def self.destroy_all
    self.all.clear
  end

end

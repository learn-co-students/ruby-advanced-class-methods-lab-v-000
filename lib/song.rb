class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end
  
  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new(name)
  end
  
  def self.create_by_name(name)
    new_song = new_by_name(name)
    self.all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
       song = self.create_by_name(name)
    end
    song
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    file_arr = file_name.chomp(".mp3").split("-")
    new_song = self.new(file_arr[1].strip,file_arr[0].strip)
    
  end
  
  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
end

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
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name} 
  end
  
  def self.new_from_filename(artist_and_song)
    song = self.new
    song.artist_name = artist_and_song.split(' - ').first
    song.name = artist_and_song.split(' - ').last.split('.').first
    song
  end
  
  def self.create_from_filename(artist_and_song)
    song = self.new
    song.artist_name = artist_and_song.split(' - ').first
    song.name = artist_and_song.split(' - ').last.split('.').first
    song.save
    song    
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end

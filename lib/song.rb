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
    song = self.new_by_name(name)
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.all.include?(self.find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song_array = filename.split(' - ').join('.').split('.')
    song_array.pop
    song = self.create_by_name(song_array[1])
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
end

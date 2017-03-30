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
    song.save
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
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    result = @@all.detect {|song| song.name == name}
    if result == nil
      self.create_by_name(name)
    else
      result
    end
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    song = self.new
    artist_array = filename.split(" - ")[0]
    song_array = filename.split(" - ")[1].split(".")[0]
    song.artist_name = artist_array
    song.name = song_array
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    artist_array = filename.split(" - ")[0]
    song_array = filename.split(" - ")[1].split(".")[0]
    song.artist_name = artist_array
    song.name = song_array
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end

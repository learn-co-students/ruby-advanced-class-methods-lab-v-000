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
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
 end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end
  
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

   def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.new
    song.name = song_array[1].split(".")[0]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end

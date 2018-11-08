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
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end
  
def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    array = filename.split(/(\s-\s|.mp3)/)
    song = self.new
    song.name = array[2]
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(filename)
    array = filename.split(/(\s-\s|.mp3)/)
    song = self.new
    song.name = array[2]
    song.artist_name = array[0]
    @@all << song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
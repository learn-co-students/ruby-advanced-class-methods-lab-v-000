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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |s| s if s.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    x = self.find_by_name(song_name)
    x = self.create_by_name(song_name) unless x
    x 
  end

  def self.alphabetical
    self.all.sort_by { |s| s.name }
  end

  def self.new_from_filename(filename)
     f = filename.split(/[-.]/)
     song = self.new
     song.artist_name = f[0].strip
     song.name = f[1].strip
     song
   end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end


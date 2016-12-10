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

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    @@all << song
    song    
  end

  def self.find_by_name (name)
    @@all.each { |e| return e if e.name == name }
  end

  def self.find_or_create_by_name (name)
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end    
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename (filename)
    song = self.new
    song_array = filename.split(" - ")
    song.artist_name = song_array[0]
    song.name = song_array[1].split(".")[0]
    song
  end

  def self.create_from_filename (filename)
    song = self.new
    song_array = filename.split(" - ")
    song.artist_name = song_array[0]
    song.name = song_array[1].split(".")[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end

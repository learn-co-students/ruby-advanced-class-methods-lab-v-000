class Song
  attr_accessor :name, :artist_name
  @@all = []
  puts @@all
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
    Song.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(name)
    #song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
    parts = name.split("-")
    name = parts[1].chomp(".mp3")
    song = self.new
    song.artist_name = parts[0].strip!
    song.name = name.strip!
    song
  end

  def self.create_from_filename(name)
    parts = name.split("-")
    name = parts[1].chomp(".mp3")
    song = self.new
    song.artist_name = parts[0].strip!
    song.name = name.strip!
    @@all << song

  end

  def self.destroy_all
    @@all.clear
  end




end

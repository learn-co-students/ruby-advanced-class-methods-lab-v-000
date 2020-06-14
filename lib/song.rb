class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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

  def self.find_by_name(string)
    @@all.detect {|s| s.name == string}
  end

  def self.find_or_create_by_name(string)
    if !self.find_by_name(string)
      self.create_by_name(string)
    else
      self.find_by_name(string)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(mp3_file)
    s = self.new
    s.name = File.basename(mp3_file, ".mp3").split(" - ")[1]
    s.artist_name = File.basename(mp3_file, ".mp3").split(" - ")[0]
    s
  end

  def self.create_from_filename(mp3_file)
    s = self.new
    s.name = File.basename(mp3_file, ".mp3").split(" - ")[1]
    s.artist_name = File.basename(mp3_file, ".mp3").split(" - ")[0]
    s.save
    s
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end

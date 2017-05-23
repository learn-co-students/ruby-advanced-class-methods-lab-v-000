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
    song= self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(this_song)
    self.all.detect{|saved_song| saved_song.name == this_song}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|saved_song| saved_song.name}
  end

  def self.new_from_filename(filename)
    raw_filename = filename.split(/\s?[-,\.]\s?/)
    artist_name = raw_filename[0]
    name = raw_filename[1]

    song= self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

  end

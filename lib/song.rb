class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.filename_split(filename)
  end

  def self.create_from_filename(filename)
    song = Song.create
    song.filename_split(filename)
  end

  def filename_split(filename)
    puts "I made it to the method"
    info = filename.split(" - ")
    @artist_name = info[0]
    @name = info[1].chomp(".mp3")
    self
  end

  def self.all
    @@all
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end

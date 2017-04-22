class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    self.all.each { |e| return e if e.name === name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |x,y| x.name <=> y.name }
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    filename = filename.split("-").each { |s| s.strip! }
    name_stub = filename[1].split(".")

    song = self.new
    song.name = name_stub[0]
    song.artist_name = filename[0]
    song
  end

  def self.create_from_filename(filename)
    filename = filename.split("-").each { |s| s.strip! }
    name_stub = filename[1].split(".")

    song = self.new
    song.name = name_stub[0]
    song.artist_name = filename[0]
    song.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

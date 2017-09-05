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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song == nil ? self.create_by_name(name) : song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_filename = filename.split(/\s(-)\s|[.]/)
    song = self.new
    song.name = new_filename[2]
    song.artist_name = new_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end

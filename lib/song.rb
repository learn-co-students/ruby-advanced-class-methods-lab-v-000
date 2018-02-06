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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.select{|song| song.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.create_from_filename(filename)
    song = self.create_by_name(filename.split("-")[1].split(".")[0][1..-1])
    song.artist_name = filename.split("-")[0][0..-2]
    song
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split("-")[1].split(".")[0][1..-1]
    song.artist_name = filename.split("-")[0][0..-2]
    song
  end

  def self.destroy_all
    @@all = []
  end

end

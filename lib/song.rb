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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|a| a.name}
  end

  def self.new_from_filename(file)
    x = self.new
    x.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    x.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    x
  end

  def self.create_from_filename(file)
    x = self.new
    x.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    x.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    x.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end

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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name) then self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    values = file.split(" - ")
    artist_name = values[0]
    name = values[1].chomp(".mp3")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def self.destroy_all
    @@all.clear
  end

end

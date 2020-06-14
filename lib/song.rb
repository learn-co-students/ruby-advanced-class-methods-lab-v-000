class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #TBD
    song = self.new #instantiates the song
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = self.new
    song.name = file.split("-")[1].split(".")[0].strip
    song.artist_name = file.split("-")[0].strip
    song.save
    song
  end

  def self.create_from_filename(file)
    song = self.create
    song.name = file.split("-")[1].split(".")[0].strip
    song.artist_name = file.split("-")[0].strip
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

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
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|person| person.name == name} == true
      self
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    @@all.sort_by!{|s| s.name}
  end

  def Song.new_from_filename(file_name)
    parts = file_name.split(" - ")
    properties = {}
    properties[:artist_name] = parts[0]
    properties[:name] = parts[1].chomp(".mp3")
    song = self.new
    song.name = properties[:name]
    song.artist_name = properties[:artist_name]
    song
  end

  def self.create_from_filename(file_name)
    parts = file_name.split(" - ")
    properties = {}
    properties[:artist_name] = parts[0]
    properties[:name] = parts[1].chomp(".mp3")
    song = self.new
    song.name = properties[:name]
    song.artist_name = properties[:artist_name]
    @@all << song


  end

  def self.destroy_all
    @@all.clear
  end

end

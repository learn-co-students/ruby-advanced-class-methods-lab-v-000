class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.each do |song|
      return song if song.name == name
    end
    nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    list = []
    @@all.each do |song|
      list << song.name
    end
    list.sort.collect do |name|
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)
    parsed = file_name.split(' - ')
    artist = parsed[0]
    name = parsed[1].chomp('.mp3')
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end

end

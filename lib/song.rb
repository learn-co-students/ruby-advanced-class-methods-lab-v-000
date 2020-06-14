class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    self.all << song
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.detect {|songs| songs.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == true
      return name
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(name)
    a = name.gsub(/\.mp3/, "")
    b = a.split(" - ")
    song = Song.new
    song.name = b[1]
    song.artist_name = b[0]
    self.all << song
    song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear
  end

end

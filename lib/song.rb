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

  def self.new_by_name(arg)
    song = self.new
    song.name = arg
    song
  end

  def self.create_by_name(arg)
    song = self.new
    song.name = arg
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(/ - |.mp3/)
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(/ - |.mp3/)
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    self.all << song
    song
  end

  def self.destroy_all
    @@all=[]
  end

end

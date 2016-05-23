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
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.detect(ifnone = self.create_by_name(name)) {|song| song.name == name}
  end

  def self.alphabetical
    alpha = self.all.sort_by {|instance| instance.name}
    alpha
  end

  def self.new_from_filename(filename)
    filename_array = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end

  def self.create_from_filename(filename)
    filename_array = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    self.all << song
  end

  def self.destroy_all
    @@all = []
  end

end

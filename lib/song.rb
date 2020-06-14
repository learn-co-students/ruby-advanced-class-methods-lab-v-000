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

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if song = self.find_by_name(title)
      song
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(title)
    array = title.split(/( - |.mp3)/)
    song = self.new
    song.name = array[2]
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(title)
    array = title.split(/( - |.mp3)/)
    song = self.new
    song.name = array[2]
    song.artist_name = array[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

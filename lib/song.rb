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
    Song.all.detect do |instance|
      instance.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
        Song.find_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by { |word| word.name  }
  end

  def self.new_from_filename(filename)
    file_data = filename.split(" - ")
    artist_name = file_data[0]
    file_data_chop = file_data[1].split(".")
    name = file_data_chop[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end

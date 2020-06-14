class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = Song.new.save
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name).save
  end

  def self.find_by_name(name)
    Song.all.detect {|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(file)
    array = file.split(/ - |\.mp3\z/)
    song = Song.new_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    Song.all.clear
  end
end

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
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    return self.create_by_name(name) if find == nil
    find
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    split_name = filename.split(" - ")
    song = self.new
    song.artist_name = split_name[0]
    song.name = split_name[1].split(".mp3")[0]
    song
  end

  def self.create_from_filename(filename)
    split_name = filename.split(" - ")
    song = self.new
    song.artist_name = split_name[0]
    song.name = split_name[1].split(".mp3")[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end

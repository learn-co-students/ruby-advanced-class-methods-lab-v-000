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
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name ==  name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
  @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file)
    song = Song.new
    string_to_array = file.chomp(".mp3").split(" - ")
    song.name = string_to_array[1]
    song.artist_name = string_to_array[0]
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def self.destroy_all
    self.all.clear
  end
end

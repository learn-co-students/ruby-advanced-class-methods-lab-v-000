class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new
    s.save
    s
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

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if !@@all.include?(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    song_with_mp3 = file_array[1]
    song_name = song_with_mp3.split(".")

    song = self.new
    song.name = song_name[0]
    song.artist_name = file_array[0]

    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end

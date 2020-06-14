class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(song_name = nil)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    self.create(song_name)
  end

  def self.create_by_name(song_name)
    song = self.create(song_name)
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|name| song_name == name.name}
  end

  def self.find_or_create_by_name(song_name)
    if song_name == self.find_by_name(song_name)
      song_name
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    array = @@all.sort_by! {|a| a.name}
    array.uniq
  end

  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    name = file[1].split(".")
    song = self.new_by_name(name[0])
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song
  end

  def self.destroy_all
    @@all.clear
  end

end

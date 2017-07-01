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
    self.all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == true
      name
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    artist_name = names[0]
    song_name = names[1].split(".mp3")[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    names = filename.split(" - ")
    artist_name = names[0]
    song_name = names[1].split(".mp3")[0]

    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

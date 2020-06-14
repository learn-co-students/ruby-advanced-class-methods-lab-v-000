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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end

  def self.find_by_name(song_title)
    song = nil
    self.all.detect do |i|
      if i.name == song_title
        song = i.name
      end
    end
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end

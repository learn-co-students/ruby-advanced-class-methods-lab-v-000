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
   song.save
   song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    elsif !@@all.include?(name)
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    songs = Song.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    title_name = filename.split(" - ")[1].gsub(".mp3", "")

    song = self.new
    song.name = title_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end
end

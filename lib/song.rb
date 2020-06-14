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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ||= self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_parsed = filename.chomp!(".mp3").split(" - ")

    song = self.new
    song.name = filename_parsed.last
    song.artist_name = filename_parsed.first
    song
  end

  def self.create_from_filename(filename)
    filename_parsed = filename.chomp!(".mp3").split(" - ")

    song = self.create
    song.name = filename_parsed.last
    song.artist_name = filename_parsed.first
  end

  def self.destroy_all
    self.all.clear
  end
end

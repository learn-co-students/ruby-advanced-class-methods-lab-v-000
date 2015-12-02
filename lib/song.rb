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

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.detect{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.all.detect{|song| song.name == title}
    song = self.new
    song = self.create_by_name(title)
    song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0]
    file2 = file[1].split(".")
    name = file2[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0]
    file2 = file[1].split(".")
    name = file2[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

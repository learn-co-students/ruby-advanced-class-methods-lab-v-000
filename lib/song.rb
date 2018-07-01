class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name }
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.new_from_filename(filename)
    a = filename.split(" - ")
    song = self.new
    song.artist_name = a[0]
    song.name = a[1].split(".")[0]
    song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

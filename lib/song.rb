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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  self.create_by_name(name) || self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
  array=file_name.gsub(".mp3","").split(" - ")
  song=self.create
  song.artist_name=array[0]
  song.name=array[1]
  song

  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all.clear
  end
end

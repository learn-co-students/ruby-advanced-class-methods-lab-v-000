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
    self.all << song
    song 
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.select {|song| song.name == name}.shift
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name) 
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ").map {|arr| arr.split(".mp3")}.flatten
    song = self.new
    song.name = data[1]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end

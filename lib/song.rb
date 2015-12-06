class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end


  def self.new_by_name(name)
    new_song = Song.new(name)
  end

  def self.find_by_name(name)
    self.all.select do |song|
      song.name == name
    end[0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    new_song = self.new_by_name(file_array[1].match(/([\s\w]+)\.mp3/)[1])
    artist_name = file_array[0]
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
  





end

require 'pry'

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
    @song = self.new
    self.all << @song
    @song
  end

  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = self.new
    @song.name = name
    self.all << @song
    @song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  # accept a string name for a song and either return
  # a matching song instance with that name or create
  # a new song with the name and return the song instance
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  #Taylor Swift - Blank Space.mp3
  def self.new_from_filename(filename)
    @song = self.new

    filename_array = filename.split(".")[0].split("-")
    @song.artist_name = filename_array[0].rstrip!
    @song.name = filename_array[1].strip!

    @song
  end

  def self.create_from_filename(filename)
    @song = self.new

    filename_array = filename.split(".")[0].split("-")
    @song.artist_name = filename_array[0].rstrip!
    @song.name = filename_array[1].strip!

    self.all << @song
    
    @song
  end

  def self.destroy_all
    self.all.clear
  end

end

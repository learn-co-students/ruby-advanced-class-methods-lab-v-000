require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save #saved to @@all through the class method Song.all.
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    found = self.all.find {|match| match.name == name}
    found
  end

  def self.find_or_create_by_name(name)
    find_create = ""
    if self.find_by_name(name) != nil
      find_create = self.find_by_name(name)
    else
      find_create = self.create_by_name(name)
    end
    find_create
  end

  def self.alphabetical
    sorted = self.all.uniq!.sort_by {|title| title.name}
    sorted
  end

  def self.new_from_filename(mp3_filename)
    artist_title_ary = mp3_filename.split("-")
    artist = artist_title_ary[0].strip
    song_title = artist_title_ary[1].strip.split(".")[0]
    instance = self.find_or_create_by_name(song_title)
    instance.artist_name = artist
    instance
  end

  def self.create_from_filename(mp3_filename)
    file = self.new_from_filename(mp3_filename)
    file.save
    file
  end

  def self.destroy_all
    @@all.clear
  end


end

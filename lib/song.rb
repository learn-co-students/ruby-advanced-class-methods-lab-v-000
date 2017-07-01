require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
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
    self.all.find{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    parsed_file_name = self.parse_file_name(file_name)
    song = Song.new_by_name(parsed_file_name[2])
    song.artist_name = parsed_file_name[1]
    song
  end

  def self.create_from_filename(file_name)
    parsed_file_name = self.parse_file_name(file_name)
    song = Song.create_by_name(parsed_file_name[2])
    song.artist_name = parsed_file_name[1]
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.parse_file_name(file_name)
    parsed_file_name = /^(.*)\s\-\s(.*)\.\w{3}$/.match(file_name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end

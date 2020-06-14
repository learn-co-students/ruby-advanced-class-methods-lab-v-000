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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song
  end

  def self.find_by_name(search_value)
    self.all.each do |e|
      if e.name == search_value
        return e
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|word| word.name.downcase}
  end

  def self.new_from_filename(filename)
    file_array = filename.split("-")
    artist_name = file_array[0].strip
    song_name = file_array[1].strip.chomp! ".mp3"
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    @@all.clear
  end

end

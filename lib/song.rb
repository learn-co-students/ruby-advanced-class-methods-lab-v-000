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
    name = song.name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    unless self.all.include?(name)
      song = self.new
    end
  end

  def self.alphabetical
    sorted_by_name = []
    self.all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(songs)
    songs.chomp!(".mp3")
    split = songs.split(" - ")
    artist_name = split[0]
    name = split[1]
    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(songs)
    song = self.new_from_filename(songs)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

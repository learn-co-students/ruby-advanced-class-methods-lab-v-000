require "pry"

class Song
  attr_accessor :name, :artist_name
# def name
  #   @name
  # end
  # def name=(name)
  #   @name = name
  # end

  @@all = []
  @@name_array = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    @@all << song
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      if song.name == song_name
        song
      end
    end
  end

  def self.find_or_create_by_name(song_name)
     if self.find_by_name(song_name) != nil
       self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename_song)

    parts = filename_song.split(" - ")
    song = self.new

    song.artist_name = parts[0]
    song.name = parts[1].split(".")[0]
    @@all<<song
    song
  end

  def self.create_from_filename(filename_song)

    parts = filename_song.split(" - ")
    song = self.new

    song.artist_name = parts[0]
    song.name = parts[1].split(".")[0]
    @@all<<song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# if
# @@name_array << song.name
# end
# @@name_array = @@name_array.sort
# @@name_array

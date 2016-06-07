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
    song.name = name
    self.all << song

    return song

  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)

    song = self.new
    song.name = name

    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|name_found| name_found.name == name}
  end

  def self.find_or_create_by_name(name)
    name_found = self.all.detect{|name_found| name_found.name == name}
      if name_found == !nil
        name_found
      else
        song = self.new
        song.name = name
        song
      end
  end

  def self.alphabetical
    sorted = self.all

  sorted.sort_by{|a_name| a_name.name}

  end

  def self.new_from_filename(song_name)

    split_name = song_name.split(" - ")

    artist_name = split_name[0]

    artist_array = split_name[1].split(".")

    name = artist_array[0]
    song = self.new
    song.artist_name = artist_name
    song.name = name
    return song

  end

  def self.create_from_filename(name)
    created_name = name.split(" - ")
    artist_name = created_name[0]
    name = created_name[1].split(".")
    song = self.new
    song.artist_name = artist_name
    song.name = name[0]

    self.all << song
    
  end

  def self.destroy_all
    self.all.clear
  end

end

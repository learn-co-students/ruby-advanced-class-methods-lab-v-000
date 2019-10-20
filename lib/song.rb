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

  def Song.create
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def Song.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
    end
  end
  end

  def Song.find_or_create_by_name(name)
    song = Song.find_by_name(name)
      if song == []
        song = Song.create_by_name(name)
      end
    song
  end

  def Song.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def Song.new_from_filename(filename)
    filename = filename.split(' - ')
    song_name = filename[1].split('.')
    song = self.find_or_create_by_name(song_name[0])
    song.artist_name = filename[0]
    song
  end

  def Song.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def Song.destroy_all
    @@all.clear
  end

end

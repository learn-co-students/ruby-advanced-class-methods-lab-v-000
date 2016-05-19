require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = Song.new
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
    song.save
    song
  end

  def self.find_by_name(name)
      @@all.each do |song| 
        if song.name == name;
       return song
      end
    end
  end
  
  def self.find_or_create_by_name(name)
    if Song.all.include?(name)
      return Song.name
    else
      song = self.new
      song.name = name
      song.save
      song
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    ary = file.split(" - ")
    artist_name = ary[0]
    name = ary[1].split(".")[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    ary = file.split(" - ")
    artist_name = ary[0]
    name = ary[1].split(".")[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end


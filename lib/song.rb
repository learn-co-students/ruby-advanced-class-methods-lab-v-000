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
   song.save
   song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    # @@all << song  song.save does the same thing
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end # of if
    end  # of do
    return nil
  end  # of def

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end # of def

  def self.alphabetical
    @@all.sort_by! {|x| x.name}
  end

  def self.new_from_filename(name)
     song = self.new
     song.name = name.split(" - ")[1].chomp(".mp3")
     song.artist_name = (name.split(" - ")[0])
     song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = name.split(" - ")[1].chomp(".mp3")
    song.artist_name = (name.split(" - ")[0])
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end

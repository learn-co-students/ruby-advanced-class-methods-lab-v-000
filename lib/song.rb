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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
     @@all.detect do |song|
       song.name == name
     end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
       self.create_by_name(name)
    else
      self.find_by_name(name)
     end
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.split("-")
    @name = split_filename[1]
    @artist_name = split_filename[0]
    # binding.pry
    Song.new
    #i fucking give up
  end

  # end

end

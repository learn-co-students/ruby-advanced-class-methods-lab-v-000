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
    song= Song.new
    song.save
    song
  end
  def self.new_by_name(name)
    song= Song.new
    song.name= name
    song
  end
  def self.create_by_name(name)
    song= Song.new
    song.name = name
    song.save
    song
  end
  def Song.find_by_name(name)
    @@all.detect {|c| c.name == name}

  end
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) != nil
      return Song.find_by_name(name)
    else
      Song.create_by_name(name)
          #what do we want to call the find and create methods on? what is the receiver?
    end
    @@all.detect {|c| c.name == name}
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
    # use ! ?
  end
  def self.new_from_filename(filename)
    array= filename.split(/[-.]/)
    artist= array[0].strip
    name= array[1].strip
    song= Song.new
    song.name= name
    song.artist_name = artist
    song
  end
  def self.create_from_filename(filename)
    song= Song.new_from_filename(filename)
    song.save
  end
  def Song.destroy_all
    @@all= []
  end

end

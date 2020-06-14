require "pry"
class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
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
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if result = @@all.detect {|song| song.name == name}
      result
    else
        song = self.new
        song.name = name
        song.save
        song
    end
  end
# another way of writing the above method is just by calling methods u have already written
#  def self.find_or_create_by_name(name)
 # self.find_by_name(name) || self.create_by_name(name)
# end


  def self.alphabetical
    @@all.sort_by {|song_name| song_name.name}
  end

  def self.new_from_filename(filename)
    element = filename.split("-")
    artist_name = element[0]
    name = element[1]
    name =  name[0, name.length - 4]
    song = self.new
    song.name = name.strip
    song.artist_name = artist_name.strip
    song
  end

  def self.create_from_filename(filename)
    element = filename.split("-")
    artist_name = element[0]
    name = element[1]
    name = name[0, name.length - 4]
    song = self.new
    song.name = name.strip
    song.artist_name = artist_name.strip
    song.save
  end


  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

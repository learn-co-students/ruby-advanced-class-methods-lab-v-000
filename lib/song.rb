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
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(my_song)
    self.all.detect {|each_song| each_song.name == my_song}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|each_song| each_song.name}
  end

  def self.new_from_filename(filename)
    #parse filename to get song's name and artist_name
    parse_filename = filename.split(/\s?[-,\.]\s?/)
    name = parse_filename[1]
    artist_name = parse_filename[0]
    #create the new song with all the above details
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end


#binding.pry

#Song.create_by_name("Thriller")
#Song.create_by_name("Blank Space")
#Song.create_by_name("Hello)

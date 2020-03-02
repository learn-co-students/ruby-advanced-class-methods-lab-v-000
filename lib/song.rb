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
    self.all << song
    song
  end #def self.create

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end #def self.new_by_name

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end #def self.create_by_name

  def self.find_by_name(name)
    self.all.detect do |matching_name|
      matching_name.name == name
    end #self.class.all.detect
  end #def self.find_by_name

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end #def self.find_or_create_by_name

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end #def self.alphabetical

  def self.new_from_filename(filename)
    song = self.new
    filename_array = filename.split(/ - |.mp3/)
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end #def self.new_from_filename

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end #def self.create_from_filename

  def self.destroy_all
    self.all.clear
  end #def self.destroy_all

end #class Song

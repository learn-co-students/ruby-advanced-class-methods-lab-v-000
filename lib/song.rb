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

  #
  def self.create
    song = self.new
    #@@all << song
    song.save
    song
  end

  #
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  #
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  #
  def self.find_by_name(name)
    @@all.detect{|person| person.name == name}
  end

  #
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  #
  def self.alphabetical
    return @@all.sort_by {|n| n.name}
  end

  #
  def self.new_from_filename(filename)
    new_file_name = []
    filename = filename.chomp(".mp3")
    new_file_name << filename.split(/[-]/)
    #binding.pry
    song = self.create_by_name(new_file_name[0][1].strip!)
    artist_name = new_file_name[0][0].strip
    #binding.pry
    song.artist_name = artist_name
    song
  end

  #
  def self.create_from_filename(filename)
    new_file_name = []
    filename = filename.chomp(".mp3")
    new_file_name << filename.split(/[-]/)
    #binding.pry
    song = self.create_by_name(new_file_name[0][1].strip!)
    artist_name = new_file_name[0][0].strip
    #binding.pry
    song.artist_name = artist_name
    song.save
    song
  end

  #
  def self.destroy_all
    self.all.clear
  end

#final 'end' (AKA not a method 'end')
end

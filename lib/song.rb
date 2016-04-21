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
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect { |i| i.name == name }
  end

  def self.find_or_create_by_name(name)
    if temp = self.all.detect { |i| i.name == name }
      temp
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |a| a.name }
  end

  def self.new_from_filename(name)
    temp = name.split(/[-.]/)
    temp.delete_at(2)
    temp.map! { |i| i.strip }
    temp2 = self.create_by_name(temp[1])
    temp2.artist_name = temp[0]
    self.all << temp2
    temp2
  end

  def self.create_from_filename(name)
    temp = name.split(/[-.]/)
    temp.delete_at(2)
    temp.map! { |i| i.strip }
    temp2 = self.create_by_name(temp[1])
    temp2.artist_name = temp[0]
    self.all << temp2
    temp2
  end

  def self.destroy_all
    @@all = []
  end

end

=begin
song_1 = Song.create_by_name("Hotline Bling")

song_2 = Song.create_by_name("Blank Spaces")
song_3 = Song.create_by_name("Hello")

a = Song.alphabetical
=end

#binding.pry



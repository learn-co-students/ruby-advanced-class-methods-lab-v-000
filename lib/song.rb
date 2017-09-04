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
    self.all << song #aka. song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    # self.name = @name
    self.all.sort_by {|song| song.name }
    # i = self.all.collect do |song|
    #   song.name
    # end
    # i.sort
    #https://stackoverflow.com/questions/882070/sorting-an-array-of-objects-in-ruby-by-object-attribute
  end

  def self.new_from_filename(filename)
    song = Song.new
    data = filename.split(" - ")
    name_1 = data[1]
    new_data = name_1.split(".")
    song.name = new_data[0]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    self.all << new_from_filename(filename)
    song_match = self.find_by_name(name)
  end

  def self.destroy_all
    self.all.clear
  end
# def normalize_name
# 		    self.name.split(" ").collect{|w| w.capitalize}.join(" ")
# 		  end
# 		 
# 		  def self.normalize_names
# 		    self.all.each do |person|
# 		      person.name = person.normalize_name
# 		    end

end

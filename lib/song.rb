require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
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
    @@all << song
    song
  end

    def self.find_by_name(name)
      self.all.find do |song|
        song.name == name
      end
    end

    def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
       self.create_by_name(name)
     else self.find_by_name(name)
     end
    end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by {|i| i.name}
  end

  def self.new_from_filename(title)
    title = title.split(" - ")
    @artist_name = title[0]
    name = title[1].split(".")
    @name = name[0]
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    song
  end

  def self.create_from_filename(title)
    @@all << self.new_from_filename(title)
  end

  def self.destroy_all
    @@all.clear
  end

end

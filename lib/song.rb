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
    new_song = self.new
    @@all << new_song
      #binding.pry
      new_song
    end

    def new_by_name(name)
      song = self.new
      song.name = name
      @@all << song
    end


end

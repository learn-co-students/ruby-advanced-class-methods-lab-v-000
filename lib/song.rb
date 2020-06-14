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
     song.save
     song
   end

   def self.find_by_name(name) #class FINDER
     self.all.detect {|song| song.name == name}
   end

   def self.find_or_create_by_name(name) #class METHOD
     find_by_name(name) || create_by_name(name)
    end

    def self.alphabetical
       @@all.sort_by(&:name)
     end

     def self.new_from_filename(filename)
       entries = filename.split(" - ")

       artist_name = entries[0]
       name = entries[1]
       name=name.gsub(".mp3", "")

       song = self.new
       song.artist_name = artist_name
       song.name = name

       song
     end

    def self.create_from_filename(filename)
      entries = filename.split(" - ")
      artist_name = entries[0]
      name = entries[1]
      name=name.gsub(".mp3", "")

      song = self.new
      song.artist_name = artist_name
      song.name = name
      song.save

      song
    end

    def self.destroy_all
        @@all.clear
    end

 end

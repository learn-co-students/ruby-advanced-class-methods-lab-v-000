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


    def self.new_from_filename(file_data)
      data = file_data.split(" - ")
      song = data.collect do |data|
       data = file_data.split(", ")
       artist_name = data[0]
       name = data[1]
       binding.pry
      song = self.new
      song.artist_name = artist_name
      song.name = name
      song
    end
    song
  end



 end

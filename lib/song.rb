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

  def initialize (name)
    @name = name
    self.class.all << self
  end


  def self.create
    song = self.new(name)
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name (name)
    @name = self.new(name)
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name 
         return song
        end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == [] ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  # def self.file_name_normalize(file_name)
  #   newarray = file_name.split(/(\s-\s)/)
  #   newarray.delete_at(1)
  #   slicelength = newarray[1].index(".mp3")
  #   newarray[1] =newarray[1].slice(0,slicelength.to_i)
  #   newarray
  #   binding.pry
  # end
  # songtitle = self.file_name_normalize(file_name)[1]
  #   artist = self.file_name_normalize(file_name)[0]

  def self.new_from_filename(file_name)
    newarray = file_name.split(/(\s-\s)/)
    newarray.delete_at(1)
    slicelength = newarray[1].index(".mp3")
    songtitle = newarray[1].slice(0,slicelength.to_i)
    artist = newarray[0]
    
    song = self.new(songtitle)
    
    song.artist_name = artist

    song
    #binding.pry
  end
end #of class Song



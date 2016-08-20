require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def self.create
    @song = Song.new
    self.all << @song
    @song
  end

  def self.new_by_name(name)
    @song = Song.create
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = Song.new_by_name(name)
    @song
  end

  def self.all
    @@all
  end

  def self.find_by_name(name) #.detect would be more concise, but this adds flexibility for multiple songs with same name
    self.all.select{|song| song.name == name}.each{|song| return song}
  end

  def self.find_or_create_by_name(name)
    if all.include?(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
    #create_by_name(name) unless find_by_name(name) != nil
  end
end

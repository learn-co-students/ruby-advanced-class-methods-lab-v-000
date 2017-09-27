require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = self.new
    #s.name = name
    #if !self.all.include?(song)
      #  binding.pry
    #self.all << s
    s.save
    #end
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by { |x| x.name }
  end

  def self.new_from_filename(mp3)
    arr = mp3.chomp(".mp3").split(" - ")
    s = self.create_by_name(arr[1])
    s.artist_name = arr[0]
    s.save
    s
  end

  def self.create_from_filename(mp3)
    self.new_from_filename(mp3)
    # arr = mp3.chomp(".mp3").split(" - ")
    # s = self.create_by_name(arr[1])
    # # s.artist_name = arr[0]
    # s.save
  end

  def self.destroy_all
    all.clear
  end

end

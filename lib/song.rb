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

  # initialize a song, save it, then return it
  def self.create
    @song = self.new
    @@all << @song
    @song
  end

  # Take string of song name and return with string set as name property and is saved to @@all
  def self.new_by_name(name)
    @song = self.new #initializes song
    @song.name = name # set name = song.name
    @song.save # saves song to @@all by evoking #save
    @song #retuns song
  end

  # initialize song with name, save to @@all and return w/ name property
  def self.create_by_name(name)
    @song = self.new # initializes song
    @song.name = name # set name = song.name
    @song.save # save song to @@all
    @song # return song
  end

  # Reuturns matching instance when name given
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name} # compare name to song.name for each song in @@all
  end

  # take song name and return mathcing instance or create new instance if none exist
  def self.find_or_create_by_name(name)
    self.all.detect{|song| song.name == name} # check to see if name matches song.name of any instance
      if @song.name == name # if name matches instance return instance
        @song
      else # create new instance if no match found
        self.create_by_name(name)
      end
  end

end

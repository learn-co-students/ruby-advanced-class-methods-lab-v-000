class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil)
    @name = name
    self.class.all << self
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
    #@@all << self
  end

  def self.find_by_name(name)
    @@all.detect{ |song| song.name == name}
    #if @@all.include?(name)
    #  name
    #else
    #  puts "Name is not found in array."
    #end
  end

  def self.find_or_create_by_name(name)
    ##if @@all.include?(name)
      self.find_by_name(name) || self.create_by_name(name)
    ##end
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name)
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(file_name)
    split_array_no_whitespace = []
    split_array = file_name.split(/[-\.]/)
    split_array.each do |value|
      split_array_no_whitespace << value.split(" ")
    end

    song = self.new
    song.name = split_array_no_whitespace[1].join(" ")
    song.artist_name = split_array_no_whitespace[0].join(" ")
    @@all << self
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end

  def self.destroy_all
    @@all.clear
  end


end

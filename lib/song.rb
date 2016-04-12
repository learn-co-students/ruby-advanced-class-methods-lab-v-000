class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def initialize
    @name
  end

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

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort! {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    attributes = filename.split(/\s-\s/)
    song = new_by_name(attributes[1].split(/\./)[0])
    song.artist_name = attributes[0]
    song
  end

  def self.create_from_filename(filename)
    attributes = filename.split(/\s-\s/)
    song = create_by_name(attributes[1].split(/\./)[0])
    song.artist_name = attributes[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

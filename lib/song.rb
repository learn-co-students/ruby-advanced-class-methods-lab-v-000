
class Song
  attr_accessor( :name, :artist_name)
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|element| element.name == name}
  end

  def self.find_or_create_by_name(name)
      self.create_by_name(name) #SO
      self.find_by_name(name) 
  end

  def self.alphabetical
    @@all.sort_by {|element| element.name}
  end

  def self.new_from_filename(filename)
    song = self.create
    result = filename.split(/ \- |[.]/)
    song.name = result[1]
    song.artist_name = result[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

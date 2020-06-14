class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) || self.find_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
    #binding.pry
  end

  def self.new_from_filename(filename)
    song = self.new
    new = filename.split(/\s-\s+|\.+\m+\p+\d/)
    song.name = new[1]
    song.artist_name = new[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    #new = filename.split(/\s-\s/)
    new = filename.split(/\s-\s+|\.+\m+\p+\d/)
    song.name = new[1]
    song.artist_name = new[0]
    @@all << song
    song
    #binding.pry
  end

  def self.destroy_all
    @@all.clear
  end





  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

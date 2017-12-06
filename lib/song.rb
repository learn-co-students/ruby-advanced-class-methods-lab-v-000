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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if (self.find_by_name(name))
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1].split(".")
    song = self.create_by_name(name[0])
    song.artist_name = data[0]
    #puts "name #{name[0]} | artist #{data[0]}"
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end

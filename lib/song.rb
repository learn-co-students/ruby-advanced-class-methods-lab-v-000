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
    @@all.each do |w|
      if w.name == name
        return w
      end
    end
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(file)
    song = Song.new
    array = file.split(" - ")
    song.artist_name = array[0]
    song.name = array[1].split(".")[0]
    song
  end

  def self.create_from_filename(file)
    song = Song.new
    array = file.split(" - ")
    song.artist_name = array[0]
    song.name = array[1].split(".")[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

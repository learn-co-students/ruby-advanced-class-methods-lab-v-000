class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new = Song.new
    @@all << new 
    new 
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new = Song.new
    new.name = name
    new
  end
  
  def self.create_by_name(name)
    new = Song.new_by_name(name)
    @@all << new
    new
  end
  
  def self.find_by_name(name)
    @@all.each do |song|
      return song if song.name == name
    end
    false 
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != false 
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by do |song|
      song.name 
    end
    sorted
  end

  #accepts files in "artist - name.mp3" format
  def self.new_from_filename(filename)
    name_and_artist = filename.chomp(".mp3").split("-")
    artist = name_and_artist[0].strip
    name = name_and_artist[1].strip
    new = Song.new_by_name(name)
    new.artist_name = artist
    new
  end

  def self.create_from_filename(filename)
    created = self.new_from_filename(filename)
    @@all << created
    created
  end

  def self.destroy_all
    @@all.clear
  end

end

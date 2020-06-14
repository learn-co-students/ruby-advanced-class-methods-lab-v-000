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
    song = self.new
    self.all << song 
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
    self.all << song 
    song  
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by {|song|song.name}
  end

  def self.new_from_filename(filename)
    file_info = filename[0..-5].split(" - ") # parse the .mp3 away, split on and remove the " - "
    song = self.new
    song.artist_name = file_info[0]
    song.name = file_info[1]
    song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end

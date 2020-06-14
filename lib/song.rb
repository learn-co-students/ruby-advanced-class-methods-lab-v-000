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
    @@all << self.new
    return @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new
    if @@all.include?(song) == true
      self.all.detect{|song| song.name == name}
    else
      @@all << song
      song.name = name
      return song
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    song = self.new
    chomp_filename = filename.chomp(".mp3")
    array_filename = chomp_filename.split(" - ")
    song.artist_name = array_filename[0]
    song.name = array_filename[1]
    return song
  end

  def self.create_from_filename(filename)
    song = self.new
    @@all << song
    chomp_filename = filename.chomp(".mp3")
    array_filename = chomp_filename.split(" - ")
    song.artist_name = array_filename[0]
    song.name = array_filename[1]
    return song
  end

  def self.destroy_all
    self.all.clear
  end

end

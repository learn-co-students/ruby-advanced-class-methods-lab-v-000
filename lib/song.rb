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
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    desired_song = find_by_name(name)
    if !desired_song
      create_by_name(name)
    else
      desired_song
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = Song.new
    file = filename.chomp(".mp3")
    array = file.split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    return song
  end

  def self.create_from_filename(filename)
    song = Song.create
    file = filename.chomp(".mp3")
    array = file.split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    return song
  end

  def self.destroy_all
    @@all.clear
  end

end

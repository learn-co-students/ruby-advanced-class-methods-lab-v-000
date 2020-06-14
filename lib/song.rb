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
    @@all << song
    song
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    @@all << song
    song
  end

  def self.find_by_name(name_of_song)
    @@all.find {|song| song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)
    if @@all.include?(name_of_song)
      find_by_name(name_of_song)
    else
      create_by_name(name_of_song)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(name_of_file)
    name_of_file.slice! ".mp3"
    split = name_of_file.split(" - ")
    song = self.new
    song.artist_name = split.first
    song.name = split.last
    song
  end

  def self.create_from_filename(name_of_file)
    name_of_file.slice! ".mp3"
    split = name_of_file.split(" - ")
    song = self.new
    song.artist_name = split.first
    song.name = split.last
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end

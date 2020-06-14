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
    self.all.detect { |songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted_array = self.all.sort_by do |song|
      song.name
    end
    sorted_array
  end

  def self.new_from_filename(song_name)
    split_array = song_name.split(/ - |.mp3/)
    song = self.new
    song.name = split_array[1]
    song.artist_name = split_array[0]
    song
  end

  def self.create_from_filename(name)
    self.all << self.new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear
  end
end

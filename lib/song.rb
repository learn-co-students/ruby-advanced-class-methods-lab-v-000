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

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    result = self.find_by_name(song_name)
    result == nil ? self.create_by_name(song_name) : result
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    file_arr = filename.split(' - ')
    song = self.new
    song.name = file_arr[1].gsub('.mp3', '')
    song.artist_name = file_arr[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end

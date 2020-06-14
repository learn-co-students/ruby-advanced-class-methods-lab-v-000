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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.detect { |song|  song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song.nil?
      song = self.create_by_name(song_name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    new_song_arr = file_name[0..-5].split(" - ")
    new_song = self.new
    new_song.artist_name = new_song_arr[0]
    new_song.name = new_song_arr[1]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

  def self.destroy_all
    @@all = []
  end

end

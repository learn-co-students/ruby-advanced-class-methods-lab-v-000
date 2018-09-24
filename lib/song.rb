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
    song.save
    song
  end

  def self.new_by_name(song_string_name)
    song = self.new
    song.name = song_string_name
    song
  end

  def self.create_by_name(song_string_name)
    song = self.new
    song.name = song_string_name
    song.save
    song
  end

  def self.find_by_name(song_string_name)
    self.all.find { |song| song.name == song_string_name}
  end

  def self.find_or_create_by_name(song_string_name)
    # if self.find_by_name(song_string_name)
    #   self.find_by_name(song_string_name)
    # else
    #   self.create_by_name(song_string_name)
    # end
    self.find_by_name(song_string_name) || self.create_by_name(song_string_name)
  end

  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    # @@all.clear
    self.all.clear
  end
end

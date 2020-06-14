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
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |x| x.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
    if found_song
      found_song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name }
  end

  def self.new_from_filename(file_name)
    song = self.new
    split_name = file_name.split(" - ")
    song.artist_name = split_name[0].chomp
    song.name = split_name[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end



end

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
    self.new.save[-1]
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    self.create.name = name
    self.all[-1]
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(mp3_name)
    artist_and_song = mp3_name[0..-5].split(" - ")
    new_song = self.new
    new_song.name = artist_and_song[1]
    new_song.artist_name = artist_and_song[0]
    new_song
  end

  def self.create_from_filename(mp3_name)
    artist_and_song = mp3_name[0..-5].split(" - ")
    self.create.name = name
    self.all[-1].name = artist_and_song[1]
    self.all[-1].artist_name = artist_and_song[0]
    self.all[-1]
  end

  def self.destroy_all
    @@all.clear
  end

end

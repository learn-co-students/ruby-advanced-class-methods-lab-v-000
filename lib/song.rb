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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song_object|
      song_object.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical

    self.all.sort_by do |song_object|
      song_object.name
    end

=begin
    song_names = @@all.collect do |song_object|
      song_object.name
    end

    song_names.sort!
    sorted_song_objects = []
    song_names.each do |song_name|
      sorted_song_objects << find_by_name(song_name)
    end

    sorted_song_objects
=end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1].chomp(".mp3")
    artist_name = filename.split(" - ")[0]

    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name

    new_song
  end

  def self.create_from_filename(filename)
    song_name = filename.split(" - ")[1].chomp(".mp3")
    artist_name = filename.split(" - ")[0]

    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name

    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
